<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Coordinates</title>
 
  
  
  
  <link rel="stylesheet" href="../css/mainJcrop.css" type="text/css" />
  <link rel="stylesheet" href="../css/demos.css" type="text/css" />
  <link rel="stylesheet" href="../css/jquery.Jcrop.css" type="text/css" />
   
   <link href="../css/detectImage/main.css" rel="stylesheet" type="text/css"/>
  <link href="../css/detectImage/imgareaselect-animated.css" rel="stylesheet" type="text/css"/>
  
 
  <g:javascript src="jquery.min.js" />
<g:javascript src="jquery-1.6.1.min.js" />
<g:javascript src="jquery.imgareaselect.pack.js" />
        
        
        
        <script type="text/javascript">
    function preview(img, selection) {
        if (!selection.width || !selection.height)
            return;

        var scaleX = 100 / selection.width;
        var scaleY = 100 / selection.height;

        $('#preview img').css({
        	width: Math.round(scaleX * 500),
            height: Math.round(scaleY * 281),
            marginLeft: -Math.round(scaleX * selection.x1),
            marginTop: -Math.round(scaleY * selection.y1)
        });

        $('#x1').val(selection.x1);
        $('#y1').val(selection.y1);
        $('#x2').val(selection.x2);
        $('#y2').val(selection.y2);
        $('#w').val(selection.width);
        $('#h').val(selection.height);
    }

    $(function () {
        $('#photo').imgAreaSelect({
            aspectRatio: '1:1', handles: true,
            fadeSpeed: 200, onSelectChange: preview
        });
    });
</script>

<style type="text/css">
#target {
	background-color: #ccc;
	width: 500px;
	height: 330px;
	font-size: 24px;
	display: block;
}
</style>

</head>
<body>

<div class="container">
		<div class="row">
			<div class="span12">
				<div class="jc-demo-box">

					<div class="page-header">
						<ul class="breadcrumb first">
							<li><a href="../">Menu</a> <span class="divider">/</span>
							<a href="../maxWheel/inputWheel">Step1</a> <span class="divider"></span>
							</li>
							
						</ul>
						<h1>ซอฟต์แวร์ช่วยเลือกล้อแม็กซ์ </h1>
						<h1>เลือกตำแหน่งล้อหลัง :</h1>
					</div>
					
					 <div class="column1">
					
              <g:img dir="images" file="${params.filename}" id="photo" width="500" height="281"  />
            </div>
            <div class="column2">
             
               <div class="frame" style="margin: 0 1em; width: 100px; height: 100px;">
               
   
      <div id="preview" style="width: 100px; height: 100px; overflow: hidden; border-radius: 50%;">
          <g:img dir="images" file="${params.filename}"  />
          
      </div>
      

      
      
      
      
    </div>
               <table style="margin-top: 1em;">
      <thead>
        <tr>
          <th colspan="2" style="font-size: 110%; font-weight: bold; text-align: left; padding-left: 0.1em;">
            Coordinates
          </th>
          <th colspan="2" style="font-size: 110%; font-weight: bold; text-align: left; padding-left: 0.1em;">
            Dimensions
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="width: 10%;"><b>X<sub>1</sub>:</b></td>
 		      <td style="width: 30%;"><input type="text" id="x1" value="-" /></td>
 		      <td style="width: 20%;"><b>Width:</b></td>
   		    <td><input type="text" value="-" id="w" /></td>
        </tr>
        <tr>
          <td><b>Y<sub>1</sub>:</b></td>
          <td><input type="text" id="y1" value="-" /></td>
          <td><b>Height:</b></td>
          <td><input type="text" id="h" value="-" /></td>
        </tr>
        <tr>
          <td><b>X<sub>2</sub>:</b></td>
          <td><input type="text" id="x2" value="-" /></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><b>Y<sub>2</sub>:</b></td>
          <td><input type="text" id="y2" value="-" /></td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
    </table>
    	<div class="page-header">
						<g:link  action="detectColor" params="[fileCropName:params.filename]"><h1> บันทึก >> </h1></g:link>
					</div>
            </div>
            <div style="clear:both;"></div>
        </div>
						
					
					
				
					
				</div>
			</div>
		</div>
	




		

    </body>
</html>
