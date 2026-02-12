#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioEffect.ahk
#Include .\IAudioEffect2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an audio effect.
 * @remarks
 * The [AudioCaptureEffectsManager](audiocaptureeffectsmanager.md) and [AudioRenderEffectsManager](audiorendereffectsmanager.md) classes can be used to discover the audio processing chain on a device.
 * 
 * See the [Audio effects discovery sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Audio%20effects%20discovery%20sample) for an example of how to query and monitor audio effects on render and capture audio devices.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffect
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class AudioEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioEffect.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of the audio effect.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffect.audioeffecttype
     * @type {Integer} 
     */
    AudioEffectType {
        get => this.get_AudioEffectType()
    }

    /**
     * Gets the [AcousticEchoCancellationConfiguration](/uwp/api/windows.media.effects.acousticechocancellationconfiguration) associated with the audio effect.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffect.acousticechocancellationconfiguration
     * @type {AcousticEchoCancellationConfiguration} 
     */
    AcousticEchoCancellationConfiguration {
        get => this.get_AcousticEchoCancellationConfiguration()
    }

    /**
     * Gets a boolean value indicating whether the audio effect supports setting its internal state with a call to <Windows.Media.Effects.AudioEffect.SetState(Windows.Media.Effects.AudioEffectState)>.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffect.cansetstate
     * @type {Boolean} 
     */
    CanSetState {
        get => this.get_CanSetState()
    }

    /**
     * Gets the current state of the audio effect.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffect.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioEffectType() {
        if (!this.HasProp("__IAudioEffect")) {
            if ((queryResult := this.QueryInterface(IAudioEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffect := IAudioEffect(outPtr)
        }

        return this.__IAudioEffect.get_AudioEffectType()
    }

    /**
     * 
     * @returns {AcousticEchoCancellationConfiguration} 
     */
    get_AcousticEchoCancellationConfiguration() {
        if (!this.HasProp("__IAudioEffect2")) {
            if ((queryResult := this.QueryInterface(IAudioEffect2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffect2 := IAudioEffect2(outPtr)
        }

        return this.__IAudioEffect2.get_AcousticEchoCancellationConfiguration()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSetState() {
        if (!this.HasProp("__IAudioEffect2")) {
            if ((queryResult := this.QueryInterface(IAudioEffect2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffect2 := IAudioEffect2(outPtr)
        }

        return this.__IAudioEffect2.get_CanSetState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IAudioEffect2")) {
            if ((queryResult := this.QueryInterface(IAudioEffect2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffect2 := IAudioEffect2(outPtr)
        }

        return this.__IAudioEffect2.get_State()
    }

    /**
     * Sets the current state of the audio effect.
     * @remarks
     * You should call <xref: Windows.Media.Effects.AudioEffect.CanSetState> to confirm that the audio effect supports setting state before calling this method.
     * @param {Integer} newState A value from the [AudioEffectState](/uwp/api/windows.media.effects.audioeffectstate) enumeration specifying the new state of the audio effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffect.setstate
     */
    SetState(newState) {
        if (!this.HasProp("__IAudioEffect2")) {
            if ((queryResult := this.QueryInterface(IAudioEffect2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffect2 := IAudioEffect2(outPtr)
        }

        return this.__IAudioEffect2.SetState(newState)
    }

;@endregion Instance Methods
}
