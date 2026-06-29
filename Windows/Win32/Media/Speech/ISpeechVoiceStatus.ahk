#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechRunState.ahk" { SpeechRunState }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechVoiceStatus extends IDispatch {
    /**
     * The interface identifier for ISpeechVoiceStatus
     * @type {Guid}
     */
    static IID := Guid("{8be47b07-57f6-11d2-9eee-00c04f797396}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechVoiceStatus interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CurrentStreamNumber    : IntPtr
        get_LastStreamNumberQueued : IntPtr
        get_LastHResult            : IntPtr
        get_RunningState           : IntPtr
        get_InputWordPosition      : IntPtr
        get_InputWordLength        : IntPtr
        get_InputSentencePosition  : IntPtr
        get_InputSentenceLength    : IntPtr
        get_LastBookmark           : IntPtr
        get_LastBookmarkId         : IntPtr
        get_PhonemeId              : IntPtr
        get_VisemeId               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechVoiceStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CurrentStreamNumber {
        get => this.get_CurrentStreamNumber()
    }

    /**
     * @type {Integer} 
     */
    LastStreamNumberQueued {
        get => this.get_LastStreamNumberQueued()
    }

    /**
     * @type {Integer} 
     */
    LastHResult {
        get => this.get_LastHResult()
    }

    /**
     * @type {SpeechRunState} 
     */
    RunningState {
        get => this.get_RunningState()
    }

    /**
     * @type {Integer} 
     */
    InputWordPosition {
        get => this.get_InputWordPosition()
    }

    /**
     * @type {Integer} 
     */
    InputWordLength {
        get => this.get_InputWordLength()
    }

    /**
     * @type {Integer} 
     */
    InputSentencePosition {
        get => this.get_InputSentencePosition()
    }

    /**
     * @type {Integer} 
     */
    InputSentenceLength {
        get => this.get_InputSentenceLength()
    }

    /**
     * @type {BSTR} 
     */
    LastBookmark {
        get => this.get_LastBookmark()
    }

    /**
     * @type {Integer} 
     */
    LastBookmarkId {
        get => this.get_LastBookmarkId()
    }

    /**
     * @type {Integer} 
     */
    PhonemeId {
        get => this.get_PhonemeId()
    }

    /**
     * @type {Integer} 
     */
    VisemeId {
        get => this.get_VisemeId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentStreamNumber() {
        result := ComCall(7, this, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastStreamNumberQueued() {
        result := ComCall(8, this, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastHResult() {
        result := ComCall(9, this, "int*", &_HResult := 0, "HRESULT")
        return _HResult
    }

    /**
     * 
     * @returns {SpeechRunState} 
     */
    get_RunningState() {
        result := ComCall(10, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputWordPosition() {
        result := ComCall(11, this, "int*", &Position := 0, "HRESULT")
        return Position
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputWordLength() {
        result := ComCall(12, this, "int*", &Length := 0, "HRESULT")
        return Length
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputSentencePosition() {
        result := ComCall(13, this, "int*", &Position := 0, "HRESULT")
        return Position
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputSentenceLength() {
        result := ComCall(14, this, "int*", &Length := 0, "HRESULT")
        return Length
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LastBookmark() {
        Bookmark := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, Bookmark, "HRESULT")
        return Bookmark
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastBookmarkId() {
        result := ComCall(16, this, "int*", &BookmarkId := 0, "HRESULT")
        return BookmarkId
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhonemeId() {
        result := ComCall(17, this, "short*", &PhoneId := 0, "HRESULT")
        return PhoneId
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VisemeId() {
        result := ComCall(18, this, "short*", &VisemeId := 0, "HRESULT")
        return VisemeId
    }

    Query(iid) {
        if (ISpeechVoiceStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentStreamNumber := CallbackCreate(GetMethod(implObj, "get_CurrentStreamNumber"), flags, 2)
        this.vtbl.get_LastStreamNumberQueued := CallbackCreate(GetMethod(implObj, "get_LastStreamNumberQueued"), flags, 2)
        this.vtbl.get_LastHResult := CallbackCreate(GetMethod(implObj, "get_LastHResult"), flags, 2)
        this.vtbl.get_RunningState := CallbackCreate(GetMethod(implObj, "get_RunningState"), flags, 2)
        this.vtbl.get_InputWordPosition := CallbackCreate(GetMethod(implObj, "get_InputWordPosition"), flags, 2)
        this.vtbl.get_InputWordLength := CallbackCreate(GetMethod(implObj, "get_InputWordLength"), flags, 2)
        this.vtbl.get_InputSentencePosition := CallbackCreate(GetMethod(implObj, "get_InputSentencePosition"), flags, 2)
        this.vtbl.get_InputSentenceLength := CallbackCreate(GetMethod(implObj, "get_InputSentenceLength"), flags, 2)
        this.vtbl.get_LastBookmark := CallbackCreate(GetMethod(implObj, "get_LastBookmark"), flags, 2)
        this.vtbl.get_LastBookmarkId := CallbackCreate(GetMethod(implObj, "get_LastBookmarkId"), flags, 2)
        this.vtbl.get_PhonemeId := CallbackCreate(GetMethod(implObj, "get_PhonemeId"), flags, 2)
        this.vtbl.get_VisemeId := CallbackCreate(GetMethod(implObj, "get_VisemeId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentStreamNumber)
        CallbackFree(this.vtbl.get_LastStreamNumberQueued)
        CallbackFree(this.vtbl.get_LastHResult)
        CallbackFree(this.vtbl.get_RunningState)
        CallbackFree(this.vtbl.get_InputWordPosition)
        CallbackFree(this.vtbl.get_InputWordLength)
        CallbackFree(this.vtbl.get_InputSentencePosition)
        CallbackFree(this.vtbl.get_InputSentenceLength)
        CallbackFree(this.vtbl.get_LastBookmark)
        CallbackFree(this.vtbl.get_LastBookmarkId)
        CallbackFree(this.vtbl.get_PhonemeId)
        CallbackFree(this.vtbl.get_VisemeId)
    }
}
