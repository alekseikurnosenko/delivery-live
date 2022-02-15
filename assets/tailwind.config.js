// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    fontFamily: {
      'sans': ['DD-TTNorms']
    },
    colors: {
      grey: 'rgb(118, 118, 118)',
      divider: 'rgb(231, 231, 231)'
    },
    extend: {    
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}
