#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import ".\IEnumNetCfgComponent.ahk" { IEnumNetCfgComponent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgClass extends IUnknown {
    /**
     * The interface identifier for INetCfgClass
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae97-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgClass interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindComponent  : IntPtr
        EnumComponents : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgClass.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszwInfId 
     * @returns {INetCfgComponent} 
     */
    FindComponent(pszwInfId) {
        pszwInfId := pszwInfId is String ? StrPtr(pszwInfId) : pszwInfId

        result := ComCall(3, this, "ptr", pszwInfId, "ptr*", &ppnccItem := 0, "HRESULT")
        return INetCfgComponent(ppnccItem)
    }

    /**
     * 
     * @returns {IEnumNetCfgComponent} 
     */
    EnumComponents() {
        result := ComCall(4, this, "ptr*", &ppenumComponent := 0, "HRESULT")
        return IEnumNetCfgComponent(ppenumComponent)
    }

    Query(iid) {
        if (INetCfgClass.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindComponent := CallbackCreate(GetMethod(implObj, "FindComponent"), flags, 3)
        this.vtbl.EnumComponents := CallbackCreate(GetMethod(implObj, "EnumComponents"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindComponent)
        CallbackFree(this.vtbl.EnumComponents)
    }
}
