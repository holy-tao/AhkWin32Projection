#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IObjectWithPackageFullName extends IUnknown {
    /**
     * The interface identifier for IObjectWithPackageFullName
     * @type {Guid}
     */
    static IID := Guid("{ed2aa515-602f-469c-a130-ce69fd0fa878}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectWithPackageFullName interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPackageFullName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectWithPackageFullName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the package full name for the specified process.
     * @remarks
     * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
     * @returns {PWSTR} Type: <b>PWSTR</b>
     * 
     * The package full name.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagefullname
     */
    GetPackageFullName() {
        result := ComCall(3, this, PWSTR.Ptr, &packageFullName := 0, "HRESULT")
        return packageFullName
    }

    Query(iid) {
        if (IObjectWithPackageFullName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPackageFullName := CallbackCreate(GetMethod(implObj, "GetPackageFullName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPackageFullName)
    }
}
