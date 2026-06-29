#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a read-only object model for a &lt;Package&gt; element in a bundle package manifest. (IAppxBundleManifestPackageInfo2)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlemanifestpackageinfo2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleManifestPackageInfo2 extends IUnknown {
    /**
     * The interface identifier for IAppxBundleManifestPackageInfo2
     * @type {Guid}
     */
    static IID := Guid("{44c2acbc-b2cf-4ccb-bbdb-9c6da8c3bc9e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleManifestPackageInfo2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIsPackageReference            : IntPtr
        GetIsNonQualifiedResourcePackage : IntPtr
        GetIsDefaultApplicablePackage    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleManifestPackageInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether a package is stored inside an app bundle, or if it's a reference to a package.
     * @returns {BOOL} True if the package in the bundle is a reference to a package; False if the package in the bundle is stored inside the app bundle.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getispackagereference
     */
    GetIsPackageReference() {
        result := ComCall(3, this, BOOL.Ptr, &isPackageReference := 0, "HRESULT")
        return isPackageReference
    }

    /**
     * Determines whether the app package is a non-qualified resource package.
     * @remarks
     * A non-qualified resource package is a package that contains resources that are not qualified with any language, scale, or other qualifier. An example of this could be a package that contains all music files. 
     * 
     * For more information on app resources, see <a href="https://docs.microsoft.com/windows/uwp/app-resources/">App resources and the Resource Management System</a>.
     * @returns {BOOL} True if the package is a non-qualified resource package, False otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getisnonqualifiedresourcepackage
     */
    GetIsNonQualifiedResourcePackage() {
        result := ComCall(4, this, BOOL.Ptr, &isNonQualifiedResourcePackage := 0, "HRESULT")
        return isNonQualifiedResourcePackage
    }

    /**
     * Determines whether the app package is a default applicable package.
     * @remarks
     * A default applicable package is a package that contains the default MRT-qualified resources. For example, a default applicable package could be English language resources that should be installed by default if no other appropriate alternative language is  available.
     * 
     * For more information on app resources, see <a href="https://docs.microsoft.com/windows/uwp/app-resources/">App resources and the Resource Management System</a>.
     * @returns {BOOL} True if the package is a default applicable package, False otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo2-getisdefaultapplicablepackage
     */
    GetIsDefaultApplicablePackage() {
        result := ComCall(5, this, BOOL.Ptr, &isDefaultApplicablePackage := 0, "HRESULT")
        return isDefaultApplicablePackage
    }

    Query(iid) {
        if (IAppxBundleManifestPackageInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIsPackageReference := CallbackCreate(GetMethod(implObj, "GetIsPackageReference"), flags, 2)
        this.vtbl.GetIsNonQualifiedResourcePackage := CallbackCreate(GetMethod(implObj, "GetIsNonQualifiedResourcePackage"), flags, 2)
        this.vtbl.GetIsDefaultApplicablePackage := CallbackCreate(GetMethod(implObj, "GetIsDefaultApplicablePackage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIsPackageReference)
        CallbackFree(this.vtbl.GetIsNonQualifiedResourcePackage)
        CallbackFree(this.vtbl.GetIsDefaultApplicablePackage)
    }
}
