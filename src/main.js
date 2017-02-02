import Vue from 'vue'
import Coditor from './Coditor'
import VueResource from 'vue-resource'
import Codemirror from 'codemirror/lib/codemirror.js'
import config from './config.json'
import modejs from 'codemirror/mode/javascript/javascript.js'
import css from 'codemirror/lib/codemirror.css'
// import clike from 'codemirror/mode/clike/clike.js'
// import monokai from 'codemirror/theme/monokai.css'
let internals = {}

Vue.use(VueResource)

if (window.coditor === undefined) {
  window.coditor = {}
}

internals.vars = {
  nameTabs: [],
  configs: [],
  httpConfig: (
    config.http.url === undefined ||
    config.http.type === undefined ||
    config.http.url === '' ||
    config.http.type === '') ? ((
      window.coditor.http === undefined ||
      window.coditor.http.url === undefined ||
      window.coditor.http.type === undefined ||
      window.coditor.http.url === '' ||
      window.coditor.http.type === '')
      ? null : window.coditor.http) : config.http,
  theme: (config.theme === '') ? 'coditor' : config.theme,
  lineNumbers: config.lineNumbers,
  init: config.init
}

internals.vars.configs = (window.coditor.cfg !== undefined)
? window.coditor.cfg : [{
  name: internals.vars.init.name,
  mode: internals.vars.init.mode,
  value: internals.vars.init.value !== undefined ? internals.vars.init.value : ''
}]

internals.loadCodeMirror = (() => {
  window.CodeMirror = Codemirror
  window.modejs = modejs
  // window.clike = clike
  // add support to a new programming language
})()

internals.initialConfig = (() => {
  internals.vars.configs.forEach((config, i) => {
    for (let key in config) {
      switch (key) {
        case 'name':
          internals.vars.nameTabs.push({
            name: config[key],
            id: 'codemirror-' + i,
            show: (i === 0)
          })
          delete internals.vars.configs[i].name
          break
        default:
          /*
          This options by default does not set in codemirror, but coditor if set this values
          as long as it was not specified in the props. But if the user it put this options
          in the props for one or a few or all tabs, this configurations just will be set
          in the tab or tabs not specified.
          */
          if (undefined === config['lineNumbers']) {
            config['lineNumbers'] = internals.vars.lineNumbers
          }
          if (undefined === config['theme']) {
            config['theme'] = internals.vars.theme
          }
          break
      }
    }
  })
})()

/* eslint-disable no-new */
new Vue({
  el: 'coditor',
  render (h) {
    return h(Coditor, {
      props: {
        configs: internals.vars.configs,
        nameTabs: internals.vars.nameTabs,
        httpConfig: internals.vars.httpConfig
      }
    })
  }
})
