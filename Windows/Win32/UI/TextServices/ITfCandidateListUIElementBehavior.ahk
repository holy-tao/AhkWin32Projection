#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfCandidateListUIElement.ahk" { ITfCandidateListUIElement }

/**
 * This interface is implemented by a text service that has a candidate list UI and its UI can be controlled by the application. The application QI this interface from ITfUIElement and controls the candidate list behavior.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcandidatelistuielementbehavior
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCandidateListUIElementBehavior extends ITfCandidateListUIElement {
    /**
     * The interface identifier for ITfCandidateListUIElementBehavior
     * @type {Guid}
     */
    static IID := Guid("{85fad185-58ce-497a-9460-355366b64b9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCandidateListUIElementBehavior interfaces
    */
    struct Vtbl extends ITfCandidateListUIElement.Vtbl {
        SetSelection : IntPtr
        Finalize     : IntPtr
        Abort        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCandidateListUIElementBehavior.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITfCandidateListUIElementBehavior::SetSelection method set the selection of the candidate list.
     * @param {Integer} nIndex [in] An index for the candidate string to be selected.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielementbehavior-setselection
     */
    SetSelection(nIndex) {
        result := ComCall(15, this, "uint", nIndex, "HRESULT")
        return result
    }

    /**
     * The ITfCandidateListUIElementBehavior::Finalize method finalizes the current selection and close the candidate list.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielementbehavior-finalize
     */
    Finalize() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The ITfCandidateListUIElementBehavior::Abort method closes the candidate list. There is no guarantee that the current selection will be finalized.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielementbehavior-abort
     */
    Abort() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfCandidateListUIElementBehavior.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSelection := CallbackCreate(GetMethod(implObj, "SetSelection"), flags, 2)
        this.vtbl.Finalize := CallbackCreate(GetMethod(implObj, "Finalize"), flags, 1)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSelection)
        CallbackFree(this.vtbl.Finalize)
        CallbackFree(this.vtbl.Abort)
    }
}
