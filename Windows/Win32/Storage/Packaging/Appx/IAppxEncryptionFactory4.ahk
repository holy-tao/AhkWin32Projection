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
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {Pointer<IStream>} outputStream 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles 
     * @param {Integer} memoryLimit 
     * @returns {HRESULT} 
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles, memoryLimit) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, "ptr", settings, "ptr", keyInfo, "ptr", exemptedFiles, "uint", memoryLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
