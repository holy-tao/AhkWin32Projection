#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartBase.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartFont extends IPartBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPartFont
     * @type {Guid}
     */
    static IID => Guid("{e07fe0ab-1124-43d0-a865-e8ffb6a3ea82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontProperties", "SetFontContent", "SetFontOptions"]

    /**
     * 
     * @param {Pointer<BSTR>} pContentType 
     * @param {Pointer<Integer>} pFontOptions 
     * @returns {HRESULT} 
     */
    GetFontProperties(pContentType, pFontOptions) {
        pFontOptionsMarshal := pFontOptions is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pContentType, pFontOptionsMarshal, pFontOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pContentType 
     * @returns {HRESULT} 
     */
    SetFontContent(pContentType) {
        pContentType := pContentType is String ? StrPtr(pContentType) : pContentType

        result := ComCall(8, this, "ptr", pContentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    SetFontOptions(options) {
        result := ComCall(9, this, "int", options, "HRESULT")
        return result
    }
}
