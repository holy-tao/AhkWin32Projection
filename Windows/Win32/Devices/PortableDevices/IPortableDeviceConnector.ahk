#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IConnectionRequestCallback.ahk" { IConnectionRequestCallback }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Properties\DEVPROPTYPE.ahk" { DEVPROPTYPE }

/**
 * Defines methods used for connection-management and property-retrieval for a paired MTP/Bluetooth device.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nn-portabledeviceconnectapi-iportabledeviceconnector
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceConnector extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceConnector
     * @type {Guid}
     */
    static IID := Guid("{625e2df8-6392-4cf0-9ad1-3cfa5f17775c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceConnector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Connect     : IntPtr
        Disconnect  : IntPtr
        Cancel      : IntPtr
        GetProperty : IntPtr
        SetProperty : IntPtr
        GetPnPID    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceConnector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sends an asynchronous connection request to the MTP/Bluetooth device.
     * @remarks
     * This method will queue a connect request and then return immediately. The connection request will result in a no-op if a device is already connected.
     * 
     * To be notified when the request is complete, applications should provide a pointer to the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iconnectionrequestcallback">IConnectionRequestCallback</a> interface.
     * 
     * If a previously paired MTP/Bluetooth device is within range, applications can call this method to instantiate the Windows Portable Devices (WPD) class driver stack for that device, so that the device can be communicated to using the WPD API.
     * @param {IConnectionRequestCallback} pCallback A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iconnectionrequestcallback">IConnectionRequestCallback</a> interface if the application wishes to be notified when the request is complete; otherwise, <b>NULL</b>. If multiple requests are being sent simultaneously using the same <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceconnectapi/nn-portabledeviceconnectapi-iportabledeviceconnector">IPortableDeviceConnector</a> object, a different instance of the callback object must be used.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-connect
     */
    Connect(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Sends an asynchronous disconnect request to the MTP/Bluetooth device.
     * @remarks
     * This method will queue a disconnect request and then return immediately.
     * 
     * To be notified when the request is complete, applications should provide a pointer to the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iconnectionrequestcallback">IConnectionRequestCallback</a> interface. This will disconnect the MTP/Bluetooth link and remove the Windows Portable Devices (WPD) class driver stack for that device.
     * 
     * Once the disconnection completes, the WPD API will no longer enumerate this device.
     * @param {IConnectionRequestCallback} pCallback A pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iconnectionrequestcallback">IConnectionRequestCallback</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-disconnect
     */
    Disconnect(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Cancels a pending request to connect or disconnect an MTP/Bluetooth device.
     * @param {IConnectionRequestCallback} pCallback A pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iconnectionrequestcallback">IConnectionRequestCallback</a> interface. This value cannot be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the <i>pCallback</i> parameter does not correspond to a pending connect or disconnect request, or this method has been already been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-cancel
     */
    Cancel(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Retrieves a property for the given MTP/Bluetooth Bus Enumerator device.
     * @remarks
     * The properties retrieved by this method are set on the device node. An example property key is <b>DEVPKEY_MTPBTH_IsConnected</b>, which indicates whether the device is currently connected.
     * 
     * Valid values for the <i>pPropertyType</i> parameter are system-defined base data types of the unified device property model. The data-type names start with the prefix <b>DEVPROP_TYPE_</b>.
     * 
     * Once the application no longer needs the property data specified by the <i>ppData</i> parameter, it must call <b>CoTaskMemAlloc</b> to free this data.
     * @param {Pointer<DEVPROPKEY>} pPropertyKey A pointer to a property key for the requested property.
     * @param {Pointer<DEVPROPTYPE>} pPropertyType A pointer to a property type.
     * @param {Pointer<Pointer<Integer>>} ppData The address of a pointer to the property data.
     * @param {Pointer<Integer>} pcbData A pointer to the size (in bytes) of the property data.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property key is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-getproperty
     */
    GetProperty(pPropertyKey, pPropertyType, ppData, pcbData) {
        pPropertyTypeMarshal := pPropertyType is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, DEVPROPKEY.Ptr, pPropertyKey, pPropertyTypeMarshal, pPropertyType, ppDataMarshal, ppData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * Sets the given property on the MTP/Bluetooth Bus Enumerator device.
     * @remarks
     * Before calling this method, an application must verify that it has Administrator user rights.
     * @param {Pointer<DEVPROPKEY>} pPropertyKey A pointer to a property key for the given property.
     * @param {DEVPROPTYPE} PropertyType The property type.
     * @param {Pointer<Integer>} pData A pointer to the property data.
     * @param {Integer} cbData The size (in bytes) of the property data.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property key is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-setproperty
     */
    SetProperty(pPropertyKey, PropertyType, pData, cbData) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, DEVPROPKEY.Ptr, pPropertyKey, DEVPROPTYPE, PropertyType, pDataMarshal, pData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * Retrieves the connector's Plug and Play (PnP) device identifier.
     * @remarks
     * The identifier retrieved by this method corresponds to a handle to the MTP/Bluetooth Bus Enumerator device node that receives connect and disconnect IOCTL requests for a paired MTP/Bluetooth device.  Applications can use this identifier with the SetupAPI functions to access the device node.
     * 
     * Once the application no longer needs the identifier specified by the <i>ppwszPnPID</i> parameter, it must call the <b>CoTaskMemAlloc</b> function to free the identifier.
     * @returns {PWSTR} The PnP device identifier.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-getpnpid
     */
    GetPnPID() {
        result := ComCall(8, this, PWSTR.Ptr, &ppwszPnPID := 0, "HRESULT")
        return ppwszPnPID
    }

    Query(iid) {
        if (IPortableDeviceConnector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 2)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 2)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 5)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 5)
        this.vtbl.GetPnPID := CallbackCreate(GetMethod(implObj, "GetPnPID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.GetPnPID)
    }
}
