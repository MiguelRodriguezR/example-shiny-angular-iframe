// code included inside $(document).ready() will only run once the page is ready for JavaScript code to execute
$(document).ready(function() {

  // initialize a counter
  // setTimeout(function(){
  //   console.log('entro js', Shiny.onInputChange);
  //   var n = 'hola mundo';
  //   Shiny.onInputChange("texto", n);
  // }, 200)

  window.addEventListener("message", function(event){
    if(event.data.id === 'archivo'){
      console.log(event.data.csvName);
      Shiny.onInputChange("texto", event.data.csvName);
      Shiny.onInputChange("tipo", event.data.type);
      Shiny.onInputChange("graphX", event.data.graphX);
      Shiny.onInputChange("graphfill", event.data.graphfill);
      Shiny.onInputChange("graphType", event.data.graphType);
    }
  }, false);


});