#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSource
     * @type {Guid}
     */
    static IID => Guid("{4c7332ef-d39f-4396-b4d9-043957a7c964}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsLive", "get_DesiredLiveOffset", "put_DesiredLiveOffset", "get_InitialBitrate", "put_InitialBitrate", "get_CurrentDownloadBitrate", "get_CurrentPlaybackBitrate", "get_AvailableBitrates", "get_DesiredMinBitrate", "put_DesiredMinBitrate", "get_DesiredMaxBitrate", "put_DesiredMaxBitrate", "get_AudioOnlyPlayback", "get_InboundBitsPerSecond", "get_InboundBitsPerSecondWindow", "put_InboundBitsPerSecondWindow", "add_DownloadBitrateChanged", "remove_DownloadBitrateChanged", "add_PlaybackBitrateChanged", "remove_PlaybackBitrateChanged", "add_DownloadRequested", "remove_DownloadRequested", "add_DownloadCompleted", "remove_DownloadCompleted", "add_DownloadFailed", "remove_DownloadFailed"]

    /**
     * @type {Boolean} 
     */
    IsLive {
        get => this.get_IsLive()
    }

    /**
     * @type {TimeSpan} 
     */
    DesiredLiveOffset {
        get => this.get_DesiredLiveOffset()
        set => this.put_DesiredLiveOffset(value)
    }

    /**
     * @type {Integer} 
     */
    InitialBitrate {
        get => this.get_InitialBitrate()
        set => this.put_InitialBitrate(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentDownloadBitrate {
        get => this.get_CurrentDownloadBitrate()
    }

    /**
     * @type {Integer} 
     */
    CurrentPlaybackBitrate {
        get => this.get_CurrentPlaybackBitrate()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    AvailableBitrates {
        get => this.get_AvailableBitrates()
    }

    /**
     * @type {IReference<Integer>} 
     */
    DesiredMinBitrate {
        get => this.get_DesiredMinBitrate()
        set => this.put_DesiredMinBitrate(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    DesiredMaxBitrate {
        get => this.get_DesiredMaxBitrate()
        set => this.put_DesiredMaxBitrate(value)
    }

    /**
     * @type {Boolean} 
     */
    AudioOnlyPlayback {
        get => this.get_AudioOnlyPlayback()
    }

    /**
     * @type {Integer} 
     */
    InboundBitsPerSecond {
        get => this.get_InboundBitsPerSecond()
    }

    /**
     * @type {TimeSpan} 
     */
    InboundBitsPerSecondWindow {
        get => this.get_InboundBitsPerSecondWindow()
        set => this.put_InboundBitsPerSecondWindow(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLive() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DesiredLiveOffset() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
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
    put_DesiredLiveOffset(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialBitrate() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
    put_InitialBitrate(value) {
        result := ComCall(10, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentDownloadBitrate() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentPlaybackBitrate() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_AvailableBitrates() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DesiredMinBitrate() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_DesiredMinBitrate(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DesiredMaxBitrate() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_DesiredMaxBitrate(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AudioOnlyPlayback() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InboundBitsPerSecond() {
        result := ComCall(19, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_InboundBitsPerSecondWindow() {
        value := TimeSpan()
        result := ComCall(20, this, "ptr", value, "int")
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
    put_InboundBitsPerSecondWindow(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadBitrateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadBitrateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", token, "int")
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
    remove_DownloadBitrateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourcePlaybackBitrateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackBitrateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(24, this, "ptr", handler, "ptr", token, "int")
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
    remove_PlaybackBitrateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(25, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(26, this, "ptr", handler, "ptr", token, "int")
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
    remove_DownloadRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(27, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(28, this, "ptr", handler, "ptr", token, "int")
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
    remove_DownloadCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(29, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadFailed(handler) {
        token := EventRegistrationToken()
        result := ComCall(30, this, "ptr", handler, "ptr", token, "int")
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
    remove_DownloadFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(31, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
