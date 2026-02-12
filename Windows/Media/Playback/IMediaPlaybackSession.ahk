#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MediaPlayer.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackSession
     * @type {Guid}
     */
    static IID => Guid("{c32b683d-0407-41ba-8946-8b345a5a5435}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PlaybackStateChanged", "remove_PlaybackStateChanged", "add_PlaybackRateChanged", "remove_PlaybackRateChanged", "add_SeekCompleted", "remove_SeekCompleted", "add_BufferingStarted", "remove_BufferingStarted", "add_BufferingEnded", "remove_BufferingEnded", "add_BufferingProgressChanged", "remove_BufferingProgressChanged", "add_DownloadProgressChanged", "remove_DownloadProgressChanged", "add_NaturalDurationChanged", "remove_NaturalDurationChanged", "add_PositionChanged", "remove_PositionChanged", "add_NaturalVideoSizeChanged", "remove_NaturalVideoSizeChanged", "get_MediaPlayer", "get_NaturalDuration", "get_Position", "put_Position", "get_PlaybackState", "get_CanSeek", "get_CanPause", "get_IsProtected", "get_PlaybackRate", "put_PlaybackRate", "get_BufferingProgress", "get_DownloadProgress", "get_NaturalVideoHeight", "get_NaturalVideoWidth", "get_NormalizedSourceRect", "put_NormalizedSourceRect", "get_StereoscopicVideoPackingMode", "put_StereoscopicVideoPackingMode"]

    /**
     * @type {MediaPlayer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
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
     * @type {Integer} 
     */
    PlaybackState {
        get => this.get_PlaybackState()
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
    IsProtected {
        get => this.get_IsProtected()
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
    BufferingProgress {
        get => this.get_BufferingProgress()
    }

    /**
     * @type {Float} 
     */
    DownloadProgress {
        get => this.get_DownloadProgress()
    }

    /**
     * @type {Integer} 
     */
    NaturalVideoHeight {
        get => this.get_NaturalVideoHeight()
    }

    /**
     * @type {Integer} 
     */
    NaturalVideoWidth {
        get => this.get_NaturalVideoWidth()
    }

    /**
     * @type {RECT} 
     */
    NormalizedSourceRect {
        get => this.get_NormalizedSourceRect()
        set => this.put_NormalizedSourceRect(value)
    }

    /**
     * @type {Integer} 
     */
    StereoscopicVideoPackingMode {
        get => this.get_StereoscopicVideoPackingMode()
        set => this.put_StereoscopicVideoPackingMode(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackStateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", token, "int")
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
    remove_PlaybackStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackRateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", value, "ptr", token, "int")
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
    remove_PlaybackRateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SeekCompleted(value) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", value, "ptr", token, "int")
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

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingStarted(value) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", value, "ptr", token, "int")
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

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingEnded(value) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", value, "ptr", token, "int")
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

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingProgressChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", value, "ptr", token, "int")
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
    remove_BufferingProgressChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadProgressChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", value, "ptr", token, "int")
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
    remove_DownloadProgressChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_NaturalDurationChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", value, "ptr", token, "int")
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
    remove_NaturalDurationChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PositionChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(22, this, "ptr", value, "ptr", token, "int")
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
    remove_PositionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_NaturalVideoSizeChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(24, this, "ptr", value, "ptr", token, "int")
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
    remove_NaturalVideoSizeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(25, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaPlayer} 
     */
    get_MediaPlayer() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlayer(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NaturalDuration() {
        value := TimeSpan()
        result := ComCall(27, this, "ptr", value, "int")
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
        result := ComCall(28, this, "ptr", value, "int")
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
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlaybackState() {
        result := ComCall(30, this, "int*", &value := 0, "int")
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
        result := ComCall(31, this, "int*", &value := 0, "int")
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
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtected() {
        result := ComCall(33, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackRate() {
        result := ComCall(34, this, "double*", &value := 0, "int")
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
        result := ComCall(35, this, "double", value, "int")
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
        result := ComCall(36, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DownloadProgress() {
        result := ComCall(37, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NaturalVideoHeight() {
        result := ComCall(38, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NaturalVideoWidth() {
        result := ComCall(39, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_NormalizedSourceRect() {
        value := RECT()
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_NormalizedSourceRect(value) {
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StereoscopicVideoPackingMode() {
        result := ComCall(42, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StereoscopicVideoPackingMode(value) {
        result := ComCall(43, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
