#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextSelection.ahk

/**
 * The ITextRange2 interface is derived from ITextRange, and its objects are powerful editing and data-binding tools that enable a program to select text in a story and then examine or change that text.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextrange2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextRange2 extends ITextSelection{
    /**
     * The interface identifier for ITextRange2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e2-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 68

    /**
     * 
     * @param {Pointer<Int32>} pcch 
     * @returns {HRESULT} 
     */
    GetCch(pcch) {
        result := ComCall(68, this, "int*", pcch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppCells 
     * @returns {HRESULT} 
     */
    GetCells(ppCells) {
        result := ComCall(69, this, "ptr", ppCells, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppColumn 
     * @returns {HRESULT} 
     */
    GetColumn(ppColumn) {
        result := ComCall(70, this, "ptr", ppColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(71, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     */
    GetDuplicate2(ppRange) {
        result := ComCall(72, this, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextFont2>} ppFont 
     * @returns {HRESULT} 
     */
    GetFont2(ppFont) {
        result := ComCall(73, this, "ptr", ppFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextFont2>} pFont 
     * @returns {HRESULT} 
     */
    SetFont2(pFont) {
        result := ComCall(74, this, "ptr", pFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     */
    GetFormattedText2(ppRange) {
        result := ComCall(75, this, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} pRange 
     * @returns {HRESULT} 
     */
    SetFormattedText2(pRange) {
        result := ComCall(76, this, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetGravity(pValue) {
        result := ComCall(77, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetGravity(Value) {
        result := ComCall(78, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} ppPara 
     * @returns {HRESULT} 
     */
    GetPara2(ppPara) {
        result := ComCall(79, this, "ptr", ppPara, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} pPara 
     * @returns {HRESULT} 
     */
    SetPara2(pPara) {
        result := ComCall(80, this, "ptr", pPara, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRow>} ppRow 
     * @returns {HRESULT} 
     */
    GetRow(ppRow) {
        result := ComCall(81, this, "ptr", ppRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetStartPara(pValue) {
        result := ComCall(82, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppTable 
     * @returns {HRESULT} 
     */
    GetTable(ppTable) {
        result := ComCall(83, this, "ptr", ppTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetURL(pbstr) {
        result := ComCall(84, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    SetURL(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(85, this, "ptr", bstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cp1 
     * @param {Integer} cp2 
     * @param {Integer} Activate 
     * @returns {HRESULT} 
     */
    AddSubrange(cp1, cp2, Activate) {
        result := ComCall(86, this, "int", cp1, "int", cp2, "int", Activate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    BuildUpMath(Flags) {
        result := ComCall(87, this, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cpFirst 
     * @param {Integer} cpLim 
     * @returns {HRESULT} 
     */
    DeleteSubrange(cpFirst, cpLim) {
        result := ComCall(88, this, "int", cpFirst, "int", cpLim, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} pRange 
     * @param {Integer} Count 
     * @param {Integer} Flags 
     * @param {Pointer<Int32>} pDelta 
     * @returns {HRESULT} 
     */
    Find(pRange, Count, Flags, pDelta) {
        result := ComCall(89, this, "ptr", pRange, "int", Count, "int", Flags, "int*", pDelta, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pChar 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    GetChar2(pChar, Offset) {
        result := ComCall(90, this, "int*", pChar, "int", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcLine 
     * @param {Pointer<Int32>} pPosition 
     * @returns {HRESULT} 
     */
    GetDropCap(pcLine, pPosition) {
        result := ComCall(91, this, "int*", pcLine, "int*", pPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Int32>} pAlign 
     * @param {Pointer<Int32>} pChar 
     * @param {Pointer<Int32>} pChar1 
     * @param {Pointer<Int32>} pChar2 
     * @param {Pointer<Int32>} pCount 
     * @param {Pointer<Int32>} pTeXStyle 
     * @param {Pointer<Int32>} pcCol 
     * @param {Pointer<Int32>} pLevel 
     * @returns {HRESULT} 
     */
    GetInlineObject(pType, pAlign, pChar, pChar1, pChar2, pCount, pTeXStyle, pcCol, pLevel) {
        result := ComCall(92, this, "int*", pType, "int*", pAlign, "int*", pChar, "int*", pChar1, "int*", pChar2, "int*", pCount, "int*", pTeXStyle, "int*", pcCol, "int*", pLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetProperty(Type, pValue) {
        result := ComCall(93, this, "int", Type, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Int32>} pLeft 
     * @param {Pointer<Int32>} pTop 
     * @param {Pointer<Int32>} pRight 
     * @param {Pointer<Int32>} pBottom 
     * @param {Pointer<Int32>} pHit 
     * @returns {HRESULT} 
     */
    GetRect(Type, pLeft, pTop, pRight, pBottom, pHit) {
        result := ComCall(94, this, "int", Type, "int*", pLeft, "int*", pTop, "int*", pRight, "int*", pBottom, "int*", pHit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSubrange 
     * @param {Pointer<Int32>} pcpFirst 
     * @param {Pointer<Int32>} pcpLim 
     * @returns {HRESULT} 
     */
    GetSubrange(iSubrange, pcpFirst, pcpLim) {
        result := ComCall(95, this, "int", iSubrange, "int*", pcpFirst, "int*", pcpLim, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetText2(Flags, pbstr) {
        result := ComCall(96, this, "int", Flags, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HexToUnicode() {
        result := ComCall(97, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cCol 
     * @param {Integer} cRow 
     * @param {Integer} AutoFit 
     * @returns {HRESULT} 
     */
    InsertTable(cCol, cRow, AutoFit) {
        result := ComCall(98, this, "int", cCol, "int", cRow, "int", AutoFit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    Linearize(Flags) {
        result := ComCall(99, this, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cpAnchor 
     * @param {Integer} cpActive 
     * @returns {HRESULT} 
     */
    SetActiveSubrange(cpAnchor, cpActive) {
        result := ComCall(100, this, "int", cpAnchor, "int", cpActive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cLine 
     * @param {Integer} Position 
     * @returns {HRESULT} 
     */
    SetDropCap(cLine, Position) {
        result := ComCall(101, this, "int", cLine, "int", Position, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetProperty(Type, Value) {
        result := ComCall(102, this, "int", Type, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    SetText2(Flags, bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(103, this, "int", Flags, "ptr", bstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnicodeToHex() {
        result := ComCall(104, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Align 
     * @param {Integer} Char 
     * @param {Integer} Char1 
     * @param {Integer} Char2 
     * @param {Integer} Count 
     * @param {Integer} TeXStyle 
     * @param {Integer} cCol 
     * @returns {HRESULT} 
     */
    SetInlineObject(Type, Align, Char, Char1, Char2, Count, TeXStyle, cCol) {
        result := ComCall(105, this, "int", Type, "int", Align, "int", Char, "int", Char1, "int", Char2, "int", Count, "int", TeXStyle, "int", cCol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetMathFunctionType(bstr, pValue) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(106, this, "ptr", bstr, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} ascent 
     * @param {Integer} Type 
     * @param {BSTR} bstrAltText 
     * @param {Pointer<IStream>} pStream 
     * @returns {HRESULT} 
     */
    InsertImage(width, height, ascent, Type, bstrAltText, pStream) {
        bstrAltText := bstrAltText is String ? BSTR.Alloc(bstrAltText).Value : bstrAltText

        result := ComCall(107, this, "int", width, "int", height, "int", ascent, "int", Type, "ptr", bstrAltText, "ptr", pStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
