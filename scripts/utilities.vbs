Sub Document_OnKeyUp
	
	If Window.Event.Keycode = 13 THEN 
		
		ReadCommand
	End If
End Sub

Public Function RollDie()

		Randomize
		RollDie = Int(6 * Rnd + 1)
		' Basically to generate a random number it's Int((maximum - minimum + 1) * Rnd + minimum).
		' In the context of a die, the minimum is always 1, so it cancels out with the + 1 constant.
		' Therefore, we can simplify Int((6 - 1 + 1) * Rnd + 1) to Int(6 * Rnd + 1).
		' In the past, this function accepted a parameter for the number of faces, but since this game is based
		' on a simplified version of Warlock of Firetop Mountain, the parameter was removed.
End Function

Function ArrayLength(array)
	
	count = 0
	
	' I discovered this function in the documentation much later than vartype.
	If IsArray(array) THEN
	
		For Each thing IN array
		
			count = count + 1
		Next
	End if
	
	ArrayLength = count
End Function

Function ArrayContains(array, value)
	
	ArrayContains = CBool(0)
	
	If IsArray(array) THEN
	
		For Each thing IN array
			
			If thing = value THEN
			
				ArrayContains = CBool(1)
				Exit For
			End If
		Next
	End if
	
	' You may have seen this odd structure all over the place, I know it's weird.
	' So, while you could think that there's a an equivalent of a return statement 
	' in vbscript, it's not really true. Even if you 'assigned' a value to the function,
	' the interpreter will not break out in the middle of the function. I learned that 
	' the hard way. Basically, a function returns the last value it was assigned.
End Function

' If the object exists, it returns the index of the array where it was found, else it returns -1
Function ItExists(array, value)

	ItExists = -1
		
	If IsArray(array) THEN
		
		count = 0
		
		For Each thing IN array
			
			If thing.pName = value THEN
			
				ItExists = count
				Exit For
			End If
			
			count = count + 1
		Next
	End if
End Function

' TODO: Fix ObjectArrayToString
Function ObjectArrayToString(array)

	ObjectArrayToString = ""
		
	' If IsArray(array) THEN
		
		' For Each thing IN array
			
			' Due to a reason which eludes me, here thing is not treated as an object despite using the same logic in the above function
			' with no issue whatsoever. So for now, until the problem has been solved, it is commented out
			' ObjectArrayToString = ObjectArrayToString & thing.pName & ", "
		' Next
	' End if
End Function