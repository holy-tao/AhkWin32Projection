#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastGlobalSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies global broadcasting settings that persist across all broadcasting UWP apps.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by calling [AppBroadcastManager.GetGlobalSettings](appbroadcastmanager_getglobalsettings_2021185159.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastGlobalSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastGlobalSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastGlobalSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if broadcasting is enabled on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.isbroadcastenabled
     * @type {Boolean} 
     */
    IsBroadcastEnabled {
        get => this.get_IsBroadcastEnabled()
    }

    /**
     * Gets a value that indicates if broadcasting is disabled on the device by group policy.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.isdisabledbypolicy
     * @type {Boolean} 
     */
    IsDisabledByPolicy {
        get => this.get_IsDisabledByPolicy()
    }

    /**
     * Gets a value indicating whether the GPU on the device is constrained.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.isgpuconstrained
     * @type {Boolean} 
     */
    IsGpuConstrained {
        get => this.get_IsGpuConstrained()
    }

    /**
     * Gets a value indicating whether the current device supports hardware-based media encoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.hashardwareencoder
     * @type {Boolean} 
     */
    HasHardwareEncoder {
        get => this.get_HasHardwareEncoder()
    }

    /**
     * Gets or sets a value indicating whether audio capture is enabled for broadcasting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.isaudiocaptureenabled
     * @type {Boolean} 
     */
    IsAudioCaptureEnabled {
        get => this.get_IsAudioCaptureEnabled()
        set => this.put_IsAudioCaptureEnabled(value)
    }

    /**
     * Gets or sets a value indicating whether microphone capture for broadcasting is enabled by default.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.ismicrophonecaptureenabledbydefault
     * @type {Boolean} 
     */
    IsMicrophoneCaptureEnabledByDefault {
        get => this.get_IsMicrophoneCaptureEnabledByDefault()
        set => this.put_IsMicrophoneCaptureEnabledByDefault(value)
    }

    /**
     * Gets or sets a value indicating whether echo cancellation is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.isechocancellationenabled
     * @type {Boolean} 
     */
    IsEchoCancellationEnabled {
        get => this.get_IsEchoCancellationEnabled()
        set => this.put_IsEchoCancellationEnabled(value)
    }

    /**
     * Gets or sets the system gain for broadcast audio capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.systemaudiogain
     * @type {Float} 
     */
    SystemAudioGain {
        get => this.get_SystemAudioGain()
        set => this.put_SystemAudioGain(value)
    }

    /**
     * Gets or sets a value indicating the microphone gain for broadcast audio capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.microphonegain
     * @type {Float} 
     */
    MicrophoneGain {
        get => this.get_MicrophoneGain()
        set => this.put_MicrophoneGain(value)
    }

    /**
     * Gets or sets a value indicating whether camera capture for broadcasting is enabled by default.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.iscameracaptureenabledbydefault
     * @type {Boolean} 
     */
    IsCameraCaptureEnabledByDefault {
        get => this.get_IsCameraCaptureEnabledByDefault()
        set => this.put_IsCameraCaptureEnabledByDefault(value)
    }

    /**
     * Gets or sets a string containing the device ID of the camera used for broadcast video capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.selectedcameraid
     * @type {HSTRING} 
     */
    SelectedCameraId {
        get => this.get_SelectedCameraId()
        set => this.put_SelectedCameraId(value)
    }

    /**
     * Gets or sets a value that specifies the location of the camera overlay within the broadcast video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.cameraoverlaylocation
     * @type {Integer} 
     */
    CameraOverlayLocation {
        get => this.get_CameraOverlayLocation()
        set => this.put_CameraOverlayLocation(value)
    }

    /**
     * Gets or sets a value that specifies the size of the camera overlay within the broadcast video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.cameraoverlaysize
     * @type {Integer} 
     */
    CameraOverlaySize {
        get => this.get_CameraOverlaySize()
        set => this.put_CameraOverlaySize(value)
    }

    /**
     * Gets a value indicating whether the cursor image is captured.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastglobalsettings.iscursorimagecaptureenabled
     * @type {Boolean} 
     */
    IsCursorImageCaptureEnabled {
        get => this.get_IsCursorImageCaptureEnabled()
        set => this.put_IsCursorImageCaptureEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBroadcastEnabled() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_IsBroadcastEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledByPolicy() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_IsDisabledByPolicy()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGpuConstrained() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_IsGpuConstrained()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasHardwareEncoder() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_HasHardwareEncoder()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAudioCaptureEnabled(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_IsAudioCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAudioCaptureEnabled() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_IsAudioCaptureEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMicrophoneCaptureEnabledByDefault(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_IsMicrophoneCaptureEnabledByDefault(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMicrophoneCaptureEnabledByDefault() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_IsMicrophoneCaptureEnabledByDefault()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEchoCancellationEnabled(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_IsEchoCancellationEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEchoCancellationEnabled() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_IsEchoCancellationEnabled()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SystemAudioGain(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_SystemAudioGain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SystemAudioGain() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_SystemAudioGain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MicrophoneGain(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_MicrophoneGain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MicrophoneGain() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_MicrophoneGain()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCameraCaptureEnabledByDefault(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_IsCameraCaptureEnabledByDefault(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCameraCaptureEnabledByDefault() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_IsCameraCaptureEnabledByDefault()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SelectedCameraId(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_SelectedCameraId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedCameraId() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_SelectedCameraId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CameraOverlayLocation(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_CameraOverlayLocation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraOverlayLocation() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_CameraOverlayLocation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CameraOverlaySize(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_CameraOverlaySize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraOverlaySize() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_CameraOverlaySize()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCursorImageCaptureEnabled(value) {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.put_IsCursorImageCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCursorImageCaptureEnabled() {
        if (!this.HasProp("__IAppBroadcastGlobalSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastGlobalSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastGlobalSettings := IAppBroadcastGlobalSettings(outPtr)
        }

        return this.__IAppBroadcastGlobalSettings.get_IsCursorImageCaptureEnabled()
    }

;@endregion Instance Methods
}
