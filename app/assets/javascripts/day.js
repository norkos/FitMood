$(document).ready(function(){
	$('#addNewDay').click(function(){
	$('ol#daySet').append(
    '<li class="dayForm">'+
      '<div class="well well-lg">' +
    		'<div class="row">' +
          '<div class="col-xs-9 col-sm-9 col-md-9">' +
      			'<input type="text"  class="input-large" placeholder="Caption"/>' +
      		'</div>' +
    			'<div class="col-xs-3 col-sm-3 col-md-3">' +
    				'<button class="copyDay btn btn-info btn-lg btn-block" type="button">duplicate</button>' +
            '<button class="moveUp btn btn-info btn-lg btn-block" type="button">move up</button>' +
            '<button class="moveDown btn btn-info btn-lg btn-block" type="button">move down</button>' +
            '<button class="removeDay btn btn-danger btn-lg btn-block" type="button">remove</button>' +
    			'</div>' +
    		'</div>' +
  		'</div>'+
    '</li>');
    });
    
    $("ol#daySet").on('click', '.moveUp', function(){
      if ( $(this).closest('.dayForm').prev().length )
      {
      	$(this).closest('.dayForm').prev().before($(this).closest('.dayForm').clone());
      	$(this).closest('.dayForm').remove();
      }
    });

    $("ol#daySet").on('click', '.moveDown', function(){
      if ( $(this).closest('.dayForm').next().length )
      {
      	$(this).closest('.dayForm').next().after($(this).closest('.dayForm').clone());
      	$(this).closest('.dayForm').remove();
      }
    });

    $("ol#daySet").on('click', '.removeDay', function(){
      $(this).closest('.dayForm').remove();
    });
    
    $("ol#daySet").on('click', '.copyDay', function(){
      $('ol#daySet').append($(this).closest('.dayForm').clone());
    });
});