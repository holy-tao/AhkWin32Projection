#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechVoiceStatus extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} StreamNumber 
     * @returns {HRESULT} 
     */
    get_CurrentStreamNumber(StreamNumber) {
        result := ComCall(7, this, "int*", StreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} StreamNumber 
     * @returns {HRESULT} 
     */
    get_LastStreamNumberQueued(StreamNumber) {
        result := ComCall(8, this, "int*", StreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} HResult 
     * @returns {HRESULT} 
     */
    get_LastHResult(HResult) {
        result := ComCall(9, this, "int*", HResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} State 
     * @returns {HRESULT} 
     */
    get_RunningState(State) {
        result := ComCall(10, this, "int*", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Position 
     * @returns {HRESULT} 
     */
    get_InputWordPosition(Position) {
        result := ComCall(11, this, "int*", Position, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Length 
     * @returns {HRESULT} 
     */
    get_InputWordLength(Length) {
        result := ComCall(12, this, "int*", Length, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Position 
     * @returns {HRESULT} 
     */
    get_InputSentencePosition(Position) {
        result := ComCall(13, this, "int*", Position, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Length 
     * @returns {HRESULT} 
     */
    get_InputSentenceLength(Length) {
        result := ComCall(14, this, "int*", Length, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Bookmark 
     * @returns {HRESULT} 
     */
    get_LastBookmark(Bookmark) {
        result := ComCall(15, this, "ptr", Bookmark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} BookmarkId 
     * @returns {HRESULT} 
     */
    get_LastBookmarkId(BookmarkId) {
        result := ComCall(16, this, "int*", BookmarkId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} PhoneId 
     * @returns {HRESULT} 
     */
    get_PhonemeId(PhoneId) {
        result := ComCall(17, this, "short*", PhoneId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} VisemeId 
     * @returns {HRESULT} 
     */
    get_VisemeId(VisemeId) {
        result := ComCall(18, this, "short*", VisemeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
