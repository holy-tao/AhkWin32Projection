#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MediaBreakManager.ahk
#Include .\MediaPlaybackCommandManager.ahk
#Include ..\..\Devices\Enumeration\DeviceInformation.ahk
#Include ..\MediaTimelineController.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\MediaPlaybackSession.ahk
#Include ..\Casting\CastingSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayer3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayer3
     * @type {Guid}
     */
    static IID => Guid("{ee0660da-031b-4feb-bd9b-92e0a0a8d299}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_IsMutedChanged", "remove_IsMutedChanged", "add_SourceChanged", "remove_SourceChanged", "get_AudioBalance", "put_AudioBalance", "get_RealTimePlayback", "put_RealTimePlayback", "get_StereoscopicVideoRenderMode", "put_StereoscopicVideoRenderMode", "get_BreakManager", "get_CommandManager", "get_AudioDevice", "put_AudioDevice", "get_TimelineController", "put_TimelineController", "get_TimelineControllerPositionOffset", "put_TimelineControllerPositionOffset", "get_PlaybackSession", "StepForwardOneFrame", "StepBackwardOneFrame", "GetAsCastingSource"]

    /**
     * @type {Float} 
     */
    AudioBalance {
        get => this.get_AudioBalance()
        set => this.put_AudioBalance(value)
    }

    /**
     * @type {Boolean} 
     */
    RealTimePlayback {
        get => this.get_RealTimePlayback()
        set => this.put_RealTimePlayback(value)
    }

    /**
     * @type {Integer} 
     */
    StereoscopicVideoRenderMode {
        get => this.get_StereoscopicVideoRenderMode()
        set => this.put_StereoscopicVideoRenderMode(value)
    }

    /**
     * @type {MediaBreakManager} 
     */
    BreakManager {
        get => this.get_BreakManager()
    }

    /**
     * @type {MediaPlaybackCommandManager} 
     */
    CommandManager {
        get => this.get_CommandManager()
    }

    /**
     * @type {DeviceInformation} 
     */
    AudioDevice {
        get => this.get_AudioDevice()
        set => this.put_AudioDevice(value)
    }

    /**
     * @type {MediaTimelineController} 
     */
    TimelineController {
        get => this.get_TimelineController()
        set => this.put_TimelineController(value)
    }

    /**
     * @type {TimeSpan} 
     */
    TimelineControllerPositionOffset {
        get => this.get_TimelineControllerPositionOffset()
        set => this.put_TimelineControllerPositionOffset(value)
    }

    /**
     * @type {MediaPlaybackSession} 
     */
    PlaybackSession {
        get => this.get_PlaybackSession()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_IsMutedChanged(value) {
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
    remove_IsMutedChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
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
    add_SourceChanged(value) {
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
    remove_SourceChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AudioBalance() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_AudioBalance(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RealTimePlayback() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_RealTimePlayback(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StereoscopicVideoRenderMode() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_StereoscopicVideoRenderMode(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaBreakManager} 
     */
    get_BreakManager() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBreakManager(value)
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManager} 
     */
    get_CommandManager() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackCommandManager(value)
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_AudioDevice() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }

    /**
     * 
     * @param {DeviceInformation} value 
     * @returns {HRESULT} 
     */
    put_AudioDevice(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaTimelineController} 
     */
    get_TimelineController() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaTimelineController(value)
    }

    /**
     * 
     * @param {MediaTimelineController} value 
     * @returns {HRESULT} 
     */
    put_TimelineController(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimelineControllerPositionOffset() {
        value := TimeSpan()
        result := ComCall(22, this, "ptr", value, "int")
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
    put_TimelineControllerPositionOffset(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaPlaybackSession} 
     */
    get_PlaybackSession() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackSession(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StepForwardOneFrame() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StepBackwardOneFrame() {
        result := ComCall(26, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CastingSource} 
     */
    GetAsCastingSource() {
        result := ComCall(27, this, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CastingSource(returnValue)
    }
}
