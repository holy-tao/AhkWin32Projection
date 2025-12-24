#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechVoiceStatus extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechVoiceStatus
     * @type {Guid}
     */
    static IID => Guid("{8be47b07-57f6-11d2-9eee-00c04f797396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentStreamNumber", "get_LastStreamNumberQueued", "get_LastHResult", "get_RunningState", "get_InputWordPosition", "get_InputWordLength", "get_InputSentencePosition", "get_InputSentenceLength", "get_LastBookmark", "get_LastBookmarkId", "get_PhonemeId", "get_VisemeId"]

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
     * @type {Integer} 
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
        result := ComCall(9, this, "int*", &HResult := 0, "HRESULT")
        return HResult
    }

    /**
     * 
     * @returns {Integer} 
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
        Bookmark := BSTR()
        result := ComCall(15, this, "ptr", Bookmark, "HRESULT")
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
}
