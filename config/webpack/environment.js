const { environment } = require('@rails/webpacker')

environment.loaders
.get('sass')
.use.find(item => item.loader === 'sass-loader').options.includePaths = [
  'node_modules'
]
const coffee =  require('./loaders/coffee')

environment.loaders.prepend('coffee', coffee)
module.exports = environment
