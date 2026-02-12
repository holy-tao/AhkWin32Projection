#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\PlaybackMediaMarkerSequence.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayer
     * @type {Guid}
     */
    static IID => Guid("{381a83cb-6fff-499b-8d64-2885dfc1249e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutoPlay", "put_AutoPlay", "get_NaturalDuration", "get_Position", "put_Position", "get_BufferingProgress", "get_CurrentState", "get_CanSeek", "get_CanPause", "get_IsLoopingEnabled", "put_IsLoopingEnabled", "get_IsProtected", "get_IsMuted", "put_IsMuted", "get_PlaybackRate", "put_PlaybackRate", "get_Volume", "put_Volume", "get_PlaybackMediaMarkers", "add_MediaOpened", "remove_MediaOpened", "add_MediaEnded", "remove_MediaEnded", "add_MediaFailed", "remove_MediaFailed", "add_CurrentStateChanged", "remove_CurrentStateChanged", "add_PlaybackMediaMarkerReached", "remove_PlaybackMediaMarkerReached", "add_MediaPlayerRateChanged", "remove_MediaPlayerRateChanged", "add_VolumeChanged", "remove_VolumeChanged", "add_SeekCompleted", "remove_SeekCompleted", "add_BufferingStarted", "remove_BufferingStarted", "add_BufferingEnded", "remove_BufferingEnded", "Play", "Pause", "SetUriSource"]

    /**
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * @type {TimeSpan} 
     */
    NaturalDuration {
        get => this.get_NaturalDuration()
    }

    /**
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * @type {Float} 
     */
    BufferingProgress {
        get => this.get_BufferingProgress()
    }

    /**
     * @type {Integer} 
     */
    CurrentState {
        get => this.get_CurrentState()
    }

    /**
     * @type {Boolean} 
     */
    CanSeek {
        get => this.get_CanSeek()
    }

    /**
     * @type {Boolean} 
     */
    CanPause {
        get => this.get_CanPause()
    }

    /**
     * @type {Boolean} 
     */
    IsLoopingEnabled {
        get => this.get_IsLoopingEnabled()
        set => this.put_IsLoopingEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsProtected {
        get => this.get_IsProtected()
    }

    /**
     * @type {Boolean} 
     */
    IsMuted {
        get => this.get_IsMuted()
        set => this.put_IsMuted(value)
    }

    /**
     * @type {Float} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
        set => this.put_PlaybackRate(value)
    }

    /**
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * @type {PlaybackMediaMarkerSequence} 
     */
    PlaybackMediaMarkers {
        get => this.get_PlaybackMediaMarkers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoPlay(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NaturalDuration() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BufferingProgress() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentState() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSeek() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPause() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLoopingEnabled() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLoopingEnabled(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtected() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMuted() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMuted(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackRate() {
        result := ComCall(20, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRate(value) {
        result := ComCall(21, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        result := ComCall(22, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        result := ComCall(23, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PlaybackMediaMarkerSequence} 
     */
    get_PlaybackMediaMarkers() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaybackMediaMarkerSequence(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MediaOpened(value) {
        token := EventRegistrationToken()
        result := ComCall(25, this, "ptr", value, "ptr", token, "int")
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
    remove_MediaOpened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(26, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MediaEnded(value) {
        token := EventRegistrationToken()
        result := ComCall(27, this, "ptr", value, "ptr", token, "int")
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
    remove_MediaEnded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(28, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, MediaPlayerFailedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MediaFailed(value) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", value, "ptr", token, "int")
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
    remove_MediaFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentStateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(31, this, "ptr", value, "ptr", token, "int")
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
    remove_CurrentStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(32, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, PlaybackMediaMarkerReachedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackMediaMarkerReached(value) {
        token := EventRegistrationToken()
        result := ComCall(33, this, "ptr", value, "ptr", token, "int")
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
    remove_PlaybackMediaMarkerReached(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(34, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, MediaPlayerRateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MediaPlayerRateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(35, this, "ptr", value, "ptr", token, "int")
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
    remove_MediaPlayerRateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(36, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_VolumeChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", value, "ptr", token, "int")
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
    remove_VolumeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SeekCompleted(value) {
        token := EventRegistrationToken()
        result := ComCall(39, this, "ptr", value, "ptr", token, "int")
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
    remove_SeekCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(40, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingStarted(value) {
        token := EventRegistrationToken()
        result := ComCall(41, this, "ptr", value, "ptr", token, "int")
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
    remove_BufferingStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(42, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingEnded(value) {
        token := EventRegistrationToken()
        result := ComCall(43, this, "ptr", value, "ptr", token, "int")
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
    remove_BufferingEnded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(44, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Play method plays the current DVD title.
     * @remarks
     * If playback is paused or stopped and [**EnableResetOnStop**](enableresetonstop-property.md) is true, then calling **Play** will resume playback at normal speed at the current location. If playback is stopped and **EnableResetOnStop** is false, then calling **Play** will cause the disc to start playing at the beginning of the first title.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/play-method
     */
    Play() {
        result := ComCall(45, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(46, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    SetUriSource(value) {
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
