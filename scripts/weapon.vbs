Class Weapon
	
	Private Name
	Private Range
	Private Ammo
	Private Damage
	Private IsInitialized
	
	Private Sub Class_Initialize

		IsInitialized = CBool(0)
	End Sub
	
	Public Sub Initialize(ByVal newName, ByVal newRange, ByVal newAmmo, ByVal newDamage)
		
		If NOT IsInitialized THEN
			
			pName = newName
			pRange = newRange
			pDamage = newDamage
			IsInitialized = CBool(1)
			pAmmo = newAmmo
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
	
	Private Property Let pRange(ByVal newRange)
		
		Range = newRange
	End Property
	
	Public Property Get pRange
		
		If IsInitialized THEN
			
			pRange = Range
			
		Else
		
			pRange = "Not initialized"
		End If
	End Property
	
	Public Property Let pAmmo(ByVal newAmmo)
	
		If IsInitialized THEN
		
			If newAmmo < 0 Then
			
				Ammo = 0
				
			Else
				
				Ammo = newAmmo
			End if
		End if
	End Property

	Public Property Get pAmmo
		
		If IsInitialized THEN
		
			pAmmo = Ammo
		End If
	End Property
	
	Private Property Let pDamage(ByVal newDamage)
		
		Damage = newDamage
	End Property
	
	Public Property Get pDamage
		
		If IsInitialized THEN
			
			pDamage = Damage
			
		Else
		
			pDamage = "Not initialized"
		End If
	End Property
End Class