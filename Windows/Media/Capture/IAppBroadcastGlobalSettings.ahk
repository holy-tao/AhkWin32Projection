#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastGlobalSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastGlobalSettings
     * @type {Guid}
     */
    static IID => Guid("{b2cb27a5-70fc-4e17-80bd-6ba0fd3ff3a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBroadcastEnabled", "get_IsDisabledByPolicy", "get_IsGpuConstrained", "get_HasHardwareEncoder", "put_IsAudioCaptureEnabled", "get_IsAudioCaptureEnabled", "put_IsMicrophoneCaptureEnabledByDefault", "get_IsMicrophoneCaptureEnabledByDefault", "put_IsEchoCancellationEnabled", "get_IsEchoCancellationEnabled", "put_SystemAudioGain", "get_SystemAudioGain", "put_MicrophoneGain", "get_MicrophoneGain", "put_IsCameraCaptureEnabledByDefault", "get_IsCameraCaptureEnabledByDefault", "put_SelectedCameraId", "get_SelectedCameraId", "put_CameraOverlayLocation", "get_CameraOverlayLocation", "put_CameraOverlaySize", "get_CameraOverlaySize", "put_IsCursorImageCaptureEnabled", "get_IsCursorImageCaptureEnabled"]

    /**
     * @type {Boolean} 
     */
    IsBroadcastEnabled {
        get => this.get_IsBroadcastEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsDisabledByPolicy {
        get => this.get_IsDisabledByPolicy()
    }

    /**
     * @type {Boolean} 
     */
    IsGpuConstrained {
        get => this.get_IsGpuConstrained()
    }

    /**
     * @type {Boolean} 
     */
    HasHardwareEncoder {
        get => this.get_HasHardwareEncoder()
    }

    /**
     * @type {Boolean} 
     */
    IsAudioCaptureEnabled {
        get => this.get_IsAudioCaptureEnabled()
        set => this.put_IsAudioCaptureEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsMicrophoneCaptureEnabledByDefault {
        get => this.get_IsMicrophoneCaptureEnabledByDefault()
        set => this.put_IsMicrophoneCaptureEnabledByDefault(value)
    }

    /**
     * @type {Boolean} 
     */
    IsEchoCancellationEnabled {
        get => this.get_IsEchoCancellationEnabled()
        set => this.put_IsEchoCancellationEnabled(value)
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
     * @type {Boolean} 
     */
    IsCameraCaptureEnabledByDefault {
        get => this.get_IsCameraCaptureEnabledByDefault()
        set => this.put_IsCameraCaptureEnabledByDefault(value)
    }

    /**
     * @type {HSTRING} 
     */
    SelectedCameraId {
        get => this.get_SelectedCameraId()
        set => this.put_SelectedCameraId(value)
    }

    /**
     * @type {Integer} 
     */
    CameraOverlayLocation {
        get => this.get_CameraOverlayLocation()
        set => this.put_CameraOverlayLocation(value)
    }

    /**
     * @type {Integer} 
     */
    CameraOverlaySize {
        get => this.get_CameraOverlaySize()
        set => this.put_CameraOverlaySize(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCursorImageCaptureEnabled {
        get => this.get_IsCursorImageCaptureEnabled()
        set => this.put_IsCursorImageCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBroadcastEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledByPolicy() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGpuConstrained() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasHardwareEncoder() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_IsAudioCaptureEnabled(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAudioCaptureEnabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_IsMicrophoneCaptureEnabledByDefault(value) {
        result := ComCall(12, this, "int", value, "int")
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
        result := ComCall(13, this, "int*", &value := 0, "int")
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
    put_IsEchoCancellationEnabled(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEchoCancellationEnabled() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
        result := ComCall(16, this, "double", value, "int")
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
        result := ComCall(17, this, "double*", &value := 0, "int")
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
        result := ComCall(18, this, "double", value, "int")
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
        result := ComCall(19, this, "double*", &value := 0, "int")
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
    put_IsCameraCaptureEnabledByDefault(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCameraCaptureEnabledByDefault() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_SelectedCameraId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedCameraId() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
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
    put_CameraOverlayLocation(value) {
        result := ComCall(24, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraOverlayLocation() {
        result := ComCall(25, this, "int*", &value := 0, "int")
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
    put_CameraOverlaySize(value) {
        result := ComCall(26, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraOverlaySize() {
        result := ComCall(27, this, "int*", &value := 0, "int")
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
    put_IsCursorImageCaptureEnabled(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCursorImageCaptureEnabled() {
        result := ComCall(29, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
