#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureSettings.ahk
#Include .\IAppCaptureSettings2.ahk
#Include .\IAppCaptureSettings3.ahk
#Include .\IAppCaptureSettings4.ahk
#Include .\IAppCaptureSettings5.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents app capture settings.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the app capture destination folder.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.appcapturedestinationfolder
     * @type {StorageFolder} 
     */
    AppCaptureDestinationFolder {
        get => this.get_AppCaptureDestinationFolder()
        set => this.put_AppCaptureDestinationFolder(value)
    }

    /**
     * Gets or sets the audio encoding bitrate.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.audioencodingbitrate
     * @type {Integer} 
     */
    AudioEncodingBitrate {
        get => this.get_AudioEncodingBitrate()
        set => this.put_AudioEncodingBitrate(value)
    }

    /**
     * Gets or sets a value indicating whether audio capture is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.isaudiocaptureenabled
     * @type {Boolean} 
     */
    IsAudioCaptureEnabled {
        get => this.get_IsAudioCaptureEnabled()
        set => this.put_IsAudioCaptureEnabled(value)
    }

    /**
     * Gets or sets the custom video encoding bitrate.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.customvideoencodingbitrate
     * @type {Integer} 
     */
    CustomVideoEncodingBitrate {
        get => this.get_CustomVideoEncodingBitrate()
        set => this.put_CustomVideoEncodingBitrate(value)
    }

    /**
     * Gets or sets the custom video encoding height.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.customvideoencodingheight
     * @type {Integer} 
     */
    CustomVideoEncodingHeight {
        get => this.get_CustomVideoEncodingHeight()
        set => this.put_CustomVideoEncodingHeight(value)
    }

    /**
     * Gets the custom video encoding width.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.customvideoencodingwidth
     * @type {Integer} 
     */
    CustomVideoEncodingWidth {
        get => this.get_CustomVideoEncodingWidth()
        set => this.put_CustomVideoEncodingWidth(value)
    }

    /**
     * Gets or sets the historical buffer length.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.historicalbufferlength
     * @type {Integer} 
     */
    HistoricalBufferLength {
        get => this.get_HistoricalBufferLength()
        set => this.put_HistoricalBufferLength(value)
    }

    /**
     * Gets or sets the units of the historical buffer length.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.historicalbufferlengthunit
     * @type {Integer} 
     */
    HistoricalBufferLengthUnit {
        get => this.get_HistoricalBufferLengthUnit()
        set => this.put_HistoricalBufferLengthUnit(value)
    }

    /**
     * Gets or sets a value indicating if historical capture is enabled.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.ishistoricalcaptureenabled
     * @type {Boolean} 
     */
    IsHistoricalCaptureEnabled {
        get => this.get_IsHistoricalCaptureEnabled()
        set => this.put_IsHistoricalCaptureEnabled(value)
    }

    /**
     * Gets or sets a value indicating whether historical capture is allowed while the device is on battery power.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.ishistoricalcaptureonbatteryallowed
     * @type {Boolean} 
     */
    IsHistoricalCaptureOnBatteryAllowed {
        get => this.get_IsHistoricalCaptureOnBatteryAllowed()
        set => this.put_IsHistoricalCaptureOnBatteryAllowed(value)
    }

    /**
     * Gets or sets a value indicating whether historical capture is allowed on wireless displays.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.ishistoricalcaptureonwirelessdisplayallowed
     * @type {Boolean} 
     */
    IsHistoricalCaptureOnWirelessDisplayAllowed {
        get => this.get_IsHistoricalCaptureOnWirelessDisplayAllowed()
        set => this.put_IsHistoricalCaptureOnWirelessDisplayAllowed(value)
    }

    /**
     * Gets or sets the maximum recording length.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.maximumrecordlength
     * @type {TimeSpan} 
     */
    MaximumRecordLength {
        get => this.get_MaximumRecordLength()
        set => this.put_MaximumRecordLength(value)
    }

    /**
     * Gets or sets the screenshot destination folder.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.screenshotdestinationfolder
     * @type {StorageFolder} 
     */
    ScreenshotDestinationFolder {
        get => this.get_ScreenshotDestinationFolder()
        set => this.put_ScreenshotDestinationFolder(value)
    }

    /**
     * Gets or sets the video encoding bitrate.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.videoencodingbitratemode
     * @type {Integer} 
     */
    VideoEncodingBitrateMode {
        get => this.get_VideoEncodingBitrateMode()
        set => this.put_VideoEncodingBitrateMode(value)
    }

    /**
     * Gets or sets the video encoding resolution mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.videoencodingresolutionmode
     * @type {Integer} 
     */
    VideoEncodingResolutionMode {
        get => this.get_VideoEncodingResolutionMode()
        set => this.put_VideoEncodingResolutionMode(value)
    }

    /**
     * Gets or sets a value indicating if app capture is enabled.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.isappcaptureenabled
     * @type {Boolean} 
     */
    IsAppCaptureEnabled {
        get => this.get_IsAppCaptureEnabled()
        set => this.put_IsAppCaptureEnabled(value)
    }

    /**
     * Gets a value indicating if app capture is CPU-constrained.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.iscpuconstrained
     * @type {Boolean} 
     */
    IsCpuConstrained {
        get => this.get_IsCpuConstrained()
    }

    /**
     * Gets a value indicating if app capture is disabled by policy.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.isdisabledbypolicy
     * @type {Boolean} 
     */
    IsDisabledByPolicy {
        get => this.get_IsDisabledByPolicy()
    }

    /**
     * Gets a value indicating whether the device is memory-constrained.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.ismemoryconstrained
     * @type {Boolean} 
     */
    IsMemoryConstrained {
        get => this.get_IsMemoryConstrained()
    }

    /**
     * Gets a value indicating if the device has a hardware encoder.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.hashardwareencoder
     * @type {Boolean} 
     */
    HasHardwareEncoder {
        get => this.get_HasHardwareEncoder()
    }

    /**
     * Gets a value indicating if app capture is GPU-constrained.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.isgpuconstrained
     * @type {Boolean} 
     */
    IsGpuConstrained {
        get => this.get_IsGpuConstrained()
    }

    /**
     * Gets the alternate shortcut key settings.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.alternateshortcutkeys
     * @type {AppCaptureAlternateShortcutKeys} 
     */
    AlternateShortcutKeys {
        get => this.get_AlternateShortcutKeys()
    }

    /**
     * Gets or sets a value indicating if microphone capture is enabled.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.ismicrophonecaptureenabled
     * @type {Boolean} 
     */
    IsMicrophoneCaptureEnabled {
        get => this.get_IsMicrophoneCaptureEnabled()
        set => this.put_IsMicrophoneCaptureEnabled(value)
    }

    /**
     * Gets or sets a value indicating if microphone capture is enabled by default.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.ismicrophonecaptureenabledbydefault
     * @type {Boolean} 
     */
    IsMicrophoneCaptureEnabledByDefault {
        get => this.get_IsMicrophoneCaptureEnabledByDefault()
        set => this.put_IsMicrophoneCaptureEnabledByDefault(value)
    }

    /**
     * Gets or sets a value specifying the gain applied to the system audio.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.systemaudiogain
     * @type {Float} 
     */
    SystemAudioGain {
        get => this.get_SystemAudioGain()
        set => this.put_SystemAudioGain(value)
    }

    /**
     * Gets or sets a value specifying the gain applied to the microphone audio.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.microphonegain
     * @type {Float} 
     */
    MicrophoneGain {
        get => this.get_MicrophoneGain()
        set => this.put_MicrophoneGain(value)
    }

    /**
     * Gets or sets a value indicating the video encoding frame rate mode.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.videoencodingframeratemode
     * @type {Integer} 
     */
    VideoEncodingFrameRateMode {
        get => this.get_VideoEncodingFrameRateMode()
        set => this.put_VideoEncodingFrameRateMode(value)
    }

    /**
     * Gets a value indicating whether echo cancellation is enabled for app capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.isechocancellationenabled
     * @type {Boolean} 
     */
    IsEchoCancellationEnabled {
        get => this.get_IsEchoCancellationEnabled()
        set => this.put_IsEchoCancellationEnabled(value)
    }

    /**
     * Gets a value indicating whether the cursor image is captured.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturesettings.iscursorimagecaptureenabled
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
     * @param {StorageFolder} value 
     * @returns {HRESULT} 
     */
    put_AppCaptureDestinationFolder(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_AppCaptureDestinationFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_AppCaptureDestinationFolder() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_AppCaptureDestinationFolder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioEncodingBitrate(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_AudioEncodingBitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioEncodingBitrate() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_AudioEncodingBitrate()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAudioCaptureEnabled(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_IsAudioCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAudioCaptureEnabled() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_IsAudioCaptureEnabled()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CustomVideoEncodingBitrate(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_CustomVideoEncodingBitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingBitrate() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_CustomVideoEncodingBitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CustomVideoEncodingHeight(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_CustomVideoEncodingHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingHeight() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_CustomVideoEncodingHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CustomVideoEncodingWidth(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_CustomVideoEncodingWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingWidth() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_CustomVideoEncodingWidth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HistoricalBufferLength(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_HistoricalBufferLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HistoricalBufferLength() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_HistoricalBufferLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HistoricalBufferLengthUnit(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_HistoricalBufferLengthUnit(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HistoricalBufferLengthUnit() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_HistoricalBufferLengthUnit()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHistoricalCaptureEnabled(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_IsHistoricalCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHistoricalCaptureEnabled() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_IsHistoricalCaptureEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHistoricalCaptureOnBatteryAllowed(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_IsHistoricalCaptureOnBatteryAllowed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHistoricalCaptureOnBatteryAllowed() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_IsHistoricalCaptureOnBatteryAllowed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHistoricalCaptureOnWirelessDisplayAllowed(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_IsHistoricalCaptureOnWirelessDisplayAllowed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHistoricalCaptureOnWirelessDisplayAllowed() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_IsHistoricalCaptureOnWirelessDisplayAllowed()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_MaximumRecordLength(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_MaximumRecordLength(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaximumRecordLength() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_MaximumRecordLength()
    }

    /**
     * 
     * @param {StorageFolder} value 
     * @returns {HRESULT} 
     */
    put_ScreenshotDestinationFolder(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_ScreenshotDestinationFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_ScreenshotDestinationFolder() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_ScreenshotDestinationFolder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VideoEncodingBitrateMode(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_VideoEncodingBitrateMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoEncodingBitrateMode() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_VideoEncodingBitrateMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VideoEncodingResolutionMode(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_VideoEncodingResolutionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoEncodingResolutionMode() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_VideoEncodingResolutionMode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAppCaptureEnabled(value) {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.put_IsAppCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAppCaptureEnabled() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_IsAppCaptureEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCpuConstrained() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_IsCpuConstrained()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledByPolicy() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_IsDisabledByPolicy()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMemoryConstrained() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_IsMemoryConstrained()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasHardwareEncoder() {
        if (!this.HasProp("__IAppCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings := IAppCaptureSettings(outPtr)
        }

        return this.__IAppCaptureSettings.get_HasHardwareEncoder()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGpuConstrained() {
        if (!this.HasProp("__IAppCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings2 := IAppCaptureSettings2(outPtr)
        }

        return this.__IAppCaptureSettings2.get_IsGpuConstrained()
    }

    /**
     * 
     * @returns {AppCaptureAlternateShortcutKeys} 
     */
    get_AlternateShortcutKeys() {
        if (!this.HasProp("__IAppCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings2 := IAppCaptureSettings2(outPtr)
        }

        return this.__IAppCaptureSettings2.get_AlternateShortcutKeys()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMicrophoneCaptureEnabled(value) {
        if (!this.HasProp("__IAppCaptureSettings3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings3 := IAppCaptureSettings3(outPtr)
        }

        return this.__IAppCaptureSettings3.put_IsMicrophoneCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMicrophoneCaptureEnabled() {
        if (!this.HasProp("__IAppCaptureSettings3")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings3 := IAppCaptureSettings3(outPtr)
        }

        return this.__IAppCaptureSettings3.get_IsMicrophoneCaptureEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMicrophoneCaptureEnabledByDefault(value) {
        if (!this.HasProp("__IAppCaptureSettings4")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings4 := IAppCaptureSettings4(outPtr)
        }

        return this.__IAppCaptureSettings4.put_IsMicrophoneCaptureEnabledByDefault(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMicrophoneCaptureEnabledByDefault() {
        if (!this.HasProp("__IAppCaptureSettings4")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings4 := IAppCaptureSettings4(outPtr)
        }

        return this.__IAppCaptureSettings4.get_IsMicrophoneCaptureEnabledByDefault()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SystemAudioGain(value) {
        if (!this.HasProp("__IAppCaptureSettings4")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings4 := IAppCaptureSettings4(outPtr)
        }

        return this.__IAppCaptureSettings4.put_SystemAudioGain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SystemAudioGain() {
        if (!this.HasProp("__IAppCaptureSettings4")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings4 := IAppCaptureSettings4(outPtr)
        }

        return this.__IAppCaptureSettings4.get_SystemAudioGain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MicrophoneGain(value) {
        if (!this.HasProp("__IAppCaptureSettings4")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings4 := IAppCaptureSettings4(outPtr)
        }

        return this.__IAppCaptureSettings4.put_MicrophoneGain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MicrophoneGain() {
        if (!this.HasProp("__IAppCaptureSettings4")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings4 := IAppCaptureSettings4(outPtr)
        }

        return this.__IAppCaptureSettings4.get_MicrophoneGain()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VideoEncodingFrameRateMode(value) {
        if (!this.HasProp("__IAppCaptureSettings4")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings4 := IAppCaptureSettings4(outPtr)
        }

        return this.__IAppCaptureSettings4.put_VideoEncodingFrameRateMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoEncodingFrameRateMode() {
        if (!this.HasProp("__IAppCaptureSettings4")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings4 := IAppCaptureSettings4(outPtr)
        }

        return this.__IAppCaptureSettings4.get_VideoEncodingFrameRateMode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEchoCancellationEnabled(value) {
        if (!this.HasProp("__IAppCaptureSettings5")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings5 := IAppCaptureSettings5(outPtr)
        }

        return this.__IAppCaptureSettings5.put_IsEchoCancellationEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEchoCancellationEnabled() {
        if (!this.HasProp("__IAppCaptureSettings5")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings5 := IAppCaptureSettings5(outPtr)
        }

        return this.__IAppCaptureSettings5.get_IsEchoCancellationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCursorImageCaptureEnabled(value) {
        if (!this.HasProp("__IAppCaptureSettings5")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings5 := IAppCaptureSettings5(outPtr)
        }

        return this.__IAppCaptureSettings5.put_IsCursorImageCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCursorImageCaptureEnabled() {
        if (!this.HasProp("__IAppCaptureSettings5")) {
            if ((queryResult := this.QueryInterface(IAppCaptureSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureSettings5 := IAppCaptureSettings5(outPtr)
        }

        return this.__IAppCaptureSettings5.get_IsCursorImageCaptureEnabled()
    }

;@endregion Instance Methods
}
