#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestPackageId.ahk
#Include .\IAppxManifestQualifiedResourcesEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for a &lt;Package&gt; element in a bundle package manifest.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlemanifestpackageinfo
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestPackageInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestPackageInfo
     * @type {Guid}
     */
    static IID => Guid("{54cd06c1-268f-40bb-8ed2-757a9ebaec8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPackageType", "GetPackageId", "GetFileName", "GetOffset", "GetSize", "GetResources"]

    /**
     * Retrieves the type of package that is represented by the package info.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_bundle_payload_package_type">APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE</a>*</b>
     * 
     * The type of package.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getpackagetype
     */
    GetPackageType() {
        result := ComCall(3, this, "int*", &packageType := 0, "HRESULT")
        return packageType
    }

    /**
     * Retrieves an object that represents the identity of the app package.
     * @returns {IAppxManifestPackageId} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid">IAppxManifestPackageId</a>**</b>
     * 
     * The package identifier.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getpackageid
     */
    GetPackageId() {
        result := ComCall(4, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * Retrieves the file-name attribute of the package.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * A string that contains the file name of the package.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getfilename
     */
    GetFileName() {
        result := ComCall(5, this, "ptr*", &fileName := 0, "HRESULT")
        return fileName
    }

    /**
     * Retrieves the offset of the package relative to the beginning of the bundle.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>*</b>
     * 
     * The offset of the package, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getoffset
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
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getsize
     */
    GetSize() {
        result := ComCall(7, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * Retrieves an enumerator that iterates through all the &lt;Resource&gt; elements that are defined in the app package's manifest.
     * @returns {IAppxManifestQualifiedResourcesEnumerator} Type: <b><a href="https://docs.microsoft.com/previous-versions/dn280306(v=vs.85)">IAppxManifestQualifiedResourcesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the resources.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getresources
     */
    GetResources() {
        result := ComCall(8, this, "ptr*", &resources := 0, "HRESULT")
        return IAppxManifestQualifiedResourcesEnumerator(resources)
    }
}
