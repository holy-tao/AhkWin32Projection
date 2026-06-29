#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPDeviceProvider interface allows a device provider to start and stop its processing.
 * @see https://learn.microsoft.com/windows/win32/api/upnphost/nn-upnphost-iupnpdeviceprovider
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDeviceProvider extends IUnknown {
    /**
     * The interface identifier for IUPnPDeviceProvider
     * @type {Guid}
     */
    static IID := Guid("{204810b8-73b2-11d4-bf42-00b0d0118b56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDeviceProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start : IntPtr
        Stop  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDeviceProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Start method starts the device provider. The device host invokes this method after it loads the device provider This method performs any initialization required by the device provider.
     * @param {BSTR} bstrInitString Identifies the initialization string specific to a device provider. This string is the same as the one passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerdeviceprovider">IUPnPRegistrar::RegisterDeviceProvider</a> at registration.
     * @returns {HRESULT} When implementing this method, return S_OK if the method succeeds. Otherwise, return one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpdeviceprovider-start
     */
    Start(bstrInitString) {
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString

        result := ComCall(3, this, BSTR, bstrInitString, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the device provider.
     * @returns {HRESULT} When implementing this method, return S_OK if the method succeeds. Otherwise, return one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpdeviceprovider-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPDeviceProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 2)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
    }
}
