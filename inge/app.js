const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-paser')
const mcors = require('cors');
const itemRoutes = require('./routes/productoRoutes')
const  app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json())
app.use(cors())

//Conexion a mongo

mongoose.connections('mongodb://localhost:27017/miapp', {
  useNewUrlParser:true,
  useUnifiedTopology:true,

})

.then(()=> console.log("MongoDB Conectado"))
.cath(err=>console.err(err))

//rutas

app.use('api/items',itemRoutes)
app.listen(port,()=>{
    console.log(`Servidor conectado en http://localhost:${port}`)
});

