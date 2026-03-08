#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFContentDecryptionModule.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a media key system.
 * @remarks
 * **IMFContentDecryptionModuleAccess** is based on the Encrypted Media Extension specification's [MediaKeySystemAccess](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#mediakeysystemaccess-interface).
 * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess
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
     * The IMFContentDecryptionModuleAccess::CreateContentDecryptionModule function creates a IMFContentDecryptionModule that represents a Content Decryption Module (CDM) for a DRM key system.
     * @remarks
     * The following properties are supported for the *contentDecryptionModuleProperties* parameter.
     * 
     * | Property                                      |Description
     * |-----------------------------------------------|---------------------------------------------------------------|
     * | [MF_CONTENTDECRYPTIONMODULE_INPRIVATESTOREPATH](/windows/win32/medfound/mf-contentdecryptionmodule-inprivatestorepath) | A file path representing a storage location the Content Decryption Module (CDM) can use for content-specific data.|
     * | [MF_CONTENTDECRYPTIONMODULE_STOREPATH](/windows/win32/medfound/mf-contentdecryptionmodule-storepath) | A file path representing a storage location the Content Decryption Module (CDM) can use for initialization. The path specified with this property will also be used for content-specific data if the **MF_CONTENTDECRYPTIONMODULE_INPRIVATESTOREPATH** property isn't set. |
     * @param {IPropertyStore} contentDecryptionModuleProperties An [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) object containing the properties for the CDM.
     * @returns {IMFContentDecryptionModule} Receives the created **IMFContentDecryptionModule** object.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess-createcontentdecryptionmodule
     */
    CreateContentDecryptionModule(contentDecryptionModuleProperties) {
        result := ComCall(3, this, "ptr", contentDecryptionModuleProperties, "ptr*", &contentDecryptionModule := 0, "HRESULT")
        return IMFContentDecryptionModule(contentDecryptionModule)
    }

    /**
     * Returns the supported combination of configuration options.
     * @remarks
     * **GetConfiguration** is based on the Encrypted Media Extension specification's [MediaKeySystemAccess.keySystem](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeysystemaccess-getconfiguration).
     * @returns {IPropertyStore} Receives a reference to an [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) object containing the configuration options for the CDM.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess-getconfiguration
     */
    GetConfiguration() {
        result := ComCall(4, this, "ptr*", &configuration := 0, "HRESULT")
        return IPropertyStore(configuration)
    }

    /**
     * Gets a string identifying the Key System being used by the Content Decryption Module (CDM).
     * @remarks
     * The *keySystem* memory must be allocated and freed using [CoTaskMem](../combaseapi/nf-combaseapi-cotaskmemalloc.md).
     * 
     * **GetKeySystem** is based on the Encrypted Media Extension specification's [MediaKeySystemAccess.getConfiguration](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeysystemaccess-keysystem).
     * @returns {PWSTR} Receives a pointer to an **LPWSTR** identifying the Key System.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess-getkeysystem
     */
    GetKeySystem() {
        result := ComCall(5, this, "ptr*", &keySystem := 0, "HRESULT")
        return keySystem
    }
}
