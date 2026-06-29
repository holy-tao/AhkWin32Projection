#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\NCPNP_RECONFIG_LAYER.ahk" { NCPNP_RECONFIG_LAYER }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgPnpReconfigCallback extends IUnknown {
    /**
     * The interface identifier for INetCfgPnpReconfigCallback
     * @type {Guid}
     */
    static IID := Guid("{8d84bd35-e227-11d2-b700-00a0c98a6a85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgPnpReconfigCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SendPnpReconfig : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgPnpReconfigCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {NCPNP_RECONFIG_LAYER} Layer 
     * @param {PWSTR} pszwUpper 
     * @param {PWSTR} pszwLower 
     * @param {Integer} pvData 
     * @param {Integer} dwSizeOfData 
     * @returns {HRESULT} 
     */
    SendPnpReconfig(Layer, pszwUpper, pszwLower, pvData, dwSizeOfData) {
        pszwUpper := pszwUpper is String ? StrPtr(pszwUpper) : pszwUpper
        pszwLower := pszwLower is String ? StrPtr(pszwLower) : pszwLower

        result := ComCall(3, this, NCPNP_RECONFIG_LAYER, Layer, "ptr", pszwUpper, "ptr", pszwLower, "ptr", pvData, "uint", dwSizeOfData, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgPnpReconfigCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SendPnpReconfig := CallbackCreate(GetMethod(implObj, "SendPnpReconfig"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SendPnpReconfig)
    }
}
