#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IUPnPDevice.ahk" { IUPnPDevice }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPDeviceFinderCallback interface allows the UPnP framework to communicate the results of an asynchronous search to an application.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpdevicefindercallback
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDeviceFinderCallback extends IUnknown {
    /**
     * The interface identifier for IUPnPDeviceFinderCallback
     * @type {Guid}
     */
    static IID := Guid("{415a984a-88b3-49f3-92af-0508bedf0d6c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDeviceFinderCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeviceAdded    : IntPtr
        DeviceRemoved  : IntPtr
        SearchComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDeviceFinderCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The DeviceAdded method is invoked by the UPnP framework to notify the application that a device has been added to the network.
     * @remarks
     * The UPnP framework might call the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinderaddcallbackwithinterface-deviceaddedwithinterface">IUPnPDeviceFinderAddCallbackWithInterface::DeviceAddedWithInterface</a> method instead of <b>DeviceAdded</b> to notify the application when a device is added to the network. The UPnP framework will query to see if the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefinderaddcallbackwithinterface">IUPnPDeviceFinderAddCallbackWithInterface</a> interface exists. If so, the UPnP framework will call <b>DeviceAddedWithInterface</b>.  Otherwise, the UPnP framework will call <b>DeviceAdded</b>.
     * 
     * The UPnP framework might return two or more callbacks for the same device. This can happen if a device's IP address was changed without first removing the device, and then re-adding it to the network. If this occurs, an application should discard the old device and use the most recently returned one. An application checks for duplicate devices by comparing the UDNs.
     * @param {Integer} lFindData Specifies the search for which the UPnP framework is returning results. The value of <i>lFindData</i> is the value returned to the caller by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @param {IUPnPDevice} pDevice Reference to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that contains the new device.
     * @returns {HRESULT} The UPnP framework does not expect the application to return any specific value; any value returned is ignored by the UPnP framework.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevicefindercallback-deviceadded
     */
    DeviceAdded(lFindData, pDevice) {
        result := ComCall(3, this, "int", lFindData, "ptr", pDevice, "HRESULT")
        return result
    }

    /**
     * The DeviceRemoved method is invoked by the UPnP framework to notify the application that a device has been removed from the network.
     * @remarks
     * The UPnP framework might return two or more callbacks for the same device. An application can ignore subsequent device-removal callbacks.
     * @param {Integer} lFindData Specifies the search for which the UPnP framework is returning results. The value of <i>lFindData</i> is the value returned to the caller by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @param {BSTR} bstrUDN Specifies the UDN of the device that was removed from the network.
     * @returns {HRESULT} The application should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevicefindercallback-deviceremoved
     */
    DeviceRemoved(lFindData, bstrUDN) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(4, this, "int", lFindData, BSTR, bstrUDN, "HRESULT")
        return result
    }

    /**
     * The SearchComplete method is invoked by the UPnP framework to notify the application that the initial search for network devices has been completed.
     * @remarks
     * This method simply provides information. It does not indicate that the asynchronous search has ended, but rather that the initial probe has completed. The asynchronous search continues to report devices being added to and removed from the network until the application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-cancelasyncfind">IUPnPDeviceFinder::CancelAsyncFind</a>.
     * 
     * The initial search can take a long time to complete. The <b>SearchComplete</b> callback is invoked when the description document for the last device found (that is, the last device found to be present on the network at the time the search was started) has either been loaded or has failed to load.
     * @param {Integer} lFindData Specifies the search for which the UPnP framework is returning results. The value of <i>lFindData</i> is the value returned to the caller by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @returns {HRESULT} The application should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevicefindercallback-searchcomplete
     */
    SearchComplete(lFindData) {
        result := ComCall(5, this, "int", lFindData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPDeviceFinderCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeviceAdded := CallbackCreate(GetMethod(implObj, "DeviceAdded"), flags, 3)
        this.vtbl.DeviceRemoved := CallbackCreate(GetMethod(implObj, "DeviceRemoved"), flags, 3)
        this.vtbl.SearchComplete := CallbackCreate(GetMethod(implObj, "SearchComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeviceAdded)
        CallbackFree(this.vtbl.DeviceRemoved)
        CallbackFree(this.vtbl.SearchComplete)
    }
}
