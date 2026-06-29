#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IAppxManifestPackageId.ahk" { IAppxManifestPackageId }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxManifestQualifiedResourcesEnumerator.ahk" { IAppxManifestQualifiedResourcesEnumerator }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE.ahk" { APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE }

/**
 * Provides a read-only object model for a &lt;Package&gt; element in a bundle package manifest. (IAppxBundleManifestPackageInfo)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlemanifestpackageinfo
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleManifestPackageInfo extends IUnknown {
    /**
     * The interface identifier for IAppxBundleManifestPackageInfo
     * @type {Guid}
     */
    static IID := Guid("{54cd06c1-268f-40bb-8ed2-757a9ebaec8d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleManifestPackageInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPackageType : IntPtr
        GetPackageId   : IntPtr
        GetFileName    : IntPtr
        GetOffset      : IntPtr
        GetSize        : IntPtr
        GetResources   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleManifestPackageInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the type of package that is represented by the package info.
     * @returns {APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_bundle_payload_package_type">APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE</a>*</b>
     * 
     * The type of package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getpackagetype
     */
    GetPackageType() {
        result := ComCall(3, this, "int*", &packageType := 0, "HRESULT")
        return packageType
    }

    /**
     * Retrieves an object that represents the identity of the app package.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <i>packageId</i> object.
     * @returns {IAppxManifestPackageId} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid">IAppxManifestPackageId</a>**</b>
     * 
     * The package identifier.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getpackageid
     */
    GetPackageId() {
        result := ComCall(4, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * Retrieves the file-name attribute of the package.
     * @remarks
     * You can pass the package file name that  <b>GetFileName</b> outputs to the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getpayloadpackage">IAppxBundleReader::GetPayloadPackage</a> method to access the package’s contents.
     * 
     * When you're done using the file name, free the memory allocated for <i>fileName</i> by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * A string that contains the file name of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getfilename
     */
    GetFileName() {
        result := ComCall(5, this, PWSTR.Ptr, &fileName := 0, "HRESULT")
        return fileName
    }

    /**
     * Retrieves the offset of the package relative to the beginning of the bundle.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>*</b>
     * 
     * The offset of the package, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getoffset
     */
    GetOffset() {
        result := ComCall(6, this, "uint*", &offset := 0, "HRESULT")
        return offset
    }

    /**
     * Retrieves the size of the package, in bytes.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>*</b>
     * 
     * The size of the package, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getsize
     */
    GetSize() {
        result := ComCall(7, this, "uint*", &_size := 0, "HRESULT")
        return _size
    }

    /**
     * Retrieves an enumerator that iterates through all the &lt;Resource&gt; elements that are defined in the app package's manifest.
     * @returns {IAppxManifestQualifiedResourcesEnumerator} Type: <b><a href="https://docs.microsoft.com/previous-versions/dn280306(v=vs.85)">IAppxManifestQualifiedResourcesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the resources.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getresources
     */
    GetResources() {
        result := ComCall(8, this, "ptr*", &resources := 0, "HRESULT")
        return IAppxManifestQualifiedResourcesEnumerator(resources)
    }

    Query(iid) {
        if (IAppxBundleManifestPackageInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPackageType := CallbackCreate(GetMethod(implObj, "GetPackageType"), flags, 2)
        this.vtbl.GetPackageId := CallbackCreate(GetMethod(implObj, "GetPackageId"), flags, 2)
        this.vtbl.GetFileName := CallbackCreate(GetMethod(implObj, "GetFileName"), flags, 2)
        this.vtbl.GetOffset := CallbackCreate(GetMethod(implObj, "GetOffset"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 2)
        this.vtbl.GetResources := CallbackCreate(GetMethod(implObj, "GetResources"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPackageType)
        CallbackFree(this.vtbl.GetPackageId)
        CallbackFree(this.vtbl.GetFileName)
        CallbackFree(this.vtbl.GetOffset)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetResources)
    }
}
