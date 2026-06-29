#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides device-related notifications to an instance of an IWSDDeviceHost object.
 * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nn-wsdhost-iwsddevicehostnotify
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDDeviceHostNotify extends IUnknown {
    /**
     * The interface identifier for IWSDDeviceHostNotify
     * @type {Guid}
     */
    static IID := Guid("{b5bee9f9-eeda-41fe-96f7-f45e14990fb0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDDeviceHostNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetService : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDDeviceHostNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a service object that is not currently registered.
     * @param {PWSTR} pszServiceId The ID of the service to be produced.
     * @returns {IUnknown} A reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdserviceproxy">IWSDServiceProxy</a> object for the specified service.
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehostnotify-getservice
     */
    GetService(pszServiceId) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(3, this, "ptr", pszServiceId, "ptr*", &ppService := 0, "HRESULT")
        return IUnknown(ppService)
    }

    Query(iid) {
        if (IWSDDeviceHostNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetService := CallbackCreate(GetMethod(implObj, "GetService"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetService)
    }
}
