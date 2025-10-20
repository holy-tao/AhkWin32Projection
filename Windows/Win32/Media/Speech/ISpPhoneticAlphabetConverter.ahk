#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhoneticAlphabetConverter extends IUnknown{
    /**
     * The interface identifier for ISpPhoneticAlphabetConverter
     * @type {Guid}
     */
    static IID => Guid("{133adcd4-19b4-4020-9fdc-842e78253b17}")

    /**
     * The class identifier for SpPhoneticAlphabetConverter
     * @type {Guid}
     */
    static CLSID => Guid("{4f414126-dfe3-4629-99ee-797978317ead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt16>} pLangID 
     * @returns {HRESULT} 
     */
    GetLangId(pLangID) {
        result := ComCall(3, this, "ushort*", pLangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LangID 
     * @returns {HRESULT} 
     */
    SetLangId(LangID) {
        result := ComCall(4, this, "ushort", LangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pszSAPIId 
     * @param {Pointer<UInt16>} pszUPSId 
     * @param {Integer} cMaxLength 
     * @returns {HRESULT} 
     */
    SAPI2UPS(pszSAPIId, pszUPSId, cMaxLength) {
        result := ComCall(5, this, "ushort*", pszSAPIId, "ushort*", pszUPSId, "uint", cMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pszUPSId 
     * @param {Pointer<UInt16>} pszSAPIId 
     * @param {Integer} cMaxLength 
     * @returns {HRESULT} 
     */
    UPS2SAPI(pszUPSId, pszSAPIId, cMaxLength) {
        result := ComCall(6, this, "ushort*", pszUPSId, "ushort*", pszSAPIId, "uint", cMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cSrcLength 
     * @param {BOOL} bSAPI2UPS 
     * @param {Pointer<UInt32>} pcMaxDestLength 
     * @returns {HRESULT} 
     */
    GetMaxConvertLength(cSrcLength, bSAPI2UPS, pcMaxDestLength) {
        result := ComCall(7, this, "uint", cSrcLength, "int", bSAPI2UPS, "uint*", pcMaxDestLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
