#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpCFGInterpreterSite extends IUnknown{
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
     * 
     * @param {Pointer<SPPHRASEREPLACEMENT>} pReplace 
     * @returns {HRESULT} 
     */
    AddTextReplacement(pReplace) {
        result := ComCall(3, this, "ptr", pReplace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPPHRASEPROPERTY>} pProperty 
     * @returns {HRESULT} 
     */
    AddProperty(pProperty) {
        result := ComCall(4, this, "ptr", pProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszResourceName 
     * @param {Pointer<PWSTR>} ppCoMemResource 
     * @returns {HRESULT} 
     */
    GetResourceValue(pszResourceName, ppCoMemResource) {
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName

        result := ComCall(5, this, "ptr", pszResourceName, "ptr", ppCoMemResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
