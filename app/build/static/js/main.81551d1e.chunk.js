(this["webpackJsonplearn-react-in-x-minutes"]=this["webpackJsonplearn-react-in-x-minutes"]||[]).push([[0],{13:function(e,t,n){},14:function(e,t,n){"use strict";n.r(t);var o=n(0),a=n.n(o),c=n(3),r=n.n(c),l=n(1),u=n(5);function i(e){var t=e.todo,n=e.toggleTodo;return a.a.createElement("div",null,a.a.createElement("label",null,a.a.createElement("input",{type:"checkbox",checked:t.complete,onChange:function(){n(t.id)}}),t.name))}function m(e){var t=e.todos,n=e.toggleTodo;return t.map((function(e){return a.a.createElement(i,{key:e.id,toggleTodo:n,todo:e})}))}var s=n(4),d=n.n(s),f=(n(13),"todoApp.todos");var p=function(){var e=Object(o.useState)([]),t=Object(u.a)(e,2),n=t[0],c=t[1],r=Object(o.useRef)();return Object(o.useEffect)((function(){var e=JSON.parse(localStorage.getItem(f));e&&c(e)}),[]),Object(o.useEffect)((function(){localStorage.setItem(f,JSON.stringify(n))}),[n]),a.a.createElement("div",{className:"container"},a.a.createElement(m,{todos:n,toggleTodo:function(e){var t=Object(l.a)(n),o=t.find((function(t){return t.id===e}));o.complete=!o.complete,c(t)}}),a.a.createElement("input",{className:"todo-input",ref:r,type:"text"}),a.a.createElement("button",{className:"todo-button",onClick:function(e){var t=r.current.value;""!==t&&(c((function(e){return[].concat(Object(l.a)(e),[{id:d()(),name:t,complete:!1}])})),r.current.value=null)}},"Add Todo"),a.a.createElement("button",{className:"clear-button",onClick:function(){var e=n.filter((function(e){return!e.complete}));c(e)}},"Clear Complete"),a.a.createElement("div",{className:"todo-count"}," ",n.filter((function(e){return!e.complete})).length," things left to do"))};r.a.render(a.a.createElement(p,null),document.getElementById("root"))},6:function(e,t,n){e.exports=n(14)}},[[6,1,2]]]);
//# sourceMappingURL=main.81551d1e.chunk.js.map