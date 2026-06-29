#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFContentDecryptionModuleAccess.ahk" { IMFContentDecryptionModuleAccess }

/**
 * A factory interface for creating IMFContentDecryptionModuleAccess objects.
 * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulefactory
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFContentDecryptionModuleFactory extends IUnknown {
    /**
     * The interface identifier for IMFContentDecryptionModuleFactory
     * @type {Guid}
     */
    static IID := Guid("{7d5abf16-4cbb-4e08-b977-9ba59049943e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFContentDecryptionModuleFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsTypeSupported                     : IntPtr
        CreateContentDecryptionModuleAccess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFContentDecryptionModuleFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries whether the specified Key System and, optionally, content type are supported.
     * @remarks
     * For information about Key Systems, see the Encrypted Media Extension specification's [Key System](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#key-system)
     * @param {PWSTR} keySystem An **LPCWSTR** specifying the Key System for which support is being queried.
     * @param {PWSTR} contentType Optional. An **LPCWSTR** specifying the content type for which support is being queried.
     * @returns {BOOL} True if the specified Key System and content type are supported; otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulefactory-istypesupported
     */
    IsTypeSupported(keySystem, contentType) {
        keySystem := keySystem is String ? StrPtr(keySystem) : keySystem
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(3, this, "ptr", keySystem, "ptr", contentType, BOOL)
        return result
    }

    /**
     * Creates an instance of the IMFContentDecryptionModuleAccess interface.
     * @remarks
     * **IMFContentDecryptionModuleAccess** is based on the Encrypted Media Extension specification's [MediaKeySystemAccess.getConfiguration](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#mediakeysystemaccess-interface).
     * @param {PWSTR} keySystem An **LPWSTR** identifying the Key System for which the interface is created.
     * @param {Pointer<IPropertyStore>} configurations An [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) object containing the configuration options for the CDM.
     * @param {Integer} numConfigurations A **DWORD** specifying the number of properties in the *configurations* parameter.
     * @returns {IMFContentDecryptionModuleAccess} Receives the created **IMFContentDecryptionModuleAccess** object.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulefactory-createcontentdecryptionmoduleaccess
     */
    CreateContentDecryptionModuleAccess(keySystem, configurations, numConfigurations) {
        keySystem := keySystem is String ? StrPtr(keySystem) : keySystem

        result := ComCall(4, this, "ptr", keySystem, IPropertyStore.Ptr, configurations, "uint", numConfigurations, "ptr*", &contentDecryptionModuleAccess := 0, "HRESULT")
        return IMFContentDecryptionModuleAccess(contentDecryptionModuleAccess)
    }

    Query(iid) {
        if (IMFContentDecryptionModuleFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsTypeSupported := CallbackCreate(GetMethod(implObj, "IsTypeSupported"), flags, 3)
        this.vtbl.CreateContentDecryptionModuleAccess := CallbackCreate(GetMethod(implObj, "CreateContentDecryptionModuleAccess"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsTypeSupported)
        CallbackFree(this.vtbl.CreateContentDecryptionModuleAccess)
    }
}
