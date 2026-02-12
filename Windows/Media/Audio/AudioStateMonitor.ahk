#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioStateMonitor.ahk
#Include .\IAudioStateMonitorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioStateMonitor.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Allows a UWP app to determine if any of the app's audio streams are currently being muted or having their volume reduced by the system.
 * @remarks
 * Windows dynamically mutes or lowers the level of audio streams in response to system events. For example, the volume of a podcast app's audio render stream may be lowered while an alarm is ringing. Or an audio recording app may have their capture stream muted when the app moves to the background. This class allows apps to respond to changes in the level of their audio streams. For example, a podcast app may choose to pause playback when the sound level is lowered by the system and then resume playback when the volume level returns to normal. Or, an audio recording app may choose to stop recording while its capture stream is muted.
 * 
 * Create an **AudioStateMonitor** by calling one of its factory methods that determines which streams are monitored based on their [MediaCategory](../windows.media.capture/mediacategory.md), [AudioDeviceRole](../windows.media.devices/audiodevicerole.md), the ID of the associated audio device, and whether the stream is capturing or rendering audio. 
 * 
 * Use the [SoundLevel](../windows.media/soundlevel.md) property to determine the current sound level of the monitored streams. You can check the value of this property, to determine if a category of audio streams will be muted or have its volume lowered, before initiating audio capture or playback. You can register a handler for the [SoundLevelChanged](audiostatemonitor_soundlevelchanged.md) event to receive notifications when the sound level for a category of audio streams changes, and then check the **SoundLevel** property to determine the new current audio level.
 * 
 * For more information on using **AudioStateMonitor** in a UWP app, see [Detect and respond to audio state changes](/windows/uwp/audio-video-camera/detect-and-respond-to-audio-state-changes).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioStateMonitor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioStateMonitor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioStateMonitor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [AudioStateMonitor](audiostatemonitor.md) class that monitors the sound level for audio render streams with the specified [MediaCategory](../windows.media.capture/mediacategory.md).
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. Other factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on their [AudioDeviceRole](../windows.media.devices/audiodevicerole.md), the ID of the associated audio device, and whether the stream is capturing or rendering audio.
     * @returns {AudioStateMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.createforrendermonitoring
     */
    static CreateForRenderMonitoring() {
        if (!AudioStateMonitor.HasProp("__IAudioStateMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioStateMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStateMonitorStatics.IID)
            AudioStateMonitor.__IAudioStateMonitorStatics := IAudioStateMonitorStatics(factoryPtr)
        }

        return AudioStateMonitor.__IAudioStateMonitorStatics.CreateForRenderMonitoring()
    }

    /**
     * Initializes a new instance of the [AudioStateMonitor](audiostatemonitor.md) class that monitors the sound level for render streams with the specified [MediaCategory](../windows.media.capture/mediacategory.md) and  [AudioDeviceRole](../windows.media.devices/audiodevicerole.md).
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. Other factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on the ID of the associated audio device and whether the stream is capturing or rendering audio.
     * @param {Integer} category A value from the [MediaCategory](../windows.media.capture/mediacategory.md) enumeration indicating the categories of audio streams that will be monitored. The system may use the category of an audio stream to determine if it should be muted or have its volume lowered in response to a particular system event.
     * @returns {AudioStateMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.createforrendermonitoring
     */
    static CreateForRenderMonitoringWithCategory(category) {
        if (!AudioStateMonitor.HasProp("__IAudioStateMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioStateMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStateMonitorStatics.IID)
            AudioStateMonitor.__IAudioStateMonitorStatics := IAudioStateMonitorStatics(factoryPtr)
        }

        return AudioStateMonitor.__IAudioStateMonitorStatics.CreateForRenderMonitoringWithCategory(category)
    }

    /**
     * Initializes a new instance of the [AudioStateMonitor](audiostatemonitor.md) class that monitors the sound level for all audio render streams.
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. Other factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on their [MediaCategory](../windows.media.capture/mediacategory.md), [AudioDeviceRole](../windows.media.devices/audiodevicerole.md), the ID of the associated audio device, and whether the stream is capturing or rendering audio.
     * @param {Integer} category 
     * @param {Integer} role 
     * @returns {AudioStateMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.createforrendermonitoring
     */
    static CreateForRenderMonitoringWithCategoryAndDeviceRole(category, role) {
        if (!AudioStateMonitor.HasProp("__IAudioStateMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioStateMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStateMonitorStatics.IID)
            AudioStateMonitor.__IAudioStateMonitorStatics := IAudioStateMonitorStatics(factoryPtr)
        }

        return AudioStateMonitor.__IAudioStateMonitorStatics.CreateForRenderMonitoringWithCategoryAndDeviceRole(category, role)
    }

    /**
     * Initializes a new instance of the [AudioStateMonitor](audiostatemonitor.md) class that monitors the sound level for audio render streams with the specified [MediaCategory](../windows.media.capture/mediacategory.md) that are using the specified audio device.
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. Other factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on their [AudioDeviceRole](../windows.media.devices/audiodevicerole.md) and whether the stream is capturing or rendering audio. 
     * 
     * Call [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_326280522.md), passing in the value returned by [GetAudioRenderSelector](../windows.media.devices/mediadevice_getaudiorenderselector_1223331501.md), to get the list of  [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects representing the available audio render devices.
     * @param {Integer} category A value from the [MediaCategory](../windows.media.capture/mediacategory.md) enumeration indicating the categories of audio streams that will be monitored. The system may use the category of an audio stream to determine if it should be muted or have its volume lowered in response to a particular system event.
     * @param {HSTRING} deviceId A string containing the unique identifier of a audio device for which associated audio streams will be monitored.
     * @returns {AudioStateMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.createforrendermonitoringwithcategoryanddeviceid
     */
    static CreateForRenderMonitoringWithCategoryAndDeviceId(category, deviceId) {
        if (!AudioStateMonitor.HasProp("__IAudioStateMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioStateMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStateMonitorStatics.IID)
            AudioStateMonitor.__IAudioStateMonitorStatics := IAudioStateMonitorStatics(factoryPtr)
        }

        return AudioStateMonitor.__IAudioStateMonitorStatics.CreateForRenderMonitoringWithCategoryAndDeviceId(category, deviceId)
    }

    /**
     * Initializes a new instance of the [AudioStateMonitor](audiostatemonitor.md) class that monitors the sound level for audio capture streams with the specified [MediaCategory](../windows.media.capture/mediacategory.md).
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. Other factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on their [AudioDeviceRole](../windows.media.devices/audiodevicerole.md), the ID of the associated audio device, and whether the stream is capturing or rendering audio.
     * @returns {AudioStateMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.createforcapturemonitoring
     */
    static CreateForCaptureMonitoring() {
        if (!AudioStateMonitor.HasProp("__IAudioStateMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioStateMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStateMonitorStatics.IID)
            AudioStateMonitor.__IAudioStateMonitorStatics := IAudioStateMonitorStatics(factoryPtr)
        }

        return AudioStateMonitor.__IAudioStateMonitorStatics.CreateForCaptureMonitoring()
    }

    /**
     * Initializes a new instance of the [AudioStateMonitor](audiostatemonitor.md) class that monitors the sound level for audio capture streams with the specified [MediaCategory](../windows.media.capture/mediacategory.md) and  [AudioDeviceRole](../windows.media.devices/audiodevicerole.md).
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. Other factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on the ID of the associated audio device and whether the stream is capturing or rendering audio.
     * @param {Integer} category A value from the [MediaCategory](../windows.media.capture/mediacategory.md) enumeration indicating the categories of audio streams that will be monitored. The system may use the category of an audio stream to determine if it should be muted or have its volume lowered in response to a particular system event.
     * @returns {AudioStateMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.createforcapturemonitoring
     */
    static CreateForCaptureMonitoringWithCategory(category) {
        if (!AudioStateMonitor.HasProp("__IAudioStateMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioStateMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStateMonitorStatics.IID)
            AudioStateMonitor.__IAudioStateMonitorStatics := IAudioStateMonitorStatics(factoryPtr)
        }

        return AudioStateMonitor.__IAudioStateMonitorStatics.CreateForCaptureMonitoringWithCategory(category)
    }

    /**
     * Initializes a new instance of the [AudioStateMonitor](audiostatemonitor.md) class that monitors the sound level for all audio capture streams.
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. Other factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on their [MediaCategory](../windows.media.capture/mediacategory.md), [AudioDeviceRole](../windows.media.devices/audiodevicerole.md), the ID of the associated audio device, and whether the stream is capturing or rendering audio.
     * @param {Integer} category 
     * @param {Integer} role 
     * @returns {AudioStateMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.createforcapturemonitoring
     */
    static CreateForCaptureMonitoringWithCategoryAndDeviceRole(category, role) {
        if (!AudioStateMonitor.HasProp("__IAudioStateMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioStateMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStateMonitorStatics.IID)
            AudioStateMonitor.__IAudioStateMonitorStatics := IAudioStateMonitorStatics(factoryPtr)
        }

        return AudioStateMonitor.__IAudioStateMonitorStatics.CreateForCaptureMonitoringWithCategoryAndDeviceRole(category, role)
    }

    /**
     * Initializes a new instance of the [AudioStateMonitor](audiostatemonitor.md) class that monitors the sound level for audio capture streams with the specified [MediaCategory](../windows.media.capture/mediacategory.md) that are using the specified audio device.
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. Other factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on their [AudioDeviceRole](../windows.media.devices/audiodevicerole.md) and whether the stream is capturing or rendering audio. 
     * 
     * Call [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_326280522.md), passing in the value returned by [GetAudioCaptureSelector](../windows.media.devices/mediadevice_getaudiocaptureselector_829052994.md), to get the list of  [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects representing the available audio capture devices.
     * @param {Integer} category A value from the [MediaCategory](../windows.media.capture/mediacategory.md) enumeration indicating the categories of audio streams that will be monitored. The system may use the category of an audio stream to determine if it should be muted or have its volume lowered in response to a particular system event.
     * @param {HSTRING} deviceId A string containing the unique identifier of a audio device for which associated audio streams will be monitored.
     * @returns {AudioStateMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.createforcapturemonitoringwithcategoryanddeviceid
     */
    static CreateForCaptureMonitoringWithCategoryAndDeviceId(category, deviceId) {
        if (!AudioStateMonitor.HasProp("__IAudioStateMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioStateMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStateMonitorStatics.IID)
            AudioStateMonitor.__IAudioStateMonitorStatics := IAudioStateMonitorStatics(factoryPtr)
        }

        return AudioStateMonitor.__IAudioStateMonitorStatics.CreateForCaptureMonitoringWithCategoryAndDeviceId(category, deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating the current sound level of the audio streams being monitored by the [AudioStateMonitor](audiostatemonitor.md).
     * @remarks
     * The method you use to instantiate **AudioStateMonitor** determines which audio streams are monitored. The different factory methods of the **AudioStateMonitor** class allow you to monitor the level of audio streams based on their [MediaCategory](../windows.media.capture/mediacategory.md), [AudioDeviceRole](../windows.media.devices/audiodevicerole.md), the ID of the associated audio device, and whether the stream is capturing or rendering audio. 
     * 
     * You can check the value of this property, to determine if a category of audio streams will be muted or have its volume lowered, before initiating audio capture or playback. You can register a handler for the [SoundLevelChanged](audiostatemonitor_soundlevelchanged.md) event to receive notifications when the sound level for a category of audio streams changes, and then check the **SoundLevel** property to determine the new current audio level.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiostatemonitor.soundlevel
     * @type {Integer} 
     */
    SoundLevel {
        get => this.get_SoundLevel()
    }

    /**
     * Occurs when the system changes the sound level of the audio streams being monitored by the [AudioStateMonitor](audiostatemonitor.md).
     * @remarks
     * Windows dynamically mutes or lowers the level of audio streams in response to system events. For example, the volume of a podcast app's audio render stream may be lowered while an alarm is ringing. Or an audio recording app may have their capture stream muted when the app moves to the background. Register a handler for this event to receive notifications when the sound level for a category of audio streams changes, and then check the [SoundLevel](../windows.media/soundlevel.md) property to determine the new current audio level.
     * @type {TypedEventHandler<AudioStateMonitor, IInspectable>}
    */
    OnSoundLevelChanged {
        get {
            if(!this.HasProp("__OnSoundLevelChanged")){
                this.__OnSoundLevelChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1333df3f-c55b-5a23-9596-34657c2a3406}"),
                    AudioStateMonitor,
                    IInspectable
                )
                this.__OnSoundLevelChangedToken := this.add_SoundLevelChanged(this.__OnSoundLevelChanged.iface)
            }
            return this.__OnSoundLevelChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSoundLevelChangedToken")) {
            this.remove_SoundLevelChanged(this.__OnSoundLevelChangedToken)
            this.__OnSoundLevelChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioStateMonitor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SoundLevelChanged(handler) {
        if (!this.HasProp("__IAudioStateMonitor")) {
            if ((queryResult := this.QueryInterface(IAudioStateMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStateMonitor := IAudioStateMonitor(outPtr)
        }

        return this.__IAudioStateMonitor.add_SoundLevelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SoundLevelChanged(token) {
        if (!this.HasProp("__IAudioStateMonitor")) {
            if ((queryResult := this.QueryInterface(IAudioStateMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStateMonitor := IAudioStateMonitor(outPtr)
        }

        return this.__IAudioStateMonitor.remove_SoundLevelChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SoundLevel() {
        if (!this.HasProp("__IAudioStateMonitor")) {
            if ((queryResult := this.QueryInterface(IAudioStateMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStateMonitor := IAudioStateMonitor(outPtr)
        }

        return this.__IAudioStateMonitor.get_SoundLevel()
    }

;@endregion Instance Methods
}
