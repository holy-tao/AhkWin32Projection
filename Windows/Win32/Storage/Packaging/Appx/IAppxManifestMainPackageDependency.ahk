#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to attribute values of the main package dependency.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestmainpackagedependency
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestMainPackageDependency extends IUnknown {
    /**
     * The interface identifier for IAppxManifestMainPackageDependency
     * @type {Guid}
     */
    static IID := Guid("{05d0611c-bc29-46d5-97e2-84b9c79bd8ae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestMainPackageDependency interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName              : IntPtr
        GetPublisher         : IntPtr
        GetPackageFamilyName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestMainPackageDependency.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the name of the main package dependency from the AppxManifest.xml.
     * @returns {PWSTR} The name of the main package dependency.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &name := 0, "HRESULT")
        return name
    }

    /**
     * Gets the publisher of the main package dependency from the AppxManifest.xml.
     * @returns {PWSTR} The publisher of the main package dependency.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getpublisher
     */
    GetPublisher() {
        result := ComCall(4, this, PWSTR.Ptr, &publisher := 0, "HRESULT")
        return publisher
    }

    /**
     * Gets the package family name of the main package dependency from the AppxManifest.xml.
     * @returns {PWSTR} The package family name of the main package dependency.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getpackagefamilyname
     */
    GetPackageFamilyName() {
        result := ComCall(5, this, PWSTR.Ptr, &packageFamilyName := 0, "HRESULT")
        return packageFamilyName
    }

    Query(iid) {
        if (IAppxManifestMainPackageDependency.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetPublisher := CallbackCreate(GetMethod(implObj, "GetPublisher"), flags, 2)
        this.vtbl.GetPackageFamilyName := CallbackCreate(GetMethod(implObj, "GetPackageFamilyName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetPublisher)
        CallbackFree(this.vtbl.GetPackageFamilyName)
    }
}
