#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MediaBreak.ahk
#Include .\MediaPlaybackSession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaBreakManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBreakManager
     * @type {Guid}
     */
    static IID => Guid("{a854ddb1-feb4-4d9b-9d97-0fdbe58e5e39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_BreaksSeekedOver", "remove_BreaksSeekedOver", "add_BreakStarted", "remove_BreakStarted", "add_BreakEnded", "remove_BreakEnded", "add_BreakSkipped", "remove_BreakSkipped", "get_CurrentBreak", "get_PlaybackSession", "PlayBreak", "SkipCurrentBreak"]

    /**
     * @type {MediaBreak} 
     */
    CurrentBreak {
        get => this.get_CurrentBreak()
    }

    /**
     * @type {MediaPlaybackSession} 
     */
    PlaybackSession {
        get => this.get_PlaybackSession()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakManager, MediaBreakSeekedOverEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BreaksSeekedOver(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BreaksSeekedOver(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakManager, MediaBreakStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BreakStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BreakStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakManager, MediaBreakEndedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BreakEnded(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BreakEnded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakManager, MediaBreakSkippedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BreakSkipped(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BreakSkipped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaBreak} 
     */
    get_CurrentBreak() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBreak(value)
    }

    /**
     * 
     * @returns {MediaPlaybackSession} 
     */
    get_PlaybackSession() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackSession(value)
    }

    /**
     * 
     * @param {MediaBreak} value 
     * @returns {HRESULT} 
     */
    PlayBreak(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SkipCurrentBreak() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
