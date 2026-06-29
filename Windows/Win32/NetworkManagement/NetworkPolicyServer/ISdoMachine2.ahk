#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISdoMachine.ahk" { ISdoMachine }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct ISdoMachine2 extends ISdoMachine {
    /**
     * The interface identifier for ISdoMachine2
     * @type {Guid}
     */
    static IID := Guid("{518e5ffe-d8ce-4f7e-a5db-b40a35419d3b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISdoMachine2 interfaces
    */
    struct Vtbl extends ISdoMachine.Vtbl {
        GetTemplatesSDO            : IntPtr
        EnableTemplates            : IntPtr
        SyncConfigAgainstTemplates : IntPtr
        ImportRemoteTemplates      : IntPtr
        Reload                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISdoMachine2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrServiceName 
     * @returns {IUnknown} 
     */
    GetTemplatesSDO(bstrServiceName) {
        bstrServiceName := bstrServiceName is String ? BSTR.Alloc(bstrServiceName).Value : bstrServiceName

        result := ComCall(16, this, BSTR, bstrServiceName, "ptr*", &ppTemplatesSDO := 0, "HRESULT")
        return IUnknown(ppTemplatesSDO)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableTemplates() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServiceName 
     * @param {Pointer<IUnknown>} ppConfigRoot 
     * @param {Pointer<IUnknown>} ppTemplatesRoot 
     * @param {VARIANT_BOOL} bForcedSync 
     * @returns {HRESULT} 
     */
    SyncConfigAgainstTemplates(bstrServiceName, ppConfigRoot, ppTemplatesRoot, bForcedSync) {
        bstrServiceName := bstrServiceName is String ? BSTR.Alloc(bstrServiceName).Value : bstrServiceName

        result := ComCall(18, this, BSTR, bstrServiceName, IUnknown.Ptr, ppConfigRoot, IUnknown.Ptr, ppTemplatesRoot, VARIANT_BOOL, bForcedSync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pLocalTemplatesRoot 
     * @param {BSTR} bstrRemoteMachineName 
     * @returns {HRESULT} 
     */
    ImportRemoteTemplates(pLocalTemplatesRoot, bstrRemoteMachineName) {
        bstrRemoteMachineName := bstrRemoteMachineName is String ? BSTR.Alloc(bstrRemoteMachineName).Value : bstrRemoteMachineName

        result := ComCall(19, this, "ptr", pLocalTemplatesRoot, BSTR, bstrRemoteMachineName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reload() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISdoMachine2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTemplatesSDO := CallbackCreate(GetMethod(implObj, "GetTemplatesSDO"), flags, 3)
        this.vtbl.EnableTemplates := CallbackCreate(GetMethod(implObj, "EnableTemplates"), flags, 1)
        this.vtbl.SyncConfigAgainstTemplates := CallbackCreate(GetMethod(implObj, "SyncConfigAgainstTemplates"), flags, 5)
        this.vtbl.ImportRemoteTemplates := CallbackCreate(GetMethod(implObj, "ImportRemoteTemplates"), flags, 3)
        this.vtbl.Reload := CallbackCreate(GetMethod(implObj, "Reload"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTemplatesSDO)
        CallbackFree(this.vtbl.EnableTemplates)
        CallbackFree(this.vtbl.SyncConfigAgainstTemplates)
        CallbackFree(this.vtbl.ImportRemoteTemplates)
        CallbackFree(this.vtbl.Reload)
    }
}
