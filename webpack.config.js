const path = require('path');
const history = require('connect-history-api-fallback');
const convert = require('koa-connect');

module.exports = {
  entry: ["./src/index.js"],
  mode: 'development',
  output: {
    path:　__dirname + '/dist',
    filename: 'bundle.js'
  },
  module: {
    rules: [{
      test: /\.(js|jsx)$/,
      exclude: /node_modules/,
      loader: "babel-loader",
      query:{
        presets:['react', 'es2015']
      }
    }]
  },
  resolve: {
    extensions: ['.js', '.jsx'],
  },
  serve: {
    content: path.resolve(__dirname, 'dist'),
    port: 3000,
    add: (app, middleware, options) => {
      app.use(convert(history({ index: '/' })));
    },
  },
};
