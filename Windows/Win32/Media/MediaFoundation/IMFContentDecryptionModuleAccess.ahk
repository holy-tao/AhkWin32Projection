#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a media key system.
 * @remarks
 * 
  * **IMFContentDecryptionModuleAccess** is based on the Encrypted Media Extension specification's [MediaKeySystemAccess](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#mediakeysystemaccess-interface).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentDecryptionModuleAccess extends IUnknown{
    /**
     * The interface identifier for IMFContentDecryptionModuleAccess
     * @type {Guid}
     */
    static IID => Guid("{a853d1f4-e2a0-4303-9edc-f1a68ee43136}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPropertyStore>} contentDecryptionModuleProperties 
     * @param {Pointer<IMFContentDecryptionModule>} contentDecryptionModule 
     * @returns {HRESULT} 
     */
    CreateContentDecryptionModule(contentDecryptionModuleProperties, contentDecryptionModule) {
        result := ComCall(3, this, "ptr", contentDecryptionModuleProperties, "ptr", contentDecryptionModule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} configuration 
     * @returns {HRESULT} 
     */
    GetConfiguration(configuration) {
        result := ComCall(4, this, "ptr", configuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} keySystem 
     * @returns {HRESULT} 
     */
    GetKeySystem(keySystem) {
        result := ComCall(5, this, "ptr", keySystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
