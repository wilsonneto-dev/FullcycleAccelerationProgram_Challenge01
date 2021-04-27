// so bad code, but it's just to play with docker...
const mysql = require('mysql2');
const express = require('express')

const getModulesFromDatabase = () => {
  return new Promise((resolve, reject) => {
    try {
      var connection = mysql.createConnection({
        host     : process.env.DB_HOST,
        user     : process.env.DB_USER,
        password : process.env.DB_SECRET,
        database : process.env.DB_NAME
      });
       
      connection.connect();
       
      connection.query('SELECT * from modules', function (error, results, fields) {
        if (error) reject(error);
        console.log(results);
        resolve(results);
      });
       
      connection.end();
    
    } catch (error) {
      reject(error);
    }
  })
}

const app = express();
const port = process.env.SERVER_PORT

app.get('/api/', (req, res) => {
  return res.json({ status: 'running...', endpoints: [ '/modules' ] });
})

app.get('/api/modules', async (req, res) => {
  try {
    const modules = await getModulesFromDatabase();
    return res.json({ modules });  
  } catch(e) {
    return res.status(500).json({ error: e.message })
  }
})

app.listen(port, () => {
  console.log(`super app listening at http://localhost:${port}`)
})