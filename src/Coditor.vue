<template>
  <div class="root-element">
    <div class="top-container">
      <div v-for="value in nameTabs">
        <input type="radio" name="rd"
               v-on:click="selectedTab"
               :id="value.id"
               :checked="value.show"/>
        <label class="label-tab" :for="value.id">
          {{value.name}} 
        </label>
      </div>
    </div>
    <div class="middle-container">
      <codemirror
          v-for="config, i in configs"
          :show="nameTabs[i].show"
          :config="config"
          :id="'container-'+nameTabs[i].id">
      </codemirror>
      <div class="footer-container">
        <button class="button" v-on:click="getCodeByTab">Get the current editor information</button>
      </div>
    </div>
    </div>
  </div>
</template>
<script>
  /* Codemirror => CM */
  import Codemirror from './components/Codemirror'
  const coditor = {}

  coditor.name = 'coditor'
  coditor.components = {Codemirror}
  coditor.props = ['configs', 'nameTabs', 'httpConfig']
  coditor.data = function () {
    return {
      information: {},
      instancesCM: {},
      currentTab: 'container-codemirror-0'
    }
  }
  coditor.methods = {
    selectedTab (event) {
      const idContainerCM = 'container-' + event.target.id
      const classContainersCM = document.getElementsByClassName('containers-cm')

      for (let i = 0; i < classContainersCM.length; i++) {
        classContainersCM[i].style.display = 'none'
      }
      document.getElementById(idContainerCM).style.display = 'block'
      this.currentTab = idContainerCM
    },
    getCodeByTab () {
      const currentInstanceCM = this.instancesCM[this.currentTab]
      this.information.mode = currentInstanceCM.getOption('mode')
      this.information.numLines = currentInstanceCM.lineCount()
      this.information.value = currentInstanceCM.getValue()

      if (this.httpConfig) {
        this.sendInfoViaAjax()
      }
      window.coditor.value = {}
      window.coditor.value[this.currentTab] = this.information
    },
    sendInfoViaAjax () {
      let data = null
      const url = this.httpConfig.url
      const type = this.httpConfig.type

      if (type.toLowerCase() === 'get') {
        data = {
          params: this.information
        }
      } else {
        data = this.information
      }
      this
      .$http[type.toLowerCase()](url, data)
      .then(function (response) {
        // response
        // console.log(response)
      }, function (err) {
        if (err) {
          // err
        }
      })
    }
  }
  export default coditor

</script>
<style scoped>
  @import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro');
  .root-element{
    position: relative;
  }
  .top-container {
    position: absolute;
    top: 0;
    width: 100%;
    background: #212429;
  }
  input[type="radio"] {
    display: none;
  }
  .label-tab {
    float: left;
    cursor: pointer;
    font-family: 'Source Sans Pro', sans-serif;
  }
  input[type="radio"]:checked + .label-tab {
    background: #2B3037;
    color: #f1f1f1;
    padding: 1em;
    display: inline-block;
  }
  input[type="radio"] + .label-tab {
    padding: 1em;
    background: #212429;
    color:#FFF;
    display: inline-block;
  }
  .middle-container {
    position: absolute;
    top: 50px;
    width: 100%;
  }
  .footer-container {
    position: relative;
    margin: 1em 0;
    width: 100%;
    text-align: right;
  }
  .button {
    background: #2B3037;
    border: none;
    color: white;
    padding: 0.75em 1.5em;
    text-align: center;
    font-size: 1em;
    font-family: 'Source Sans Pro', sans-serif;
    cursor: pointer;
    transition:all 0.8s, color 0.2s 0.2s;
    border-radius: 0.25em;
  }
  .button:hover {
    background: #181d25;
    -webkit-box-shadow: 0 rgba(0,0,0,0.75) inset;
    -moz-box-shadow: 0 rgba(0,0,0,0.75) inset;
    -o-box-shadow: 0 rgba(0,0,0,0.75) inset;
    box-shadow: 0 rgba(0,0,0,0.75) inset;
  }
</style>