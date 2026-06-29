#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgComponent extends IUnknown {
    /**
     * The interface identifier for INetCfgComponent
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae99-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgComponent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDisplayName     : IntPtr
        SetDisplayName     : IntPtr
        GetHelpText        : IntPtr
        GetId              : IntPtr
        GetCharacteristics : IntPtr
        GetInstanceGuid    : IntPtr
        GetPnpDevNodeId    : IntPtr
        GetClassGuid       : IntPtr
        GetBindName        : IntPtr
        GetDeviceStatus    : IntPtr
        OpenParamKey       : IntPtr
        RaisePropertyUi    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgComponent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetDisplayName() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszwDisplayName := 0, "HRESULT")
        return ppszwDisplayName
    }

    /**
     * 
     * @param {PWSTR} pszwDisplayName 
     * @returns {HRESULT} 
     */
    SetDisplayName(pszwDisplayName) {
        pszwDisplayName := pszwDisplayName is String ? StrPtr(pszwDisplayName) : pszwDisplayName

        result := ComCall(4, this, "ptr", pszwDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetHelpText() {
        result := ComCall(5, this, PWSTR.Ptr, &pszwHelpText := 0, "HRESULT")
        return pszwHelpText
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetId() {
        result := ComCall(6, this, PWSTR.Ptr, &ppszwId := 0, "HRESULT")
        return ppszwId
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCharacteristics() {
        result := ComCall(7, this, "uint*", &pdwCharacteristics := 0, "HRESULT")
        return pdwCharacteristics
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetInstanceGuid() {
        pGuid := Guid()
        result := ComCall(8, this, Guid.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetPnpDevNodeId() {
        result := ComCall(9, this, PWSTR.Ptr, &ppszwDevNodeId := 0, "HRESULT")
        return ppszwDevNodeId
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetClassGuid() {
        pGuid := Guid()
        result := ComCall(10, this, Guid.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetBindName() {
        result := ComCall(11, this, PWSTR.Ptr, &ppszwBindName := 0, "HRESULT")
        return ppszwBindName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDeviceStatus() {
        result := ComCall(12, this, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @returns {HKEY} 
     */
    OpenParamKey() {
        phkey := HKEY.Owned()
        result := ComCall(13, this, HKEY.Ptr, phkey, "HRESULT")
        return phkey
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {IUnknown} punkContext 
     * @returns {HRESULT} 
     */
    RaisePropertyUi(hwndParent, dwFlags, punkContext) {
        result := ComCall(14, this, HWND, hwndParent, "uint", dwFlags, "ptr", punkContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgComponent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDisplayName := CallbackCreate(GetMethod(implObj, "GetDisplayName"), flags, 2)
        this.vtbl.SetDisplayName := CallbackCreate(GetMethod(implObj, "SetDisplayName"), flags, 2)
        this.vtbl.GetHelpText := CallbackCreate(GetMethod(implObj, "GetHelpText"), flags, 2)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 2)
        this.vtbl.GetCharacteristics := CallbackCreate(GetMethod(implObj, "GetCharacteristics"), flags, 2)
        this.vtbl.GetInstanceGuid := CallbackCreate(GetMethod(implObj, "GetInstanceGuid"), flags, 2)
        this.vtbl.GetPnpDevNodeId := CallbackCreate(GetMethod(implObj, "GetPnpDevNodeId"), flags, 2)
        this.vtbl.GetClassGuid := CallbackCreate(GetMethod(implObj, "GetClassGuid"), flags, 2)
        this.vtbl.GetBindName := CallbackCreate(GetMethod(implObj, "GetBindName"), flags, 2)
        this.vtbl.GetDeviceStatus := CallbackCreate(GetMethod(implObj, "GetDeviceStatus"), flags, 2)
        this.vtbl.OpenParamKey := CallbackCreate(GetMethod(implObj, "OpenParamKey"), flags, 2)
        this.vtbl.RaisePropertyUi := CallbackCreate(GetMethod(implObj, "RaisePropertyUi"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDisplayName)
        CallbackFree(this.vtbl.SetDisplayName)
        CallbackFree(this.vtbl.GetHelpText)
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetCharacteristics)
        CallbackFree(this.vtbl.GetInstanceGuid)
        CallbackFree(this.vtbl.GetPnpDevNodeId)
        CallbackFree(this.vtbl.GetClassGuid)
        CallbackFree(this.vtbl.GetBindName)
        CallbackFree(this.vtbl.GetDeviceStatus)
        CallbackFree(this.vtbl.OpenParamKey)
        CallbackFree(this.vtbl.RaisePropertyUi)
    }
}
