#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct IRouterProtocolConfig extends IUnknown {
    /**
     * The interface identifier for IRouterProtocolConfig
     * @type {Guid}
     */
    static IID := Guid("{66a2db16-d706-11d0-a37b-00c04fc9da04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRouterProtocolConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddProtocol    : IntPtr
        RemoveProtocol : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRouterProtocolConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszMachineName 
     * @param {Integer} dwTransportId 
     * @param {Integer} dwProtocolId 
     * @param {HWND} _hWnd 
     * @param {Integer} dwFlags 
     * @param {IUnknown} pRouter 
     * @param {Pointer} uReserved1 
     * @returns {HRESULT} 
     */
    AddProtocol(pszMachineName, dwTransportId, dwProtocolId, _hWnd, dwFlags, pRouter, uReserved1) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        result := ComCall(3, this, "ptr", pszMachineName, "uint", dwTransportId, "uint", dwProtocolId, HWND, _hWnd, "uint", dwFlags, "ptr", pRouter, "ptr", uReserved1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMachineName 
     * @param {Integer} dwTransportId 
     * @param {Integer} dwProtocolId 
     * @param {HWND} _hWnd 
     * @param {Integer} dwFlags 
     * @param {IUnknown} pRouter 
     * @param {Pointer} uReserved1 
     * @returns {HRESULT} 
     */
    RemoveProtocol(pszMachineName, dwTransportId, dwProtocolId, _hWnd, dwFlags, pRouter, uReserved1) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        result := ComCall(4, this, "ptr", pszMachineName, "uint", dwTransportId, "uint", dwProtocolId, HWND, _hWnd, "uint", dwFlags, "ptr", pRouter, "ptr", uReserved1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRouterProtocolConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddProtocol := CallbackCreate(GetMethod(implObj, "AddProtocol"), flags, 8)
        this.vtbl.RemoveProtocol := CallbackCreate(GetMethod(implObj, "RemoveProtocol"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddProtocol)
        CallbackFree(this.vtbl.RemoveProtocol)
    }
}
