#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioCaptureEffectsManager.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioCaptureEffectsManager.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an audio capture effects manager which can be used to discover the audio processing chain on a device for a specific media category and audio processing mode.
 * @remarks
 * To create an instance of **AudioCaptureEffectsManager**, call [AudioEffectsManager.CreateAudioCaptureEffectsManager](audioeffectsmanager_createaudiocaptureeffectsmanager_1036225902.md). Or, you can get an instance of this class from an [AudioDeviceController](/uwp/api/windows.media.devices.audiodevicecontroller) by accessing the [AudioCaptureEffectsManager](/uwp/api/windows.media.devices.audiodevicecontroller.audiocaptureeffectsmanager) property.
 * 
 * See the [Audio effects discovery sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Audio%20effects%20discovery%20sample) for an example of how to query and monitor audio effects on render and capture audio devices.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audiocaptureeffectsmanager
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class AudioCaptureEffectsManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioCaptureEffectsManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioCaptureEffectsManager.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAudioCaptureEffectsChangedToken")) {
            this.remove_AudioCaptureEffectsChanged(this.__OnAudioCaptureEffectsChangedToken)
            this.__OnAudioCaptureEffectsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioCaptureEffectsManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioCaptureEffectsChanged(handler) {
        if (!this.HasProp("__IAudioCaptureEffectsManager")) {
            if ((queryResult := this.QueryInterface(IAudioCaptureEffectsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioCaptureEffectsManager := IAudioCaptureEffectsManager(outPtr)
        }

        return this.__IAudioCaptureEffectsManager.add_AudioCaptureEffectsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioCaptureEffectsChanged(token) {
        if (!this.HasProp("__IAudioCaptureEffectsManager")) {
            if ((queryResult := this.QueryInterface(IAudioCaptureEffectsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioCaptureEffectsManager := IAudioCaptureEffectsManager(outPtr)
        }

        return this.__IAudioCaptureEffectsManager.remove_AudioCaptureEffectsChanged(token)
    }

    /**
     * Gets the list of audio effects on the device.
     * @returns {IVectorView<AudioEffect>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audiocaptureeffectsmanager.getaudiocaptureeffects
     */
    GetAudioCaptureEffects() {
        if (!this.HasProp("__IAudioCaptureEffectsManager")) {
            if ((queryResult := this.QueryInterface(IAudioCaptureEffectsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioCaptureEffectsManager := IAudioCaptureEffectsManager(outPtr)
        }

        return this.__IAudioCaptureEffectsManager.GetAudioCaptureEffects()
    }

;@endregion Instance Methods
}
