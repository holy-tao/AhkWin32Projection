#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetCfgBindingPath.ahk" { INetCfgBindingPath }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumNetCfgBindingPath.ahk" { IEnumNetCfgBindingPath }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgComponentBindings extends IUnknown {
    /**
     * The interface identifier for INetCfgComponentBindings
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae9e-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgComponentBindings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BindTo                   : IntPtr
        UnbindFrom               : IntPtr
        SupportsBindingInterface : IntPtr
        IsBoundTo                : IntPtr
        IsBindableTo             : IntPtr
        EnumBindingPaths         : IntPtr
        MoveBefore               : IntPtr
        MoveAfter                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgComponentBindings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {INetCfgComponent} pnccItem 
     * @returns {HRESULT} 
     */
    BindTo(pnccItem) {
        result := ComCall(3, this, "ptr", pnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pnccItem 
     * @returns {HRESULT} 
     */
    UnbindFrom(pnccItem) {
        result := ComCall(4, this, "ptr", pnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszwInterfaceName 
     * @returns {HRESULT} 
     */
    SupportsBindingInterface(dwFlags, pszwInterfaceName) {
        pszwInterfaceName := pszwInterfaceName is String ? StrPtr(pszwInterfaceName) : pszwInterfaceName

        result := ComCall(5, this, "uint", dwFlags, "ptr", pszwInterfaceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pnccItem 
     * @returns {HRESULT} 
     */
    IsBoundTo(pnccItem) {
        result := ComCall(6, this, "ptr", pnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pnccItem 
     * @returns {HRESULT} 
     */
    IsBindableTo(pnccItem) {
        result := ComCall(7, this, "ptr", pnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {IEnumNetCfgBindingPath} 
     */
    EnumBindingPaths(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumNetCfgBindingPath(ppIEnum)
    }

    /**
     * 
     * @param {INetCfgBindingPath} pncbItemSrc 
     * @param {INetCfgBindingPath} pncbItemDest 
     * @returns {HRESULT} 
     */
    MoveBefore(pncbItemSrc, pncbItemDest) {
        result := ComCall(9, this, "ptr", pncbItemSrc, "ptr", pncbItemDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgBindingPath} pncbItemSrc 
     * @param {INetCfgBindingPath} pncbItemDest 
     * @returns {HRESULT} 
     */
    MoveAfter(pncbItemSrc, pncbItemDest) {
        result := ComCall(10, this, "ptr", pncbItemSrc, "ptr", pncbItemDest, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgComponentBindings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BindTo := CallbackCreate(GetMethod(implObj, "BindTo"), flags, 2)
        this.vtbl.UnbindFrom := CallbackCreate(GetMethod(implObj, "UnbindFrom"), flags, 2)
        this.vtbl.SupportsBindingInterface := CallbackCreate(GetMethod(implObj, "SupportsBindingInterface"), flags, 3)
        this.vtbl.IsBoundTo := CallbackCreate(GetMethod(implObj, "IsBoundTo"), flags, 2)
        this.vtbl.IsBindableTo := CallbackCreate(GetMethod(implObj, "IsBindableTo"), flags, 2)
        this.vtbl.EnumBindingPaths := CallbackCreate(GetMethod(implObj, "EnumBindingPaths"), flags, 3)
        this.vtbl.MoveBefore := CallbackCreate(GetMethod(implObj, "MoveBefore"), flags, 3)
        this.vtbl.MoveAfter := CallbackCreate(GetMethod(implObj, "MoveAfter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BindTo)
        CallbackFree(this.vtbl.UnbindFrom)
        CallbackFree(this.vtbl.SupportsBindingInterface)
        CallbackFree(this.vtbl.IsBoundTo)
        CallbackFree(this.vtbl.IsBindableTo)
        CallbackFree(this.vtbl.EnumBindingPaths)
        CallbackFree(this.vtbl.MoveBefore)
        CallbackFree(this.vtbl.MoveAfter)
    }
}
