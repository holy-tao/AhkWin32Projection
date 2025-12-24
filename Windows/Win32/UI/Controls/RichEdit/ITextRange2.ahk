#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ITextRange2.ahk
#Include .\ITextFont2.ahk
#Include .\ITextPara2.ahk
#Include .\ITextRow.ahk
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
     * Gets the count of characters in a range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The signed count of characters.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getcch
     */
    GetCch() {
        result := ComCall(68, this, "int*", &pcch := 0, "HRESULT")
        return pcch
    }

    /**
     * Gets a cells object with the parameters of cells in the currently selected table row or column.
     * @returns {IUnknown} Type: <b>IUnknown**</b>
     * 
     * The cells object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getcells
     */
    GetCells() {
        result := ComCall(69, this, "ptr*", &ppCells := 0, "HRESULT")
        return IUnknown(ppCells)
    }

    /**
     * Gets the column properties for the currently selected column.
     * @returns {IUnknown} Type: <b>IUnknown**</b>
     * 
     * The column properties for the currently selected column.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getcolumn
     */
    GetColumn() {
        result := ComCall(70, this, "ptr*", &ppColumn := 0, "HRESULT")
        return IUnknown(ppColumn)
    }

    /**
     * Gets the count of subranges, including the active subrange in the current range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of subranges not including the active one.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getcount
     */
    GetCount() {
        result := ComCall(71, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets a duplicate of a range object.
     * @returns {ITextRange2} Type: <b>ITextRange2**</b>
     * 
     * The duplicate range.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getduplicate2
     */
    GetDuplicate2() {
        result := ComCall(72, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    /**
     * Gets an ITextFont2 object with the character attributes of the current range.
     * @returns {ITextFont2} Type: <b>ITextFont2**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getfont2
     */
    GetFont2() {
        result := ComCall(73, this, "ptr*", &ppFont := 0, "HRESULT")
        return ITextFont2(ppFont)
    }

    /**
     * Sets the character formatting attributes of the range.
     * @param {ITextFont2} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont2">ITextFont2</a>*</b>
     * 
     * The font object with the desired character formatting attributes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-setfont2
     */
    SetFont2(pFont) {
        result := ComCall(74, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * Gets an ITextRange2 object with the current range's formatted text.
     * @returns {ITextRange2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>**</b>
     * 
     * The formatted text.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getformattedtext2
     */
    GetFormattedText2() {
        result := ComCall(75, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    /**
     * Sets the text of this range to the formatted text of the specified range.
     * @param {ITextRange2} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>*</b>
     * 
     * The range that contains the formatted text that replaces the text of this range.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-setformattedtext2
     */
    SetFormattedText2(pRange) {
        result := ComCall(76, this, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * Gets the gravity of this range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The gravity value, which can be one of the following: 
     * 
     * <a id="tomGravityUI"></a>
     * <a id="tomgravityui"></a>
     * <a id="TOMGRAVITYUI"></a>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getgravity
     */
    GetGravity() {
        result := ComCall(77, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the gravity of this range.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new gravity value, which can be one of the following.
     * 
     * <a id="tomGravityUI"></a>
     * <a id="tomgravityui"></a>
     * <a id="TOMGRAVITYUI"></a>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-setgravity
     */
    SetGravity(Value) {
        result := ComCall(78, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets an ITextPara2 object with the paragraph attributes of a range.
     * @returns {ITextPara2} Type: <b>ITextPara2**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara2">ITextPara2</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getpara2
     */
    GetPara2() {
        result := ComCall(79, this, "ptr*", &ppPara := 0, "HRESULT")
        return ITextPara2(ppPara)
    }

    /**
     * Sets the paragraph format attributes of a range.
     * @param {ITextPara2} pPara Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara2">ITextPara2</a>*</b>
     * 
     * The desired paragraph format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-setpara2
     */
    SetPara2(pPara) {
        result := ComCall(80, this, "ptr", pPara, "HRESULT")
        return result
    }

    /**
     * Gets the row properties in the currently selected row.
     * @returns {ITextRow} Type: <b>ITextRow**</b>
     * 
     * The row properties.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getrow
     */
    GetRow() {
        result := ComCall(81, this, "ptr*", &ppRow := 0, "HRESULT")
        return ITextRow(ppRow)
    }

    /**
     * Gets the character position of the start of the paragraph that contains the range's start character position.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The start of the paragraph that contains the range's start character position.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getstartpara
     */
    GetStartPara() {
        result := ComCall(82, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets the table properties in the currently selected table.
     * @returns {IUnknown} Type: <b>IUnknown**</b>
     * 
     * The table properties.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-gettable
     */
    GetTable() {
        result := ComCall(83, this, "ptr*", &ppTable := 0, "HRESULT")
        return IUnknown(ppTable)
    }

    /**
     * Returns the URL text associated with a range.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * The URL text associated with the range.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-geturl
     */
    GetURL() {
        pbstr := BSTR()
        result := ComCall(84, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Sets the text in this range to that of the specified URL.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The text to use as a URL for the selected friendly name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-seturl
     */
    SetURL(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(85, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * Adds a subrange to this range.
     * @param {Integer} cp1 Type: <b>long</b>
     * 
     * The active-end character position of the subrange.
     * @param {Integer} cp2 Type: <b>long</b>
     * 
     * The anchor-end character position  of the subrange.
     * @param {Integer} Activate Type: <b>long</b>
     * 
     * The activate parameter.  If this parameter is <b>tomTrue</b>, the new subrange is the active subrange, with <i>cp1</i> as the active end, and <i>cp2</i> the anchor end.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-addsubrange
     */
    AddSubrange(cp1, cp2, Activate) {
        result := ComCall(86, this, "int", cp1, "int", cp2, "int", Activate, "HRESULT")
        return result
    }

    /**
     * Converts the linear-format math in a range to a built-up form, or modifies the current built-up form.
     * @param {Integer} Flags Type: <b>long</b>
     * 
     * A combination of the following flags.
     * 
     * <a id="tomChemicalFormula"></a>
     * <a id="tomchemicalformula"></a>
     * <a id="TOMCHEMICALFORMULA"></a>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-buildupmath
     */
    BuildUpMath(Flags) {
        result := ComCall(87, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Deletes a subrange from a range.
     * @param {Integer} cpFirst Type: <b>long</b>
     * 
     * The start character position of the subrange.
     * @param {Integer} cpLim Type: <b>long</b>
     * 
     * The end character position of the subrange.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-deletesubrange
     */
    DeleteSubrange(cpFirst, cpLim) {
        result := ComCall(88, this, "int", cpFirst, "int", cpLim, "HRESULT")
        return result
    }

    /**
     * Searchs for math inline functions in text as specified by a source range.
     * @param {ITextRange2} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>*</b>
     * 
     * The formatted text to find in the range's text.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * The number of characters to search through.
     * @param {Integer} Flags Type: <b>long</b>
     * 
     * Flags that control the search as defined for <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-findtext">ITextRange::FindText</a>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A count of the number of characters bypassed.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-find
     */
    Find(pRange, Count, Flags) {
        result := ComCall(89, this, "ptr", pRange, "int", Count, "int", Flags, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Gets the character at the specified offset from the end of this range.
     * @param {Integer} Offset Type: <b>long</b>
     * 
     * The offset from the end of the range. An offset of 0 gets the character at the end of the range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The character value.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getchar2
     */
    GetChar2(Offset) {
        result := ComCall(90, this, "int*", &pChar := 0, "int", Offset, "HRESULT")
        return pChar
    }

    /**
     * Gets the drop-cap parameters of the paragraph that contains this range.
     * @param {Pointer<Integer>} pcLine Type: <b>long*</b>
     * 
     * The count of lines for the drop cap.  A value of 0 means no drop cap.
     * @param {Pointer<Integer>} pPosition Type: <b>long*</b>
     * 
     * The position of the drop cap. The position can be one of the following: 
     * 
     * <ul>
     * <li>tomDropMargin</li>
     * <li>tomDropNone</li>
     * <li>tomDropNormal</li>
     * </ul>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getdropcap
     */
    GetDropCap(pcLine, pPosition) {
        pcLineMarshal := pcLine is VarRef ? "int*" : "ptr"
        pPositionMarshal := pPosition is VarRef ? "int*" : "ptr"

        result := ComCall(91, this, pcLineMarshal, pcLine, pPositionMarshal, pPosition, "HRESULT")
        return result
    }

    /**
     * Gets the properties of the inline object at the range active end.
     * @param {Pointer<Integer>} pType Type: <b>long*</b>
     * 
     * The inline object type can be one of the following:
     * 
     * 
     * <a id="tomSimpleText"></a>
     * <a id="tomsimpletext"></a>
     * <a id="TOMSIMPLETEXT"></a>
     * @param {Pointer<Integer>} pAlign Type: <b>long*</b>
     * 
     * The inline object alignment, which can be one of these meanings depending on the inline object type:
     * <table>
     * <tr>
     * <th>Inline object type</th>
     * <th>Meaning of Align Parameter</th>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomRuby</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomRubyBelow</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomRubyAlignCenter</a> (default)</dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomRubyAlign010</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomRubyAlign121</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomRubyAlignLeft</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomRubyAlignRight</a></dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomBox</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxAlignCenter</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSpaceMask</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSpaceDefault</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSpaceUnary</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSpaceBinary</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSpaceRelational</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSpaceSkip</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSpaceOrd</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSpaceDifferential</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSizeText</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSizeScript</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSizeScriptScript</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomNoBreak</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomTransparentForPositioning</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomTransparentForSpacing</a></dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomBoxedFormula</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxHideTop</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxHideBottom</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxHideLeft</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxHideRight</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxStrikeH</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxStrikeV</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxStrikeTLBR</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomBoxStrikeBLTR</a></dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomBrackets</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomAlignDefault</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomAlignCenter</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomAlignMatchAscentDescent</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMathVariant</a></dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomEquationArray</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomEqArrayLayoutWidth</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomEqArrayAlignMask</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomEqArrayAlignCenter</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomEqArrayAlignTopRow</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomEqArrayAlignBottomRow</a></dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomMatrix</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMatrixAlignMask</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMatrixAlignCenter</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMatrixAlignTopRow</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomMatrixAlignBottomRow</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomShowMatPlaceHldr</a></dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomNary</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomLimitsDefault</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomLimitsUnderOver</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomLimitsSubSup</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomUpperLimitAsSuperScript</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomLimitsOpposite</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomShowLLimPlaceHldr</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomShowULimPlaceHldr</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomDontGrowWithContent</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomGrowWithContent</a></dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomPhantom</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomPhantomShow</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomPhantomZeroWidth</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomPhantomZeroAscent</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomPhantomZeroDescent</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomPhantomTransparent</a></dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomRadical</a></td>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomShowDegPlaceHldr</a></td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomSubSup</a></td>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomSubSupAlign</a></td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomStretchStack</a></td>
     * <td>
     * <dl>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomStretchCharBelow</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomStretchCharAbove</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomStretchBaseBelow</a></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomStretchBaseAbove</a></dt>
     * </dl>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pChar Type: <b>long*</b>
     * 
     * The inline object character.
     * 
     * The value for each object type is shown in the following table..  <table>
     * <tr>
     * <th>Inline object type</th>
     * <th>Meaning of align parameter</th>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomAccent</a></td>
     * <td>Accent (U+0300—U+36F, U+20D0—U+20EF)</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomBoxedFormula</a></td>
     * <td>U+25AD for rectangle enclosure</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomBrackets</a></td>
     * <td>Opening bracket. Default: U+0028.  </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomBracketsWithSeps</a></td>
     * <td>Opening bracket with separators. Default: U+0028</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomEquationArray</a></td>
     * <td>U+2588</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomFraction</a></td>
     * <td>Normal built-up fraction: U+002F; small numeric fraction: U+2298</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomFunctionApply</a></td>
     * <td>U+2061</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomLeftSubSup</a></td>
     * <td>U+005E</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomLowerLimit</a></td>
     * <td>U+252C</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomMatrix</a></td>
     * <td>
     * <dl>
     * <dt>U+25A0: no enclosing brackets
     * </dt>
     * <dt>U+24A8: enclosing parentheses (\pmatrix)
     * </dt>
     * <dt>U+24B1: enclosing vertical bars (\vmatrix)
     * </dt>
     * <dt>U+24A9: enclosing double vertical bars (\Vmatrix)
     * </dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomNary</a></td>
     * <td>n-ary symbol</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomOpChar</a></td>
     * <td>Internal use for no-build operators</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomOverbar</a></td>
     * <td>U+00AF</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomPhantom</a></td>
     * <td>
     * <dl>
     * <dt>U+27E1: full or custom phantom
     * </dt>
     * <dt>U+2B04: horizontal phantom
     * </dt>
     * <dt>U+21F3: vertical phantom
     * </dt>
     * <dt>U+2B06: ascent smash
     * </dt>
     * <dt>U+2B07: descent smash
     * </dt>
     * <dt>U+2B0C: horizontal smash
     * </dt>
     * <dt>U+2B0D: full smash
     * </dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomRadical</a></td>
     * <td>
     * <dl>
     * <dt>U+221A: square or nth root
     * </dt>
     * <dt>U+221B: cube root
     * </dt>
     * <dt>U+221C: fourth root
     * </dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomSlashedFraction</a></td>
     * <td>
     * <dl>
     * <dt>U+2044: skewed fraction</dt>
     * <dt>U+2215: built-up linear fraction
     * </dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomStack</a></td>
     * <td>U+00A6
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomStretchStack</a></td>
     * <td>Horizontal stretch character (see <a href="https://www.unicode.org/notes/tn28/">Unicode Technical Note 28</a> Appendix B for a list)</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomSubscript</a></td>
     * <td>U+005E
     * 
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomSubSup</a></td>
     * <td>U+005E</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomSuperscript</a></td>
     * <td>U+005F</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomUnderbar</a></td>
     * <td>U+2581</td>
     * </tr>
     * <tr>
     * <td><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomUpperLimit</a></td>
     * <td>U+2534</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pChar1 Type: <b>long*</b>
     * 
     * The closing <b>tomBrackets</b> character.  See <a href="https://www.unicode.org/notes/tn28/">Unicode Technical Note 28</a> Appendix B. Character Keywords and Properties for a list.
     * @param {Pointer<Integer>} pChar2 Type: <b>long*</b>
     * 
     * The separator character for <b>tomBracketsWithSep</b>:
     * @param {Pointer<Integer>} pCount Type: <b>long*</b>
     * 
     * The inline object count of arguments.
     * @param {Pointer<Integer>} pTeXStyle Type: <b>long*</b>
     * @param {Pointer<Integer>} pcCol Type: <b>long*</b>
     * 
     * The inline object count of columns (<b>tomMatrix</b> only).
     * @param {Pointer<Integer>} pLevel Type: <b>long*</b>
     * 
     * The inline object 0-based nesting level.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getinlineobject
     */
    GetInlineObject(pType, pAlign, pChar, pChar1, pChar2, pCount, pTeXStyle, pcCol, pLevel) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pAlignMarshal := pAlign is VarRef ? "int*" : "ptr"
        pCharMarshal := pChar is VarRef ? "int*" : "ptr"
        pChar1Marshal := pChar1 is VarRef ? "int*" : "ptr"
        pChar2Marshal := pChar2 is VarRef ? "int*" : "ptr"
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"
        pTeXStyleMarshal := pTeXStyle is VarRef ? "int*" : "ptr"
        pcColMarshal := pcCol is VarRef ? "int*" : "ptr"
        pLevelMarshal := pLevel is VarRef ? "int*" : "ptr"

        result := ComCall(92, this, pTypeMarshal, pType, pAlignMarshal, pAlign, pCharMarshal, pChar, pChar1Marshal, pChar1, pChar2Marshal, pChar2, pCountMarshal, pCount, pTeXStyleMarshal, pTeXStyle, pcColMarshal, pcCol, pLevelMarshal, pLevel, "HRESULT")
        return result
    }

    /**
     * Gets the value of a property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The property ID.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The property value.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getproperty
     */
    GetProperty(Type) {
        result := ComCall(93, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a rectangle of the specified type for the current range.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The type of rectangle to return. This parameter can include one value from each of the following tables. 
     * 
     * <a id="tomAllowOffClient"></a>
     * <a id="tomallowoffclient"></a>
     * <a id="TOMALLOWOFFCLIENT"></a>
     * @param {Pointer<Integer>} pLeft Type: <b>long*</b>
     * 
     * The left rectangle coordinate.
     * @param {Pointer<Integer>} pTop Type: <b>long*</b>
     * 
     * The top rectangle coordinate.
     * @param {Pointer<Integer>} pRight Type: <b>long*</b>
     * 
     * The right rectangle coordinate.
     * @param {Pointer<Integer>} pBottom Type: <b>long*</b>
     * 
     * The bottom rectangle coordinate.
     * @param {Pointer<Integer>} pHit Type: <b>long*</b>
     * 
     * The hit-test value for the range.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getrect
     */
    GetRect(Type, pLeft, pTop, pRight, pBottom, pHit) {
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pRightMarshal := pRight is VarRef ? "int*" : "ptr"
        pBottomMarshal := pBottom is VarRef ? "int*" : "ptr"
        pHitMarshal := pHit is VarRef ? "int*" : "ptr"

        result := ComCall(94, this, "int", Type, pLeftMarshal, pLeft, pTopMarshal, pTop, pRightMarshal, pRight, pBottomMarshal, pBottom, pHitMarshal, pHit, "HRESULT")
        return result
    }

    /**
     * Retrieves a subrange in a range.
     * @param {Integer} iSubrange Type: <b>long</b>
     * 
     * The subrange index.
     * @param {Pointer<Integer>} pcpFirst Type: <b>long*</b>
     * 
     * The character position for the start of the subrange.
     * @param {Pointer<Integer>} pcpLim Type: <b>long*</b>
     * 
     * The character position for the end of the subrange.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getsubrange
     */
    GetSubrange(iSubrange, pcpFirst, pcpLim) {
        pcpFirstMarshal := pcpFirst is VarRef ? "int*" : "ptr"
        pcpLimMarshal := pcpLim is VarRef ? "int*" : "ptr"

        result := ComCall(95, this, "int", iSubrange, pcpFirstMarshal, pcpFirst, pcpLimMarshal, pcpLim, "HRESULT")
        return result
    }

    /**
     * Gets the text in this range according to the specified conversion flags.
     * @param {Integer} Flags Type: <b>long</b>
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * The text in the range.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-gettext2
     */
    GetText2(Flags) {
        pbstr := BSTR()
        result := ComCall(96, this, "int", Flags, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Converts and replaces the hexadecimal number at the end of this range to a Unicode character.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-hextounicode
     */
    HexToUnicode() {
        result := ComCall(97, this, "HRESULT")
        return result
    }

    /**
     * Inserts a table in a range.
     * @param {Integer} cCol Type: <b>long</b>
     * 
     * The number of columns in the table.
     * @param {Integer} cRow Type: <b>long</b>
     * 
     * The number of rows in the table.
     * @param {Integer} AutoFit Type: <b>long</b>
     * 
     * Specifies how the cells fit the target space.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-inserttable
     */
    InsertTable(cCol, cRow, AutoFit) {
        result := ComCall(98, this, "int", cCol, "int", cRow, "int", AutoFit, "HRESULT")
        return result
    }

    /**
     * Translates the built-up math, ruby, and other inline objects in this range to linearized form.
     * @param {Integer} Flags Type: <b>long</b>
     * 
     * A combination of the following flags.
     * 
     * <a id="tomMathAlphabetics"></a>
     * <a id="tommathalphabetics"></a>
     * <a id="TOMMATHALPHABETICS"></a>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-linearize
     */
    Linearize(Flags) {
        result := ComCall(99, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Makes the specified subrange the active subrange of this range.
     * @param {Integer} cpAnchor Type: <b>long</b>
     * 
     * The anchor end character position of the subrange to make active.
     * @param {Integer} cpActive Type: <b>long</b>
     * 
     * The active end character position of the subrange to make active.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-setactivesubrange
     */
    SetActiveSubrange(cpAnchor, cpActive) {
        result := ComCall(100, this, "int", cpAnchor, "int", cpActive, "HRESULT")
        return result
    }

    /**
     * Sets the drop-cap parameters for the paragraph that contains the current range.
     * @param {Integer} cLine Type: <b>long</b>
     * 
     * The count of lines for drop cap. Zero means no drop cap.
     * @param {Integer} Position Type: <b>long</b>
     * 
     * The position of drop cap. It can be one of the following. <dl>
     * <dd>tomDropMargin</dd>
     * <dd>tomDropNone</dd>
     * <dd>tomDropNormal</dd>
     * </dl>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-setdropcap
     */
    SetDropCap(cLine, Position) {
        result := ComCall(101, this, "int", cLine, "int", Position, "HRESULT")
        return result
    }

    /**
     * Sets the value of the specified property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The ID of the property to set.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new property value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(102, this, "int", Type, "int", Value, "HRESULT")
        return result
    }

    /**
     * Sets the text of this range.
     * @param {Integer} Flags Type: <b>long</b>
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The new text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-settext2
     */
    SetText2(Flags, bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(103, this, "int", Flags, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * Converts the Unicode character(s) preceding the start position of this text range to a hexadecimal number, and selects it.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-unicodetohex
     */
    UnicodeToHex() {
        result := ComCall(104, this, "HRESULT")
        return result
    }

    /**
     * Sets or inserts the properties of an inline object for a degenerate range.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The object type as defined in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-getinlineobject">ITextRange2::GetInlineObject</a>.
     * @param {Integer} Align Type: <b>long</b>
     * 
     * The object alignment as defined in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-getinlineobject">ITextRange2::GetInlineObject</a>.
     * @param {Integer} Char Type: <b>long</b>
     * 
     * The object character as defined in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-getinlineobject">ITextRange2::GetInlineObject</a>.
     * @param {Integer} Char1 Type: <b>long</b>
     * 
     * The closing bracket (<a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomBrackets</a>) character. See <a href="https://www.unicode.org/notes/tn28/">Unicode Technical Note 28</a> for a list of characters.
     * @param {Integer} Char2 Type: <b>long</b>
     * @param {Integer} Count Type: <b>long</b>
     * 
     * The number of arguments in the inline object.
     * @param {Integer} TeXStyle Type: <b>long</b>
     * 
     * The TeX style, as defined in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-getinlineobject">ITextRange2::GetInlineObject</a>.
     * @param {Integer} cCol Type: <b>long</b>
     * 
     * The number of columns in the inline object. For  <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">tomMatrix</a> only.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-setinlineobject
     */
    SetInlineObject(Type, Align, Char, Char1, Char2, Count, TeXStyle, cCol) {
        result := ComCall(105, this, "int", Type, "int", Align, "int", Char, "int", Char1, "int", Char2, "int", Count, "int", TeXStyle, "int", cCol, "HRESULT")
        return result
    }

    /**
     * Retrieves the math function type associated with the specified math function name.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The math function name that is checked to determine the math function type.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-getmathfunctiontype
     */
    GetMathFunctionType(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(106, this, "ptr", bstr, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Inserts an image into this range.
     * @param {Integer} width Type: <b>long</b>
     * 
     * The width, in HIMETRIC units (0.01 mm), of the image.
     * @param {Integer} height Type: <b>long</b>
     * 
     * The height, in HIMETRIC units, of the image.
     * @param {Integer} ascent Type: <b>long</b>
     * 
     * If <i>Type</i> is TA_BASELINE, this parameter is the distance, in HIMETRIC units, that the top of the image extends above the text baseline. If <i>Type</i> is TA_BASELINE and <i>ascent</i> is zero, the bottom of the image is placed at the text baseline.
     * @param {Integer} Type Type: <b>long</b>
     * @param {BSTR} bstrAltText Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The alternate text for the image.
     * @param {IStream} pStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a></b>
     * 
     * The stream that contains the image data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange2-insertimage
     */
    InsertImage(width, height, ascent, Type, bstrAltText, pStream) {
        bstrAltText := bstrAltText is String ? BSTR.Alloc(bstrAltText).Value : bstrAltText

        result := ComCall(107, this, "int", width, "int", height, "int", ascent, "int", Type, "ptr", bstrAltText, "ptr", pStream, "HRESULT")
        return result
    }
}
