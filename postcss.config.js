module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      performance: {
        maxEntrypointSize: 500000,
        maxAssetSize: 500000,
      },
      stage: 3
    })
  ]
}
