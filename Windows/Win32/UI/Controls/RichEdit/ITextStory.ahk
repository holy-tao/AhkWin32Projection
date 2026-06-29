#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITextRange2.ahk" { ITextRange2 }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITextStory interface methods are used to access shared data from multiple stories, which is stored in the parent ITextServices instance.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextstory
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct ITextStory extends IUnknown {
    /**
     * The interface identifier for ITextStory
     * @type {Guid}
     */
    static IID := Guid("{c241f5f3-7206-11d8-a2c7-00a0d1d6c6b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextStory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetActive        : IntPtr
        SetActive        : IntPtr
        GetDisplay       : IntPtr
        GetIndex         : IntPtr
        GetType          : IntPtr
        SetType          : IntPtr
        GetProperty      : IntPtr
        GetRange         : IntPtr
        GetText          : IntPtr
        SetFormattedText : IntPtr
        SetProperty      : IntPtr
        SetText          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextStory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the active state of a story. (ITextStory.GetActive)
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getactive
     */
    GetActive() {
        result := ComCall(3, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the active state of a story. (ITextStory.SetActive)
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The active state. For values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextstory-getactive">ITextStory::GetActive</a> method.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-setactive
     */
    SetActive(Value) {
        result := ComCall(4, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets a new display for a story.
     * @remarks
     * A story can be displayed by calling <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextstory-setactive">ITextStory::SetActive</a>(<b>tomDisplayActive</b>). The <b>ITextStory::GetDisplay</b> method is included, in case it might be advantageous to have more than one display for a set of <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextstory">ITextStory</a> interfaces.
     * @returns {IUnknown} Type: <b>IUnknown**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for a display.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getdisplay
     */
    GetDisplay() {
        result := ComCall(5, this, "ptr*", &ppDisplay := 0, "HRESULT")
        return IUnknown(ppDisplay)
    }

    /**
     * Gets the index of a story.
     * @remarks
     * The index is used with the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument2-getstory">ITextDocument2:: GetStory</a> method.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The index.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getindex
     */
    GetIndex() {
        result := ComCall(6, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets this story's type.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-gettype
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-settype
     */
    SetType(Value) {
        result := ComCall(8, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the value of the specified property. (ITextStory.GetProperty)
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The ID of the property.  Currently, no extra properties are defined.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The property value.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-getrange
     */
    GetRange(cpActive, cpAnchor) {
        result := ComCall(10, this, "int", cpActive, "int", cpAnchor, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    /**
     * Gets the text in a story according to the specified conversion flags.
     * @remarks
     * This method is similar to using <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-gettext2">ITextRange2::GetText2</a> for a whole story, but it doesn’t require a range.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-gettext
     */
    GetText(Flags) {
        pbstr := BSTR.Owned()
        result := ComCall(11, this, "int", Flags, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Replaces a story’s text with specified formatted text.
     * @remarks
     * This method calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> for an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a> interface.
     * @param {IUnknown} pUnk Type: <b>IUnknown*</b>
     * 
     * The formatted text to replace the story’s text.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-setformattedtext
     */
    SetFormattedText(pUnk) {
        result := ComCall(12, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * Sets the value of the specified property. (ITextStory.SetProperty)
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The Microsoft accountID that identifies the property. Currently, no extra properties are defined.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The new property value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-setproperty
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
     * @param {BSTR} _bstr Type: <b>BSTR</b>
     * 
     * The new text for this story. If this parameter is <b>NULL</b>, the text in the story is deleted.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextstory-settext
     */
    SetText(Flags, _bstr) {
        _bstr := _bstr is String ? BSTR.Alloc(_bstr).Value : _bstr

        result := ComCall(14, this, "int", Flags, BSTR, _bstr, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITextStory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetActive := CallbackCreate(GetMethod(implObj, "GetActive"), flags, 2)
        this.vtbl.SetActive := CallbackCreate(GetMethod(implObj, "SetActive"), flags, 2)
        this.vtbl.GetDisplay := CallbackCreate(GetMethod(implObj, "GetDisplay"), flags, 2)
        this.vtbl.GetIndex := CallbackCreate(GetMethod(implObj, "GetIndex"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.SetType := CallbackCreate(GetMethod(implObj, "SetType"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.GetRange := CallbackCreate(GetMethod(implObj, "GetRange"), flags, 4)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 3)
        this.vtbl.SetFormattedText := CallbackCreate(GetMethod(implObj, "SetFormattedText"), flags, 2)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
        this.vtbl.SetText := CallbackCreate(GetMethod(implObj, "SetText"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetActive)
        CallbackFree(this.vtbl.SetActive)
        CallbackFree(this.vtbl.GetDisplay)
        CallbackFree(this.vtbl.GetIndex)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.SetType)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.GetRange)
        CallbackFree(this.vtbl.GetText)
        CallbackFree(this.vtbl.SetFormattedText)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.SetText)
    }
}
