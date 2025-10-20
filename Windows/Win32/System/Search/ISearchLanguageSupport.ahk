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
     * 
     * @param {BOOL} fDiacriticSensitive 
     * @returns {HRESULT} 
     */
    SetDiacriticSensitivity(fDiacriticSensitive) {
        result := ComCall(3, this, "int", fDiacriticSensitive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfDiacriticSensitive 
     * @returns {HRESULT} 
     */
    GetDiacriticSensitivity(pfDiacriticSensitive) {
        result := ComCall(4, this, "ptr", pfDiacriticSensitive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppWordBreaker 
     * @param {Pointer<UInt32>} pLcidUsed 
     * @returns {HRESULT} 
     */
    LoadWordBreaker(lcid, riid, ppWordBreaker, pLcidUsed) {
        result := ComCall(5, this, "uint", lcid, "ptr", riid, "ptr", ppWordBreaker, "uint*", pLcidUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppStemmer 
     * @param {Pointer<UInt32>} pLcidUsed 
     * @returns {HRESULT} 
     */
    LoadStemmer(lcid, riid, ppStemmer, pLcidUsed) {
        result := ComCall(6, this, "uint", lcid, "ptr", riid, "ptr", ppStemmer, "uint*", pLcidUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsQueryToken 
     * @param {Integer} cwcQueryToken 
     * @param {PWSTR} pwcsDocumentToken 
     * @param {Integer} cwcDocumentToken 
     * @param {Pointer<UInt32>} pulPrefixLength 
     * @returns {HRESULT} 
     */
    IsPrefixNormalized(pwcsQueryToken, cwcQueryToken, pwcsDocumentToken, cwcDocumentToken, pulPrefixLength) {
        pwcsQueryToken := pwcsQueryToken is String ? StrPtr(pwcsQueryToken) : pwcsQueryToken
        pwcsDocumentToken := pwcsDocumentToken is String ? StrPtr(pwcsDocumentToken) : pwcsDocumentToken

        result := ComCall(7, this, "ptr", pwcsQueryToken, "uint", cwcQueryToken, "ptr", pwcsDocumentToken, "uint", cwcDocumentToken, "uint*", pulPrefixLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
