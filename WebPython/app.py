from flask import Flask, flash, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime  
from sqlalchemy import text


app = Flask(__name__)

#app.config['SQLALCHEMY_DATABASE_URI'] = 'mssql+pymssql://hasan123:1@DESKTOP-VT0Q6IP/AliAbiShop'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mssql+pymssql://@localhost/AliAbiShop' #local baglantı için ustteki satırı silin ve bu satırı yorumdan cıkarın
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/employee')
def employee():

    sql_query = "SELECT * FROM Employee"
      
    all_data = db.session.execute(text(sql_query))

    return render_template('employee.html', all_data = all_data)


@app.route('/menu')
def menu():
    return render_template('menu.html')


@app.route('/login_system', methods=['POST'])
def login_system():
    password = request.form.get('loginPassword')
    email = request.form.get('loginEmail')

    sql_login_query = f"SELECT * FROM Employee WHERE email = '{email}' AND password = '{password}'"
      
    if(db.session.execute(text(sql_login_query)).scalar()):

        return redirect(url_for('menu'))
    
    else:
        flash('Looks like you have changed your name!')
        return render_template("index.html")

 



@app.route('/delete_employee', methods=['POST'])
def delete_employee():

    sql_delete_query = f"DELETE FROM Employee WHERE EmployeeId = {request.form.get('deleteId')}"
      
    db.session.execute(text(sql_delete_query))
    
    db.session.commit()

    return redirect(url_for('employee'))


def is_employee_exist(requsetId):
    sql_search = f"SELECT * FROM Employee WHERE EmployeeId = {requsetId}"

    return db.session.execute(text(sql_search)).scalar()


@app.route('/add_employee', methods=['POST'])
def add_employee():


    manuel_employee_id = request.form.get('id')
    name = request.form.get('name')
    surname = request.form.get('surname')
    password = request.form.get('password')
    email = request.form.get('email')
    salary = request.form.get('salary')
    workEntranceDate = datetime.strptime(request.form.get('workEntranceDate'), '%Y-%m-%d')
    birthDate = datetime.strptime(request.form.get('birthDate'), '%Y-%m-%d')
    phoneNumber = request.form.get('phoneNumber')
    managerId = request.form.get('managerId')



    if(not(is_employee_exist(request.form.get('id')))):
        sql_add_employee = f""" INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)

            VALUES ({manuel_employee_id},'{name}','{surname}',
            '{password}','{email}',{salary},'{workEntranceDate}',
            '{birthDate}','{phoneNumber}', {managerId})"""


        db.session.execute(text(sql_add_employee))

        db.session.commit()

        return redirect(url_for('employee'))
    else:
        sql_update_employee = f""" UPDATE Employee SET
            Name = '{name}',
            Surname = '{surname}',
            Password = '{password}',
            Email = '{email}',
            Salary = {salary},
            WorkEntranceDate = '{workEntranceDate}',
            BirthDate = '{birthDate}',
            PhoneNumber = '{phoneNumber}',
            ManagerId = {managerId}
        WHERE EmployeeId = {manuel_employee_id};"""

        db.session.execute(text(sql_update_employee))

        db.session.commit()
        return redirect(url_for('employee'))

@app.route('/search_employee', methods=['POST'])
def search_employee():
    search_id = request.form.get('search_id')

    search_sql = f"""SELECT TOP (1000) [EmployeeId]
      ,[Name]
      ,[Surname]
      ,[Password]
      ,[Email]
      ,[Salary]
      ,[WorkEntranceDate]
      ,[BirthDate]
      ,[PhoneNumber]
      ,[ManagerId]
      ,[Age]
      FROM [AliAbiShop].[dbo].[Employee] WHERE EmployeeId = {search_id}"""

    result = db.session.execute(text(search_sql)).first()


    sql_query_all_data = "SELECT * FROM Employee"
      
    all_data = db.session.execute(text(sql_query_all_data))

    return render_template('employee.html', all_data = all_data, result=result)


if __name__ == "__main__":
    app.run(debug=True)
