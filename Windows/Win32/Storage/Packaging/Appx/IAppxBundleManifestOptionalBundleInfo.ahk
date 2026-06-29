#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IAppxManifestPackageId.ahk" { IAppxManifestPackageId }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxBundleManifestPackageInfoEnumerator.ahk" { IAppxBundleManifestPackageInfoEnumerator }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a read-only object model for an &lt;OptionalBundle&gt; element in a bundle package manifest.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlemanifestoptionalbundleinfo
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleManifestOptionalBundleInfo extends IUnknown {
    /**
     * The interface identifier for IAppxBundleManifestOptionalBundleInfo
     * @type {Guid}
     */
    static IID := Guid("{515bf2e8-bcb0-4d69-8c48-e383147b6e12}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleManifestOptionalBundleInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPackageId        : IntPtr
        GetFileName         : IntPtr
        GetPackageInfoItems : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleManifestOptionalBundleInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an object that represents the identity of the &lt;OptionalBundle&gt;.
     * @returns {IAppxManifestPackageId} The package identifier.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfo-getpackageid
     */
    GetPackageId() {
        result := ComCall(3, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * Retrieves the file-name attribute of the &lt;OptionalBundle&gt;.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * A string that contains the file name of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfo-getfilename
     */
    GetFileName() {
        result := ComCall(4, this, PWSTR.Ptr, &fileName := 0, "HRESULT")
        return fileName
    }

    /**
     * Retrieves optional packages in the bundle.
     * @returns {IAppxBundleManifestPackageInfoEnumerator} Type: <b>IAppxBundleManifestPackageInfoEnumerator**</b>
     * 
     *  An enumerator over all payload packages in a &lt;OptionalBundle&gt; element of a bundle.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfo-getpackageinfoitems
     */
    GetPackageInfoItems() {
        result := ComCall(5, this, "ptr*", &packageInfoItems := 0, "HRESULT")
        return IAppxBundleManifestPackageInfoEnumerator(packageInfoItems)
    }

    Query(iid) {
        if (IAppxBundleManifestOptionalBundleInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPackageId := CallbackCreate(GetMethod(implObj, "GetPackageId"), flags, 2)
        this.vtbl.GetFileName := CallbackCreate(GetMethod(implObj, "GetFileName"), flags, 2)
        this.vtbl.GetPackageInfoItems := CallbackCreate(GetMethod(implObj, "GetPackageInfoItems"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPackageId)
        CallbackFree(this.vtbl.GetFileName)
        CallbackFree(this.vtbl.GetPackageInfoItems)
    }
}
