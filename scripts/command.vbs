' TODO: Command Reader
Sub ReadCommand
	
	target = ""
	
	commands = document.getElementById("textInput").value
	command = commands
	commands = Split(commands, ":")
	
	If ArrayLength(commands) > 1 THEN
	
		target = commands(1)
		command = commands(0)
	End If
	
	Select Case LCase(command)
		
		Case "i"
		
			EnableInventory
		
		Case "hello"
		
			MsgBox "Hello!" & target
			
		Case "talk", "talk to", "speak", "speak with", "speak to", "converse", "discuss", "communicate"
		
			If NOT target = "" THEN
				
				If VarType(NPCs) = vbArray AND ArrayContains(NPCs, target) THEN
					
					'TODO: initiate npc conversation.
					
				Else
					
					MsgBox "He or she doesn't seem to be here."
				End If
				
			Else
			
				MsgBox "Talk to who?"
			End If
			
		Case "inspect", "check", "look", "look at", "investigate"
		
			If NOT target = "" THEN
				
				index = ItExists(items, target)
				
				If index <> -1 THEN
					
					MsgBox items(index).pDescription
					MsgBox "This item's average value is " & items(index).pValue
					
					If items(index).pLPGain > 0 THEN
					
						MsgBox "This item can be consumed. It can restore " & items(index).pLPGain & " HPs."
					End If
					
				Else
					
					MsgBox "There's nothing to inspect."
				End If
				
			Else
			
				MsgBox "Inspect what?"
			End If
			
		Case "take", "pick", "grab"
		
			If NOT target = "" THEN
				
				If VarType(items) = vbArray AND ArrayContains(items, target) <> -1 THEN
					
					'TODO: check if there is enough place in the inventory.
					'TODO: if not enough place, ask user to remove an item or cancel.
					'TODO: add the item to inventory.
					'TODO: add to the file containing a list of taken items to prevent the player from retaking that item.
					
					MsgBox "Sorry, this feature is not implemented yet."
					
				Else
					
					MsgBox "There's nothing to take."
				End If
				
			Else
			
				MsgBox "Take what?"
			End If
			
		Case "go to", "go"
		
			If NOT target = "" THEN
				
				' There is no vartype verification here because at all times, as long as the player is somewhere,
				' the array places cannot be empty by design. But in case it does happen I would like to say: 
				' Well played crashlord, well played.
				
				If ArrayContains(places, target) THEN 
					
					LoadArea "areas/" & target
					
				Else
					
					MsgBox "That place is out of reach."
				End If
				
			Else
				
				MsgBox "Go where?"
			End If
			
		Case "look around"
		
			If ArrayLength(items) > 0 THEN 
				
				MsgBox "You find " & ObjectArrayToString(items)
			
			Else
				
				MsgBox "You don't find anything interesting."
			End If
	End Select
End Sub