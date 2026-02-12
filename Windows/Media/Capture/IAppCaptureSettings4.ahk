#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureSettings4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureSettings4
     * @type {Guid}
     */
    static IID => Guid("{07c2774c-1a81-482f-a244-049d95f25b0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_IsMicrophoneCaptureEnabledByDefault", "get_IsMicrophoneCaptureEnabledByDefault", "put_SystemAudioGain", "get_SystemAudioGain", "put_MicrophoneGain", "get_MicrophoneGain", "put_VideoEncodingFrameRateMode", "get_VideoEncodingFrameRateMode"]

    /**
     * @type {Boolean} 
     */
    IsMicrophoneCaptureEnabledByDefault {
        get => this.get_IsMicrophoneCaptureEnabledByDefault()
        set => this.put_IsMicrophoneCaptureEnabledByDefault(value)
    }

    /**
     * @type {Float} 
     */
    SystemAudioGain {
        get => this.get_SystemAudioGain()
        set => this.put_SystemAudioGain(value)
    }

    /**
     * @type {Float} 
     */
    MicrophoneGain {
        get => this.get_MicrophoneGain()
        set => this.put_MicrophoneGain(value)
    }

    /**
     * @type {Integer} 
     */
    VideoEncodingFrameRateMode {
        get => this.get_VideoEncodingFrameRateMode()
        set => this.put_VideoEncodingFrameRateMode(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMicrophoneCaptureEnabledByDefault(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMicrophoneCaptureEnabledByDefault() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_SystemAudioGain(value) {
        result := ComCall(8, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SystemAudioGain() {
        result := ComCall(9, this, "double*", &value := 0, "int")
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
    put_MicrophoneGain(value) {
        result := ComCall(10, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MicrophoneGain() {
        result := ComCall(11, this, "double*", &value := 0, "int")
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
    put_VideoEncodingFrameRateMode(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoEncodingFrameRateMode() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
