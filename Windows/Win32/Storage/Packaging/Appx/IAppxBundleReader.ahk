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
     * 
     * @param {Integer} fileType 
     * @param {Pointer<IAppxFile>} footprintFile 
     * @returns {HRESULT} 
     */
    GetFootprintFile(fileType, footprintFile) {
        result := ComCall(3, this, "int", fileType, "ptr", footprintFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxBlockMapReader>} blockMapReader 
     * @returns {HRESULT} 
     */
    GetBlockMap(blockMapReader) {
        result := ComCall(4, this, "ptr", blockMapReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxBundleManifestReader>} manifestReader 
     * @returns {HRESULT} 
     */
    GetManifest(manifestReader) {
        result := ComCall(5, this, "ptr", manifestReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxFilesEnumerator>} payloadPackages 
     * @returns {HRESULT} 
     */
    GetPayloadPackages(payloadPackages) {
        result := ComCall(6, this, "ptr", payloadPackages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<IAppxFile>} payloadPackage 
     * @returns {HRESULT} 
     */
    GetPayloadPackage(fileName, payloadPackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(7, this, "ptr", fileName, "ptr", payloadPackage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
