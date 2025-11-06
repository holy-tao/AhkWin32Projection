#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxEncryptedPackageWriter.ahk
#Include .\IAppxEncryptedBundleWriter.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for encrypting, decrypting, reading, and writing Windows app packages and bundles.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptionfactory3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptionFactory3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxEncryptionFactory3
     * @type {Guid}
     */
    static IID => Guid("{09edca37-cd64-47d6-b7e8-1cb11d4f7e05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EncryptPackage", "CreateEncryptedPackageWriter", "EncryptBundle", "CreateEncryptedBundleWriter"]

    /**
     * 
     * @param {IStream} inputStream 
     * @param {IStream} outputStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory3-encryptpackage
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} outputStream 
     * @param {IStream} manifestStream 
     * @param {IStream} contentGroupMapStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @returns {IAppxEncryptedPackageWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory3-createencryptedpackagewriter
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, contentGroupMapStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(4, this, "ptr", outputStream, "ptr", manifestStream, "ptr", contentGroupMapStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr*", &packageWriter := 0, "HRESULT")
        return IAppxEncryptedPackageWriter(packageWriter)
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {IStream} outputStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory3-encryptbundle
     */
    EncryptBundle(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(5, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} outputStream 
     * @param {Integer} bundleVersion 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @returns {IAppxEncryptedBundleWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory3-createencryptedbundlewriter
     */
    CreateEncryptedBundleWriter(outputStream, bundleVersion, settings, keyInfo, exemptedFiles) {
        result := ComCall(6, this, "ptr", outputStream, "uint", bundleVersion, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr*", &bundleWriter := 0, "HRESULT")
        return IAppxEncryptedBundleWriter(bundleWriter)
    }
}
