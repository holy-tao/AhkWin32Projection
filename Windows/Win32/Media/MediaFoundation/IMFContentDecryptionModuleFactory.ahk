#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFContentDecryptionModuleAccess.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A factory interface for creating IMFContentDecryptionModuleAccess objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulefactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentDecryptionModuleFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFContentDecryptionModuleFactory
     * @type {Guid}
     */
    static IID => Guid("{7d5abf16-4cbb-4e08-b977-9ba59049943e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsTypeSupported", "CreateContentDecryptionModuleAccess"]

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

        result := ComCall(3, this, "ptr", keySystem, "ptr", contentType, "int")
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

        result := ComCall(4, this, "ptr", keySystem, "ptr*", configurations, "uint", numConfigurations, "ptr*", &contentDecryptionModuleAccess := 0, "HRESULT")
        return IMFContentDecryptionModuleAccess(contentDecryptionModuleAccess)
    }
}
