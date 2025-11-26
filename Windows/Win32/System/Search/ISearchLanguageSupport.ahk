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
     * Sets a value that indicates whether an implemented ISearchLanguageSupport interface is sensitive to diacritics. A diacritic is an accent mark added to a letter to indicate a special phonetic value or pronunciation.
     * @param {BOOL} fDiacriticSensitive Type: <b>BOOL</b>
     * 
     * A Boolean value that indicates whether the interface is sensitive to diacritics. The default setting is <b>FALSE</b>, indicating that the interface ignores diacritical characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchlanguagesupport-setdiacriticsensitivity
     */
    SetDiacriticSensitivity(fDiacriticSensitive) {
        result := ComCall(3, this, "int", fDiacriticSensitive, "HRESULT")
        return result
    }

    /**
     * Gets the sensitivity of an implemented ISearchLanguageSupport interface to diacritics. A diacritic is an accent mark added to a letter to indicate a special phonetic value or pronunciation.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, contains a pointer to the sensitivity setting. <b>FALSE</b> indicates that the interface ignores diacritics; <b>TRUE</b> indicates the interface recognizes diacritics.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchlanguagesupport-getdiacriticsensitivity
     */
    GetDiacriticSensitivity() {
        result := ComCall(4, this, "int*", &pfDiacriticSensitive := 0, "HRESULT")
        return pfDiacriticSensitive
    }

    /**
     * Retrieves an interface to the word breaker registered for the specified language code identifier (LCID).
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * The LCID requested.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the interface to be queried.
     * @param {Pointer<Pointer<Void>>} ppWordBreaker Type: <b>void**</b>
     * 
     * On return, contains the address of a pointer to the interface of the LCID contained in <i>pLcidUsed</i>.
     * @param {Pointer<Integer>} pLcidUsed Type: <b>LCID*</b>
     * 
     * On return, contains a pointer to the actual LCID used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchlanguagesupport-loadwordbreaker
     */
    LoadWordBreaker(lcid, riid, ppWordBreaker, pLcidUsed) {
        ppWordBreakerMarshal := ppWordBreaker is VarRef ? "ptr*" : "ptr"
        pLcidUsedMarshal := pLcidUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", lcid, "ptr", riid, ppWordBreakerMarshal, ppWordBreaker, pLcidUsedMarshal, pLcidUsed, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface to the word stemmer registered for the specified language code identifier (LCID).
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * The LCID requested.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the interface to be queried.
     * @param {Pointer<Pointer<Void>>} ppStemmer Type: <b>void**</b>
     * 
     * On return, contains the address of a pointer to the interface of the LCID contained in <i>pLcidUsed</i>.
     * @param {Pointer<Integer>} pLcidUsed Type: <b>LCID*</b>
     * 
     * On return, contains a pointer to the actual LCID used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchlanguagesupport-loadstemmer
     */
    LoadStemmer(lcid, riid, ppStemmer, pLcidUsed) {
        ppStemmerMarshal := ppStemmer is VarRef ? "ptr*" : "ptr"
        pLcidUsedMarshal := pLcidUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", lcid, "ptr", riid, ppStemmerMarshal, ppStemmer, pLcidUsedMarshal, pLcidUsed, "HRESULT")
        return result
    }

    /**
     * Determines whether the query token is a prefix of the document token, disregarding case, width, and (optionally) diacritics.
     * @param {PWSTR} pwcsQueryToken Type: <b>LPCWSTR</b>
     * 
     * Pointer to the prefix to search for.
     * @param {Integer} cwcQueryToken Type: <b>ULONG</b>
     * 
     * The size of <i>pwcsQueryToken</i>.
     * @param {PWSTR} pwcsDocumentToken Type: <b>LPCWSTR</b>
     * 
     * Pointer to the document to be searched.
     * @param {Integer} cwcDocumentToken Type: <b>ULONG</b>
     * 
     * The size of <i>pwcsDocumentToken</i>.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Returns a pointer to the number of characters matched in <i>pwcsDocumentToken</i>. Typically, but not necessarily, the number of characters in <i>pwcsQueryToken</i>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchlanguagesupport-isprefixnormalized
     */
    IsPrefixNormalized(pwcsQueryToken, cwcQueryToken, pwcsDocumentToken, cwcDocumentToken) {
        pwcsQueryToken := pwcsQueryToken is String ? StrPtr(pwcsQueryToken) : pwcsQueryToken
        pwcsDocumentToken := pwcsDocumentToken is String ? StrPtr(pwcsDocumentToken) : pwcsDocumentToken

        result := ComCall(7, this, "ptr", pwcsQueryToken, "uint", cwcQueryToken, "ptr", pwcsDocumentToken, "uint", cwcDocumentToken, "uint*", &pulPrefixLength := 0, "HRESULT")
        return pulPrefixLength
    }
}
