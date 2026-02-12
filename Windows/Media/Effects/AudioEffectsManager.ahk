#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioEffectsManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for creating audio capture and render effects manager objects.
 * @remarks
 * See the [Audio effects discovery sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Audio%20effects%20discovery%20sample) for an example of how to query and monitor audio effects on render and capture audio devices.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectsmanager
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class AudioEffectsManager extends IInspectable {
;@region Static Methods
    /**
     * Creates a [AudioRenderEffectsManager](audiorendereffectsmanager.md) object for the specified device for a specific media category.
     * @param {HSTRING} deviceId The device id.
     * @param {Integer} category The audio render category.
     * @returns {AudioRenderEffectsManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectsmanager.createaudiorendereffectsmanager
     */
    static CreateAudioRenderEffectsManager(deviceId, category) {
        if (!AudioEffectsManager.HasProp("__IAudioEffectsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.AudioEffectsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEffectsManagerStatics.IID)
            AudioEffectsManager.__IAudioEffectsManagerStatics := IAudioEffectsManagerStatics(factoryPtr)
        }

        return AudioEffectsManager.__IAudioEffectsManagerStatics.CreateAudioRenderEffectsManager(deviceId, category)
    }

    /**
     * Creates a [AudioRenderEffectsManager](audiorendereffectsmanager.md) object for the specified device for a specific media category and audio processing mode.
     * @param {HSTRING} deviceId The device id.
     * @param {Integer} category The audio render category.
     * @param {Integer} mode_ 
     * @returns {AudioRenderEffectsManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectsmanager.createaudiorendereffectsmanager
     */
    static CreateAudioRenderEffectsManagerWithMode(deviceId, category, mode_) {
        if (!AudioEffectsManager.HasProp("__IAudioEffectsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.AudioEffectsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEffectsManagerStatics.IID)
            AudioEffectsManager.__IAudioEffectsManagerStatics := IAudioEffectsManagerStatics(factoryPtr)
        }

        return AudioEffectsManager.__IAudioEffectsManagerStatics.CreateAudioRenderEffectsManagerWithMode(deviceId, category, mode_)
    }

    /**
     * Creates a [AudioCaptureEffectsManager](audiocaptureeffectsmanager.md) object for the specified device for a specific media category and audio processing mode.
     * @param {HSTRING} deviceId The device id.
     * @param {Integer} category The media category.
     * @returns {AudioCaptureEffectsManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectsmanager.createaudiocaptureeffectsmanager
     */
    static CreateAudioCaptureEffectsManager(deviceId, category) {
        if (!AudioEffectsManager.HasProp("__IAudioEffectsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.AudioEffectsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEffectsManagerStatics.IID)
            AudioEffectsManager.__IAudioEffectsManagerStatics := IAudioEffectsManagerStatics(factoryPtr)
        }

        return AudioEffectsManager.__IAudioEffectsManagerStatics.CreateAudioCaptureEffectsManager(deviceId, category)
    }

    /**
     * Creates a [AudioCaptureEffectsManager](audiocaptureeffectsmanager.md) object for the specified device for a specific media category.
     * @param {HSTRING} deviceId The device id.
     * @param {Integer} category The media category.
     * @param {Integer} mode_ 
     * @returns {AudioCaptureEffectsManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectsmanager.createaudiocaptureeffectsmanager
     */
    static CreateAudioCaptureEffectsManagerWithMode(deviceId, category, mode_) {
        if (!AudioEffectsManager.HasProp("__IAudioEffectsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.AudioEffectsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEffectsManagerStatics.IID)
            AudioEffectsManager.__IAudioEffectsManagerStatics := IAudioEffectsManagerStatics(factoryPtr)
        }

        return AudioEffectsManager.__IAudioEffectsManagerStatics.CreateAudioCaptureEffectsManagerWithMode(deviceId, category, mode_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
