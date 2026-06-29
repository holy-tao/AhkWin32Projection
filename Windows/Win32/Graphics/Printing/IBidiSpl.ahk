#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBidiRequestContainer.ahk" { IBidiRequestContainer }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IBidiRequest.ahk" { IBidiRequest }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IBidiSpl extends IUnknown {
    /**
     * The interface identifier for IBidiSpl
     * @type {Guid}
     */
    static IID := Guid("{d580dc0e-de39-4649-baa8-bf0b85a03a97}")

    /**
     * The class identifier for BidiSpl
     * @type {Guid}
     */
    static CLSID := Guid("{2a614240-a4c5-4c33-bd87-1bc709331639}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBidiSpl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BindDevice    : IntPtr
        UnbindDevice  : IntPtr
        SendRecv      : IntPtr
        MultiSendRecv : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBidiSpl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszDeviceName 
     * @param {Integer} dwAccess 
     * @returns {HRESULT} 
     */
    BindDevice(pszDeviceName, dwAccess) {
        pszDeviceName := pszDeviceName is String ? StrPtr(pszDeviceName) : pszDeviceName

        result := ComCall(3, this, "ptr", pszDeviceName, "uint", dwAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnbindDevice() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAction 
     * @param {IBidiRequest} pRequest 
     * @returns {HRESULT} 
     */
    SendRecv(pszAction, pRequest) {
        pszAction := pszAction is String ? StrPtr(pszAction) : pszAction

        result := ComCall(5, this, "ptr", pszAction, "ptr", pRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAction 
     * @param {IBidiRequestContainer} pRequestContainer 
     * @returns {HRESULT} 
     */
    MultiSendRecv(pszAction, pRequestContainer) {
        pszAction := pszAction is String ? StrPtr(pszAction) : pszAction

        result := ComCall(6, this, "ptr", pszAction, "ptr", pRequestContainer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBidiSpl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BindDevice := CallbackCreate(GetMethod(implObj, "BindDevice"), flags, 3)
        this.vtbl.UnbindDevice := CallbackCreate(GetMethod(implObj, "UnbindDevice"), flags, 1)
        this.vtbl.SendRecv := CallbackCreate(GetMethod(implObj, "SendRecv"), flags, 3)
        this.vtbl.MultiSendRecv := CallbackCreate(GetMethod(implObj, "MultiSendRecv"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BindDevice)
        CallbackFree(this.vtbl.UnbindDevice)
        CallbackFree(this.vtbl.SendRecv)
        CallbackFree(this.vtbl.MultiSendRecv)
    }
}
