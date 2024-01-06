from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime  
from sqlalchemy import text


app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mssql+pymssql://hasan123:1@DESKTOP-VT0Q6IP/AliAbiShop'
#app.config['SQLALCHEMY_DATABASE_URI'] = 'mssql+pymssql://@localhost/AliAbiShop' #local baglantı için ustteki satırı silin ve bu satırı yorumdan cıkarın
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


db = SQLAlchemy(app)

class ExampleModel(db.Model):
    __tablename__ = 'Employee'
    EmployeeId = db.Column(db.Integer, primary_key=True, autoincrement=False)
    Name = db.Column(db.String(50))
    Surname = db.Column(db.String(50))
    Password = db.Column(db.String(50))
    Email = db.Column(db.String(50), unique=True)
    Salary = db.Column(db.Integer)
    WorkEntranceDate = db.Column(db.Date)
    BirthDate = db.Column(db.Date)
    PhoneNumber = db.Column(db.String(15), unique=True)
    ManagerId = db.Column(db.Integer, db.ForeignKey('Employee.EmployeeId'))





@app.route('/')
def index():
    return render_template('index.html')

@app.route('/employee')
def employee():

    sql_query = "SELECT * FROM Employee"
      
    all_data = db.session.execute(text(sql_query))

    return render_template('employee.html', all_data = all_data)


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

    new_employee = ExampleModel(
        EmployeeId=manuel_employee_id,
        Name=name,
        Surname=surname,
        Password=password,
        Email=email,
        Salary=salary,
        WorkEntranceDate=workEntranceDate,
        BirthDate=birthDate,
        PhoneNumber=phoneNumber,
        ManagerId=managerId
    )



    db.session.add(new_employee)
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
