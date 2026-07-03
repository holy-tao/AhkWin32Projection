#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPortableDeviceEventCallback interface implemented by the application to receive asynchronous callbacks if an application has registered to receive them by calling IPortableDevice::Advise.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceeventcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceEventCallback extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceEventCallback
     * @type {Guid}
     */
    static IID := Guid("{a8792a31-f385-493c-a893-40f64eb45f6e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceEventCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceEventCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnEvent method is called by the SDK to notify the application about asynchronous events.
     * @remarks
     * The application must register to receive events by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-advise">IPortableDevice::Advise</a>.
     * @param {IPortableDeviceValues} pEventParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains event details.
     * @returns {HRESULT} Any values returned by the application are ignored by Windows Portable Devices.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceeventcallback-onevent
     */
    OnEvent(pEventParameters) {
        result := ComCall(3, this, "ptr", pEventParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceEventCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnEvent := CallbackCreate(GetMethod(implObj, "OnEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnEvent)
    }
}
