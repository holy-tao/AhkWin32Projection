#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppBroadcastStreamReader.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastBackgroundServiceStreamInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastBackgroundServiceStreamInfo
     * @type {Guid}
     */
    static IID => Guid("{31dc02bc-990a-4904-aa96-fe364381f136}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StreamState", "put_DesiredVideoEncodingBitrate", "get_DesiredVideoEncodingBitrate", "put_BandwidthTestBitrate", "get_BandwidthTestBitrate", "put_AudioCodec", "get_AudioCodec", "get_BroadcastStreamReader", "add_StreamStateChanged", "remove_StreamStateChanged", "add_VideoEncodingResolutionChanged", "remove_VideoEncodingResolutionChanged", "add_VideoEncodingBitrateChanged", "remove_VideoEncodingBitrateChanged"]

    /**
     * @type {Integer} 
     */
    StreamState {
        get => this.get_StreamState()
    }

    /**
     * @type {Integer} 
     */
    DesiredVideoEncodingBitrate {
        get => this.get_DesiredVideoEncodingBitrate()
        set => this.put_DesiredVideoEncodingBitrate(value)
    }

    /**
     * @type {Integer} 
     */
    BandwidthTestBitrate {
        get => this.get_BandwidthTestBitrate()
        set => this.put_BandwidthTestBitrate(value)
    }

    /**
     * @type {HSTRING} 
     */
    AudioCodec {
        get => this.get_AudioCodec()
        set => this.put_AudioCodec(value)
    }

    /**
     * @type {AppBroadcastStreamReader} 
     */
    BroadcastStreamReader {
        get => this.get_BroadcastStreamReader()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StreamState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_DesiredVideoEncodingBitrate(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredVideoEncodingBitrate() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_BandwidthTestBitrate(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BandwidthTestBitrate() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AudioCodec(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioCodec() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppBroadcastStreamReader} 
     */
    get_BroadcastStreamReader() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastStreamReader(value)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, AppBroadcastStreamStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StreamStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_StreamStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoEncodingResolutionChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_VideoEncodingResolutionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoEncodingBitrateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
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
    remove_VideoEncodingBitrateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
