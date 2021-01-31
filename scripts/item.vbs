Class GameItem

	Private Name
	Private Description
	Private Value
	Private LPGain
	Private IsInitialized
	
	Private Sub Class_Initialize
		
		IsInitialized = CBool(0)
	End Sub
	
	Public Sub Initialize(ByVal newName, ByVal newDesc, ByVal newValue, ByVal newGain)
		
		If NOT IsInitialized THEN
			
			pName = newName
			pDescription = newDesc
			pValue = newValue
			pLPGain = newGain
			IsInitialized = CBool(1)
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
	
	Private Property Let pDescription(ByVal newDescription)
		
		Description = newDescription
	End Property
	
	Public Property Get pDescription
		
		If IsInitialized THEN
			
			pDescription = Description
			
		Else
		
			pDescription = "Not initialized"
		End If
	End Property
	
	Private Property Let pValue(ByVal newValue)
		
		Value = newValue
	End Property
	
	Public Property Get pValue
		
		If IsInitialized THEN
			
			pValue = Value
			
		Else
			
			pValue = "Not initialized"
		End If
	End Property
	
	Private Property Let pLPGain(ByVal newLPGain)
		
		LPGain = newLPGain
	End Property
	
	Public Property Get pLPGain
		
		If IsInitialized THEN
			
			pLPGain = LPGain
			
		Else
			
			pLPGain = "Not initialized"
		End If
	End Property
End Class