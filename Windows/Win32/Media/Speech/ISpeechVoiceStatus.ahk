#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} StreamNumber 
     * @returns {HRESULT} 
     */
    get_CurrentStreamNumber(StreamNumber) {
        result := ComCall(7, this, "int*", StreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} StreamNumber 
     * @returns {HRESULT} 
     */
    get_LastStreamNumberQueued(StreamNumber) {
        result := ComCall(8, this, "int*", StreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} HResult 
     * @returns {HRESULT} 
     */
    get_LastHResult(HResult) {
        result := ComCall(9, this, "int*", HResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} State 
     * @returns {HRESULT} 
     */
    get_RunningState(State) {
        result := ComCall(10, this, "int*", State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Position 
     * @returns {HRESULT} 
     */
    get_InputWordPosition(Position) {
        result := ComCall(11, this, "int*", Position, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Length 
     * @returns {HRESULT} 
     */
    get_InputWordLength(Length) {
        result := ComCall(12, this, "int*", Length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Position 
     * @returns {HRESULT} 
     */
    get_InputSentencePosition(Position) {
        result := ComCall(13, this, "int*", Position, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Length 
     * @returns {HRESULT} 
     */
    get_InputSentenceLength(Length) {
        result := ComCall(14, this, "int*", Length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Bookmark 
     * @returns {HRESULT} 
     */
    get_LastBookmark(Bookmark) {
        result := ComCall(15, this, "ptr", Bookmark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} BookmarkId 
     * @returns {HRESULT} 
     */
    get_LastBookmarkId(BookmarkId) {
        result := ComCall(16, this, "int*", BookmarkId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PhoneId 
     * @returns {HRESULT} 
     */
    get_PhonemeId(PhoneId) {
        result := ComCall(17, this, "short*", PhoneId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} VisemeId 
     * @returns {HRESULT} 
     */
    get_VisemeId(VisemeId) {
        result := ComCall(18, this, "short*", VisemeId, "HRESULT")
        return result
    }
}
