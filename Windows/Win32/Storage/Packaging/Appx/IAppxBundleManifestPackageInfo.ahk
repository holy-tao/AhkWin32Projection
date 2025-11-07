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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getpackagetype
     */
    GetPackageType() {
        result := ComCall(3, this, "int*", &packageType := 0, "HRESULT")
        return packageType
    }

    /**
     * Gets the package identifier (ID) for the specified process.
     * @returns {IAppxManifestPackageId} 
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackageid
     */
    GetPackageId() {
        result := ComCall(4, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getfilename
     */
    GetFileName() {
        result := ComCall(5, this, "ptr*", &fileName := 0, "HRESULT")
        return fileName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getoffset
     */
    GetOffset() {
        result := ComCall(6, this, "uint*", &offset := 0, "HRESULT")
        return offset
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getsize
     */
    GetSize() {
        result := ComCall(7, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * 
     * @returns {IAppxManifestQualifiedResourcesEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getresources
     */
    GetResources() {
        result := ComCall(8, this, "ptr*", &resources := 0, "HRESULT")
        return IAppxManifestQualifiedResourcesEnumerator(resources)
    }
}
