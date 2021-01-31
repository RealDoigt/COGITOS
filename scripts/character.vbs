Class Character
	
	Private Name
	Private Life
	Private Inventory(19)
	Private WeaponMelee
	Private WeaponRanged
	Private Protection
	Private Skill
	Private Credits
	Private IsInitialized

	Private Sub Class_Initialize

		IsInitialized = CBool(0)
	End Sub
	
	Public Sub Initialize(ByVal newName, ByVal newLife, ByVal newSkill, ByVal newCash)
		
		If NOT IsInitialized THEN
		
			pName = newName
			pSkill = newSkill
			IsInitialized = CBool(1)
			pCredits = newCash
			pLife = newLife
		End If
	End Sub
	
	Private Property Let pName(ByVal newName)
		
		Name = newName
	End Property
	
	Public Property Get pName
		
		If IsInitialized THEN
			
			pName = Name
			
		Else
		
			pName = "Not initialized"
		End If
	End Property
	
	Public Property Let pLife(ByVal newLife)
	
		If IsInitialized THEN
		
			If newLife < 0 THEN
			
				Life = 0
				
			Else
				
				Life = newLife
			End if
		End if
	End Property

	Public Property Get pLife
		
		If IsInitialized THEN
		
			pLife = Life
		End If
	End Property
	
	Private Property Let pSkill(ByVal newSkill)
		
		Skill = newSkill
	End Property
	
	Public Property Get pSkill
		
		If IsInitialized THEN
			
			pSkill = Skill
			
		Else
		
			pSkill = "Not initialized"
		End If
	End Property
	
	Public Property Let pCredits(ByVal newCredits)
	
		If IsInitialized THEN
		
			If newCredits < 0 THEN
			
				Credits = 0
				
			Else
				
				Credits = newCredits
			End if
		End if
	End Property

	Public Property Get pCredits
		
		If IsInitialized THEN
		
			pCredits = Credits
			
		Else
		
			pCredits = "Not initialized"
		End If
	End Property
	
	Public Property Get InventoryIsFull
		
		returnValue = CBool(1)
		
		For count = 0 TO 19
			
			If VarType(Inventory(count)) > 2 THEN 
					
				returnValue = CBool(0)
				Exit For
			End If
		Next
		
		InventoryIsFull = returnValue
	End Property
	
	' Counts from 0, therefore it doesn't return a number from 1 to 20
	Public Property Get InventoryCount
		
		emptyCount = 0
		
		For count = 0 TO 19
			
			' Basically it checks if the 'cell' is empty, var type lower or equal to 2 are basically synonyms for empty
			If VarType(Inventory(count)) <= 2 THEN 
					
				emptyCount = emptyCount + 1 
			End If
		Next
		
		InventoryCount = 19 - emptyCount
	End Property
	
	Public Sub SetArmour(ByVal newArmourName, ByVal newArmourThoughness)
		
		Set Protection = new Armour
		Protection.Initialize newArmourName, newArmourThoughness
	End Sub
	
	Public Sub DamageArmour(ByVal damage)
		
		If VarType(Protection) > 2 THEN
		
			Protection.DecreaseDurability damage
		End If	
	End Sub
	
	Public Sub AddWeapon(ByVal newWeaponName, ByVal newWeaponRange, ByVal newWeaponAmmo, ByVal newWeaponDamage)
		
		If newWeaponRange = "melee" THEN
			
			Set WeaponMelee = new Weapon
			WeaponMelee.Initialize newWeaponName, newWeaponRange, newWeaponAmmo, newWeaponDamage
			
		Else
		
			Set WeaponRanged = new Weapon
			WeaponRanged.Initialize newWeaponName, newWeaponRange, newWeaponAmmo, newWeaponDamage
			
		End If
	End Sub
	
	'It's redundant but it avoids coding many more cases and ifs and make the code even more convoluted.
	Public Function GetMeleeWeapon(ByVal propName)
		
		If VarType(WeaponMelee) > 2 THEN
			
			Select Case propName
			
				Case "Name"
				
					GetMeleeWeapon = WeaponMelee.pName

				Case "Damage"

					GetMeleeWeapon = WeaponMelee.pDamage
					
				Case "Value"
				
					GetMeleeWeapon = WeaponMelee.pDamage * 6
					
				Case Else

					GetMeleeWeapon = "Invalid property name"
			End Select
		End If
	End Function
	
	Public Function GetRangedWeapon(ByVal propName)
		
		If VarType(WeaponRanged) > 2 THEN
			
			Select Case propName
				
				Case "Name"
					
					GetRangedWeapon = WeaponRanged.pName
					
				Case "Ammo"
					
					GetRangedWeapon = WeaponRanged.pAmmo
					
				Case "Damage"
					
					GetRangedWeapon = WeaponRanged.pDamage
					
				Case "Value"
				
					GetRangedWeapon = WeaponRanged.pDamage * 5 + WeaponRanged.pAmmo
					
				Case Else
				
					GetRangedWeapon = "Invalid property name"
			End Select
		End If
	End Function
	
	Public Function GetArmour(ByVal propName)
		
		If VarType(Protection) > 2 THEN
			
			Select Case propName
				
				Case "Name"
					
					GetArmour = Protection.pName
					
				Case "Thoughness"
					
					GetArmour = Protection.pThoughness
					
				Case "Durability"
					
					GetArmour = Protection.pDurability
					
				Case "Value"
				
					GetArmour = Protection.Value
					
				Case Else
				
					GetArmour = "Invalid property name"
			End Select
		End If
	End Function
	
	Public Function GetItem(ByVal index, ByVal propName)
		
		' I would not normaly hardcode the length, but in vbs...
		If IsInitialized AND index > -1 AND index < 20 THEN
			
			Select Case propName
				
				Case "Name"
				
					GetItem = Inventory(index).pName
				
				Case "Desc"
					
					GetItem = Inventory(index).pDescription
					
				Case "Value"
				
					GetItem = Inventory(index).pValue
					
				Case "Gain"
				
					GetItem = Inventory(index).pLPGain
					
				Case Else
				
					GetItem = "Invalid property name"
			End Select
			
		Else
			
			GetItem = "Not initialized or index out of range"
		End If
	End Function
	
	Public Sub AddItem(ByVal newItemName, ByVal newItemDesc, ByVal newItemValue, ByVal newItemGain)
		
		If IsInitialized THEN
			
			' I would not normaly hardcode the length, but in vbs...
			For count = 0 to 19
				
				' Condition checks for empties and nulls in the array. To understand what's going on see: https://docs.microsoft.com/en-us/previous-versions//3kfz157h%28v%3dvs.85%29
				If VarType(Inventory(count)) <= 2 THEN 
					
					Set Inventory(count) = new GameItem
					Inventory(count).Initialize newItemName, newItemDesc, newItemValue, newItemGain
					Exit For
				End If
			Next
		End If
	End Sub
	
	Public Sub RemoveItem(ByVal index)
		
		If IsInitialized AND index > -1 AND index < 20 THEN
		
			Inventory(index) = vbEmpty
		End If
	End Sub
End Class