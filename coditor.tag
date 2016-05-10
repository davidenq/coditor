<coditor>
    <div class="cc-tabs cc-tabs-height-auto" id="top-tabs">
        <ul id="list">
            <li class="tab-content tab${value}" each=${element, value in opts.tabs}>
                <pre id="${element.editor.id}">${element.editor.code}</pre>
            </li>
        </ul>
    </div>

    <script>

        const editors = [];
        const data = opts.tabs;
        const lang = "ace/mode/" + opts.lang;
        riot.settings.brackets = '${ }';

        this.on('mount', function () {

            data.forEach((value, key) => {
                const editor = document.getElementById(value.editor.id);
                editors.push(ace.edit(editor));
                editor.style = 'background-color: #2C2C2C; font-size:13px;position: absolute;top: 0;right: 0;bottom: 0;left: 0;';
                editor.childNodes[1].style = 'background: #2C2C2C;color: #8F908A;';

                //crated nodes for tabs
                const nodeInput = document.createElement('input');
                nodeInput.setAttribute('id', 'tab'+key);
                nodeInput.setAttribute('class', 'tab'+key)
                if (value.checked) {
                    nodeInput.setAttribute('checked', 'checked');
                }
                nodeInput.setAttribute('name', 'cc-tabs');
                nodeInput.setAttribute('type', 'radio');

                //created nodes for labels to each tab
                const nodeLabel = document.createElement('label')
                const label = document.createTextNode(value.title);
                nodeLabel.setAttribute("for", 'tab'+key);
                nodeLabel.setAttribute("value", value.title);
                nodeLabel.appendChild(label);

                //added nodes to the DOM
                const addNode = document.getElementById('top-tabs');
                addNode.insertBefore(nodeInput, document.getElementById('list'));
                addNode.insertBefore(nodeLabel, document.getElementById('list'));
            });

            //settings for each editor
            editors.forEach((editor)=>{
                editor.setHighlightGutterLine(false);
                editor.setHighlightActiveLine(false);
                editor.getSession().setUseWrapMode(true);
                editor.setShowPrintMargin(false);
                editor.setTheme("ace/theme/monokai");
                editor.getSession().setMode(lang);
                editor.resize();
            });
        });

    </script>

    <style>
        /*Credits by Mahesh (http://codepen.io/maheshambure21/pen/VvxWLZ)*/
        .cc-tabs {
          margin: 0;
          padding: 0;
          border: 0;
          outline: none;
          text-align: left;
        }

        .cc-tabs > input {
          position: absolute;
          display: none;
        }

        .cc-tabs > label {
          position: relative;
          display: inline-block;
          margin: 0;
          padding: 0;
          border: 0;
          outline: none;
          cursor: pointer;
          transition: all 0.1s;
          -o-transition: all 0.1s;
          -ms-transition: all 0.1s;
          -moz-transition: all 0.1s;
          -webkit-transition: all 0.1s;
        }

        .cc-tabs > label i {
          display: block;
          float: left;
          margin: 0 8px 0 -2px;
          padding: 0;
          border: 0;
          outline: none;
        }

        .cc-tabs > input:checked + label {
          cursor: default;
        }

        .cc-tabs > ul {
          list-style: none;
          position: relative;
          display: block;
          overflow: hidden;
          margin: 0;
          padding: 0;
          border: 0;
          outline: none;
          border-left: 1px solid #FF7B61;
        }

        .cc-tabs > ul > li {
          position: absolute;
          width: 100%;
          overflow: auto;
          padding: 30px 40px 40px;
          box-sizing: border-box;
          -moz-box-sizing: border-box;
          opacity: 0;
          transition: all 0.5s;
          -o-transition: all 0.5s;
          -ms-transition: all 0.5s;
          -moz-transition: all 0.5s;
          -webkit-transition: all 0.5s;
        }

        .cc-tabs-height-auto > ul {
          height: 50vh;
        }

        .cc-tabs-height-auto > ul > li {
          position: static;
          display: none;
          height: 50vh;
        }

        .cc-tabs > .tab0:checked ~ ul .tab0,
        .cc-tabs > .tab1:checked ~ ul .tab1,
        .cc-tabs > .tab2:checked ~ ul .tab2,
        .cc-tabs > .tab-content-last:checked ~ ul .tab-content-last {
          z-index: 1;
          top: 0;
          left: 0;
          opacity: 1;
          -webkit-transform: scale(1,1);
          -webkit-transform: rotate(0deg);
        }

        .cc-tabs-height-auto > .tab0:checked ~ ul .tab0,
        .cc-tabs-height-auto > .tab1:checked ~ ul .tab1,
        .cc-tabs-height-auto > .tab2:checked ~ ul .tab2,
        .cc-tabs-height-auto > .tab-content-last:checked ~ ul .tab-content-last {
          display: block;
        }

        .cc-tabs-layout-top-right {
          text-align: right;
        }

        .cc-tabs-layout-top-center {
          text-align: center;
        }

        .cc-tabs {
          background: #242424;
          color: #FFF;
        }

        .cc-tabs > label {
          text-align: center;
          color: #fff;
          opacity: 0.6;
          padding: 0 20px;
          font-size: 13px;
          line-height: 50px;
        }

        .cc-tabs > label:hover {
          background: none;
          color: #f2f2f2;
          opacity: 1;
          -webkit-transition-duration: 400ms;
          -moz-transition-duration: 400ms;
          -o-transition-duration: 400ms;
          transition-duration: 400ms;
        }

        .cc-tabs > input:checked + label {
          border-left: 1px solid #FF7B61;
          background: #2c2c2c;
          color: #FFF;
          opacity: 1;
        }

        .cc-tabs> ul {
          border-radius: 0;
          box-shadow: none;
          background: #2C2C2C;
          text-align: left;
        }
    </style>
</coditor>
