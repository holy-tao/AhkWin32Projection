#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for bundle packages.
 * @remarks
 * 
  * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlereader">CreateBundleReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxbundlefactory">IAppxBundleFactory</a> interface to retrieve the <b>IAppxBundleReader</b> object. 
  * 
  * Through <b>IAppxBundleReader</b>, you can retrieve both footprint files, such as the bundle’s manifest, block map, and signature, and app packages that are contained in the bundle.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlereader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleReader
     * @type {Guid}
     */
    static IID => Guid("{dd75b8c0-ba76-43b0-ae0f-68656a1dc5c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFootprintFile", "GetBlockMap", "GetManifest", "GetPayloadPackages", "GetPayloadPackage"]

    /**
     * 
     * @param {Integer} fileType 
     * @param {Pointer<IAppxFile>} footprintFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getfootprintfile
     */
    GetFootprintFile(fileType, footprintFile) {
        result := ComCall(3, this, "int", fileType, "ptr*", footprintFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxBlockMapReader>} blockMapReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getblockmap
     */
    GetBlockMap(blockMapReader) {
        result := ComCall(4, this, "ptr*", blockMapReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxBundleManifestReader>} manifestReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getmanifest
     */
    GetManifest(manifestReader) {
        result := ComCall(5, this, "ptr*", manifestReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxFilesEnumerator>} payloadPackages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getpayloadpackages
     */
    GetPayloadPackages(payloadPackages) {
        result := ComCall(6, this, "ptr*", payloadPackages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<IAppxFile>} payloadPackage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getpayloadpackage
     */
    GetPayloadPackage(fileName, payloadPackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(7, this, "ptr", fileName, "ptr*", payloadPackage, "HRESULT")
        return result
    }
}
