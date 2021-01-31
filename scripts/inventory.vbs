Sub EnableInventory
	
	Set itemsTag = document.getElementById("inventoryScreen")
	Set normalScreen = document.getElementById("mainScreen")
	
	If NOT inventoryIsEnabled THEN
		
		normalScreen.style.display = "none"
		itemsTag.style.display = "inherit"
		itemsTag.appendChild(document.createElement("table"))
		inventoryIsEnabled = CBool(1)
		CreateInventory
		
	Else
		
		normalScreen.style.display = "inherit"
		itemsTag.style.display = "none"
		inventoryIsEnabled = CBool(0)
		
		itemsTag.InnerHtml = ""
	End If
End Sub

Sub CreateInventory
	
	CreateRow "Item", "Value", "Description", 0
	
	CreateRow playerCharacter.GetArmour("Name"), playerCharacter.GetArmour("Value"), "This armour will prevent up to " & playerCharacter.GetArmour("Thoughness") & " damage.", 0
	CreateRow playerCharacter.GetMeleeWeapon("Name"), playerCharacter.GetMeleeWeapon("Value"), "This melee weapon deals " & playerCharacter.GetMeleeWeapon("Damage") & " damage.", 0
	CreateRow playerCharacter.GetRangedWeapon("Name"), playerCharacter.GetRangedWeapon("Value"), "This ranged weapon deals " & playerCharacter.GetRangedWeapon("Damage") & " damage. You have " & playerCharacter.GetRangedWeapon("Ammo") & " ammo.", 0
	
	maxCount = playerCharacter.InventoryCount
	
	For count = 0 TO maxCount
		
		CreateRow playerCharacter.GetItem(count, "Name"), playerCharacter.GetItem(count, "Value"), playerCharacter.GetItem(count, "Desc"), playerCharacter.GetItem(count, "Gain")
	Next
End Sub

Sub CreateRow(name, value, desc, gain)
	
	Set tableRow = document.createElement("tr")
	Set rowName = document.createElement("td")
	Set rowValue = document.createElement("td")
	Set rowDesc = document.createElement("td")
	
	rowName.innerText = name
	rowValue.innerText = value
	rowDesc.innerText = desc
	
	If gain > 0 THEN
		
		rowDesc.title = "This is an item you can use to restore " & gain & " HP."
	End If
	
	tableRow.appendChild(rowName)
	tableRow.appendChild(rowValue)
	tableRow.appendChild(rowDesc)
	
	document.getElementsByTagName("table")(0).appendChild(tableRow)
End Sub