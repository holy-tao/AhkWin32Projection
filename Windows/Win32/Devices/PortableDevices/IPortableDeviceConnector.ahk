#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods used for connection-management and property-retrieval for a paired MTP/Bluetooth device.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nn-portabledeviceconnectapi-iportabledeviceconnector
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceConnector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceConnector
     * @type {Guid}
     */
    static IID => Guid("{625e2df8-6392-4cf0-9ad1-3cfa5f17775c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "Cancel", "GetProperty", "SetProperty", "GetPnPID"]

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
     * @param {Pointer<Integer>} pPropertyType A pointer to a property type.
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

        result := ComCall(6, this, "ptr", pPropertyKey, pPropertyTypeMarshal, pPropertyType, ppDataMarshal, ppData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * Sets the given property on the MTP/Bluetooth Bus Enumerator device.
     * @remarks
     * Before calling this method, an application must verify that it has Administrator user rights.
     * @param {Pointer<DEVPROPKEY>} pPropertyKey A pointer to a property key for the given property.
     * @param {Integer} PropertyType The property type.
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

        result := ComCall(7, this, "ptr", pPropertyKey, "uint", PropertyType, pDataMarshal, pData, "uint", cbData, "HRESULT")
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
        result := ComCall(8, this, "ptr*", &ppwszPnPID := 0, "HRESULT")
        return ppwszPnPID
    }
}
