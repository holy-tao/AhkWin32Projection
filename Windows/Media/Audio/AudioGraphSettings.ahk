#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioGraphSettings.ahk
#Include .\IAudioGraphSettings2.ahk
#Include .\IAudioGraphSettingsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents initialization settings for an audio graph. Set the properties of this object to your desired values and then call [AudioGraph.CreateAsync](audiograph_createasync_145006550.md) to create a new audio graph instance with the specified settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioGraphSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioGraphSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioGraphSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [AudioGraphSettings](audiographsettings.md) class with initial settings values optimized for the specified [AudioRenderCategory](audiographsettings_audiorendercategory.md).
     * @param {Integer} audioRenderCategory_ The [AudioRenderCategory](audiographsettings_audiorendercategory.md) that determines the initial settings values.
     * @returns {AudioGraphSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings.#ctor
     */
    static Create(audioRenderCategory_) {
        if (!AudioGraphSettings.HasProp("__IAudioGraphSettingsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioGraphSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioGraphSettingsFactory.IID)
            AudioGraphSettings.__IAudioGraphSettingsFactory := IAudioGraphSettingsFactory(factoryPtr)
        }

        return AudioGraphSettings.__IAudioGraphSettingsFactory.Create(audioRenderCategory_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the audio encoding properties setting for the audio graph.
     * @remarks
     * Audio graphs always operate using 32-bit float encoding, regardless of the [Subtype](../windows.media.mediaproperties/audioencodingproperties_subtype.md) value in the specified [AudioEncodingProperties](../windows.media.mediaproperties/audioencodingproperties.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings.encodingproperties
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
        set => this.put_EncodingProperties(value)
    }

    /**
     * Gets or sets an object that represents the primary render device for the audio graph.
     * @remarks
     * If **PrimaryRenderDevice** is null, the default playback device will be used.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings.primaryrenderdevice
     * @type {DeviceInformation} 
     */
    PrimaryRenderDevice {
        get => this.get_PrimaryRenderDevice()
        set => this.put_PrimaryRenderDevice(value)
    }

    /**
     * Gets or sets the quantum size selection mode for the audio graph.
     * @remarks
     * If the audio graph you created is intended to be used exclusively with files, it is strongly recommended that you set the QuantumSizeSelectionMode to **SystemDefault**.
     * 
     * Selecting **QuantumSizeSelectionMode.LowestLatency** can result in different quantum sizes across different devices or audio endpoints.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings.quantumsizeselectionmode
     * @type {Integer} 
     */
    QuantumSizeSelectionMode {
        get => this.get_QuantumSizeSelectionMode()
        set => this.put_QuantumSizeSelectionMode(value)
    }

    /**
     * Gets or sets the desired number of samples per quantum defined for the audio graph.
     * @remarks
     * Note that this property value is only valid if the [QuantumSizeSelectionMode](audiographsettings_quantumsizeselectionmode.md) property is set to **ClosestToDesired**.
     * 
     * If the audio graph you created is intended to be used exclusively with files, it is strongly recommended that you set the [QuantumSizeSelectionMode](audiographsettings_quantumsizeselectionmode.md) to **SystemDefault**.
     * 
     * Setting this property does not guarantee that the specified value will be used by the created audio graph. To determine the actual value used, check the [AudioGraph.SamplesPerQuantum](audiograph_samplesperquantum.md) property of the audio graph after it has been created.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings.desiredsamplesperquantum
     * @type {Integer} 
     */
    DesiredSamplesPerQuantum {
        get => this.get_DesiredSamplesPerQuantum()
        set => this.put_DesiredSamplesPerQuantum(value)
    }

    /**
     * Gets or sets a value that indicates the audio render category setting for the audio graph.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings.audiorendercategory
     * @type {Integer} 
     */
    AudioRenderCategory {
        get => this.get_AudioRenderCategory()
        set => this.put_AudioRenderCategory(value)
    }

    /**
     * Gets or sets a value that indicates the desired audio processing mode setting for the audio graph.
     * @remarks
     * Setting this property does not guarantee that the specified value will be used by the created audio graph. To determine the actual value used, check the [AudioGraph.RenderDeviceAudioProcessing](audiograph_renderdeviceaudioprocessing.md) property of the audio graph after it has been created.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings.desiredrenderdeviceaudioprocessing
     * @type {Integer} 
     */
    DesiredRenderDeviceAudioProcessing {
        get => this.get_DesiredRenderDeviceAudioProcessing()
        set => this.put_DesiredRenderDeviceAudioProcessing(value)
    }

    /**
     * Gets or sets the maximum playback speed of input nodes in the [AudioGraph](audiograph.md).
     * @remarks
     * Properties that set the playback speed of a node, such as [AudioFileInputNode.PlaybackSpeedFactor](audiofileinputnode_playbackspeedfactor.md), [AudioFrameInputNode.PlaybackSpeedFactor](audioframeinputnode_playbackspeedfactor.md), or [MediaSourceAudioInputNode.PlaybackSpeedFactor](../windows.media.audio/mediasourceaudioinputnode_playbackspeedfactor.md), will be clamped to the maximum value specified by **MaxPlaybackSpeedFactor** when the audio graph was created. 
     * 
     * > [!Important] 
     * > When an audio graph supports a playback speed factor greater than 1, the system must allocate additional memory in order to maintain a sufficient buffer of audio data. For this reason, setting **MaxPlaybackSpeedFactor** to the lowest value required by your app will reduce the memory consumption of your app. If your app will only play back content at normal speed, it is recommended that you set **MaxPlaybackSpeedFactor** to 1.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographsettings.maxplaybackspeedfactor
     * @type {Float} 
     */
    MaxPlaybackSpeedFactor {
        get => this.get_MaxPlaybackSpeedFactor()
        set => this.put_MaxPlaybackSpeedFactor(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_EncodingProperties() {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.get_EncodingProperties()
    }

    /**
     * 
     * @param {AudioEncodingProperties} value 
     * @returns {HRESULT} 
     */
    put_EncodingProperties(value) {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.put_EncodingProperties(value)
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_PrimaryRenderDevice() {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.get_PrimaryRenderDevice()
    }

    /**
     * 
     * @param {DeviceInformation} value 
     * @returns {HRESULT} 
     */
    put_PrimaryRenderDevice(value) {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.put_PrimaryRenderDevice(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QuantumSizeSelectionMode() {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.get_QuantumSizeSelectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_QuantumSizeSelectionMode(value) {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.put_QuantumSizeSelectionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredSamplesPerQuantum() {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.get_DesiredSamplesPerQuantum()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredSamplesPerQuantum(value) {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.put_DesiredSamplesPerQuantum(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioRenderCategory() {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.get_AudioRenderCategory()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioRenderCategory(value) {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.put_AudioRenderCategory(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredRenderDeviceAudioProcessing() {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.get_DesiredRenderDeviceAudioProcessing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredRenderDeviceAudioProcessing(value) {
        if (!this.HasProp("__IAudioGraphSettings")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings := IAudioGraphSettings(outPtr)
        }

        return this.__IAudioGraphSettings.put_DesiredRenderDeviceAudioProcessing(value)
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxPlaybackSpeedFactor(value) {
        if (!this.HasProp("__IAudioGraphSettings2")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings2 := IAudioGraphSettings2(outPtr)
        }

        return this.__IAudioGraphSettings2.put_MaxPlaybackSpeedFactor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxPlaybackSpeedFactor() {
        if (!this.HasProp("__IAudioGraphSettings2")) {
            if ((queryResult := this.QueryInterface(IAudioGraphSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphSettings2 := IAudioGraphSettings2(outPtr)
        }

        return this.__IAudioGraphSettings2.get_MaxPlaybackSpeedFactor()
    }

;@endregion Instance Methods
}
