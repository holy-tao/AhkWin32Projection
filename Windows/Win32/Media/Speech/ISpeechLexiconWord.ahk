#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechLexiconPronunciations.ahk" { ISpeechLexiconPronunciations }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechWordType.ahk" { SpeechWordType }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechLexiconWord extends IDispatch {
    /**
     * The interface identifier for ISpeechLexiconWord
     * @type {Guid}
     */
    static IID := Guid("{4e5b933c-c9be-48ed-8842-1ee51bb1d4ff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechLexiconWord interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_LangId         : IntPtr
        get_Type           : IntPtr
        get_Word           : IntPtr
        get_Pronunciations : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechLexiconWord.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    LangId {
        get => this.get_LangId()
    }

    /**
     * @type {SpeechWordType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    Word {
        get => this.get_Word()
    }

    /**
     * @type {ISpeechLexiconPronunciations} 
     */
    Pronunciations {
        get => this.get_Pronunciations()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LangId() {
        result := ComCall(7, this, "int*", &LangId := 0, "HRESULT")
        return LangId
    }

    /**
     * 
     * @returns {SpeechWordType} 
     */
    get_Type() {
        result := ComCall(8, this, "int*", &WordType := 0, "HRESULT")
        return WordType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Word() {
        Word := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, Word, "HRESULT")
        return Word
    }

    /**
     * 
     * @returns {ISpeechLexiconPronunciations} 
     */
    get_Pronunciations() {
        result := ComCall(10, this, "ptr*", &Pronunciations := 0, "HRESULT")
        return ISpeechLexiconPronunciations(Pronunciations)
    }

    Query(iid) {
        if (ISpeechLexiconWord.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LangId := CallbackCreate(GetMethod(implObj, "get_LangId"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Word := CallbackCreate(GetMethod(implObj, "get_Word"), flags, 2)
        this.vtbl.get_Pronunciations := CallbackCreate(GetMethod(implObj, "get_Pronunciations"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LangId)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Word)
        CallbackFree(this.vtbl.get_Pronunciations)
    }
}
