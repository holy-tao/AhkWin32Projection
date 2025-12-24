#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for encrypting Windows app packages and bundles.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptionfactory4
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptionFactory4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxEncryptionFactory4
     * @type {Guid}
     */
    static IID => Guid("{a879611f-12fd-41fe-85d5-06ae779bbaf5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EncryptPackage"]

    /**
     * Creates an encrypted Windows app package from an unencrypted one.
     * @param {IStream} inputStream A readable stream from the app bundle to encrypt.
     * @param {IStream} outputStream A writeable stream for writing the resulting encrypted app bundle.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings Settings for creating the bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the bundle. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles Files exempted from the package writer.
     * @param {Integer} memoryLimit The memory limit in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxencryptionfactory4-encryptpackage
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles, memoryLimit) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "uint", memoryLimit, "HRESULT")
        return result
    }
}
