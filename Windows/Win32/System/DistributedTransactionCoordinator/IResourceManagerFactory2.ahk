#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IResourceManagerFactory.ahk" { IResourceManagerFactory }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IResourceManagerSink.ahk" { IResourceManagerSink }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IResourceManagerFactory2 extends IResourceManagerFactory {
    /**
     * The interface identifier for IResourceManagerFactory2
     * @type {Guid}
     */
    static IID := Guid("{6b369c21-fbd2-11d1-8f47-00c04f8ee57d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResourceManagerFactory2 interfaces
    */
    struct Vtbl extends IResourceManagerFactory.Vtbl {
        CreateEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResourceManagerFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidRM 
     * @param {PSTR} pszRMName 
     * @param {IResourceManagerSink} pIResMgrSink 
     * @param {Pointer<Guid>} riidRequested 
     * @returns {Pointer<Void>} 
     */
    CreateEx(pguidRM, pszRMName, pIResMgrSink, riidRequested) {
        pszRMName := pszRMName is String ? StrPtr(pszRMName) : pszRMName

        result := ComCall(4, this, Guid.Ptr, pguidRM, "ptr", pszRMName, "ptr", pIResMgrSink, Guid.Ptr, riidRequested, "ptr*", &ppvResMgr := 0, "HRESULT")
        return ppvResMgr
    }

    Query(iid) {
        if (IResourceManagerFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateEx := CallbackCreate(GetMethod(implObj, "CreateEx"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateEx)
    }
}
