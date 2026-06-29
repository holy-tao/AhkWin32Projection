#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPWORDLIST.ahk" { SPWORDLIST }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPPARTOFSPEECH.ahk" { SPPARTOFSPEECH }
#Import ".\SPWORDPRONUNCIATIONLIST.ahk" { SPWORDPRONUNCIATIONLIST }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpLexicon extends IUnknown {
    /**
     * The interface identifier for ISpLexicon
     * @type {Guid}
     */
    static IID := Guid("{da41a7c2-5383-4db2-916b-6c1719e3db58}")

    /**
     * The class identifier for SpLexicon
     * @type {Guid}
     */
    static CLSID := Guid("{0655e396-25d0-11d3-9c26-00c04f8ef87c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpLexicon interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPronunciations   : IntPtr
        AddPronunciation    : IntPtr
        RemovePronunciation : IntPtr
        GetGeneration       : IntPtr
        GetGenerationChange : IntPtr
        GetWords            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpLexicon.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(3, this, "ptr", pszWord, "ushort", LangID, "uint", dwFlags, SPWORDPRONUNCIATIONLIST.Ptr, pWordPronunciationList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Integer} LangID 
     * @param {SPPARTOFSPEECH} ePartOfSpeech 
     * @param {Pointer<Integer>} pszPronunciation 
     * @returns {HRESULT} 
     */
    AddPronunciation(pszWord, LangID, ePartOfSpeech, pszPronunciation) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        pszPronunciationMarshal := pszPronunciation is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ptr", pszWord, "ushort", LangID, SPPARTOFSPEECH, ePartOfSpeech, pszPronunciationMarshal, pszPronunciation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Integer} LangID 
     * @param {SPPARTOFSPEECH} ePartOfSpeech 
     * @param {Pointer<Integer>} pszPronunciation 
     * @returns {HRESULT} 
     */
    RemovePronunciation(pszWord, LangID, ePartOfSpeech, pszPronunciation) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        pszPronunciationMarshal := pszPronunciation is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, "ptr", pszWord, "ushort", LangID, SPPARTOFSPEECH, ePartOfSpeech, pszPronunciationMarshal, pszPronunciation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwGeneration 
     * @returns {HRESULT} 
     */
    GetGeneration(pdwGeneration) {
        pdwGenerationMarshal := pdwGeneration is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwGenerationMarshal, pdwGeneration, "HRESULT")
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
        pdwGenerationMarshal := pdwGeneration is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", dwFlags, pdwGenerationMarshal, pdwGeneration, SPWORDLIST.Ptr, pWordList, "HRESULT")
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
        pdwGenerationMarshal := pdwGeneration is VarRef ? "uint*" : "ptr"
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwFlags, pdwGenerationMarshal, pdwGeneration, pdwCookieMarshal, pdwCookie, SPWORDLIST.Ptr, pWordList, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpLexicon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPronunciations := CallbackCreate(GetMethod(implObj, "GetPronunciations"), flags, 5)
        this.vtbl.AddPronunciation := CallbackCreate(GetMethod(implObj, "AddPronunciation"), flags, 5)
        this.vtbl.RemovePronunciation := CallbackCreate(GetMethod(implObj, "RemovePronunciation"), flags, 5)
        this.vtbl.GetGeneration := CallbackCreate(GetMethod(implObj, "GetGeneration"), flags, 2)
        this.vtbl.GetGenerationChange := CallbackCreate(GetMethod(implObj, "GetGenerationChange"), flags, 4)
        this.vtbl.GetWords := CallbackCreate(GetMethod(implObj, "GetWords"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPronunciations)
        CallbackFree(this.vtbl.AddPronunciation)
        CallbackFree(this.vtbl.RemovePronunciation)
        CallbackFree(this.vtbl.GetGeneration)
        CallbackFree(this.vtbl.GetGenerationChange)
        CallbackFree(this.vtbl.GetWords)
    }
}
