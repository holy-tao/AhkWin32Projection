#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechLexiconPronunciations.ahk" { ISpeechLexiconPronunciations }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISpeechLexiconWords.ahk" { ISpeechLexiconWords }
#Import ".\SpeechPartOfSpeech.ahk" { SpeechPartOfSpeech }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechLexiconType.ahk" { SpeechLexiconType }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechLexicon extends IDispatch {
    /**
     * The interface identifier for ISpeechLexicon
     * @type {Guid}
     */
    static IID := Guid("{3da7627a-c7ae-4b23-8708-638c50362c25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechLexicon interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_GenerationId              : IntPtr
        GetWords                      : IntPtr
        AddPronunciation              : IntPtr
        AddPronunciationByPhoneIds    : IntPtr
        RemovePronunciation           : IntPtr
        RemovePronunciationByPhoneIds : IntPtr
        GetPronunciations             : IntPtr
        GetGenerationChange           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechLexicon.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(7, this, "int*", &GenerationId := 0, "HRESULT")
        return GenerationId
    }

    /**
     * 
     * @param {SpeechLexiconType} Flags 
     * @param {Pointer<Integer>} GenerationID 
     * @param {Pointer<ISpeechLexiconWords>} Words 
     * @returns {HRESULT} 
     */
    GetWords(Flags, GenerationID, Words) {
        GenerationIDMarshal := GenerationID is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, SpeechLexiconType, Flags, GenerationIDMarshal, GenerationID, ISpeechLexiconWords.Ptr, Words, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {SpeechPartOfSpeech} PartOfSpeech 
     * @param {BSTR} bstrPronunciation 
     * @returns {HRESULT} 
     */
    AddPronunciation(bstrWord, LangId, PartOfSpeech, bstrPronunciation) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord
        bstrPronunciation := bstrPronunciation is String ? BSTR.Alloc(bstrPronunciation).Value : bstrPronunciation

        result := ComCall(9, this, BSTR, bstrWord, "int", LangId, SpeechPartOfSpeech, PartOfSpeech, BSTR, bstrPronunciation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {SpeechPartOfSpeech} PartOfSpeech 
     * @param {Pointer<VARIANT>} PhoneIds 
     * @returns {HRESULT} 
     */
    AddPronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech, PhoneIds) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord

        result := ComCall(10, this, BSTR, bstrWord, "int", LangId, SpeechPartOfSpeech, PartOfSpeech, VARIANT.Ptr, PhoneIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {SpeechPartOfSpeech} PartOfSpeech 
     * @param {BSTR} bstrPronunciation 
     * @returns {HRESULT} 
     */
    RemovePronunciation(bstrWord, LangId, PartOfSpeech, bstrPronunciation) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord
        bstrPronunciation := bstrPronunciation is String ? BSTR.Alloc(bstrPronunciation).Value : bstrPronunciation

        result := ComCall(11, this, BSTR, bstrWord, "int", LangId, SpeechPartOfSpeech, PartOfSpeech, BSTR, bstrPronunciation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {SpeechPartOfSpeech} PartOfSpeech 
     * @param {Pointer<VARIANT>} PhoneIds 
     * @returns {HRESULT} 
     */
    RemovePronunciationByPhoneIds(bstrWord, LangId, PartOfSpeech, PhoneIds) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord

        result := ComCall(12, this, BSTR, bstrWord, "int", LangId, SpeechPartOfSpeech, PartOfSpeech, VARIANT.Ptr, PhoneIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWord 
     * @param {Integer} LangId 
     * @param {SpeechLexiconType} _TypeFlags 
     * @returns {ISpeechLexiconPronunciations} 
     */
    GetPronunciations(bstrWord, LangId, _TypeFlags) {
        bstrWord := bstrWord is String ? BSTR.Alloc(bstrWord).Value : bstrWord

        result := ComCall(13, this, BSTR, bstrWord, "int", LangId, SpeechLexiconType, _TypeFlags, "ptr*", &ppPronunciations := 0, "HRESULT")
        return ISpeechLexiconPronunciations(ppPronunciations)
    }

    /**
     * 
     * @param {Pointer<Integer>} GenerationID 
     * @returns {ISpeechLexiconWords} 
     */
    GetGenerationChange(GenerationID) {
        GenerationIDMarshal := GenerationID is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, GenerationIDMarshal, GenerationID, "ptr*", &ppWords := 0, "HRESULT")
        return ISpeechLexiconWords(ppWords)
    }

    Query(iid) {
        if (ISpeechLexicon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_GenerationId := CallbackCreate(GetMethod(implObj, "get_GenerationId"), flags, 2)
        this.vtbl.GetWords := CallbackCreate(GetMethod(implObj, "GetWords"), flags, 4)
        this.vtbl.AddPronunciation := CallbackCreate(GetMethod(implObj, "AddPronunciation"), flags, 5)
        this.vtbl.AddPronunciationByPhoneIds := CallbackCreate(GetMethod(implObj, "AddPronunciationByPhoneIds"), flags, 5)
        this.vtbl.RemovePronunciation := CallbackCreate(GetMethod(implObj, "RemovePronunciation"), flags, 5)
        this.vtbl.RemovePronunciationByPhoneIds := CallbackCreate(GetMethod(implObj, "RemovePronunciationByPhoneIds"), flags, 5)
        this.vtbl.GetPronunciations := CallbackCreate(GetMethod(implObj, "GetPronunciations"), flags, 5)
        this.vtbl.GetGenerationChange := CallbackCreate(GetMethod(implObj, "GetGenerationChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_GenerationId)
        CallbackFree(this.vtbl.GetWords)
        CallbackFree(this.vtbl.AddPronunciation)
        CallbackFree(this.vtbl.AddPronunciationByPhoneIds)
        CallbackFree(this.vtbl.RemovePronunciation)
        CallbackFree(this.vtbl.RemovePronunciationByPhoneIds)
        CallbackFree(this.vtbl.GetPronunciations)
        CallbackFree(this.vtbl.GetGenerationChange)
    }
}
