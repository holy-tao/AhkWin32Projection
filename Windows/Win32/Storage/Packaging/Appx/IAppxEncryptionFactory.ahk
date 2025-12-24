#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxEncryptedPackageWriter.ahk
#Include .\IAppxPackageReader.ahk
#Include .\IAppxEncryptedBundleWriter.ahk
#Include .\IAppxBundleReader.ahk
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
     * Creates an encrypted Windows app package from an unencrypted one.
     * @param {IStream} inputStream A readable stream from the app package to be encrypted.
     * @param {IStream} outputStream A writeable stream for writing the resulting encrypted app package.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key information containing the base encryption key and key ID. The base key is used to derive the per file encryption keys. If the base key is null, the global test key and key Id are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles The list of files to be exempted from encryption.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory-encryptpackage
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "HRESULT")
        return result
    }

    /**
     * Creates an unencrypted Windows app package from an encrypted one.
     * @param {IStream} inputStream A readable stream from the app package to be decrypted.
     * @param {IStream} outputStream A writeable stream for writing the resulting decrypted app package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory-decryptpackage
     */
    DecryptPackage(inputStream, outputStream, keyInfo) {
        result := ComCall(4, this, "ptr", inputStream, "ptr", outputStream, "ptr", keyInfo, "HRESULT")
        return result
    }

    /**
     * Creates a new instance of an IAppxEncryptedPackageWriter.
     * @param {IStream} outputStream A writeable stream for sending bytes produced by the app package.
     * @param {IStream} manifestStream A readable stream that defines the package for the  AppxManifest.xml.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles The list of files to be exempted from encryption.
     * @returns {IAppxEncryptedPackageWriter} The package writer object created.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedpackagewriter
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(5, this, "ptr", outputStream, "ptr", manifestStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr*", &packageWriter := 0, "HRESULT")
        return IAppxEncryptedPackageWriter(packageWriter)
    }

    /**
     * Creates a new instance of IAppxEncryptedPackageReader.
     * @param {IStream} inputStream A readable stream from the app package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @returns {IAppxPackageReader} The package reader object created.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedpackagereader
     */
    CreateEncryptedPackageReader(inputStream, keyInfo) {
        result := ComCall(6, this, "ptr", inputStream, "ptr", keyInfo, "ptr*", &packageReader := 0, "HRESULT")
        return IAppxPackageReader(packageReader)
    }

    /**
     * Creates an encrypted Windows app bundle from an unencrypted one.
     * @param {IStream} inputStream A readable stream from the app bundle to encrypt.
     * @param {IStream} outputStream A writeable stream for writing the resulting encrypted app bundle.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the bundle. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles The list of files to be exempted from encryption.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory-encryptbundle
     */
    EncryptBundle(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(7, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "HRESULT")
        return result
    }

    /**
     * Creates an unencrypted Windows app bundle from an encrypted one.
     * @param {IStream} inputStream A readable stream from the app bundle to be decrypted.
     * @param {IStream} outputStream A writeable stream for writing the resulting decrypted app bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the bundle. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory-decryptbundle
     */
    DecryptBundle(inputStream, outputStream, keyInfo) {
        result := ComCall(8, this, "ptr", inputStream, "ptr", outputStream, "ptr", keyInfo, "HRESULT")
        return result
    }

    /**
     * Creates a write-only bundle object to which encrypted Windows app packages can be added.
     * @param {IStream} outputStream A writeable stream for writing the resulting encrypted app bundle.
     * @param {Integer} bundleVersion The version number of the bundle. If the bundle version is 0, a default version based on the current system time will be generated.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the bundle. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles The list of files to be exempted from encryption.
     * @returns {IAppxEncryptedBundleWriter} The bundle writer object created.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedbundlewriter
     */
    CreateEncryptedBundleWriter(outputStream, bundleVersion, settings, keyInfo, exemptedFiles) {
        result := ComCall(9, this, "ptr", outputStream, "uint", bundleVersion, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr*", &bundleWriter := 0, "HRESULT")
        return IAppxEncryptedBundleWriter(bundleWriter)
    }

    /**
     * Creates a read-only bundle object to which encrypted Windows app packages can be added.
     * @param {IStream} inputStream A stream for reading the encrypted bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the bundle. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @returns {IAppxBundleReader} The bundle reader object created.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedbundlereader
     */
    CreateEncryptedBundleReader(inputStream, keyInfo) {
        result := ComCall(10, this, "ptr", inputStream, "ptr", keyInfo, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }
}
