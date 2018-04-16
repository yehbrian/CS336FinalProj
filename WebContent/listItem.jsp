<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>create auction here</title>
</head>
<body>
<form method = "post" action="newItem.jsp">
  Name of item:<br>
  <input type="text" name="name" required>
  <br>
  Category:<br>
  <select name="category" required>
	  		<option value="Ring">Ring</option>
	  		<option value="Necklace">Necklace</option>
	  		<option value="Watch">Watch</option>
  </select>
		<br>
	condition:<br>
  <input type="text" name="cond" required>
  <br>	
  brand:<br>
  <input type="text" name="brand" required>
  <br>	
  
  metal:<br>
  <input type="text" name="metal" required>
  <br>	
  
  stone:<br>
  <input type="text" name="stone" required>
  <br>	
  
  color:<br>
  <input type="text" name="color" required>
  <br>	

	
  <br>
         Description : <br />
         <textarea rows = "5" cols = "50" name = "description" required>
            
         </textarea>
         
    <br>	

	StartingBid:<br>
  <input type="number" step="0.01" name="startingBid" required >
  <br>	
   <br>	

	increment:<br>
  <input type="number" step="0.01" name="increment" required>
  <br>	
         
          <br>	

	minimum (reserve) price (enter the starting bid if you do not want a minimum price):<br>
  <input type="number" step="0.01" name="minimum" required>
  <br>	
          <br>	

	In how many hours do you want your auction to end?<br>
   <input type="number" name="date" required>
  <br>	
         <input type="submit">
         
      </form>

</body>
</html>