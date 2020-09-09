'use strict';

// init object
process.execMysql = {};

require('dotenv').config();
const mysql = require('mysql2/promise');

const DB_HOST = process.env.DB_HOST
const DB_PORT = process.env.DB_PORT
const DB_USERNAME = process.env.DB_USERNAME
const DB_PASSWORD = process.env.DB_PASSWORD
const DB_DATABASE = process.env.DB_DATABASE

async function execQuery(sql) {
  const connection = await mysql.createConnection({
    host: DB_HOST,
    port: DB_PORT,
    user: DB_USERNAME,
    password: DB_PASSWORD,
    database: DB_DATABASE
  })

  const [rows, fields] = await connection.execute(sql)

  process.execMysql = {
    rows: rows,
    fields: fields
  };

  connection.end()
}

exports.handler = async (event, content) => {
  console.log('START LAMBDA')
  console.log(event)

  let sql = 'SELECT * FROM `tests`'

  await execQuery(sql).then(function () {console.log('SUC')}, function () {console.log('FAIL')})

  const response = {
    statusCode: 200,
    body: process.execMysql.rows,
  };
  console.log('END LAMBDA')

  return response;
}
