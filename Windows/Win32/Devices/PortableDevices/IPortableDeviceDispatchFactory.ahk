#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a factory that can instantiate a WPD Automation Device object.
 * @remarks
 * The <b>IPortableDeviceDispatchFactory</b> interface can be CoCreated directly using <b>CLSID_PortableDeviceDispatchFactory</b> as in the following code.
 * 
 * 
 * ```cpp
 * IPortableDeviceDispatchFactgory* pDeviceDispatchFactory = NULL;
 * HRESULT hr = CoCreateInstance(CLSID_PortableDeviceDispatchFactory, NULL, CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&pDeviceDispatchFactory));   
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicedispatchfactory
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceDispatchFactory extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceDispatchFactory
     * @type {Guid}
     */
    static IID := Guid("{5e1eafc3-e3d7-4132-96fa-759c0f9d1e0f}")

    /**
     * The class identifier for PortableDeviceDispatchFactory
     * @type {Guid}
     */
    static CLSID := Guid("{43232233-8338-4658-ae01-0b4ae830b6b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceDispatchFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDeviceDispatch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceDispatchFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Instantiates a WPD Automation Device object for a given WPD device identifier. (IPortableDeviceDispatchFactory.GetDeviceDispatch)
     * @remarks
     * For an example of how to use <b>GetDeviceDispatch</b> method to instantiate a WPD Automation <b>Device</b>  object, see 
     *   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/wpdauto/instantiating-the-wpd-automation-factory-interface">Instantiating the WPD Automation Factory Interface</a>.
     * @param {PWSTR} pszPnPDeviceID A pointer to a <b>String</b> that is used by Plug-and-play to identify a currently connected WPD device. The Plug and Play (PnP) identifier for a particular device can be obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">IPortableDeviceManager::GetDevices</a> method in the WPD C++/COM API.
     * @returns {IDispatch} Contains a pointer to the <b>IDispatch</b> implementation for the WPD Automation <a href="https://docs.microsoft.com/previous-versions/windows/desktop/wiaaut/-wiaaut-device">Device</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicedispatchfactory-getdevicedispatch
     */
    GetDeviceDispatch(pszPnPDeviceID) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID

        result := ComCall(3, this, "ptr", pszPnPDeviceID, "ptr*", &ppDeviceDispatch := 0, "HRESULT")
        return IDispatch(ppDeviceDispatch)
    }

    Query(iid) {
        if (IPortableDeviceDispatchFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceDispatch := CallbackCreate(GetMethod(implObj, "GetDeviceDispatch"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceDispatch)
    }
}
