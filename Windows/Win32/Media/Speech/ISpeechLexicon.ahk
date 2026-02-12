#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechLexiconPronunciations.ahk
#Include .\ISpeechLexiconWords.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechLexicon extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GenerationId", "GetWords", "AddPronunciation", "AddPronunciationByPhoneIds", "RemovePronunciation", "RemovePronunciationByPhoneIds", "GetPronunciations", "GetGenerationChange"]

    /**
     * @type {Integer} 
     */
    GenerationId {
        get => this.get_GenerationId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GenerationId() {
        result := ComCall(7, this, "int*", &GenerationId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GenerationId
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} GenerationID 
     * @param {Pointer<ISpeechLexiconWords>} Words 
     * @returns {HRESULT} 
     */
    GetWords(Flags, GenerationID, Words) {
        GenerationIDMarshal := GenerationID is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "int", Flags, GenerationIDMarshal, GenerationID, "ptr*", Words, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrWord is String) {
            pin := BSTR.Alloc(bstrWord)
            bstrWord := pin.Value
        }
        if(bstrPronunciation is String) {
            pin := BSTR.Alloc(bstrPronunciation)
            bstrPronunciation := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrWord, "int", LangId, "int", PartOfSpeech, "ptr", bstrPronunciation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrWord is String) {
            pin := BSTR.Alloc(bstrWord)
            bstrWord := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrWord, "int", LangId, "int", PartOfSpeech, "ptr", PhoneIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrWord is String) {
            pin := BSTR.Alloc(bstrWord)
            bstrWord := pin.Value
        }
        if(bstrPronunciation is String) {
            pin := BSTR.Alloc(bstrPronunciation)
            bstrPronunciation := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrWord, "int", LangId, "int", PartOfSpeech, "ptr", bstrPronunciation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrWord is String) {
            pin := BSTR.Alloc(bstrWord)
            bstrWord := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrWord, "int", LangId, "int", PartOfSpeech, "ptr", PhoneIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {Integer} TypeFlags_ 
     * @returns {ISpeechLexiconPronunciations} 
     */
    GetPronunciations(bstrWord, LangId, TypeFlags_) {
        if(bstrWord is String) {
            pin := BSTR.Alloc(bstrWord)
            bstrWord := pin.Value
        }

        result := ComCall(13, this, "ptr", bstrWord, "int", LangId, "int", TypeFlags_, "ptr*", &ppPronunciations := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechLexiconPronunciations(ppPronunciations)
    }

    /**
     * 
     * @param {Pointer<Integer>} GenerationID 
     * @returns {ISpeechLexiconWords} 
     */
    GetGenerationChange(GenerationID) {
        GenerationIDMarshal := GenerationID is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, GenerationIDMarshal, GenerationID, "ptr*", &ppWords := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechLexiconWords(ppWords)
    }
}
