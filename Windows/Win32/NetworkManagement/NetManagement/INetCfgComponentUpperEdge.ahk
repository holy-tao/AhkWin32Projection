#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgComponentUpperEdge extends IUnknown {
    /**
     * The interface identifier for INetCfgComponentUpperEdge
     * @type {Guid}
     */
    static IID := Guid("{932238e4-bea1-11d0-9298-00c04fc99dcf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgComponentUpperEdge interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInterfaceIdsForAdapter   : IntPtr
        AddInterfacesToAdapter      : IntPtr
        RemoveInterfacesFromAdapter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgComponentUpperEdge.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {INetCfgComponent} pAdapter 
     * @param {Pointer<Integer>} pdwNumInterfaces 
     * @param {Pointer<Pointer<Guid>>} ppguidInterfaceIds 
     * @returns {HRESULT} 
     */
    GetInterfaceIdsForAdapter(pAdapter, pdwNumInterfaces, ppguidInterfaceIds) {
        pdwNumInterfacesMarshal := pdwNumInterfaces is VarRef ? "uint*" : "ptr"
        ppguidInterfaceIdsMarshal := ppguidInterfaceIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pAdapter, pdwNumInterfacesMarshal, pdwNumInterfaces, ppguidInterfaceIdsMarshal, ppguidInterfaceIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pAdapter 
     * @param {Integer} dwNumInterfaces 
     * @returns {HRESULT} 
     */
    AddInterfacesToAdapter(pAdapter, dwNumInterfaces) {
        result := ComCall(4, this, "ptr", pAdapter, "uint", dwNumInterfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pAdapter 
     * @param {Integer} dwNumInterfaces 
     * @param {Pointer<Guid>} pguidInterfaceIds 
     * @returns {HRESULT} 
     */
    RemoveInterfacesFromAdapter(pAdapter, dwNumInterfaces, pguidInterfaceIds) {
        result := ComCall(5, this, "ptr", pAdapter, "uint", dwNumInterfaces, Guid.Ptr, pguidInterfaceIds, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgComponentUpperEdge.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInterfaceIdsForAdapter := CallbackCreate(GetMethod(implObj, "GetInterfaceIdsForAdapter"), flags, 4)
        this.vtbl.AddInterfacesToAdapter := CallbackCreate(GetMethod(implObj, "AddInterfacesToAdapter"), flags, 3)
        this.vtbl.RemoveInterfacesFromAdapter := CallbackCreate(GetMethod(implObj, "RemoveInterfacesFromAdapter"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInterfaceIdsForAdapter)
        CallbackFree(this.vtbl.AddInterfacesToAdapter)
        CallbackFree(this.vtbl.RemoveInterfacesFromAdapter)
    }
}
