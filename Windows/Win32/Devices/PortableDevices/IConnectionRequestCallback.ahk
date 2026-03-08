#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a single callback method.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iconnectionrequestcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IConnectionRequestCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionRequestCallback
     * @type {Guid}
     */
    static IID => Guid("{272c9ae0-7161-4ae0-91bd-9f448ee9c427}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnComplete"]

    /**
     * Notifies an application that a previously scheduled Connect or Disconnect request to the MTP/Bluetooth device has completed.
     * @remarks
     * An application implements the [**IConnectionRequestCallback**](iconnectionrequestcallback.md) interface to receive notifications about completed requests and to cancel pending requests.
     * 
     * Windows Portable Devices (WPD) calls this method to notify an application that a previously scheduled request has completed. Each request can be tracked and canceled by its application-supplied callback. Therefore, if the application needs to send multiple requests at the same time using the same [**IPortableDeviceConnector**](/windows/desktop/api/portabledeviceconnectapi/nn-portabledeviceconnectapi-iportabledeviceconnector) object, each request should be passed a unique [**IConnectionRequestCallback**](iconnectionrequestcallback.md) object as the input parameter to the [**IPortableDeviceConnector::Connect**](/windows/desktop/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-connect) and [**IPortableDeviceConnector::Disconnect**](/windows/desktop/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-disconnect) methods.
     * @param {HRESULT} hrStatus The status of the request to connect or disconnect a given device.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iconnectionrequestcallback-oncomplete
     */
    OnComplete(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "HRESULT")
        return result
    }
}
