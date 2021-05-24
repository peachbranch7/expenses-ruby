module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      performance: {
        maxAssetSize: 100000,
      },
      stage: 3
    })
  ]
}
