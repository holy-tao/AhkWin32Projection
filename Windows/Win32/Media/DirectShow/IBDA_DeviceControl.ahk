#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_DeviceControl interface is implemented on all BDA device filters.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DeviceControl)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_devicecontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DeviceControl extends IUnknown {
    /**
     * The interface identifier for IBDA_DeviceControl
     * @type {Guid}
     */
    static IID := Guid("{fd0a5af3-b41d-11d2-9c95-00c04f7971e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DeviceControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartChanges   : IntPtr
        CheckChanges   : IntPtr
        CommitChanges  : IntPtr
        GetChangeState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DeviceControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The StartChanges method is called by a Network Provider before it begins to modify a set of properties on a BDA device filter.
     * @remarks
     * The device filter validates and accumulates all changes requested after <b>StartChanges</b>. It makes the accumulated list of changes when <b>CommitChanges</b> is called.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_devicecontrol-startchanges
     */
    StartChanges() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The CheckChanges method queries the device filter as to whether the changes that are pending would succeed if they were committed.
     * @remarks
     * This method provides a means to determine whether a particular set of changes would be successful, without actually modifying any parameters on the device.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_devicecontrol-checkchanges
     */
    CheckChanges() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The CommitChanges method instructs the device to perform the changes specified in the previous call to StartChanges.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_devicecontrol-commitchanges
     */
    CommitChanges() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The GetChangeState method returns a value indicating whether any uncommitted changes are currently pending in the filter.
     * @param {Pointer<Integer>} pState Receives the current state of the filter. See BDA_CHANGE_STATE in the Windows DDK for possible values.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_devicecontrol-getchangestate
     */
    GetChangeState(pState) {
        pStateMarshal := pState is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pStateMarshal, pState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DeviceControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartChanges := CallbackCreate(GetMethod(implObj, "StartChanges"), flags, 1)
        this.vtbl.CheckChanges := CallbackCreate(GetMethod(implObj, "CheckChanges"), flags, 1)
        this.vtbl.CommitChanges := CallbackCreate(GetMethod(implObj, "CommitChanges"), flags, 1)
        this.vtbl.GetChangeState := CallbackCreate(GetMethod(implObj, "GetChangeState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartChanges)
        CallbackFree(this.vtbl.CheckChanges)
        CallbackFree(this.vtbl.CommitChanges)
        CallbackFree(this.vtbl.GetChangeState)
    }
}
