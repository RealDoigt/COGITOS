Class Armour

	Private Name
	Private Thoughness
	Private Durability
	Private IsInitialized
	
	Private Sub Class_Initialize
		
		IsInitialized = CBool(0)
	End Sub
	
	Public Sub Initialize(ByVal newName, ByVal newThoughness)
		
		If NOT IsInitialized THEN
			
			pName = newName
			pThoughness = newThoughness
			IsInitialized = CBool(1)
			pDurability = 20
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
	
	Private Property Let pThoughness(ByVal value)
		
		Thoughness = value
	End Property
	
	Public Property Get pThoughness
		
		If IsInitialized THEN
		
			pThoughness = Thoughness
			
		Else
		
			pThoughness = "Not initialized"
		End If
	End Property
	
	Private Property Let pDurability(ByVal newDurability)
	
		If IsInitialized THEN
		
			If newDurability < 0 Then
			
				Durability = 0
				
			Else
				
				Durability = newDurability
			End if
		End if
	End Property

	Public Property Get pDurability
		
		If IsInitialized THEN
			
			pDurability = Durability
			
		Else
			
			pDurability = "Not initialized" 
		End If
	End Property
	
	Public Property Get Value
		
		If IsInitialized THEN
			
			Value = pDurability * 2 + pThoughness * 4
			
		Else
			
			Value = "Not initialized" 
		End If
	End Property
	
	Public Sub DecreaseDurability(ByVal value)
		
		pDurability = pDurability - value
	End Sub
End Class