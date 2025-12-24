#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestPackageId.ahk
#Include .\IAppxBundleManifestPackageInfoEnumerator.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for manifests of bundle packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlemanifestreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestReader
     * @type {Guid}
     */
    static IID => Guid("{cf0ebbc1-cc99-4106-91eb-e67462e04fb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPackageId", "GetPackageInfoItems", "GetStream"]

    /**
     * Retrieves an object that represents the &lt;Identity&gt; element under the root &lt;Bundle&gt; element.
     * @returns {IAppxManifestPackageId} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid">IAppxManifestPackageId</a>**</b>
     * 
     * The package identifier.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestreader-getpackageid
     */
    GetPackageId() {
        result := ComCall(3, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * Retrieves an enumerator over all the &lt;Package&gt; elements under the &lt;Packages&gt; element.
     * @returns {IAppxBundleManifestPackageInfoEnumerator} Type: <b>IAppxBundleManifestPackageInfoEnumerator**</b>
     * 
     *  An enumerator over all payload packages in a &lt;Packages&gt; element of a bundle.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestreader-getpackageinfoitems
     */
    GetPackageInfoItems() {
        result := ComCall(4, this, "ptr*", &packageInfoItems := 0, "HRESULT")
        return IAppxBundleManifestPackageInfoEnumerator(packageInfoItems)
    }

    /**
     * Gets the raw XML document without any preprocessing.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The read-only stream that represents the XML content of the manifest.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlemanifestreader-getstream
     */
    GetStream() {
        result := ComCall(5, this, "ptr*", &manifestStream := 0, "HRESULT")
        return IStream(manifestStream)
    }
}
