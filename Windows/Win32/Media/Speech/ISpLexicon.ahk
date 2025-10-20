#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpLexicon extends IUnknown{
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
     * 
     * @param {PWSTR} pszWord 
     * @param {Integer} LangID 
     * @param {Integer} dwFlags 
     * @param {Pointer<SPWORDPRONUNCIATIONLIST>} pWordPronunciationList 
     * @returns {HRESULT} 
     */
    GetPronunciations(pszWord, LangID, dwFlags, pWordPronunciationList) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        result := ComCall(3, this, "ptr", pszWord, "ushort", LangID, "uint", dwFlags, "ptr", pWordPronunciationList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Integer} LangID 
     * @param {Integer} ePartOfSpeech 
     * @param {Pointer<UInt16>} pszPronunciation 
     * @returns {HRESULT} 
     */
    AddPronunciation(pszWord, LangID, ePartOfSpeech, pszPronunciation) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        result := ComCall(4, this, "ptr", pszWord, "ushort", LangID, "int", ePartOfSpeech, "ushort*", pszPronunciation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Integer} LangID 
     * @param {Integer} ePartOfSpeech 
     * @param {Pointer<UInt16>} pszPronunciation 
     * @returns {HRESULT} 
     */
    RemovePronunciation(pszWord, LangID, ePartOfSpeech, pszPronunciation) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        result := ComCall(5, this, "ptr", pszWord, "ushort", LangID, "int", ePartOfSpeech, "ushort*", pszPronunciation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwGeneration 
     * @returns {HRESULT} 
     */
    GetGeneration(pdwGeneration) {
        result := ComCall(6, this, "uint*", pdwGeneration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwGeneration 
     * @param {Pointer<SPWORDLIST>} pWordList 
     * @returns {HRESULT} 
     */
    GetGenerationChange(dwFlags, pdwGeneration, pWordList) {
        result := ComCall(7, this, "uint", dwFlags, "uint*", pdwGeneration, "ptr", pWordList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwGeneration 
     * @param {Pointer<UInt32>} pdwCookie 
     * @param {Pointer<SPWORDLIST>} pWordList 
     * @returns {HRESULT} 
     */
    GetWords(dwFlags, pdwGeneration, pdwCookie, pWordList) {
        result := ComCall(8, this, "uint", dwFlags, "uint*", pdwGeneration, "uint*", pdwCookie, "ptr", pWordList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
