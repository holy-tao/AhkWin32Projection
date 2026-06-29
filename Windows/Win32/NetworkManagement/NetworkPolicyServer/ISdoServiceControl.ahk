#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use the ISdoServiceControl interface to control the service being administered on the SDO computer.
 * @remarks
 * Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-getservicesdo">ISdoMachine::GetServiceSDO</a> method to retrieve a pointer to an 
 * <b>ISdoServiceControl</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/nn-sdoias-isdoservicecontrol
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct ISdoServiceControl extends IDispatch {
    /**
     * The interface identifier for ISdoServiceControl
     * @type {Guid}
     */
    static IID := Guid("{479f6e74-49a2-11d2-8eca-00c04fc2f519}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISdoServiceControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        StartService     : IntPtr
        StopService      : IntPtr
        GetServiceStatus : IntPtr
        ResetService     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISdoServiceControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The StartService method starts the service administered through SDO.
     * @remarks
     * Calls to this method return almost immediately. NPS (IAS) takes several minutes to start up if its SDO configuration database contains a large number of objects.
     * 
     * <div class="alert"><b>Note</b>  Internet Authentication Service (IAS) was renamed Network Policy Server (NPS) starting with Windows Server 2008.</div>
     * <div> </div>
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdoservicecontrol-startservice
     */
    StartService() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The StopService method shuts down the service administered through SDO.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdoservicecontrol-stopservice
     */
    StopService() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The GetServiceStatus method retrieves the status of the service being administered through SDO.
     * @returns {Integer} Pointer to a <b>LONG</b> variable that contains the status of the service. The status
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdoservicecontrol-getservicestatus
     */
    GetServiceStatus() {
        result := ComCall(9, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * The ResetService method resets the service administered by the SDO API. Resetting the service causes the service to refresh its data.
     * @remarks
     * The data refresh begins 5 seconds after the last call to 
     *   <b>ISdoServiceControl::ResetService</b>. The 
     *   amount of time it takes for the refresh to complete depends on the number of objects in the SDO configuration 
     *   database.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdoservicecontrol-resetservice
     */
    ResetService() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISdoServiceControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartService := CallbackCreate(GetMethod(implObj, "StartService"), flags, 1)
        this.vtbl.StopService := CallbackCreate(GetMethod(implObj, "StopService"), flags, 1)
        this.vtbl.GetServiceStatus := CallbackCreate(GetMethod(implObj, "GetServiceStatus"), flags, 2)
        this.vtbl.ResetService := CallbackCreate(GetMethod(implObj, "ResetService"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartService)
        CallbackFree(this.vtbl.StopService)
        CallbackFree(this.vtbl.GetServiceStatus)
        CallbackFree(this.vtbl.ResetService)
    }
}
