-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/qM7htN
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [depatments] (
    [dept_no] varchar  NOT NULL ,
    [dept_name] varchar  NOT NULL ,
    CONSTRAINT [PK_depatments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_manager] (
    [dept_manager] varchar  NOT NULL ,
    [emp_no] varchar  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [dept_emp] (
    [emp_no] varchar  NOT NULL ,
    [dept_no] varchar  NOT NULL ,
    [from_date] varchar  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [titles] (
    [emp_no] varchar  NOT NULL ,
    [title] varchar  NOT NULL ,
    [from_date] date  NOT NULL ,
    [tp_date] date  NOT NULL 
)

CREATE TABLE [salaries] (
    [emp_no] varchar  NOT NULL ,
    [salary] int  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [employees] (
    [emp_no] varchar  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar  NOT NULL ,
    [last_name] varchar  NOT NULL ,
    [sex] varchar(1)  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

ALTER TABLE [depatments] WITH CHECK ADD CONSTRAINT [FK_depatments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [dept_manager] ([dept_manager])

ALTER TABLE [depatments] CHECK CONSTRAINT [FK_depatments_dept_no]

ALTER TABLE [depatments] WITH CHECK ADD CONSTRAINT [FK_depatments_dept_name] FOREIGN KEY([dept_name])
REFERENCES [dept_emp] ([dept_no])

ALTER TABLE [depatments] CHECK CONSTRAINT [FK_depatments_dept_name]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_emp_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [salaries] ([emp_no])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_no]

COMMIT TRANSACTION QUICKDBD