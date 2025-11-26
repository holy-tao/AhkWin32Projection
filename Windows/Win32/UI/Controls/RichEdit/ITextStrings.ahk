#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextRange2.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITextStrings interface represents a collection of rich-text strings that are useful for manipulating rich text.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextstrings
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextStrings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStrings
     * @type {Guid}
     */
    static IID => Guid("{c241f5e7-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item", "GetCount", "Add", "Append", "Cat2", "CatTop2", "DeleteRange", "EncodeFunction", "GetCch", "InsertNullStr", "MoveBoundary", "PrefixTop", "Remove", "SetFormattedText", "SetOpCp", "SuffixTop", "Swap"]

    /**
     * Gets an ITextRange2 object for a selected index in a string collection.
     * @param {Integer} Index Type: <b>long</b>
     * 
     * The index of the string to retrieve. The default value is 1.
     * @returns {ITextRange2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>**</b>
     * 
     * The object to receive the range.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-item
     */
    Item(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    /**
     * Gets the number of strings in a string collection.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of strings.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-getcount
     */
    GetCount() {
        result := ComCall(8, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Adds a string to the end of the collection.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The string. The value can be <b>NULL</b> for  a null string.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-add
     */
    Add(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(9, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * Appends a string to the string at the specified index in the collection.
     * @param {ITextRange2} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>*</b>
     * 
     * The string to append.
     * @param {Integer} iString Type: <b>long</b>
     * 
     * The string index.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-append
     */
    Append(pRange, iString) {
        result := ComCall(10, this, "ptr", pRange, "int", iString, "HRESULT")
        return result
    }

    /**
     * Concatenates two strings.
     * @param {Integer} iString Type: <b>long</b>
     * 
     * The string.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-cat2
     */
    Cat2(iString) {
        result := ComCall(11, this, "int", iString, "HRESULT")
        return result
    }

    /**
     * Inserts text between the top two strings in a collection.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The text to insert. The value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-cattop2
     */
    CatTop2(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(12, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * Deletes the contents of a given range.
     * @param {ITextRange2} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>*</b>
     * 
     * The range to delete.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Range is not degenerate.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-deleterange
     */
    DeleteRange(pRange) {
        result := ComCall(13, this, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * Encodes an object, given a set of argument strings.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The object type. See <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-getinlineobject">ITextRange2::GetInlineObject</a> for a table of definitions.
     * @param {Integer} Align Type: <b>long</b>
     * 
     * The object alignment. See <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-getinlineobject">ITextRange2::GetInlineObject</a> for a table of definitions.
     * @param {Integer} Char Type: <b>long</b>
     * 
     * The object character.
     * @param {Integer} Char1 Type: <b>long</b>
     * 
     * The object character.
     * @param {Integer} Char2 Type: <b>long</b>
     * 
     * The object character.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * The count of strings (arguments) to concatenate.
     * @param {Integer} TeXStyle Type: <b>long</b>
     * 
     * The TeX style.
     * @param {Integer} cCol Type: <b>long</b>
     * 
     * The count of columns (<b>tomArray</b> only).
     * @param {ITextRange2} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>*</b>
     * 
     * The specifying range that points at the desired formatting.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-encodefunction
     */
    EncodeFunction(Type, Align, Char, Char1, Char2, Count, TeXStyle, cCol, pRange) {
        result := ComCall(14, this, "int", Type, "int", Align, "int", Char, "int", Char1, "int", Char2, "int", Count, "int", TeXStyle, "int", cCol, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * Gets the count of characters for a selected string index.
     * @param {Integer} iString Type: <b>long</b>
     * 
     * The string index.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The string character count.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-getcch
     */
    GetCch(iString) {
        result := ComCall(15, this, "int", iString, "int*", &pcch := 0, "HRESULT")
        return pcch
    }

    /**
     * Inserts a NULL string in the collection at a selected string index.
     * @param {Integer} iString Type: <b>long</b>
     * 
     * The string index.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-insertnullstr
     */
    InsertNullStr(iString) {
        result := ComCall(16, this, "int", iString, "HRESULT")
        return result
    }

    /**
     * Moves the start boundary of a string, by index, for a selected number of characters.
     * @param {Integer} iString Type: <b>long</b>
     * 
     * The string index.
     * @param {Integer} cch Type: <b>long</b>
     * 
     * The selected number of characters to move the boundary.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-moveboundary
     */
    MoveBoundary(iString, cch) {
        result := ComCall(17, this, "int", iString, "int", cch, "HRESULT")
        return result
    }

    /**
     * Prefixes a string to the top string in the collection.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The string to prefix to the collection.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-prefixtop
     */
    PrefixTop(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(18, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * Removes a string from a string collection, starting at an index.
     * @param {Integer} iString Type: <b>long</b>
     * 
     * The string index.
     * @param {Integer} cString Type: <b>long</b>
     * 
     * The count of strings to remove.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-remove
     */
    Remove(iString, cString) {
        result := ComCall(19, this, "int", iString, "int", cString, "HRESULT")
        return result
    }

    /**
     * Replaces text with formatted text.
     * @param {ITextRange2} pRangeD Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>*</b>
     * 
     * The text to be replaced.
     * @param {ITextRange2} pRangeS Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>*</b>
     * 
     * The formatted text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-setformattedtext
     */
    SetFormattedText(pRangeD, pRangeS) {
        result := ComCall(20, this, "ptr", pRangeD, "ptr", pRangeS, "HRESULT")
        return result
    }

    /**
     * Sets the character position in the source range's story that has desired character formatting attributes.
     * @param {Integer} iString Type: <b>long</b>
     * 
     * The index of the string to associate with a character position.
     * @param {Integer} cp Type: <b>long</b>
     * 
     * The character position in source range's story that has the desired character formatting.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-setopcp
     */
    SetOpCp(iString, cp) {
        result := ComCall(21, this, "int", iString, "int", cp, "HRESULT")
        return result
    }

    /**
     * Suffixes a string to the top string in the collection.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The text to suffix to the top string.
     * @param {ITextRange2} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>*</b>
     * 
     * The range with the desired character formatting.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-suffixtop
     */
    SuffixTop(bstr, pRange) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(22, this, "ptr", bstr, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * Swaps the top two strings in the collection.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstrings-swap
     */
    Swap() {
        result := ComCall(23, this, "HRESULT")
        return result
    }
}
