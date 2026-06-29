#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BDA_DrmPairingError.ahk" { BDA_DrmPairingError }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_DRIDRMService interface implements a Digital Rights Management (DRM) service for Media Transform Devices (MTDs) under the Protected Broadcast Driver Architecture (PBDA).
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DRIDRMService)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_dridrmservice
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DRIDRMService extends IUnknown {
    /**
     * The interface identifier for IBDA_DRIDRMService
     * @type {Guid}
     */
    static IID := Guid("{1f9bc2a5-44a3-4c52-aab1-0bbce5a1381d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DRIDRMService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDRM           : IntPtr
        GetDRMStatus     : IntPtr
        GetPairingStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DRIDRMService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Selects a Digital Rights Management (DRM) application for a Media Transform Device (MTD) in a Protected Broadcast Device Architecture (PBDA) graph.
     * @param {BSTR} bstrNewDrm Address of the GUID that identifies the new DRM application.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_dridrmservice-setdrm
     */
    SetDRM(bstrNewDrm) {
        bstrNewDrm := bstrNewDrm is String ? BSTR.Alloc(bstrNewDrm).Value : bstrNewDrm

        result := ComCall(3, this, BSTR, bstrNewDrm, "HRESULT")
        return result
    }

    /**
     * The GetDRMSTatus method returns the current status of the Digital Rights Management (DRM) system for a Media Transform Device (MTD) in a graph under the Protected Broadcast Device Architecture (PBDA).
     * @param {Pointer<BSTR>} pbstrDrmUuidList Address of a variable that gets a comma-delimited string of UUID values that identify the DRM systems supported by the MTD. This method allocates the memory for the variable by calling <b>SysAllocString</b> and returns the associated pointer in this parameter. The caller is memory and is responsible for deallocating it by calling <b>SysFreeString</b>.
     * @param {Pointer<Guid>} DrmUuid Address of a variable that gets a GUID identifying the active DRM system for the MTD.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_dridrmservice-getdrmstatus
     */
    GetDRMStatus(pbstrDrmUuidList, DrmUuid) {
        result := ComCall(4, this, BSTR.Ptr, pbstrDrmUuidList, Guid.Ptr, DrmUuid, "HRESULT")
        return result
    }

    /**
     * The GetPairingStatus method gets the Digital Rights Management (DRM) pairing status for a Media Transform Device (MTD) in a graph under the Protected Broadcast Driver Architecture (PBDA).
     * @param {Pointer<BDA_DrmPairingError>} penumPairingStatus 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_dridrmservice-getpairingstatus
     */
    GetPairingStatus(penumPairingStatus) {
        penumPairingStatusMarshal := penumPairingStatus is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, penumPairingStatusMarshal, penumPairingStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DRIDRMService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDRM := CallbackCreate(GetMethod(implObj, "SetDRM"), flags, 2)
        this.vtbl.GetDRMStatus := CallbackCreate(GetMethod(implObj, "GetDRMStatus"), flags, 3)
        this.vtbl.GetPairingStatus := CallbackCreate(GetMethod(implObj, "GetPairingStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDRM)
        CallbackFree(this.vtbl.GetDRMStatus)
        CallbackFree(this.vtbl.GetPairingStatus)
    }
}
