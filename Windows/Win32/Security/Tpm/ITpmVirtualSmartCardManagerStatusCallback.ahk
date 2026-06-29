#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TPMVSCMGR_STATUS.ahk" { TPMVSCMGR_STATUS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\TPMVSCMGR_ERROR.ahk" { TPMVSCMGR_ERROR }

/**
 * Notifies the caller of the progress of the requested operation or any resulting errors.
 * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback
 * @namespace Windows.Win32.Security.Tpm
 */
export default struct ITpmVirtualSmartCardManagerStatusCallback extends IUnknown {
    /**
     * The interface identifier for ITpmVirtualSmartCardManagerStatusCallback
     * @type {Guid}
     */
    static IID := Guid("{1a1bb35f-abb8-451c-a1ae-33d98f1bef4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITpmVirtualSmartCardManagerStatusCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReportProgress : IntPtr
        ReportError    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITpmVirtualSmartCardManagerStatusCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports the progress of the current operation.
     * @param {TPMVSCMGR_STATUS} _Status Status code of the current operation from the possible status states listed in the <a href="https://docs.microsoft.com/windows/win32/api/tpmvscmgr/ne-tpmvscmgr-tpmvscmgr_status">TPMVSCMGR_STATUS</a> enumeration.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns a Win32 error code. The requested operation on the TPM virtual smart card manager server may be interrupted.
     * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/nf-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback-reportprogress
     */
    ReportProgress(_Status) {
        result := ComCall(3, this, TPMVSCMGR_STATUS, _Status, "HRESULT")
        return result
    }

    /**
     * Reports any errors from the requested operation.
     * @param {TPMVSCMGR_ERROR} _Error Error code of the current error from the possible errors listed in the <a href="https://docs.microsoft.com/windows/win32/api/tpmvscmgr/ne-tpmvscmgr-tpmvscmgr_error">TPMVSCMGR_ERROR</a> enumeration.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns a Win32 error code. The requested operation on the TPM virtual smart card manager server may be interrupted.
     * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/nf-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback-reporterror
     */
    ReportError(_Error) {
        result := ComCall(4, this, TPMVSCMGR_ERROR, _Error, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITpmVirtualSmartCardManagerStatusCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReportProgress := CallbackCreate(GetMethod(implObj, "ReportProgress"), flags, 2)
        this.vtbl.ReportError := CallbackCreate(GetMethod(implObj, "ReportError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReportProgress)
        CallbackFree(this.vtbl.ReportError)
    }
}
