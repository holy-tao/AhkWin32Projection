#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include .\AppBroadcastStreamAudioFrame.ahk
#Include .\AppBroadcastStreamVideoFrame.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastStreamReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastStreamReader
     * @type {Guid}
     */
    static IID => Guid("{b338bcf9-3364-4460-b5f1-3cc2796a8aa2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioChannels", "get_AudioSampleRate", "get_AudioAacSequence", "get_AudioBitrate", "TryGetNextAudioFrame", "get_VideoWidth", "get_VideoHeight", "get_VideoBitrate", "TryGetNextVideoFrame", "add_AudioFrameArrived", "remove_AudioFrameArrived", "add_VideoFrameArrived", "remove_VideoFrameArrived"]

    /**
     * @type {Integer} 
     */
    AudioChannels {
        get => this.get_AudioChannels()
    }

    /**
     * @type {Integer} 
     */
    AudioSampleRate {
        get => this.get_AudioSampleRate()
    }

    /**
     * @type {IBuffer} 
     */
    AudioAacSequence {
        get => this.get_AudioAacSequence()
    }

    /**
     * @type {Integer} 
     */
    AudioBitrate {
        get => this.get_AudioBitrate()
    }

    /**
     * @type {Integer} 
     */
    VideoWidth {
        get => this.get_VideoWidth()
    }

    /**
     * @type {Integer} 
     */
    VideoHeight {
        get => this.get_VideoHeight()
    }

    /**
     * @type {Integer} 
     */
    VideoBitrate {
        get => this.get_VideoBitrate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioChannels() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioSampleRate() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AudioAacSequence() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioBitrate() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppBroadcastStreamAudioFrame} 
     */
    TryGetNextAudioFrame() {
        result := ComCall(10, this, "ptr*", &frame_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastStreamAudioFrame(frame_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoWidth() {
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
    get_VideoHeight() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoBitrate() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppBroadcastStreamVideoFrame} 
     */
    TryGetNextVideoFrame() {
        result := ComCall(14, this, "ptr*", &frame_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastStreamVideoFrame(frame_)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastStreamReader, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_AudioFrameArrived(value) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", value, "ptr", token, "int")
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
    remove_AudioFrameArrived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastStreamReader, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_VideoFrameArrived(value) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", value, "ptr", token, "int")
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
    remove_VideoFrameArrived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
