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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCch", "GetCells", "GetColumn", "GetCount", "GetDuplicate2", "GetFont2", "SetFont2", "GetFormattedText2", "SetFormattedText2", "GetGravity", "SetGravity", "GetPara2", "SetPara2", "GetRow", "GetStartPara", "GetTable", "GetURL", "SetURL", "AddSubrange", "BuildUpMath", "DeleteSubrange", "Find", "GetChar2", "GetDropCap", "GetInlineObject", "GetProperty", "GetRect", "GetSubrange", "GetText2", "HexToUnicode", "InsertTable", "Linearize", "SetActiveSubrange", "SetDropCap", "SetProperty", "SetText2", "UnicodeToHex", "SetInlineObject", "GetMathFunctionType", "InsertImage"]

    /**
     * 
     * @param {Pointer<Integer>} pcch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getcch
     */
    GetCch(pcch) {
        result := ComCall(68, this, "int*", pcch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppCells 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getcells
     */
    GetCells(ppCells) {
        result := ComCall(69, this, "ptr*", ppCells, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppColumn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getcolumn
     */
    GetColumn(ppColumn) {
        result := ComCall(70, this, "ptr*", ppColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getcount
     */
    GetCount(pCount) {
        result := ComCall(71, this, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getduplicate2
     */
    GetDuplicate2(ppRange) {
        result := ComCall(72, this, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextFont2>} ppFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getfont2
     */
    GetFont2(ppFont) {
        result := ComCall(73, this, "ptr*", ppFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextFont2} pFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-setfont2
     */
    SetFont2(pFont) {
        result := ComCall(74, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getformattedtext2
     */
    GetFormattedText2(ppRange) {
        result := ComCall(75, this, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextRange2} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-setformattedtext2
     */
    SetFormattedText2(pRange) {
        result := ComCall(76, this, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getgravity
     */
    GetGravity(pValue) {
        result := ComCall(77, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-setgravity
     */
    SetGravity(Value) {
        result := ComCall(78, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} ppPara 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getpara2
     */
    GetPara2(ppPara) {
        result := ComCall(79, this, "ptr*", ppPara, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextPara2} pPara 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-setpara2
     */
    SetPara2(pPara) {
        result := ComCall(80, this, "ptr", pPara, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextRow>} ppRow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getrow
     */
    GetRow(ppRow) {
        result := ComCall(81, this, "ptr*", ppRow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getstartpara
     */
    GetStartPara(pValue) {
        result := ComCall(82, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-gettable
     */
    GetTable(ppTable) {
        result := ComCall(83, this, "ptr*", ppTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-geturl
     */
    GetURL(pbstr) {
        result := ComCall(84, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-seturl
     */
    SetURL(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(85, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cp1 
     * @param {Integer} cp2 
     * @param {Integer} Activate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-addsubrange
     */
    AddSubrange(cp1, cp2, Activate) {
        result := ComCall(86, this, "int", cp1, "int", cp2, "int", Activate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-buildupmath
     */
    BuildUpMath(Flags) {
        result := ComCall(87, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpFirst 
     * @param {Integer} cpLim 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-deletesubrange
     */
    DeleteSubrange(cpFirst, cpLim) {
        result := ComCall(88, this, "int", cpFirst, "int", cpLim, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextRange2} pRange 
     * @param {Integer} Count 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} pDelta 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-find
     */
    Find(pRange, Count, Flags, pDelta) {
        result := ComCall(89, this, "ptr", pRange, "int", Count, "int", Flags, "int*", pDelta, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pChar 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getchar2
     */
    GetChar2(pChar, Offset) {
        result := ComCall(90, this, "int*", pChar, "int", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcLine 
     * @param {Pointer<Integer>} pPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getdropcap
     */
    GetDropCap(pcLine, pPosition) {
        result := ComCall(91, this, "int*", pcLine, "int*", pPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pAlign 
     * @param {Pointer<Integer>} pChar 
     * @param {Pointer<Integer>} pChar1 
     * @param {Pointer<Integer>} pChar2 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Integer>} pTeXStyle 
     * @param {Pointer<Integer>} pcCol 
     * @param {Pointer<Integer>} pLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getinlineobject
     */
    GetInlineObject(pType, pAlign, pChar, pChar1, pChar2, pCount, pTeXStyle, pcCol, pLevel) {
        result := ComCall(92, this, "int*", pType, "int*", pAlign, "int*", pChar, "int*", pChar1, "int*", pChar2, "int*", pCount, "int*", pTeXStyle, "int*", pcCol, "int*", pLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getproperty
     */
    GetProperty(Type, pValue) {
        result := ComCall(93, this, "int", Type, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pLeft 
     * @param {Pointer<Integer>} pTop 
     * @param {Pointer<Integer>} pRight 
     * @param {Pointer<Integer>} pBottom 
     * @param {Pointer<Integer>} pHit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getrect
     */
    GetRect(Type, pLeft, pTop, pRight, pBottom, pHit) {
        result := ComCall(94, this, "int", Type, "int*", pLeft, "int*", pTop, "int*", pRight, "int*", pBottom, "int*", pHit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSubrange 
     * @param {Pointer<Integer>} pcpFirst 
     * @param {Pointer<Integer>} pcpLim 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getsubrange
     */
    GetSubrange(iSubrange, pcpFirst, pcpLim) {
        result := ComCall(95, this, "int", iSubrange, "int*", pcpFirst, "int*", pcpLim, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-gettext2
     */
    GetText2(Flags, pbstr) {
        result := ComCall(96, this, "int", Flags, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-hextounicode
     */
    HexToUnicode() {
        result := ComCall(97, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCol 
     * @param {Integer} cRow 
     * @param {Integer} AutoFit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-inserttable
     */
    InsertTable(cCol, cRow, AutoFit) {
        result := ComCall(98, this, "int", cCol, "int", cRow, "int", AutoFit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-linearize
     */
    Linearize(Flags) {
        result := ComCall(99, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpAnchor 
     * @param {Integer} cpActive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-setactivesubrange
     */
    SetActiveSubrange(cpAnchor, cpActive) {
        result := ComCall(100, this, "int", cpAnchor, "int", cpActive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cLine 
     * @param {Integer} Position 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-setdropcap
     */
    SetDropCap(cLine, Position) {
        result := ComCall(101, this, "int", cLine, "int", Position, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(102, this, "int", Type, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-settext2
     */
    SetText2(Flags, bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(103, this, "int", Flags, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-unicodetohex
     */
    UnicodeToHex() {
        result := ComCall(104, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-setinlineobject
     */
    SetInlineObject(Type, Align, Char, Char1, Char2, Count, TeXStyle, cCol) {
        result := ComCall(105, this, "int", Type, "int", Align, "int", Char, "int", Char1, "int", Char2, "int", Count, "int", TeXStyle, "int", cCol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-getmathfunctiontype
     */
    GetMathFunctionType(bstr, pValue) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(106, this, "ptr", bstr, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} ascent 
     * @param {Integer} Type 
     * @param {BSTR} bstrAltText 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange2-insertimage
     */
    InsertImage(width, height, ascent, Type, bstrAltText, pStream) {
        bstrAltText := bstrAltText is String ? BSTR.Alloc(bstrAltText).Value : bstrAltText

        result := ComCall(107, this, "int", width, "int", height, "int", ascent, "int", Type, "ptr", bstrAltText, "ptr", pStream, "HRESULT")
        return result
    }
}
