Sub CreatePlayer

	defaultName = "Samuel B."
	characterName = InputBox("character name:", "Creating character", defaultName)

	If characterName = "" THEN
		
		characterName = defaultName
	End If

	Set file = CreateObject("Scripting.FileSystemObject")

	If file.FileExists("saves/" & characterName & ".char") THEN 

		MsgBox "Your character does exist, however, the save feature is not implemented yet. A new game will be created."
		
	Else

		MsgBox "Your character does not exist. A new game will be created."
	End If

	' #region inside the conditional block (false), this will eventually be moved.

		Set playerCharacter = new Character
		
		playerCharacter.Initialize characterName, RollDie() + RollDie() + 12, RollDie() + 6, 0
		
		playerCharacter.SetArmour "Normal Clothes", 0
		
		playerCharacter.AddWeapon "Fists", "melee", 0, 2
		playerCharacter.AddWeapon "Rocks", "ranged", 20, 1.5
		
		playerCharacter.AddItem "Wedding Rings", "The wedding rings of your parents.", 50, 0
		playerCharacter.AddItem "Apple", "This one is dark red.", 1, 2.5
		playerCharacter.AddItem "Apple", "This one is yellow.", 1, 2.5
		playerCharacter.AddItem "Water Bottle", "250ml variant.", 2, 5
		
	' #end region
	
	LoadArea "areas/city centre"
End Sub

Sub WriteGUI
	
	document.getElementById("playerName").innerText = playerCharacter.pName
	document.getElementById("life").innerText = playerCharacter.pLife & " HP"
	document.getElementById("skill").innerText = playerCharacter.pSkill & " Skill"
	document.getElementById("cash").innerText = playerCharacter.pCredits & " Credits"
	document.getElementById("protection").innerText = playerCharacter.GetArmour("Durability") & " Armour"
End Sub