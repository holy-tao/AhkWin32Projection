#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDeviceControlHttpHeaders extends IUnknown {
    /**
     * The interface identifier for IUPnPDeviceControlHttpHeaders
     * @type {Guid}
     */
    static IID := Guid("{204810bb-73b2-11d4-bf42-00b0d0118b56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDeviceControlHttpHeaders interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAdditionalResponseHeaders : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDeviceControlHttpHeaders.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetAdditionalResponseHeaders() {
        bstrHttpResponseHeaders := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, bstrHttpResponseHeaders, "HRESULT")
        return bstrHttpResponseHeaders
    }

    Query(iid) {
        if (IUPnPDeviceControlHttpHeaders.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAdditionalResponseHeaders := CallbackCreate(GetMethod(implObj, "GetAdditionalResponseHeaders"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAdditionalResponseHeaders)
    }
}
