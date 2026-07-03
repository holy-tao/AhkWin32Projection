#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a single callback method.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iconnectionrequestcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IConnectionRequestCallback extends IUnknown {
    /**
     * The interface identifier for IConnectionRequestCallback
     * @type {Guid}
     */
    static IID := Guid("{272c9ae0-7161-4ae0-91bd-9f448ee9c427}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConnectionRequestCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConnectionRequestCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IConnectionRequestCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnComplete := CallbackCreate(GetMethod(implObj, "OnComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnComplete)
    }
}
