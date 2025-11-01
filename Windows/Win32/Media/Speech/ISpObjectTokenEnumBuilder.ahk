#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSpObjectTokens.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpObjectTokenEnumBuilder extends IEnumSpObjectTokens{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpObjectTokenEnumBuilder
     * @type {Guid}
     */
    static IID => Guid("{06b64f9f-7fda-11d2-b4f2-00c04f797396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAttribs", "AddTokens", "AddTokensFromDataKey", "AddTokensFromTokenEnum", "Sort"]

    /**
     * 
     * @param {PWSTR} pszReqAttribs 
     * @param {PWSTR} pszOptAttribs 
     * @returns {HRESULT} 
     */
    SetAttribs(pszReqAttribs, pszOptAttribs) {
        pszReqAttribs := pszReqAttribs is String ? StrPtr(pszReqAttribs) : pszReqAttribs
        pszOptAttribs := pszOptAttribs is String ? StrPtr(pszOptAttribs) : pszOptAttribs

        result := ComCall(9, this, "ptr", pszReqAttribs, "ptr", pszOptAttribs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cTokens 
     * @param {Pointer<ISpObjectToken>} pToken 
     * @returns {HRESULT} 
     */
    AddTokens(cTokens, pToken) {
        result := ComCall(10, this, "uint", cTokens, "ptr*", pToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpDataKey} pDataKey 
     * @param {PWSTR} pszSubKey 
     * @param {PWSTR} pszCategoryId 
     * @returns {HRESULT} 
     */
    AddTokensFromDataKey(pDataKey, pszSubKey, pszCategoryId) {
        pszSubKey := pszSubKey is String ? StrPtr(pszSubKey) : pszSubKey
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId

        result := ComCall(11, this, "ptr", pDataKey, "ptr", pszSubKey, "ptr", pszCategoryId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IEnumSpObjectTokens} pTokenEnum 
     * @returns {HRESULT} 
     */
    AddTokensFromTokenEnum(pTokenEnum) {
        result := ComCall(12, this, "ptr", pTokenEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTokenIdToListFirst 
     * @returns {HRESULT} 
     */
    Sort(pszTokenIdToListFirst) {
        pszTokenIdToListFirst := pszTokenIdToListFirst is String ? StrPtr(pszTokenIdToListFirst) : pszTokenIdToListFirst

        result := ComCall(13, this, "ptr", pszTokenIdToListFirst, "HRESULT")
        return result
    }
}
