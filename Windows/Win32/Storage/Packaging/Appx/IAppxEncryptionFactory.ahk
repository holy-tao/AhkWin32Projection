#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for encrypting, decrypting, reading, and writing packages and bundles.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptionfactory
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptionFactory extends IUnknown{
    /**
     * The interface identifier for IAppxEncryptionFactory
     * @type {Guid}
     */
    static IID => Guid("{80e8e04d-8c88-44ae-a011-7cadf6fb2e72}")

    /**
     * The class identifier for AppxEncryptionFactory
     * @type {Guid}
     */
    static CLSID => Guid("{dc664fdd-d868-46ee-8780-8d196cb739f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IStream>} outputStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @returns {HRESULT} 
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IStream>} outputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @returns {HRESULT} 
     */
    DecryptPackage(inputStream, outputStream, keyInfo) {
        result := ComCall(4, this, "ptr", inputStream, "ptr", outputStream, "ptr", keyInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} outputStream 
     * @param {Pointer<IStream>} manifestStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @param {Pointer<IAppxEncryptedPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, settings, keyInfo, exemptedFiles, packageWriter) {
        result := ComCall(5, this, "ptr", outputStream, "ptr", manifestStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr", packageWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<IAppxPackageReader>} packageReader 
     * @returns {HRESULT} 
     */
    CreateEncryptedPackageReader(inputStream, keyInfo, packageReader) {
        result := ComCall(6, this, "ptr", inputStream, "ptr", keyInfo, "ptr", packageReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IStream>} outputStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @returns {HRESULT} 
     */
    EncryptBundle(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(7, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IStream>} outputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @returns {HRESULT} 
     */
    DecryptBundle(inputStream, outputStream, keyInfo) {
        result := ComCall(8, this, "ptr", inputStream, "ptr", outputStream, "ptr", keyInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} outputStream 
     * @param {Integer} bundleVersion 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @param {Pointer<IAppxEncryptedBundleWriter>} bundleWriter 
     * @returns {HRESULT} 
     */
    CreateEncryptedBundleWriter(outputStream, bundleVersion, settings, keyInfo, exemptedFiles, bundleWriter) {
        result := ComCall(9, this, "ptr", outputStream, "uint", bundleVersion, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr", bundleWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<IAppxBundleReader>} bundleReader 
     * @returns {HRESULT} 
     */
    CreateEncryptedBundleReader(inputStream, keyInfo, bundleReader) {
        result := ComCall(10, this, "ptr", inputStream, "ptr", keyInfo, "ptr", bundleReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
