#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for accessing thesaurus information.
 * @remarks
 * 
  * A thesaurus file contains a word and a list of words to substitute when querying. It is specific to a catalog and can be defined in more than one file.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchlanguagesupport
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchLanguageSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchLanguageSupport
     * @type {Guid}
     */
    static IID => Guid("{24c3cbaa-ebc1-491a-9ef1-9f6d8deb1b8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDiacriticSensitivity", "GetDiacriticSensitivity", "LoadWordBreaker", "LoadStemmer", "IsPrefixNormalized"]

    /**
     * 
     * @param {BOOL} fDiacriticSensitive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchlanguagesupport-setdiacriticsensitivity
     */
    SetDiacriticSensitivity(fDiacriticSensitive) {
        result := ComCall(3, this, "int", fDiacriticSensitive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfDiacriticSensitive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchlanguagesupport-getdiacriticsensitivity
     */
    GetDiacriticSensitivity(pfDiacriticSensitive) {
        result := ComCall(4, this, "ptr", pfDiacriticSensitive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppWordBreaker 
     * @param {Pointer<Integer>} pLcidUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchlanguagesupport-loadwordbreaker
     */
    LoadWordBreaker(lcid, riid, ppWordBreaker, pLcidUsed) {
        ppWordBreakerMarshal := ppWordBreaker is VarRef ? "ptr*" : "ptr"
        pLcidUsedMarshal := pLcidUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", lcid, "ptr", riid, ppWordBreakerMarshal, ppWordBreaker, pLcidUsedMarshal, pLcidUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppStemmer 
     * @param {Pointer<Integer>} pLcidUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchlanguagesupport-loadstemmer
     */
    LoadStemmer(lcid, riid, ppStemmer, pLcidUsed) {
        ppStemmerMarshal := ppStemmer is VarRef ? "ptr*" : "ptr"
        pLcidUsedMarshal := pLcidUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", lcid, "ptr", riid, ppStemmerMarshal, ppStemmer, pLcidUsedMarshal, pLcidUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsQueryToken 
     * @param {Integer} cwcQueryToken 
     * @param {PWSTR} pwcsDocumentToken 
     * @param {Integer} cwcDocumentToken 
     * @param {Pointer<Integer>} pulPrefixLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchlanguagesupport-isprefixnormalized
     */
    IsPrefixNormalized(pwcsQueryToken, cwcQueryToken, pwcsDocumentToken, cwcDocumentToken, pulPrefixLength) {
        pwcsQueryToken := pwcsQueryToken is String ? StrPtr(pwcsQueryToken) : pwcsQueryToken
        pwcsDocumentToken := pwcsDocumentToken is String ? StrPtr(pwcsDocumentToken) : pwcsDocumentToken

        pulPrefixLengthMarshal := pulPrefixLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pwcsQueryToken, "uint", cwcQueryToken, "ptr", pwcsDocumentToken, "uint", cwcDocumentToken, pulPrefixLengthMarshal, pulPrefixLength, "HRESULT")
        return result
    }
}
