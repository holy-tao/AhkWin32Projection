#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemShutdown interface indicates to the provider that an instance of an object is ready to be discarded. The provider can use this call to release resources that it is referencing currently.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemshutdown
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemShutdown extends IUnknown {
    /**
     * The interface identifier for IWbemShutdown
     * @type {Guid}
     */
    static IID := Guid("{b7b31df9-d515-11d3-a11c-00105a1f515a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemShutdown interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Shutdown : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemShutdown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemShutdown::Shutdown method indicates to the provider that the provider services are not required.
     * @param {Integer} uReason Reserved. This value must be zero (0).
     * @param {Integer} uMaxMilliseconds Reserved. This value must be zero (0).
     * @param {IWbemContext} pCtx Reserved. This value must be <b>NULL</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>, which identifies the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemshutdown-shutdown
     */
    Shutdown(uReason, uMaxMilliseconds, pCtx) {
        result := ComCall(3, this, "int", uReason, "uint", uMaxMilliseconds, "ptr", pCtx, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemShutdown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Shutdown)
    }
}
