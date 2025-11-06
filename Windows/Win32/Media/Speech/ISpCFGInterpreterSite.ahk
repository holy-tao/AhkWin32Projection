#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpCFGInterpreterSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpCFGInterpreterSite
     * @type {Guid}
     */
    static IID => Guid("{6a6ffad8-78b6-473d-b844-98152e4fb16b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTextReplacement", "AddProperty", "GetResourceValue"]

    /**
     * 
     * @param {Pointer<SPPHRASEREPLACEMENT>} pReplace 
     * @returns {HRESULT} 
     */
    AddTextReplacement(pReplace) {
        result := ComCall(3, this, "ptr", pReplace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPPHRASEPROPERTY>} pProperty 
     * @returns {HRESULT} 
     */
    AddProperty(pProperty) {
        result := ComCall(4, this, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszResourceName 
     * @returns {PWSTR} 
     */
    GetResourceValue(pszResourceName) {
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName

        result := ComCall(5, this, "ptr", pszResourceName, "ptr*", &ppCoMemResource := 0, "HRESULT")
        return ppCoMemResource
    }
}
