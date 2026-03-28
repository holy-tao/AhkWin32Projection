#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdoServiceControl interface to control the service being administered on the SDO computer.
 * @remarks
 * Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-getservicesdo">ISdoMachine::GetServiceSDO</a> method to retrieve a pointer to an 
 * <b>ISdoServiceControl</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/nn-sdoias-isdoservicecontrol
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdoServiceControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISdoServiceControl
     * @type {Guid}
     */
    static IID => Guid("{479f6e74-49a2-11d2-8eca-00c04fc2f519}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartService", "StopService", "GetServiceStatus", "ResetService"]

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
     * @returns {Integer} 
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
}
