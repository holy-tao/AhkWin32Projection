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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EncryptPackage", "DecryptPackage", "CreateEncryptedPackageWriter", "CreateEncryptedPackageReader", "EncryptBundle", "DecryptBundle", "CreateEncryptedBundleWriter", "CreateEncryptedBundleReader"]

    /**
     * 
     * @param {IStream} inputStream 
     * @param {IStream} outputStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-encryptpackage
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {IStream} outputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-decryptpackage
     */
    DecryptPackage(inputStream, outputStream, keyInfo) {
        result := ComCall(4, this, "ptr", inputStream, "ptr", outputStream, "ptr", keyInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} outputStream 
     * @param {IStream} manifestStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @param {Pointer<IAppxEncryptedPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedpackagewriter
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, settings, keyInfo, exemptedFiles, packageWriter) {
        result := ComCall(5, this, "ptr", outputStream, "ptr", manifestStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr*", packageWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<IAppxPackageReader>} packageReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedpackagereader
     */
    CreateEncryptedPackageReader(inputStream, keyInfo, packageReader) {
        result := ComCall(6, this, "ptr", inputStream, "ptr", keyInfo, "ptr*", packageReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {IStream} outputStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-encryptbundle
     */
    EncryptBundle(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(7, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {IStream} outputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-decryptbundle
     */
    DecryptBundle(inputStream, outputStream, keyInfo) {
        result := ComCall(8, this, "ptr", inputStream, "ptr", outputStream, "ptr", keyInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} outputStream 
     * @param {Integer} bundleVersion 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @param {Pointer<IAppxEncryptedBundleWriter>} bundleWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedbundlewriter
     */
    CreateEncryptedBundleWriter(outputStream, bundleVersion, settings, keyInfo, exemptedFiles, bundleWriter) {
        result := ComCall(9, this, "ptr", outputStream, "uint", bundleVersion, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr*", bundleWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<IAppxBundleReader>} bundleReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedbundlereader
     */
    CreateEncryptedBundleReader(inputStream, keyInfo, bundleReader) {
        result := ComCall(10, this, "ptr", inputStream, "ptr", keyInfo, "ptr*", bundleReader, "HRESULT")
        return result
    }
}
