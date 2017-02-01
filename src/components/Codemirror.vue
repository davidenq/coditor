<template>
  <span :id="id"  class="containers-cm"></span>
</template>
<script>
  export default {
    name: 'codemirror',
    props: ['config', 'id', 'show'],
    data () {
      return {
        codemirror: null
      }
    },
    created () {
      this.Codemirror = window.CodeMirror
    },
    mounted () {
      /* eslint-disable no-new */
      const cm = new this.Codemirror(document.getElementById(this.id), this.config)
      this.$parent.instancesCM[this.id] = cm
      if (!this.show) {
        document.getElementById(this.id).style.display = 'none'
      }
    }
  }
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.cm-s-coditor.CodeMirror {
    background: #2B3037;
    color: #f8f8f2;
    padding: 1em 0;
}
.cm-s-coditor div.CodeMirror-selected {
    background: #49483E
}
.cm-s-coditor .CodeMirror-line::selection,
.cm-s-coditor .CodeMirror-line>span::selection,
.cm-s-coditor .CodeMirror-line>span>span::selection {
    background: rgba(73, 72, 62, .99)
}
.cm-s-coditor .CodeMirror-line::-moz-selection,
.cm-s-coditor .CodeMirror-line>span::-moz-selection,
.cm-s-coditor .CodeMirror-line>span>span::-moz-selection {
    background: rgba(73, 72, 62, .99)
}
.cm-s-coditor .CodeMirror-gutters {
    background: #2B3037;
    border-right: 0
}
.cm-s-coditor .CodeMirror-guttermarker {
    color: #fff
}
.cm-s-coditor .CodeMirror-guttermarker-subtle,
.cm-s-coditor .CodeMirror-linenumber {
    color: #d0d0d0
}
.cm-s-coditor .CodeMirror-cursor {
    border-left: 1px solid #f8f8f0
}
.cm-s-coditor span.cm-comment {
    color: #584B53
}
.cm-s-coditor span.cm-atom,
.cm-s-coditor span.cm-number {
    color: #61a1b9
}
.cm-s-coditor span.cm-attribute,
.cm-s-coditor span.cm-property {
    color: #ACBDBA
}
.cm-s-coditor span.cm-keyword {
    color: #FF6765;
}
.cm-s-coditor span.cm-builtin {
    color: #66d9ef
}
.cm-s-coditor span.cm-string {
    color: #A07297;
}
.cm-s-coditor span.cm-variable {
    color: #CDDDDD
}
.cm-s-coditor span.cm-variable-2 {
    color: #ab7d7d
}
.cm-s-coditor span.cm-variable-3 {
    color: #ffb443
}
.cm-s-coditor span.cm-def {
    color: #33a3d8;
}
.cm-s-coditor span.cm-bracket {
    color: #f8f8f2
}
.cm-s-coditor span.cm-tag {
    color: #f92672
}
.cm-s-coditor span.cm-header,
.cm-s-coditor span.cm-link {
    color: #A6C48A
}
.cm-s-coditor span.cm-error {
    background: #f92672;
    color: #f8f8f0
}
.cm-s-coditor .CodeMirror-activeline-background {
    background: #373831
}
.cm-s-coditor .CodeMirror-matchingbracket {
    text-decoration: underline;
    color: #fff!important
}
.cm-meta {
  color: #c1711f
}
/*# sourceMappingURL=coditor.min.css.map */
</style>