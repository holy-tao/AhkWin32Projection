#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBundleWriter.ahk
#Include .\IAppxBundleReader.ahk
#Include .\IAppxBundleManifestReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing bundle packages.
 * @remarks
 * 
 * The <b>IAppxBundleFactory</b> interface provides factory methods to create readers and writers of bundle packages as well as methods to create readers for manifests outside of a bundle. 
 * 
 * The <b>IAppxBundleFactory</b> interface is the main entry point to the Appx Bundle APIs.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlefactory
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleFactory
     * @type {Guid}
     */
    static IID => Guid("{bba65864-965f-4a5f-855f-f074bdbf3a7b}")

    /**
     * The class identifier for AppxBundleFactory
     * @type {Guid}
     */
    static CLSID => Guid("{378e0446-5384-43b7-8877-e7dbdd883446}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBundleWriter", "CreateBundleReader", "CreateBundleManifestReader"]

    /**
     * 
     * @param {IStream} outputStream 
     * @param {Integer} bundleVersion 
     * @returns {IAppxBundleWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlewriter
     */
    CreateBundleWriter(outputStream, bundleVersion) {
        result := ComCall(3, this, "ptr", outputStream, "uint", bundleVersion, "ptr*", &bundleWriter := 0, "HRESULT")
        return IAppxBundleWriter(bundleWriter)
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @returns {IAppxBundleReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlereader
     */
    CreateBundleReader(inputStream) {
        result := ComCall(4, this, "ptr", inputStream, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @returns {IAppxBundleManifestReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlemanifestreader
     */
    CreateBundleManifestReader(inputStream) {
        result := ComCall(5, this, "ptr", inputStream, "ptr*", &manifestReader := 0, "HRESULT")
        return IAppxBundleManifestReader(manifestReader)
    }
}
