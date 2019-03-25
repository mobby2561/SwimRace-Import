Attribute VB_Name = "Main"

Sub Auto()
    
'
' Makro pro �pravu dat k importu do programu SwimRace
'
    
'
    Count = Range("A1").End(xlDown).Row
    sheetExists = False
    Dim ActiveRange As String
    Dim CopySource As String
    Dim PasteRange As String
    Dim DistCell As String
    Dim BirthYear As String
    Dim SexCell As String
    Row = 2
    
    Application.ScreenUpdating = False
    Application.Calculation = xlCalculationManual
    Application.DisplayAlerts = False
    Application.StatusBar = "Pros�m �ekejte..."
    
    Columns("A:A").Select
    Selection.Delete Shift:=xlToLeft
    Columns("D:D").Select
    Selection.Delete Shift:=xlToLeft
    Columns("F:H").Select
    Selection.Merge True
    Selection.UnMerge
    Columns("G:H").Select
    Selection.Delete Shift:=xlToLeft
    Columns("L:L").Select
    Selection.Cut
    Columns("H:H").Select
    Selection.Insert Shift:=xlToRight
    Columns("N:N").Select
    Selection.Cut
    Columns("H:H").Select
    Selection.Insert Shift:=xlToRight
    Columns("Q:Q").Select
    Selection.Cut
    Columns("H:H").Select
    Selection.Insert Shift:=xlToRight
    Range("H1:L1").Select
    Selection.ClearContents
    Columns("G:L").Select
    Selection.Merge True
    Selection.UnMerge
    Columns("H:L").Select
    Selection.Delete Shift:=xlToLeft
    Range("I1:N1").Select
    Selection.ClearContents
    Columns("H:N").Select
    Selection.Merge True
    Columns("H:N").Select
    Range("H111").Activate
    Selection.UnMerge
    Columns("I:P").Select
    Selection.Delete Shift:=xlToLeft
    
    Columns("D:D").Select
    Selection.Cut
    Columns("A:A").Select
    Selection.Insert Shift:=xlToRight
    Columns("N:N").Select
    Selection.Cut
    Columns("B:B").Select
    Selection.Insert Shift:=xlToRight
    Columns("C:C").Select
    Selection.Cut
    Columns("F:F").Select
    Selection.Insert Shift:=xlToRight
    Columns("G:G").Select
    Selection.Cut
    Columns("E:E").Select
    Selection.Insert Shift:=xlToRight
    
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "Odd�l"
    Range("B1").Select
    ActiveCell.FormulaR1C1 = "Zkratka odd�lu"
    Range("G1").Select
    ActiveCell.FormulaR1C1 = "Typ"
    Range("E1").Select
    ActiveCell.FormulaR1C1 = "Rok narozen�"
    
    For Each Sheet In Worksheets
        If "p�ihl�ky" = Sheet.Name Then
            sheetExists = True
        End If
        Next Sheet
        
        If sheetExists = False Then
            With ThisWorkbook
                Set WS = .Worksheets.Add(After:=.Sheets(.Sheets.Count))
                WS.Name = "p�ihl�ky"
            End With
        End If
        
        Worksheets("p�ihl�ky").Activate
        
        Range("A1").Select
        ActiveCell.FormulaR1C1 = "Odd�l"
        Range("B1").Select
        ActiveCell.FormulaR1C1 = "zk# Odd�l"
        Range("C1").Select
        ActiveCell.FormulaR1C1 = "P��jmen�"
        Range("D1").Select
        ActiveCell.FormulaR1C1 = "Jm�no"
        Range("E1").Select
        ActiveCell.FormulaR1C1 = "Rok nar"
        Range("F1").Select
        ActiveCell.FormulaR1C1 = "M/�"
        Range("G1").Select
        ActiveCell.FormulaR1C1 = "Disc"
        Range("H1").Select
        ActiveCell.FormulaR1C1 = "�as"
        
        Worksheets(1).Activate
        
        For i = 2 To Count
            Let ActiveRange = "A" & i
            Range(ActiveRange).Select
            If ActiveCell.FormulaR1C1 = "POFM - z�vodn�k" Or ActiveCell.FormulaR1C1 = "POFM - nez�vodn�k" Then
                ActiveCell.FormulaR1C1 = "Plaveck� odd�l Fr�dek-M�stek"
                Let ActiveRange = "B" & i
                Range(ActiveRange).Select
                ActiveCell.FormulaR1C1 = "POFM"
            End If
            Let ActiveRange = "F" & i
            Range(ActiveRange).Select
            If ActiveCell.FormulaR1C1 = "Chlapec" Then
                ActiveCell.FormulaR1C1 = "M"
            Else
                ActiveCell.FormulaR1C1 = "�"
            End If
            Next i
            
            
            For i = 2 To Count
                Let ActiveRange = "G" & i
                Range(ActiveRange).Select
                If ActiveCell.FormulaR1C1 = "P�edplavec" Then
                    Let CopySource = "A" & i & ":" & "F" & i
                    Let PasteRange = "A" & Row
                    Let DistCell = "G" & Row
                    Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                    Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "26"
                    Row = Row + 1
                End If
                If ActiveCell.FormulaR1C1 = "Hendikepovan�" Then
                    Let CopySource = "A" & i & ":" & "F" & i
                    Let PasteRange = "A" & Row
                    Let DistCell = "G" & Row
                    Let BirthYear = "E" & i
                    Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                    Range(BirthYear).Select
                    If Year(Date) - CInt(ActiveCell.FormulaR1C1) > 16 Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "12"
                    Else
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "11"
                    End If
                    Row = Row + 1
                End If
                If ActiveCell.FormulaR1C1 = "Ostatn�" Or ActiveCell.FormulaR1C1 = "B&#283;�n� plavec" Then
                    Let CopySource = "A" & i & ":" & "F" & i
                    Let PasteRange = "A" & Row
                    Let DistCell = "G" & Row
                    Let BirthYear = "E" & i
                    Let SexCell = "F" & i
                    Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                    Let ActiveRange = "H" & i
                    Range(ActiveRange).Select
                    
                    If ActiveCell.FormulaR1C1 = "" Then
                        If CInt(Year(Date)) - CInt(Range(BirthYear).FormulaR1C1) < 6 Then
                            Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "26"
                            Row = Row + 1
                        End If
                    End If
                    
                    If ActiveCell.FormulaR1C1 = "Prsa 16 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "2"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Znak 16 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "6"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Voln� zp�sob 33 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "10"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Voln� zp�sob 33m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "10"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Prsa 33 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "4"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Znak 33 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "8"
                        Row = Row + 1
                    End If
                    
                    If ActiveCell.FormulaR1C1 = "Prsa 16 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "1"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Znak 16 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "5"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Voln� zp�sob 33 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "9"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Voln� zp�sob 33m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "9"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Prsa 33 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "3"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Znak 33 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "7"
                        Row = Row + 1
                    End If
                    
                    Let ActiveRange = "I" & i
                    Range(ActiveRange).Select
                    Let PasteRange = "A" & Row
                    Let DistCell = "G" & Row
                    
                    If ActiveCell.FormulaR1C1 = "Prsa 16 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "2"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Znak 16 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "6"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Voln� zp�sob 33 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "10"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Voln� zp�sob 33m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "10"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Prsa 33 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "4"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Znak 33 m" And Range(SexCell).FormulaR1C1 = "M" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "8"
                        Row = Row + 1
                    End If
                    
                    If ActiveCell.FormulaR1C1 = "Prsa 16 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "1"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Znak 16 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "5"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Voln� zp�sob 33 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "9"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Voln� zp�sob 33m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "9"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Prsa 33 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "3"
                        Row = Row + 1
                    End If
                    If ActiveCell.FormulaR1C1 = "Znak 33 m" And Range(SexCell).FormulaR1C1 = "�" Then
                        Worksheets(1).Range(CopySource).Copy Worksheets("p�ihl�ky").Range(PasteRange)
                        Worksheets("p�ihl�ky").Range(DistCell).FormulaR1C1 = "7"
                        Row = Row + 1
                    End If
                End If
                Next i
                
                Application.StatusBar = False
                Application.DisplayAlerts = True
                Application.ScreenUpdating = True
                Application.Calculation = xlCalculationAutomatic
                Worksheets("p�ihl�ky").Activate
                i = MsgBox("Data jsou p�ipravena k importu do aplikace SwimRace.", vbOKOnly + vbInformation, "Dokon�eno")
                
            End Sub
            
