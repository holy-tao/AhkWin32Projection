#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpLexicon extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpLexicon
     * @type {Guid}
     */
    static IID => Guid("{da41a7c2-5383-4db2-916b-6c1719e3db58}")

    /**
     * The class identifier for SpLexicon
     * @type {Guid}
     */
    static CLSID => Guid("{0655e396-25d0-11d3-9c26-00c04f8ef87c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPronunciations", "AddPronunciation", "RemovePronunciation", "GetGeneration", "GetGenerationChange", "GetWords"]

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Integer} LangID 
     * @param {Integer} dwFlags 
     * @param {Pointer<SPWORDPRONUNCIATIONLIST>} pWordPronunciationList 
     * @returns {HRESULT} 
     */
    GetPronunciations(pszWord, LangID, dwFlags, pWordPronunciationList) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        result := ComCall(3, this, "ptr", pszWord, "ushort", LangID, "uint", dwFlags, "ptr", pWordPronunciationList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Integer} LangID 
     * @param {Integer} ePartOfSpeech 
     * @param {Pointer<Integer>} pszPronunciation 
     * @returns {HRESULT} 
     */
    AddPronunciation(pszWord, LangID, ePartOfSpeech, pszPronunciation) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        result := ComCall(4, this, "ptr", pszWord, "ushort", LangID, "int", ePartOfSpeech, "ushort*", pszPronunciation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Integer} LangID 
     * @param {Integer} ePartOfSpeech 
     * @param {Pointer<Integer>} pszPronunciation 
     * @returns {HRESULT} 
     */
    RemovePronunciation(pszWord, LangID, ePartOfSpeech, pszPronunciation) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        result := ComCall(5, this, "ptr", pszWord, "ushort", LangID, "int", ePartOfSpeech, "ushort*", pszPronunciation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwGeneration 
     * @returns {HRESULT} 
     */
    GetGeneration(pdwGeneration) {
        result := ComCall(6, this, "uint*", pdwGeneration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pdwGeneration 
     * @param {Pointer<SPWORDLIST>} pWordList 
     * @returns {HRESULT} 
     */
    GetGenerationChange(dwFlags, pdwGeneration, pWordList) {
        result := ComCall(7, this, "uint", dwFlags, "uint*", pdwGeneration, "ptr", pWordList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pdwGeneration 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<SPWORDLIST>} pWordList 
     * @returns {HRESULT} 
     */
    GetWords(dwFlags, pdwGeneration, pdwCookie, pWordList) {
        result := ComCall(8, this, "uint", dwFlags, "uint*", pdwGeneration, "uint*", pdwCookie, "ptr", pWordList, "HRESULT")
        return result
    }
}
