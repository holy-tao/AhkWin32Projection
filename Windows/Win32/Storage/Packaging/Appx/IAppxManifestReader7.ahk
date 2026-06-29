#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxManifestOSPackageDependenciesEnumerator.ahk" { IAppxManifestOSPackageDependenciesEnumerator }
#Import ".\IAppxManifestHostRuntimeDependenciesEnumerator.ahk" { IAppxManifestHostRuntimeDependenciesEnumerator }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxManifestDriverDependenciesEnumerator.ahk" { IAppxManifestDriverDependenciesEnumerator }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestReader7 extends IUnknown {
    /**
     * The interface identifier for IAppxManifestReader7
     * @type {Guid}
     */
    static IID := Guid("{8efe6f27-0ce0-4988-b32d-738eb63db3b7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestReader7 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDriverDependencies      : IntPtr
        GetOSPackageDependencies   : IntPtr
        GetHostRuntimeDependencies : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestReader7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IAppxManifestDriverDependenciesEnumerator} 
     */
    GetDriverDependencies() {
        result := ComCall(3, this, "ptr*", &driverDependencies := 0, "HRESULT")
        return IAppxManifestDriverDependenciesEnumerator(driverDependencies)
    }

    /**
     * 
     * @returns {IAppxManifestOSPackageDependenciesEnumerator} 
     */
    GetOSPackageDependencies() {
        result := ComCall(4, this, "ptr*", &osPackageDependencies := 0, "HRESULT")
        return IAppxManifestOSPackageDependenciesEnumerator(osPackageDependencies)
    }

    /**
     * 
     * @returns {IAppxManifestHostRuntimeDependenciesEnumerator} 
     */
    GetHostRuntimeDependencies() {
        result := ComCall(5, this, "ptr*", &hostRuntimeDependencies := 0, "HRESULT")
        return IAppxManifestHostRuntimeDependenciesEnumerator(hostRuntimeDependencies)
    }

    Query(iid) {
        if (IAppxManifestReader7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDriverDependencies := CallbackCreate(GetMethod(implObj, "GetDriverDependencies"), flags, 2)
        this.vtbl.GetOSPackageDependencies := CallbackCreate(GetMethod(implObj, "GetOSPackageDependencies"), flags, 2)
        this.vtbl.GetHostRuntimeDependencies := CallbackCreate(GetMethod(implObj, "GetHostRuntimeDependencies"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDriverDependencies)
        CallbackFree(this.vtbl.GetOSPackageDependencies)
        CallbackFree(this.vtbl.GetHostRuntimeDependencies)
    }
}
