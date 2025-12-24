#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextSelection.ahk
#Include .\ITextStoryRanges.ahk
#Include .\ITextRange.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITextDocument interface is the Text Object Model (TOM) top-level interface, which retrieves the active selection and range objects for any story in the document�whether active or not.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextdocument
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextDocument extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDocument
     * @type {Guid}
     */
    static IID => Guid("{8cc497c0-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetSelection", "GetStoryCount", "GetStoryRanges", "GetSaved", "SetSaved", "GetDefaultTabStop", "SetDefaultTabStop", "New", "Open", "Save", "Freeze", "Unfreeze", "BeginEditCollection", "EndEditCollection", "Undo", "Redo", "Range", "RangeFromPoint"]

    /**
     * Gets the file name of this document. This is the ITextDocument default property.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * The file name.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-getname
     */
    GetName() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * Gets the active selection.
     * @returns {ITextSelection} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextselection">ITextSelection</a>**</b>
     * 
     * The active selection.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-getselection
     */
    GetSelection() {
        result := ComCall(8, this, "ptr*", &ppSel := 0, "HRESULT")
        return ITextSelection(ppSel)
    }

    /**
     * Gets the count of stories in this document.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The number of stories in the document.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-getstorycount
     */
    GetStoryCount() {
        result := ComCall(9, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the story collection object used to enumerate the stories in a document.
     * @returns {ITextStoryRanges} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstoryranges">ITextStoryRanges</a>**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstoryranges">ITextStoryRanges</a> pointer.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-getstoryranges
     */
    GetStoryRanges() {
        result := ComCall(10, this, "ptr*", &ppStories := 0, "HRESULT")
        return ITextStoryRanges(ppStories)
    }

    /**
     * Gets a value that indicates whether changes have been made since the file was last saved.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The value <b>tomTrue</b> if no changes have been made since the file was last saved, or the value <b>tomFalse</b> if there are unsaved changes.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-getsaved
     */
    GetSaved() {
        result := ComCall(11, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the document Saved property.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * New value of the
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The return value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-setsaved
     */
    SetSaved(Value) {
        result := ComCall(12, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the default tab width.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The default tab width.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-getdefaulttabstop
     */
    GetDefaultTabStop() {
        result := ComCall(13, this, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the default tab stop, which is used when no tab exists beyond the current display position.
     * @param {Float} Value Type: <b>float</b>
     * 
     * New default tab setting, in floating-point points. Default value is 36.0 points, that is, 0.5 inches.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information on COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-setdefaulttabstop
     */
    SetDefaultTabStop(Value) {
        result := ComCall(14, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Opens a new document.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the <b>ITextDocument::New</b> method succeeds, it returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-new
     */
    New() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Opens a specified document. There are parameters to specify access and sharing privileges, creation and conversion of the file, as well as the code page for the file.
     * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
     * 
     * A <b>VARIANT</b> that specifies the name of the file to open.
     * @param {Integer} Flags Type: <b>long</b>
     * 
     * The file creation, open, share, and conversion flags. Default value is zero, which gives read/write access and read/write sharing, open always, and automatic recognition of the file format (unrecognized file formats are treated as text). Other values are defined in the following groups.
     * 
     * 
     * Any combination of these values may be used.
     * 
     * 
     * 
     * <a id="tomReadOnly"></a>
     * <a id="tomreadonly"></a>
     * <a id="TOMREADONLY"></a>
     * @param {Integer} CodePage Type: <b>long</b>
     * 
     * The code page to use for the file. Zero (the default value) means <b>CP_ACP</b> (ANSI code page) unless the file begins with a Unicode BOM 0xfeff, in which case the file is considered to be Unicode. Note that code page 1200 is Unicode, <b>CP_UTF8</b> is UTF-8.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The return value can be an <b>HRESULT</b> value that corresponds to a system error or COM error code, including one of the following values. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeds
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Feature not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-open
     */
    Open(pVar, Flags, CodePage) {
        result := ComCall(16, this, "ptr", pVar, "int", Flags, "int", CodePage, "HRESULT")
        return result
    }

    /**
     * Saves the document.
     * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
     * 
     * The save target. This parameter is a <b>VARIANT</b>, which can be a file name, or <b>NULL</b>.
     * @param {Integer} Flags Type: <b>long</b>
     * 
     * File creation, open, share, and conversion flags. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-open">ITextDocument::Open</a>.
     * @param {Integer} CodePage Type: <b>long</b>
     * 
     * The specified code page. Common values are CP_ACP (zero: system ANSI code page), 1200 (Unicode), and 1208 (UTF-8).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The return value can be an 
     * 						<b>HRESULT</b> value that corresponds to a system error code or a COM error code, including one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeds.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Feature not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-save
     */
    Save(pVar, Flags, CodePage) {
        result := ComCall(17, this, "ptr", pVar, "int", Flags, "int", CodePage, "HRESULT")
        return result
    }

    /**
     * Increments the freeze count.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The updated freeze count.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-freeze
     */
    Freeze() {
        result := ComCall(18, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Decrements the freeze count.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The updated freeze count.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-unfreeze
     */
    Unfreeze() {
        result := ComCall(19, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Turns on edit collection (also called undo grouping).
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undo is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-begineditcollection
     */
    BeginEditCollection() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * Turns off edit collection (also called undo grouping).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns the following COM error code. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-endeditcollection
     */
    EndEditCollection() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Performs a specified number of undo operations.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * The specified number of undo operations. If the value of this parameter is <b>tomFalse</b>, undo processing is suspended. If this parameter is <b>tomTrue</b>, undo processing is restored.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of undo operations performed. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-undo
     */
    Undo(Count) {
        result := ComCall(22, this, "int", Count, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Performs a specified number of redo operations.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * The number of redo operations specified.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of redo operations performed. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-redo
     */
    Redo(Count) {
        result := ComCall(23, this, "int", Count, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Retrieves a text range object for a specified range of content in the active story of the document.
     * @param {Integer} cpActive Type: <b>long</b>
     * 
     * The start position of new range. The default value is zero, which represents the start of the document.
     * @param {Integer} cpAnchor Type: <b>long</b>
     * 
     * The end position of new range. The default value is zero.
     * @returns {ITextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>**</b>
     * 
     * Address of a pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> that receives a pointer to the specified text range.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-range
     */
    Range(cpActive, cpAnchor) {
        result := ComCall(24, this, "int", cpActive, "int", cpAnchor, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }

    /**
     * Retrieves a range for the content at or nearest to the specified point on the screen.
     * @param {Integer} x Type: <b>long</b>
     * 
     * The horizontal coordinate of the specified point, in screen coordinates.
     * @param {Integer} y Type: <b>long</b>
     * 
     * The vertical coordinate of the specified point, in screen coordinates.
     * @returns {ITextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>**</b>
     * 
     * The text range that corresponds to the specified point.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextdocument-rangefrompoint
     */
    RangeFromPoint(x, y) {
        result := ComCall(25, this, "int", x, "int", y, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }
}
