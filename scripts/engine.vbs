' TODO: Incomplete: save feature
' Sub SaveGame(fileName)

	' file = fileName & ".sav"
	' Set streamWrite = CreateObject("Scripting.FileSystemObject")
	' Set saveFile = streamWrite.CreateTextFile(file, True)
	' saveFile.WriteLine("This is a test.")
	' saveFile.Close
' End Sub

' TODO: Incomplete LoadArea
' TODO: Check for a temp file to see if some items have already been taken
Sub LoadArea(fileName)

	file = fileName & ".area"
	Set streamRead = CreateObject("Scripting.FileSystemObject")
	Set areaFile = streamRead.OpenTextFile(file)
	
	If streamRead.FileExists(file) THEN
		
		Dim lines(5)
		count = 0
		
		Do Until areaFile.AtEndOfStream
			
			lines(count) = areaFile.ReadLine
			count = count + 1
		Loop
		
		areaFile.Close
		LoadEvent lines(0)
		
		places = Split(lines(1),",")
		items = CreateItems(lines(2))
		' TODO: NPCs
		document.getElementById("mainScreen").innerText = lines(3)
		' TODO: Background pictures
		
	Else
		
		MsgBox "An error ocurred while trying to load the next area; its file was not found."
	End If
End Sub

' TODO: Load battle and dialogue events
Sub LoadEvent(eventLine)

	eventType = Split(eventLine, ",")(0)
	
	Select Case eventType
		
		Case "battle"
			
			msgbox "A battle event has been detected, but that feature is not currently implemented."
			
		Case "dialogue"
		
			msgbox "A dialogue event has been detected, but that feature is not currently implemented."
			
		Case Else
		
			msgbox "Your arrival into this place goes unnoticed... for now!"
		
	End Select
	
End Sub

' TODO: NPC creation
' Function CreateCharacters(charsString)
	
' End Function

Function CreateItems(itemsString)
	
	If itemsString <> "nothing" THEN
	
		itemsStrings = Split(itemsString, ",")
		Dim tempItems()
		Redim tempItems(ArrayLength(itemsStrings))
		
		count = 0
		
		For Each str IN itemsStrings
			
			tempItemProps = Split(str, ".")
			Set tempItems(count) = new GameItem
			
			tempItems(count).Initialize tempItemProps(0), tempItemProps(1), tempItemProps(2), tempItemProps(3)

			count = count + 1
		Next
		
		CreateItems = tempItems
		
	Else
		
		CreateItems = itemsStrings
	End If
End Function

' TODO: Test this sub below.
' Sub PlaySound(filePath)
	
'	Set testStream = CreateObject("Scripting.FileSystemObject")
	
'	If testStream.FileExists(filePath) THEN
	
'		Set soundPlayer = CreateObject("WMPlayer.OCX")
'		soundPlayer.URL = filePath
'		soundPlayer.Controls.Play
'		soundPlayer.Close
'	End If
' End Sub