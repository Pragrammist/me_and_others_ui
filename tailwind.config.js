// /** @type {import('tailwindcss').Config} */
// const plugin = require('tailwindcss/plugin');
// const flattenColorPalette = require('tailwindcss/lib/util/flattenColorPalette').default;

module.exports = {
  content: ["./index.html", "./src/**/*.{gleam,mjs}"],
  theme: {
    extend: {
      width: {
        '256': '64rem',
        '158': '39.5rem'
      }
    },
  },
  plugins: [
    // plugin(function({ matchUtilities, theme }) {
    //   matchUtilities(
    //     {
    //       'stop-color': (value) => ({
    //         stopColor: value
    //       }),
    //     },
    //     { values: flattenColorPalette(theme('colors')), type: 'color' }
    //   )
    // })
  ],
};