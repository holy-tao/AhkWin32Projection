#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\GlobalSystemMediaTransportControlsSessionMediaProperties.ahk
#Include .\GlobalSystemMediaTransportControlsSessionTimelineProperties.ahk
#Include .\GlobalSystemMediaTransportControlsSessionPlaybackInfo.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class IGlobalSystemMediaTransportControlsSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlobalSystemMediaTransportControlsSession
     * @type {Guid}
     */
    static IID => Guid("{7148c835-9b14-5ae2-ab85-dc9b1c14e1a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceAppUserModelId", "TryGetMediaPropertiesAsync", "GetTimelineProperties", "GetPlaybackInfo", "TryPlayAsync", "TryPauseAsync", "TryStopAsync", "TryRecordAsync", "TryFastForwardAsync", "TryRewindAsync", "TrySkipNextAsync", "TrySkipPreviousAsync", "TryChangeChannelUpAsync", "TryChangeChannelDownAsync", "TryTogglePlayPauseAsync", "TryChangeAutoRepeatModeAsync", "TryChangePlaybackRateAsync", "TryChangeShuffleActiveAsync", "TryChangePlaybackPositionAsync", "add_TimelinePropertiesChanged", "remove_TimelinePropertiesChanged", "add_PlaybackInfoChanged", "remove_PlaybackInfoChanged", "add_MediaPropertiesChanged", "remove_MediaPropertiesChanged"]

    /**
     * @type {HSTRING} 
     */
    SourceAppUserModelId {
        get => this.get_SourceAppUserModelId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceAppUserModelId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<GlobalSystemMediaTransportControlsSessionMediaProperties>} 
     */
    TryGetMediaPropertiesAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GlobalSystemMediaTransportControlsSessionMediaProperties, operation)
    }

    /**
     * 
     * @returns {GlobalSystemMediaTransportControlsSessionTimelineProperties} 
     */
    GetTimelineProperties() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GlobalSystemMediaTransportControlsSessionTimelineProperties(result_)
    }

    /**
     * 
     * @returns {GlobalSystemMediaTransportControlsSessionPlaybackInfo} 
     */
    GetPlaybackInfo() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GlobalSystemMediaTransportControlsSessionPlaybackInfo(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryPlayAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryPauseAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryStopAsync() {
        result := ComCall(12, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRecordAsync() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryFastForwardAsync() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRewindAsync() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySkipNextAsync() {
        result := ComCall(16, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySkipPreviousAsync() {
        result := ComCall(17, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryChangeChannelUpAsync() {
        result := ComCall(18, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryChangeChannelDownAsync() {
        result := ComCall(19, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryTogglePlayPauseAsync() {
        result := ComCall(20, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} requestedAutoRepeatMode 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryChangeAutoRepeatModeAsync(requestedAutoRepeatMode) {
        result := ComCall(21, this, "int", requestedAutoRepeatMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Float} requestedPlaybackRate 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryChangePlaybackRateAsync(requestedPlaybackRate) {
        result := ComCall(22, this, "double", requestedPlaybackRate, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Boolean} requestedShuffleState 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryChangeShuffleActiveAsync(requestedShuffleState) {
        result := ComCall(23, this, "int", requestedShuffleState, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} requestedPlaybackPosition 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryChangePlaybackPositionAsync(requestedPlaybackPosition) {
        result := ComCall(24, this, "int64", requestedPlaybackPosition, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSession, TimelinePropertiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TimelinePropertiesChanged(handler) {
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
    remove_TimelinePropertiesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(26, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSession, PlaybackInfoChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackInfoChanged(handler) {
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
    remove_PlaybackInfoChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(28, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSession, MediaPropertiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaPropertiesChanged(handler) {
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
    remove_MediaPropertiesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
