#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUPnPDevice.ahk" { IUPnPDevice }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPDeviceFinderAddCallbackWithInterface interface allows the UPnP framework to communicate to an application
 * @remarks
 * If you implement this interface, you must also implement the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefindercallback">IUPnPDeviceFinderCallback</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpdevicefinderaddcallbackwithinterface
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDeviceFinderAddCallbackWithInterface extends IUnknown {
    /**
     * The interface identifier for IUPnPDeviceFinderAddCallbackWithInterface
     * @type {Guid}
     */
    static IID := Guid("{983dfc0b-1796-44df-8975-ca545b620ee5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDeviceFinderAddCallbackWithInterface interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeviceAddedWithInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDeviceFinderAddCallbackWithInterface.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The DeviceAddedWithInterface method is invoked by the UPnP framework to notify the application that a device has been added to the network.
     * @remarks
     * The UPnP framework will query to see if the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefinderaddcallbackwithinterface">IUPnPDeviceFinderAddCallbackWithInterface</a> interface exists. If you have implemented the interface, the UPnP framework will call the <b>DeviceAddedWithInterface</b> method.  Otherwise, the UPnP framework will call the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefindercallback-deviceadded">IUPnPDeviceFinderCallback::DeviceAdded</a> method.
     * @param {Integer} lFindData Specifies the search for which the UPnP framework is returning results. The value of <i>lFindData</i> is the value returned to the caller by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @param {IUPnPDevice} pDevice Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that contains the new device.
     * @param {Pointer<Guid>} pguidInterface GUID of the network adapter through which the device advertisement came.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevicefinderaddcallbackwithinterface-deviceaddedwithinterface
     */
    DeviceAddedWithInterface(lFindData, pDevice, pguidInterface) {
        result := ComCall(3, this, "int", lFindData, "ptr", pDevice, Guid.Ptr, pguidInterface, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPDeviceFinderAddCallbackWithInterface.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeviceAddedWithInterface := CallbackCreate(GetMethod(implObj, "DeviceAddedWithInterface"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeviceAddedWithInterface)
    }
}
