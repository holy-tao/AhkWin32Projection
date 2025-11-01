#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A factory interface for creating IMFContentDecryptionModuleAccess objects.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulefactory
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
     * 
     * @param {PWSTR} keySystem 
     * @param {PWSTR} contentType 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulefactory-istypesupported
     */
    IsTypeSupported(keySystem, contentType) {
        keySystem := keySystem is String ? StrPtr(keySystem) : keySystem
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(3, this, "ptr", keySystem, "ptr", contentType, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} keySystem 
     * @param {Pointer<IPropertyStore>} configurations 
     * @param {Integer} numConfigurations 
     * @param {Pointer<IMFContentDecryptionModuleAccess>} contentDecryptionModuleAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulefactory-createcontentdecryptionmoduleaccess
     */
    CreateContentDecryptionModuleAccess(keySystem, configurations, numConfigurations, contentDecryptionModuleAccess) {
        keySystem := keySystem is String ? StrPtr(keySystem) : keySystem

        result := ComCall(4, this, "ptr", keySystem, "ptr*", configurations, "uint", numConfigurations, "ptr*", contentDecryptionModuleAccess, "HRESULT")
        return result
    }
}
