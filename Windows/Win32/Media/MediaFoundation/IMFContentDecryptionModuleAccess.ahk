#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import ".\IMFContentDecryptionModule.ahk" { IMFContentDecryptionModule }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a media key system.
 * @remarks
 * **IMFContentDecryptionModuleAccess** is based on the Encrypted Media Extension specification's [MediaKeySystemAccess](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#mediakeysystemaccess-interface).
 * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFContentDecryptionModuleAccess extends IUnknown {
    /**
     * The interface identifier for IMFContentDecryptionModuleAccess
     * @type {Guid}
     */
    static IID := Guid("{a853d1f4-e2a0-4303-9edc-f1a68ee43136}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFContentDecryptionModuleAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateContentDecryptionModule : IntPtr
        GetConfiguration              : IntPtr
        GetKeySystem                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFContentDecryptionModuleAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(5, this, PWSTR.Ptr, &keySystem := 0, "HRESULT")
        return keySystem
    }

    Query(iid) {
        if (IMFContentDecryptionModuleAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateContentDecryptionModule := CallbackCreate(GetMethod(implObj, "CreateContentDecryptionModule"), flags, 3)
        this.vtbl.GetConfiguration := CallbackCreate(GetMethod(implObj, "GetConfiguration"), flags, 2)
        this.vtbl.GetKeySystem := CallbackCreate(GetMethod(implObj, "GetKeySystem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateContentDecryptionModule)
        CallbackFree(this.vtbl.GetConfiguration)
        CallbackFree(this.vtbl.GetKeySystem)
    }
}
