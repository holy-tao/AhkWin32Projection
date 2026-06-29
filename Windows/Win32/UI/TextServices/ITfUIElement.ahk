#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfUIElement interface is a base interface of the UIElement object and is implemented by a text service.
 * @remarks
 * A text service may implement some other UIElement interface such as <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcandidatelistuielement">ITfCandidateListUIElement</a> in the same object that can be obtained by QI. A text service may implement only the <b>ITfUIElement</b> interface to a UI object that does not have to be drawn by the application but the show status can be controlled by the application. A text service that is categorized by GUID_TFCAT_TIPCAP_UIELEMENTENABLED needs to implement ITfUIElement for any UI object.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfuielement
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfUIElement extends IUnknown {
    /**
     * The interface identifier for ITfUIElement
     * @type {Guid}
     */
    static IID := Guid("{ea1ea137-19df-11d7-a6d2-00065b84435c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfUIElement interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDescription : IntPtr
        GetGUID        : IntPtr
        Show           : IntPtr
        IsShown        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfUIElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITfUIElement::GetDescription method returns the description of the UI element.
     * @returns {BSTR} [in] A pointer to BSTR that contains the description of the UI element.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielement-getdescription
     */
    GetDescription() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * The ITfUIElement::GetGUID method returns the unique id of this UI element.
     * @returns {Guid} [out] A pointer to receive the GUID of the UI element.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielement-getguid
     */
    GetGUID() {
        pguid := Guid()
        result := ComCall(4, this, Guid.Ptr, pguid, "HRESULT")
        return pguid
    }

    /**
     * The ITfUIElement::Show method shows the text service's UI of this UI element.
     * @param {BOOL} bShow [in] <b>TRUE</b> to show the original UI of the element. <b>FALSE</b> to hide the original UI of the element.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielement-show
     */
    Show(bShow) {
        result := ComCall(5, this, BOOL, bShow, "HRESULT")
        return result
    }

    /**
     * The ITfUIElement::IsShown method returns true if the UI is currently shown by a text service; otherwise false.
     * @returns {BOOL} [out] A pointer to bool of the current show status of the original UI of this element.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielement-isshown
     */
    IsShown() {
        result := ComCall(6, this, BOOL.Ptr, &pbShow := 0, "HRESULT")
        return pbShow
    }

    Query(iid) {
        if (ITfUIElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.GetGUID := CallbackCreate(GetMethod(implObj, "GetGUID"), flags, 2)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 2)
        this.vtbl.IsShown := CallbackCreate(GetMethod(implObj, "IsShown"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetGUID)
        CallbackFree(this.vtbl.Show)
        CallbackFree(this.vtbl.IsShown)
    }
}
