#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AssemblyBindInfo.ahk" { AssemblyBindInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ModuleBindInfo.ahk" { ModuleBindInfo }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostAssemblyStore extends IUnknown {
    /**
     * The interface identifier for IHostAssemblyStore
     * @type {Guid}
     */
    static IID := Guid("{7b102a88-3f7f-496d-8fa2-c35374e01af3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostAssemblyStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ProvideAssembly : IntPtr
        ProvideModule   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostAssemblyStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<AssemblyBindInfo>} pBindInfo 
     * @param {Pointer<Integer>} pAssemblyId 
     * @param {Pointer<Integer>} pContext 
     * @param {Pointer<IStream>} ppStmAssemblyImage 
     * @param {Pointer<IStream>} ppStmPDB 
     * @returns {HRESULT} 
     */
    ProvideAssembly(pBindInfo, pAssemblyId, pContext, ppStmAssemblyImage, ppStmPDB) {
        pAssemblyIdMarshal := pAssemblyId is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, AssemblyBindInfo.Ptr, pBindInfo, pAssemblyIdMarshal, pAssemblyId, pContextMarshal, pContext, IStream.Ptr, ppStmAssemblyImage, IStream.Ptr, ppStmPDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ModuleBindInfo>} pBindInfo 
     * @param {Pointer<Integer>} pdwModuleId 
     * @param {Pointer<IStream>} ppStmModuleImage 
     * @param {Pointer<IStream>} ppStmPDB 
     * @returns {HRESULT} 
     */
    ProvideModule(pBindInfo, pdwModuleId, ppStmModuleImage, ppStmPDB) {
        pdwModuleIdMarshal := pdwModuleId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ModuleBindInfo.Ptr, pBindInfo, pdwModuleIdMarshal, pdwModuleId, IStream.Ptr, ppStmModuleImage, IStream.Ptr, ppStmPDB, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostAssemblyStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProvideAssembly := CallbackCreate(GetMethod(implObj, "ProvideAssembly"), flags, 6)
        this.vtbl.ProvideModule := CallbackCreate(GetMethod(implObj, "ProvideModule"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProvideAssembly)
        CallbackFree(this.vtbl.ProvideModule)
    }
}
