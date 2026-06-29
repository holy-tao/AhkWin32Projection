#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for posting a cancel window message to the process thread from the Progress Dialog.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iiocancelinformation
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IIOCancelInformation extends IUnknown {
    /**
     * The interface identifier for IIOCancelInformation
     * @type {Guid}
     */
    static IID := Guid("{f5b0bf81-8cb5-4b1b-9449-1a159e0c733c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIOCancelInformation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCancelInformation : IntPtr
        GetCancelInformation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIOCancelInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets information that is posted when a user selects Cancel from the progress UI.
     * @remarks
     * When the user selects <b>Cancel</b> from the progress UI, the <i>dwThreadID</i> will cancel any pending or future input/output (I/O) requests.  Also the <i>uMsgCancel</i> message, received from the progress dialog, will be posted to the thread to tell it to exit a wait state, if asynchronous I/O is pending.
     * @param {Integer} dwThreadID Type: <b>DWORD</b>
     * 
     * The ID of the process thread to be canceled.
     * @param {Integer} uMsgCancel Type: <b>UINT</b>
     * 
     * The cancel message to be posted to the thread.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iiocancelinformation-setcancelinformation
     */
    SetCancelInformation(dwThreadID, uMsgCancel) {
        result := ComCall(3, this, "uint", dwThreadID, "uint", uMsgCancel, "HRESULT")
        return result
    }

    /**
     * Returns information that is posted when a user selects Cancel from the progress UI.
     * @param {Pointer<Integer>} pdwThreadID Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to the ID of the process thread.
     * @param {Pointer<Integer>} puMsgCancel Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to <i>uMsgCancel</i> that the process thread should post if the operation is canceled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iiocancelinformation-getcancelinformation
     */
    GetCancelInformation(pdwThreadID, puMsgCancel) {
        pdwThreadIDMarshal := pdwThreadID is VarRef ? "uint*" : "ptr"
        puMsgCancelMarshal := puMsgCancel is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwThreadIDMarshal, pdwThreadID, puMsgCancelMarshal, puMsgCancel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIOCancelInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCancelInformation := CallbackCreate(GetMethod(implObj, "SetCancelInformation"), flags, 3)
        this.vtbl.GetCancelInformation := CallbackCreate(GetMethod(implObj, "GetCancelInformation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCancelInformation)
        CallbackFree(this.vtbl.GetCancelInformation)
    }
}
