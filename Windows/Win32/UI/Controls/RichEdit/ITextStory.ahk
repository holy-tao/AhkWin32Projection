#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ITextRange2.ahk

/**
 * The ITextStory interface methods are used to access shared data from multiple stories, which is stored in the parent ITextServices instance.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextstory
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextStory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStory
     * @type {Guid}
     */
    static IID => Guid("{c241f5f3-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActive", "SetActive", "GetDisplay", "GetIndex", "GetType", "SetType", "GetProperty", "GetRange", "GetText", "SetFormattedText", "SetProperty", "SetText"]

    /**
     * Sets the active state of a story.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-getactive
     */
    GetActive() {
        result := ComCall(3, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the active state of a story.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The active state. For values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextstory-getactive">ITextStory::GetActive</a> method.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-setactive
     */
    SetActive(Value) {
        result := ComCall(4, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets a new display for a story.
     * @returns {IUnknown} Type: <b>IUnknown**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for a display.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-getdisplay
     */
    GetDisplay() {
        result := ComCall(5, this, "ptr*", &ppDisplay := 0, "HRESULT")
        return IUnknown(ppDisplay)
    }

    /**
     * Gets the index of a story.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The index.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-getindex
     */
    GetIndex() {
        result := ComCall(6, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets this story's type.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-gettype
     */
    GetType() {
        result := ComCall(7, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the story type.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The story type. The type values are defined in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextstory-gettype">ITextStory::GetType</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-settype
     */
    SetType(Value) {
        result := ComCall(8, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the value of the specified property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The ID of the property.  Currently, no extra properties are defined.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The property value.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-getproperty
     */
    GetProperty(Type) {
        result := ComCall(9, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets a text range object for the story.
     * @param {Integer} cpActive Type: <b>long</b>
     * 
     * The active end of the range.
     * @param {Integer} cpAnchor Type: <b>long</b>
     * 
     * The anchor end of the range.
     * @returns {ITextRange2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>**</b>
     * 
     * The text range object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-getrange
     */
    GetRange(cpActive, cpAnchor) {
        result := ComCall(10, this, "int", cpActive, "int", cpAnchor, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    /**
     * Gets the text in a story according to the specified conversion flags.
     * @param {Integer} Flags Type: <b>long</b>
     * 
     * The conversion flags.
     * 
     * A <i>Flags</i> value of 0 retrieves text the same as <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-gettext">ITextRange::GetText</a>.  Other values include the following.
     * 
     * <a id="tomAdjustCRLF"></a>
     * <a id="tomadjustcrlf"></a>
     * <a id="TOMADJUSTCRLF"></a>
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * The text in the story.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-gettext
     */
    GetText(Flags) {
        pbstr := BSTR()
        result := ComCall(11, this, "int", Flags, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Replaces a story’s text with specified formatted text.
     * @param {IUnknown} pUnk Type: <b>IUnknown*</b>
     * 
     * The formatted text to replace the story’s text.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-setformattedtext
     */
    SetFormattedText(pUnk) {
        result := ComCall(12, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * Sets the value of the specified property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The Microsoft accountID that identifies the property. Currently, no extra properties are defined.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new property value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(13, this, "int", Type, "int", Value, "HRESULT")
        return result
    }

    /**
     * Replaces the text in a story with the specified text.
     * @param {Integer} Flags Type: <b>long</b>
     * 
     * Flags controlling how the text is inserted as defined in the following table:
     * 
     * 
     * <a id="tomCheckTextLimit"></a>
     * <a id="tomchecktextlimit"></a>
     * <a id="TOMCHECKTEXTLIMIT"></a>
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The new text for this story. If this parameter is <b>NULL</b>, the text in the story is deleted.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextstory-settext
     */
    SetText(Flags, bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(14, this, "int", Flags, "ptr", bstr, "HRESULT")
        return result
    }
}
