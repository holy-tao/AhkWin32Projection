#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetCfgBindingPath.ahk" { INetCfgBindingPath }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgComponentNotifyGlobal extends IUnknown {
    /**
     * The interface identifier for INetCfgComponentNotifyGlobal
     * @type {Guid}
     */
    static IID := Guid("{932238e2-bea1-11d0-9298-00c04fc99dcf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgComponentNotifyGlobal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSupportedNotifications : IntPtr
        SysQueryBindingPath       : IntPtr
        SysNotifyBindingPath      : IntPtr
        SysNotifyComponent        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgComponentNotifyGlobal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSupportedNotifications() {
        result := ComCall(3, this, "uint*", &dwNotifications := 0, "HRESULT")
        return dwNotifications
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgBindingPath} pIPath 
     * @returns {HRESULT} 
     */
    SysQueryBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(4, this, "uint", dwChangeFlag, "ptr", pIPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgBindingPath} pIPath 
     * @returns {HRESULT} 
     */
    SysNotifyBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(5, this, "uint", dwChangeFlag, "ptr", pIPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgComponent} pIComp 
     * @returns {HRESULT} 
     */
    SysNotifyComponent(dwChangeFlag, pIComp) {
        result := ComCall(6, this, "uint", dwChangeFlag, "ptr", pIComp, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgComponentNotifyGlobal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSupportedNotifications := CallbackCreate(GetMethod(implObj, "GetSupportedNotifications"), flags, 2)
        this.vtbl.SysQueryBindingPath := CallbackCreate(GetMethod(implObj, "SysQueryBindingPath"), flags, 3)
        this.vtbl.SysNotifyBindingPath := CallbackCreate(GetMethod(implObj, "SysNotifyBindingPath"), flags, 3)
        this.vtbl.SysNotifyComponent := CallbackCreate(GetMethod(implObj, "SysNotifyComponent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSupportedNotifications)
        CallbackFree(this.vtbl.SysQueryBindingPath)
        CallbackFree(this.vtbl.SysNotifyBindingPath)
        CallbackFree(this.vtbl.SysNotifyComponent)
    }
}
