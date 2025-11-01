#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartBase.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartThumbnail extends IPartBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPartThumbnail
     * @type {Guid}
     */
    static IID => Guid("{027ed1c9-ba39-4cc5-aa55-7ec3a0de171a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThumbnailProperties", "SetThumbnailContent"]

    /**
     * 
     * @param {Pointer<BSTR>} pContentType 
     * @returns {HRESULT} 
     */
    GetThumbnailProperties(pContentType) {
        result := ComCall(7, this, "ptr", pContentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pContentType 
     * @returns {HRESULT} 
     */
    SetThumbnailContent(pContentType) {
        pContentType := pContentType is String ? StrPtr(pContentType) : pContentType

        result := ComCall(8, this, "ptr", pContentType, "HRESULT")
        return result
    }
}
