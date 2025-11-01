#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhoneticAlphabetConverter extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLangId", "SetLangId", "SAPI2UPS", "UPS2SAPI", "GetMaxConvertLength"]

    /**
     * 
     * @param {Pointer<Integer>} pLangID 
     * @returns {HRESULT} 
     */
    GetLangId(pLangID) {
        pLangIDMarshal := pLangID is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, pLangIDMarshal, pLangID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LangID 
     * @returns {HRESULT} 
     */
    SetLangId(LangID) {
        result := ComCall(4, this, "ushort", LangID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pszSAPIId 
     * @param {Pointer<Integer>} pszUPSId 
     * @param {Integer} cMaxLength 
     * @returns {HRESULT} 
     */
    SAPI2UPS(pszSAPIId, pszUPSId, cMaxLength) {
        pszSAPIIdMarshal := pszSAPIId is VarRef ? "ushort*" : "ptr"
        pszUPSIdMarshal := pszUPSId is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pszSAPIIdMarshal, pszSAPIId, pszUPSIdMarshal, pszUPSId, "uint", cMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pszUPSId 
     * @param {Pointer<Integer>} pszSAPIId 
     * @param {Integer} cMaxLength 
     * @returns {HRESULT} 
     */
    UPS2SAPI(pszUPSId, pszSAPIId, cMaxLength) {
        pszUPSIdMarshal := pszUPSId is VarRef ? "ushort*" : "ptr"
        pszSAPIIdMarshal := pszSAPIId is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pszUPSIdMarshal, pszUPSId, pszSAPIIdMarshal, pszSAPIId, "uint", cMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cSrcLength 
     * @param {BOOL} bSAPI2UPS 
     * @param {Pointer<Integer>} pcMaxDestLength 
     * @returns {HRESULT} 
     */
    GetMaxConvertLength(cSrcLength, bSAPI2UPS, pcMaxDestLength) {
        pcMaxDestLengthMarshal := pcMaxDestLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", cSrcLength, "int", bSAPI2UPS, pcMaxDestLengthMarshal, pcMaxDestLength, "HRESULT")
        return result
    }
}
