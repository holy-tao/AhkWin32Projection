#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing app packages.
 * @remarks
 * 
  * The <b>IAppxFactory</b> interface provides factory methods to create readers and writers of app packages as well as methods to create readers for block maps and manifests outside of a package.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxfactory
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFactory extends IUnknown{
    /**
     * The interface identifier for IAppxFactory
     * @type {Guid}
     */
    static IID => Guid("{beb94909-e451-438b-b5a7-d79e767b75d8}")

    /**
     * The class identifier for AppxFactory
     * @type {Guid}
     */
    static CLSID => Guid("{5842a140-ff9f-4166-8f5c-62f5b7b0c781}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IStream>} outputStream 
     * @param {Pointer<APPX_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<IAppxPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     */
    CreatePackageWriter(outputStream, settings, packageWriter) {
        result := ComCall(3, this, "ptr", outputStream, "ptr", settings, "ptr", packageWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IAppxPackageReader>} packageReader 
     * @returns {HRESULT} 
     */
    CreatePackageReader(inputStream, packageReader) {
        result := ComCall(4, this, "ptr", inputStream, "ptr", packageReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IAppxManifestReader>} manifestReader 
     * @returns {HRESULT} 
     */
    CreateManifestReader(inputStream, manifestReader) {
        result := ComCall(5, this, "ptr", inputStream, "ptr", manifestReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IAppxBlockMapReader>} blockMapReader 
     * @returns {HRESULT} 
     */
    CreateBlockMapReader(inputStream, blockMapReader) {
        result := ComCall(6, this, "ptr", inputStream, "ptr", blockMapReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} blockMapStream 
     * @param {PWSTR} signatureFileName 
     * @param {Pointer<IAppxBlockMapReader>} blockMapReader 
     * @returns {HRESULT} 
     */
    CreateValidatedBlockMapReader(blockMapStream, signatureFileName, blockMapReader) {
        signatureFileName := signatureFileName is String ? StrPtr(signatureFileName) : signatureFileName

        result := ComCall(7, this, "ptr", blockMapStream, "ptr", signatureFileName, "ptr", blockMapReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
