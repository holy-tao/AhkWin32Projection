#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFContentDecryptionModule.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateContentDecryptionModule", "GetConfiguration", "GetKeySystem"]

    /**
     * 
     * @param {IPropertyStore} contentDecryptionModuleProperties 
     * @returns {IMFContentDecryptionModule} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess-createcontentdecryptionmodule
     */
    CreateContentDecryptionModule(contentDecryptionModuleProperties) {
        result := ComCall(3, this, "ptr", contentDecryptionModuleProperties, "ptr*", &contentDecryptionModule := 0, "HRESULT")
        return IMFContentDecryptionModule(contentDecryptionModule)
    }

    /**
     * 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess-getconfiguration
     */
    GetConfiguration() {
        result := ComCall(4, this, "ptr*", &configuration := 0, "HRESULT")
        return IPropertyStore(configuration)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess-getkeysystem
     */
    GetKeySystem() {
        result := ComCall(5, this, "ptr*", &keySystem := 0, "HRESULT")
        return keySystem
    }
}
