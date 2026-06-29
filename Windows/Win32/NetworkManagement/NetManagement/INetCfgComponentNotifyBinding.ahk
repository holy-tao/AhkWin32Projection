#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetCfgBindingPath.ahk" { INetCfgBindingPath }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgComponentNotifyBinding extends IUnknown {
    /**
     * The interface identifier for INetCfgComponentNotifyBinding
     * @type {Guid}
     */
    static IID := Guid("{932238e1-bea1-11d0-9298-00c04fc99dcf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgComponentNotifyBinding interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryBindingPath  : IntPtr
        NotifyBindingPath : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgComponentNotifyBinding.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgBindingPath} pIPath 
     * @returns {HRESULT} 
     */
    QueryBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(3, this, "uint", dwChangeFlag, "ptr", pIPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgBindingPath} pIPath 
     * @returns {HRESULT} 
     */
    NotifyBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(4, this, "uint", dwChangeFlag, "ptr", pIPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgComponentNotifyBinding.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryBindingPath := CallbackCreate(GetMethod(implObj, "QueryBindingPath"), flags, 3)
        this.vtbl.NotifyBindingPath := CallbackCreate(GetMethod(implObj, "NotifyBindingPath"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryBindingPath)
        CallbackFree(this.vtbl.NotifyBindingPath)
    }
}
