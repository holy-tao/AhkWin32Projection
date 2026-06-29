#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a device's Digital Rights Management (DRM) Service.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DRMService)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_drmservice
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DRMService extends IUnknown {
    /**
     * The interface identifier for IBDA_DRMService
     * @type {Guid}
     */
    static IID := Guid("{bff6b5bb-b0ae-484c-9dca-73528fb0b46e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DRMService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDRM       : IntPtr
        GetDRMStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DRMService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Activates a digital rights management (DRM) system on the media transform device (MTD).
     * @param {Pointer<Guid>} puuidNewDrm Pointer to a GUID that specifies the DRM system.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_drmservice-setdrm
     */
    SetDRM(puuidNewDrm) {
        result := ComCall(3, this, Guid.Ptr, puuidNewDrm, "HRESULT")
        return result
    }

    /**
     * Gets the current digital rights management (DRM) status.
     * @param {Pointer<BSTR>} pbstrDrmUuidList Receives a comma-separated list of GUIDs that identify the DRM systems supported by the media transform device (MTD). Each GUID is represented in following format: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx". The caller must release the string by calling <b>SysFreeString</b>.
     * @param {Pointer<Guid>} DrmUuid Receives a GUID that identifies which DRM system is currently active.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_drmservice-getdrmstatus
     */
    GetDRMStatus(pbstrDrmUuidList, DrmUuid) {
        result := ComCall(4, this, BSTR.Ptr, pbstrDrmUuidList, Guid.Ptr, DrmUuid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DRMService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDRM := CallbackCreate(GetMethod(implObj, "SetDRM"), flags, 2)
        this.vtbl.GetDRMStatus := CallbackCreate(GetMethod(implObj, "GetDRMStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDRM)
        CallbackFree(this.vtbl.GetDRMStatus)
    }
}
