#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHostAssemblyStore.ahk" { IHostAssemblyStore }
#Import ".\ICLRAssemblyReferenceList.ahk" { ICLRAssemblyReferenceList }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostAssemblyManager extends IUnknown {
    /**
     * The interface identifier for IHostAssemblyManager
     * @type {Guid}
     */
    static IID := Guid("{613dabd7-62b2-493e-9e65-c1e32a1e0c5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostAssemblyManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNonHostStoreAssemblies : IntPtr
        GetAssemblyStore          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostAssemblyManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ICLRAssemblyReferenceList} 
     */
    GetNonHostStoreAssemblies() {
        result := ComCall(3, this, "ptr*", &ppReferenceList := 0, "HRESULT")
        return ICLRAssemblyReferenceList(ppReferenceList)
    }

    /**
     * 
     * @returns {IHostAssemblyStore} 
     */
    GetAssemblyStore() {
        result := ComCall(4, this, "ptr*", &ppAssemblyStore := 0, "HRESULT")
        return IHostAssemblyStore(ppAssemblyStore)
    }

    Query(iid) {
        if (IHostAssemblyManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNonHostStoreAssemblies := CallbackCreate(GetMethod(implObj, "GetNonHostStoreAssemblies"), flags, 2)
        this.vtbl.GetAssemblyStore := CallbackCreate(GetMethod(implObj, "GetAssemblyStore"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNonHostStoreAssemblies)
        CallbackFree(this.vtbl.GetAssemblyStore)
    }
}
