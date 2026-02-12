#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlayer.ahk
#Include .\MediaPlaybackCommandManagerCommandBehavior.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackCommandManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackCommandManager
     * @type {Guid}
     */
    static IID => Guid("{5acee5a6-5cb6-4a5a-8521-cc86b1c1ed37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "put_IsEnabled", "get_MediaPlayer", "get_PlayBehavior", "get_PauseBehavior", "get_NextBehavior", "get_PreviousBehavior", "get_FastForwardBehavior", "get_RewindBehavior", "get_ShuffleBehavior", "get_AutoRepeatModeBehavior", "get_PositionBehavior", "get_RateBehavior", "add_PlayReceived", "remove_PlayReceived", "add_PauseReceived", "remove_PauseReceived", "add_NextReceived", "remove_NextReceived", "add_PreviousReceived", "remove_PreviousReceived", "add_FastForwardReceived", "remove_FastForwardReceived", "add_RewindReceived", "remove_RewindReceived", "add_ShuffleReceived", "remove_ShuffleReceived", "add_AutoRepeatModeReceived", "remove_AutoRepeatModeReceived", "add_PositionReceived", "remove_PositionReceived", "add_RateReceived", "remove_RateReceived"]

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * @type {MediaPlayer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    PlayBehavior {
        get => this.get_PlayBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    PauseBehavior {
        get => this.get_PauseBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    NextBehavior {
        get => this.get_NextBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    PreviousBehavior {
        get => this.get_PreviousBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    FastForwardBehavior {
        get => this.get_FastForwardBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    RewindBehavior {
        get => this.get_RewindBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    ShuffleBehavior {
        get => this.get_ShuffleBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    AutoRepeatModeBehavior {
        get => this.get_AutoRepeatModeBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    PositionBehavior {
        get => this.get_PositionBehavior()
    }

    /**
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    RateBehavior {
        get => this.get_RateBehavior()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
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
    put_IsEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
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
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlayer(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_PlayBehavior() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_PauseBehavior() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_NextBehavior() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_PreviousBehavior() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_FastForwardBehavior() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_RewindBehavior() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_ShuffleBehavior() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_AutoRepeatModeBehavior() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_PositionBehavior() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_RateBehavior() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManagerCommandBehavior(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPlayReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlayReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
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
    remove_PlayReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPauseReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PauseReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", token, "int")
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
    remove_PauseReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(22, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerNextReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NextReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(23, this, "ptr", handler, "ptr", token, "int")
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
    remove_NextReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(24, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPreviousReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PreviousReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(25, this, "ptr", handler, "ptr", token, "int")
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
    remove_PreviousReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(26, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerFastForwardReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FastForwardReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(27, this, "ptr", handler, "ptr", token, "int")
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
    remove_FastForwardReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(28, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerRewindReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RewindReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", handler, "ptr", token, "int")
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
    remove_RewindReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerShuffleReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShuffleReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(31, this, "ptr", handler, "ptr", token, "int")
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
    remove_ShuffleReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(32, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutoRepeatModeReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(33, this, "ptr", handler, "ptr", token, "int")
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
    remove_AutoRepeatModeReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(34, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPositionReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(35, this, "ptr", handler, "ptr", token, "int")
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
    remove_PositionReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(36, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerRateReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RateReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", handler, "ptr", token, "int")
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
    remove_RateReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
