#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxEncryptedPackageWriter.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for encrypting, decrypting, reading, and writing Windows app packages and bundles.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptionfactory2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptionFactory2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxEncryptionFactory2
     * @type {Guid}
     */
    static IID => Guid("{c1b11eee-c4ba-4ab2-a55d-d015fe8ff64f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEncryptedPackageWriter"]

    /**
     * Creates a new instance of an IAppxEncryptedPackageWriter.
     * @param {IStream} outputStream A writeable stream for sending bytes produced by the app package.
     * @param {IStream} manifestStream A readable stream that defines the package for the  AppxManifest.xml.
     * @param {IStream} contentGroupMapStream A stream that defines the content group map.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles Files exempted from the package writer.
     * @returns {IAppxEncryptedPackageWriter} The package writer object created.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory2-createencryptedpackagewriter
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, contentGroupMapStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(3, this, "ptr", outputStream, "ptr", manifestStream, "ptr", contentGroupMapStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr*", &packageWriter := 0, "HRESULT")
        return IAppxEncryptedPackageWriter(packageWriter)
    }
}
