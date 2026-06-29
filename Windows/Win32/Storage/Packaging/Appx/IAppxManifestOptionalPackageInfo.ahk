#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to attribute values of the optional package information.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestoptionalpackageinfo
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestOptionalPackageInfo extends IUnknown {
    /**
     * The interface identifier for IAppxManifestOptionalPackageInfo
     * @type {Guid}
     */
    static IID := Guid("{2634847d-5b5d-4fe5-a243-002ff95edc7e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestOptionalPackageInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIsOptionalPackage : IntPtr
        GetMainPackageName   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestOptionalPackageInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the package is optional.
     * @returns {BOOL} True if the package is optional, false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestoptionalpackageinfo-getisoptionalpackage
     */
    GetIsOptionalPackage() {
        result := ComCall(3, this, BOOL.Ptr, &isOptionalPackage := 0, "HRESULT")
        return isOptionalPackage
    }

    /**
     * Gets the main package name from the optional package.
     * @returns {PWSTR} The main package name.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestoptionalpackageinfo-getmainpackagename
     */
    GetMainPackageName() {
        result := ComCall(4, this, PWSTR.Ptr, &mainPackageName := 0, "HRESULT")
        return mainPackageName
    }

    Query(iid) {
        if (IAppxManifestOptionalPackageInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIsOptionalPackage := CallbackCreate(GetMethod(implObj, "GetIsOptionalPackage"), flags, 2)
        this.vtbl.GetMainPackageName := CallbackCreate(GetMethod(implObj, "GetMainPackageName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIsOptionalPackage)
        CallbackFree(this.vtbl.GetMainPackageName)
    }
}
