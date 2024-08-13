-- Run table creation one-by-one and import data after each creation

CREATE TABLE IF NOT EXISTS titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR
);

CREATE TABLE IF NOT EXISTS employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR,
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);    

CREATE TABLE IF NOT EXISTS departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR
);

CREATE TABLE IF NOT EXISTS dept_manager (
    dept_no VARCHAR,
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS dept_emp (
    emp_no INT,
	dept_no VARCHAR,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS salaries (
    emp_no INT PRIMARY KEY,
    salary VARCHAR,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
