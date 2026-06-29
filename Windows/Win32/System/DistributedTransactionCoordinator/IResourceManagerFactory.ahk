#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IResourceManager.ahk" { IResourceManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IResourceManagerSink.ahk" { IResourceManagerSink }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IResourceManagerFactory extends IUnknown {
    /**
     * The interface identifier for IResourceManagerFactory
     * @type {Guid}
     */
    static IID := Guid("{13741d20-87eb-11ce-8081-0080c758527e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResourceManagerFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResourceManagerFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {Pointer<Guid>} pguidRM 
     * @param {PSTR} pszRMName 
     * @param {IResourceManagerSink} pIResMgrSink 
     * @returns {IResourceManager} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(pguidRM, pszRMName, pIResMgrSink) {
        pszRMName := pszRMName is String ? StrPtr(pszRMName) : pszRMName

        result := ComCall(3, this, Guid.Ptr, pguidRM, "ptr", pszRMName, "ptr", pIResMgrSink, "ptr*", &ppResMgr := 0, "HRESULT")
        return IResourceManager(ppResMgr)
    }

    Query(iid) {
        if (IResourceManagerFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}
