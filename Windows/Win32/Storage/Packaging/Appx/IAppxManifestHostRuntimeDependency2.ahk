#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestHostRuntimeDependency2 extends IUnknown {
    /**
     * The interface identifier for IAppxManifestHostRuntimeDependency2
     * @type {Guid}
     */
    static IID := Guid("{c26f23a8-ee10-4ad6-b898-2b4d7aebfe6a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestHostRuntimeDependency2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPackageFamilyName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestHostRuntimeDependency2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the package family name for the specified process.
     * @remarks
     * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
     * @returns {PWSTR} Type: <b>PWSTR</b>
     * 
     * The package family name.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagefamilyname
     */
    GetPackageFamilyName() {
        result := ComCall(3, this, PWSTR.Ptr, &packageFamilyName := 0, "HRESULT")
        return packageFamilyName
    }

    Query(iid) {
        if (IAppxManifestHostRuntimeDependency2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPackageFamilyName := CallbackCreate(GetMethod(implObj, "GetPackageFamilyName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPackageFamilyName)
    }
}
