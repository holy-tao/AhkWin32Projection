#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\SpeechPartOfSpeech.ahk" { SpeechPartOfSpeech }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechLexiconType.ahk" { SpeechLexiconType }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechLexiconPronunciation extends IDispatch {
    /**
     * The interface identifier for ISpeechLexiconPronunciation
     * @type {Guid}
     */
    static IID := Guid("{95252c5d-9e43-4f4a-9899-48ee73352f9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechLexiconPronunciation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type         : IntPtr
        get_LangId       : IntPtr
        get_PartOfSpeech : IntPtr
        get_PhoneIds     : IntPtr
        get_Symbolic     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechLexiconPronunciation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {SpeechLexiconType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    LangId {
        get => this.get_LangId()
    }

    /**
     * @type {SpeechPartOfSpeech} 
     */
    PartOfSpeech {
        get => this.get_PartOfSpeech()
    }

    /**
     * @type {VARIANT} 
     */
    PhoneIds {
        get => this.get_PhoneIds()
    }

    /**
     * @type {BSTR} 
     */
    Symbolic {
        get => this.get_Symbolic()
    }

    /**
     * 
     * @returns {SpeechLexiconType} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &LexiconType := 0, "HRESULT")
        return LexiconType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LangId() {
        result := ComCall(8, this, "int*", &LangId := 0, "HRESULT")
        return LangId
    }

    /**
     * 
     * @returns {SpeechPartOfSpeech} 
     */
    get_PartOfSpeech() {
        result := ComCall(9, this, "int*", &PartOfSpeech := 0, "HRESULT")
        return PartOfSpeech
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PhoneIds() {
        PhoneIds := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, PhoneIds, "HRESULT")
        return PhoneIds
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Symbolic() {
        Symbolic := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, Symbolic, "HRESULT")
        return Symbolic
    }

    Query(iid) {
        if (ISpeechLexiconPronunciation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_LangId := CallbackCreate(GetMethod(implObj, "get_LangId"), flags, 2)
        this.vtbl.get_PartOfSpeech := CallbackCreate(GetMethod(implObj, "get_PartOfSpeech"), flags, 2)
        this.vtbl.get_PhoneIds := CallbackCreate(GetMethod(implObj, "get_PhoneIds"), flags, 2)
        this.vtbl.get_Symbolic := CallbackCreate(GetMethod(implObj, "get_Symbolic"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_LangId)
        CallbackFree(this.vtbl.get_PartOfSpeech)
        CallbackFree(this.vtbl.get_PhoneIds)
        CallbackFree(this.vtbl.get_Symbolic)
    }
}
