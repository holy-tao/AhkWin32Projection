#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ITfUIElement.ahk" { ITfUIElement }

/**
 * The ITfCandidateListUIElement interface is implemented by a text service that has a UI for reading information UI at the near caret.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfreadinginformationuielement
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfReadingInformationUIElement extends ITfUIElement {
    /**
     * The interface identifier for ITfReadingInformationUIElement
     * @type {Guid}
     */
    static IID := Guid("{ea1ea139-19df-11d7-a6d2-00065b84435c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfReadingInformationUIElement interfaces
    */
    struct Vtbl extends ITfUIElement.Vtbl {
        GetUpdatedFlags           : IntPtr
        GetContext                : IntPtr
        GetString                 : IntPtr
        GetMaxReadingStringLength : IntPtr
        GetErrorIndex             : IntPtr
        IsVerticalOrderPreferred  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfReadingInformationUIElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method returns the flag that tells which part of this element was updated.
     * @returns {Integer} [out] A pointer to receive the flags that is a combination of the following bits:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_CONTEXT"></a><a id="tf_riuie_context"></a><dl>
     * <dt><b>TF_RIUIE_CONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_STRING"></a><a id="tf_riuie_string"></a><dl>
     * <dt><b>TF_RIUIE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reading information string was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_MAXREADINGSTRINGLENGTH"></a><a id="tf_riuie_maxreadingstringlength"></a><dl>
     * <dt><b>TF_RIUIE_MAXREADINGSTRINGLENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The max length of the reading information string was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_ERRORINDEX"></a><a id="tf_riuie_errorindex"></a><dl>
     * <dt><b>TF_RIUIE_ERRORINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The error index of the reading information string was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_VERTICALORDER"></a><a id="tf_riuie_verticalorder"></a><dl>
     * <dt><b>TF_RIUIE_VERTICALORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The vertical order preference was changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getupdatedflags
     */
    GetUpdatedFlags() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * This method returns the target ITfContext of this reading information UI.
     * @returns {ITfContext} [out] A pointer to receive the target <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface of this UI element.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getcontext
     */
    GetContext() {
        result := ComCall(8, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * This method returns the string on the reading information UI.
     * @returns {BSTR} [out] A pointer to the BSTR of the reading information string.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getstring
     */
    GetString() {
        _pstr := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, _pstr, "HRESULT")
        return _pstr
    }

    /**
     * The ITfReadingInformationUIElement::GetMaxReadingStringLength method returns the max string count of the reading information UI.
     * @returns {Integer} [out] A pointer to the max length of the reading information string.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-getmaxreadingstringlength
     */
    GetMaxReadingStringLength() {
        result := ComCall(10, this, "uint*", &pcchMax := 0, "HRESULT")
        return pcchMax
    }

    /**
     * This method returns the char index where the typing error occurs.
     * @returns {Integer} [out] A pointer to receive the char index where the typing error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-geterrorindex
     */
    GetErrorIndex() {
        result := ComCall(11, this, "uint*", &pErrorIndex := 0, "HRESULT")
        return pErrorIndex
    }

    /**
     * This method returns if the UI prefers to be shown in vertical order.
     * @returns {BOOL} [out] True if the UI prefers to be shown in the vertical order.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadinginformationuielement-isverticalorderpreferred
     */
    IsVerticalOrderPreferred() {
        result := ComCall(12, this, BOOL.Ptr, &pfVertical := 0, "HRESULT")
        return pfVertical
    }

    Query(iid) {
        if (ITfReadingInformationUIElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUpdatedFlags := CallbackCreate(GetMethod(implObj, "GetUpdatedFlags"), flags, 2)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 2)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 2)
        this.vtbl.GetMaxReadingStringLength := CallbackCreate(GetMethod(implObj, "GetMaxReadingStringLength"), flags, 2)
        this.vtbl.GetErrorIndex := CallbackCreate(GetMethod(implObj, "GetErrorIndex"), flags, 2)
        this.vtbl.IsVerticalOrderPreferred := CallbackCreate(GetMethod(implObj, "IsVerticalOrderPreferred"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUpdatedFlags)
        CallbackFree(this.vtbl.GetContext)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetMaxReadingStringLength)
        CallbackFree(this.vtbl.GetErrorIndex)
        CallbackFree(this.vtbl.IsVerticalOrderPreferred)
    }
}
