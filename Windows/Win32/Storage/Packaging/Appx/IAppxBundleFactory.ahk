#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IStream>} outputStream 
     * @param {Integer} bundleVersion 
     * @param {Pointer<IAppxBundleWriter>} bundleWriter 
     * @returns {HRESULT} 
     */
    CreateBundleWriter(outputStream, bundleVersion, bundleWriter) {
        result := ComCall(3, this, "ptr", outputStream, "uint", bundleVersion, "ptr", bundleWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IAppxBundleReader>} bundleReader 
     * @returns {HRESULT} 
     */
    CreateBundleReader(inputStream, bundleReader) {
        result := ComCall(4, this, "ptr", inputStream, "ptr", bundleReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IAppxBundleManifestReader>} manifestReader 
     * @returns {HRESULT} 
     */
    CreateBundleManifestReader(inputStream, manifestReader) {
        result := ComCall(5, this, "ptr", inputStream, "ptr", manifestReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
