#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for encrypting, decrypting, reading, and writing Windows app packages and bundles.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptionfactory2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptionFactory2 extends IUnknown{
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
     * 
     * @param {Pointer<IStream>} outputStream 
     * @param {Pointer<IStream>} manifestStream 
     * @param {Pointer<IStream>} contentGroupMapStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @param {Pointer<IAppxEncryptedPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, contentGroupMapStream, settings, keyInfo, exemptedFiles, packageWriter) {
        result := ComCall(3, this, "ptr", outputStream, "ptr", manifestStream, "ptr", contentGroupMapStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "ptr", packageWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
