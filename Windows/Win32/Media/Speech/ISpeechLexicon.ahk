#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechLexicon extends IDispatch{
    /**
     * The interface identifier for ISpeechLexicon
     * @type {Guid}
     */
    static IID => Guid("{3da7627a-c7ae-4b23-8708-638c50362c25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} GenerationId 
     * @returns {HRESULT} 
     */
    get_GenerationId(GenerationId) {
        result := ComCall(7, this, "int*", GenerationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Int32>} GenerationID 
     * @param {Pointer<ISpeechLexiconWords>} Words 
     * @returns {HRESULT} 
     */
    GetWords(Flags, GenerationID, Words) {
        result := ComCall(8, this, "int", Flags, "int*", GenerationID, "ptr", Words, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {Integer} PartOfSpeech 
     * @param {BSTR} bstrPronunciation 
     * @returns {HRESULT} 
     */
    AddPronunciation(bstrWord, LangId, PartOfSpeech, bstrPronunciation) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord
        bstrPronunciation := bstrPronunciation is String ? BSTR.Alloc(bstrPronunciation).Value : bstrPronunciation

        result := ComCall(9, this, "ptr", bstrWord, "int", LangId, "int", PartOfSpeech, "ptr", bstrPronunciation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {Integer} PartOfSpeech 
     * @param {Pointer<VARIANT>} PhoneIds 
     * @returns {HRESULT} 
     */
    AddPronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech, PhoneIds) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord

        result := ComCall(10, this, "ptr", bstrWord, "int", LangId, "int", PartOfSpeech, "ptr", PhoneIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {Integer} PartOfSpeech 
     * @param {BSTR} bstrPronunciation 
     * @returns {HRESULT} 
     */
    RemovePronunciation(bstrWord, LangId, PartOfSpeech, bstrPronunciation) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord
        bstrPronunciation := bstrPronunciation is String ? BSTR.Alloc(bstrPronunciation).Value : bstrPronunciation

        result := ComCall(11, this, "ptr", bstrWord, "int", LangId, "int", PartOfSpeech, "ptr", bstrPronunciation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {Integer} PartOfSpeech 
     * @param {Pointer<VARIANT>} PhoneIds 
     * @returns {HRESULT} 
     */
    RemovePronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech, PhoneIds) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord

        result := ComCall(12, this, "ptr", bstrWord, "int", LangId, "int", PartOfSpeech, "ptr", PhoneIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {Integer} TypeFlags 
     * @param {Pointer<ISpeechLexiconPronunciations>} ppPronunciations 
     * @returns {HRESULT} 
     */
    GetPronunciations(bstrWord, LangId, TypeFlags, ppPronunciations) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord

        result := ComCall(13, this, "ptr", bstrWord, "int", LangId, "int", TypeFlags, "ptr", ppPronunciations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} GenerationID 
     * @param {Pointer<ISpeechLexiconWords>} ppWords 
     * @returns {HRESULT} 
     */
    GetGenerationChange(GenerationID, ppWords) {
        result := ComCall(14, this, "int*", GenerationID, "ptr", ppWords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
