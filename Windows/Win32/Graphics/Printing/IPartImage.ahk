#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPartBase.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartImage extends IPartBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPartImage
     * @type {Guid}
     */
    static IID => Guid("{725f2e3c-401a-4705-9de0-fe6f1353b87f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImageProperties", "SetImageContent"]

    /**
     * 
     * @returns {BSTR} 
     */
    GetImageProperties() {
        pContentType := BSTR()
        result := ComCall(7, this, "ptr", pContentType, "HRESULT")
        return pContentType
    }

    /**
     * 
     * @param {PWSTR} pContentType 
     * @returns {HRESULT} 
     */
    SetImageContent(pContentType) {
        pContentType := pContentType is String ? StrPtr(pContentType) : pContentType

        result := ComCall(8, this, "ptr", pContentType, "HRESULT")
        return result
    }
}
