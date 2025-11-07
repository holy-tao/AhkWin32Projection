#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestPackageId.ahk
#Include .\IAppxBundleManifestPackageInfoEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for an &lt;OptionalBundle&gt; element in a bundle package manifest.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlemanifestoptionalbundleinfo
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestOptionalBundleInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestOptionalBundleInfo
     * @type {Guid}
     */
    static IID => Guid("{515bf2e8-bcb0-4d69-8c48-e383147b6e12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPackageId", "GetFileName", "GetPackageInfoItems"]

    /**
     * Gets the package identifier (ID) for the specified process.
     * @returns {IAppxManifestPackageId} 
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackageid
     */
    GetPackageId() {
        result := ComCall(3, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfo-getfilename
     */
    GetFileName() {
        result := ComCall(4, this, "ptr*", &fileName := 0, "HRESULT")
        return fileName
    }

    /**
     * 
     * @returns {IAppxBundleManifestPackageInfoEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfo-getpackageinfoitems
     */
    GetPackageInfoItems() {
        result := ComCall(5, this, "ptr*", &packageInfoItems := 0, "HRESULT")
        return IAppxBundleManifestPackageInfoEnumerator(packageInfoItems)
    }
}
