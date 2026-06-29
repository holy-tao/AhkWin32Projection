#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves the device associated with a service and the list of services found on a device.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemanager
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceServiceManager extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceServiceManager
     * @type {Guid}
     */
    static IID := Guid("{a8abc4e9-a84a-47a9-80b3-c5d9b172a961}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceServiceManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDeviceServices   : IntPtr
        GetDeviceForService : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceServiceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a list of the services associated with the specified device.
     * @remarks
     * If this method succeeds, the application should call the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/freeportabledevicepnpids">FreePortableDevicePnPIDs</a> function to free the array referenced by the <i>pServices</i> parameter.
     * 
     * An application can retrieve the PnP identifier for a device by calling the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">IPortableDeviceManager::GetDevices</a> method.
     *   
     * 
     * Applications that use Single Threaded Apartments should use <b>CLSID_PortableDeviceServiceFTM</b> as this eliminates the overhead of interface pointer marshaling.  <b>CLSID_PortableDeviceService</b> is still supported for legacy applications.
     * @param {PWSTR} pszPnPDeviceID The Plug and Play (PnP) identifier of the device.
     * @param {Pointer<Guid>} guidServiceCategory A reference to a globally unique identifier (GUID) that specifies the category of services to retrieve. If the  referenced identifier is <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/device-interface-guids">GUID_DEVINTERFACE_WPD_SERVICE</a>, this method will retrieve all services supported by the device.
     * @param {Pointer<PWSTR>} pServices A user-allocated array of pointers to strings. When the method returns, the array contains the retrieved PnP service identifiers.
     * @param {Pointer<Integer>} pcServices The number of elements in the array specified by the <i>pServices</i> parameter. This value represents the maximum number of service identifiers that will be retrieved. When the method returns,  this parameter contains the number of identifiers actually retrieved.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array referenced by the <i>pServices</i> parameter was too small to contain all of the services.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pcServices</i> parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemanager-getdeviceservices
     */
    GetDeviceServices(pszPnPDeviceID, guidServiceCategory, pServices, pcServices) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID

        pServicesMarshal := pServices is VarRef ? "ptr*" : "ptr"
        pcServicesMarshal := pcServices is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszPnPDeviceID, Guid.Ptr, guidServiceCategory, pServicesMarshal, pServices, pcServicesMarshal, pcServices, "HRESULT")
        return result
    }

    /**
     * Retrieves the device associated with the specified service.
     * @remarks
     * Neither the <i>pszPnPServiceID</i> parameter nor the <i>pszPnPDeviceID</i> parameter can be <b>NULL</b>.
     * 
     * An application can retrieve a PnP service identifier by calling the <b>GetDeviceServices</b> method.
     * @param {PWSTR} pszPnPServiceID The Plug and Play (PnP) identifier of the service.
     * @returns {PWSTR} The retrieved PnP identifier of the device associated with the service.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemanager-getdeviceforservice
     */
    GetDeviceForService(pszPnPServiceID) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(4, this, "ptr", pszPnPServiceID, PWSTR.Ptr, &ppszPnPDeviceID := 0, "HRESULT")
        return ppszPnPDeviceID
    }

    Query(iid) {
        if (IPortableDeviceServiceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceServices := CallbackCreate(GetMethod(implObj, "GetDeviceServices"), flags, 5)
        this.vtbl.GetDeviceForService := CallbackCreate(GetMethod(implObj, "GetDeviceForService"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceServices)
        CallbackFree(this.vtbl.GetDeviceForService)
    }
}
