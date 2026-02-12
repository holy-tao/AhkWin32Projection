#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioRenderEffectsManager.ahk
#Include .\IAudioRenderEffectsManager2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioRenderEffectsManager.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represent an audio render effects manager which can be used to discover the audio processing chain on a device for a specific media category and audio processing mode.
 * @remarks
 * To create an instance of AudioRenderEffectsManager, call [AudioEffectsManager.CreateAudioRenderEffectsManager](audioeffectsmanager_createaudiorendereffectsmanager_1253909866.md).
 * 
 * See the [Audio effects discovery sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Audio%20effects%20discovery%20sample) for an example of how to query and monitor audio effects on render and capture audio devices.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audiorendereffectsmanager
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class AudioRenderEffectsManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioRenderEffectsManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioRenderEffectsManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the thumbnail image that is associated with this audio effects provider.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audiorendereffectsmanager.effectsproviderthumbnail
     * @type {IRandomAccessStreamWithContentType} 
     */
    EffectsProviderThumbnail {
        get => this.get_EffectsProviderThumbnail()
    }

    /**
     * Gets the label that is associated with this audio effects provider setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audiorendereffectsmanager.effectsprovidersettingslabel
     * @type {HSTRING} 
     */
    EffectsProviderSettingsLabel {
        get => this.get_EffectsProviderSettingsLabel()
    }

    /**
     * Occurs when audio process chain changes.
     * @type {TypedEventHandler<AudioRenderEffectsManager, IInspectable>}
    */
    OnAudioRenderEffectsChanged {
        get {
            if(!this.HasProp("__OnAudioRenderEffectsChanged")){
                this.__OnAudioRenderEffectsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4be29c7e-449c-576e-a7b8-3a40f2f01dc8}"),
                    AudioRenderEffectsManager,
                    IInspectable
                )
                this.__OnAudioRenderEffectsChangedToken := this.add_AudioRenderEffectsChanged(this.__OnAudioRenderEffectsChanged.iface)
            }
            return this.__OnAudioRenderEffectsChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAudioRenderEffectsChangedToken")) {
            this.remove_AudioRenderEffectsChanged(this.__OnAudioRenderEffectsChangedToken)
            this.__OnAudioRenderEffectsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioRenderEffectsManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioRenderEffectsChanged(handler) {
        if (!this.HasProp("__IAudioRenderEffectsManager")) {
            if ((queryResult := this.QueryInterface(IAudioRenderEffectsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioRenderEffectsManager := IAudioRenderEffectsManager(outPtr)
        }

        return this.__IAudioRenderEffectsManager.add_AudioRenderEffectsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioRenderEffectsChanged(token) {
        if (!this.HasProp("__IAudioRenderEffectsManager")) {
            if ((queryResult := this.QueryInterface(IAudioRenderEffectsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioRenderEffectsManager := IAudioRenderEffectsManager(outPtr)
        }

        return this.__IAudioRenderEffectsManager.remove_AudioRenderEffectsChanged(token)
    }

    /**
     * Gets the list of audio effects on the device.
     * @returns {IVectorView<AudioEffect>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audiorendereffectsmanager.getaudiorendereffects
     */
    GetAudioRenderEffects() {
        if (!this.HasProp("__IAudioRenderEffectsManager")) {
            if ((queryResult := this.QueryInterface(IAudioRenderEffectsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioRenderEffectsManager := IAudioRenderEffectsManager(outPtr)
        }

        return this.__IAudioRenderEffectsManager.GetAudioRenderEffects()
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_EffectsProviderThumbnail() {
        if (!this.HasProp("__IAudioRenderEffectsManager2")) {
            if ((queryResult := this.QueryInterface(IAudioRenderEffectsManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioRenderEffectsManager2 := IAudioRenderEffectsManager2(outPtr)
        }

        return this.__IAudioRenderEffectsManager2.get_EffectsProviderThumbnail()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EffectsProviderSettingsLabel() {
        if (!this.HasProp("__IAudioRenderEffectsManager2")) {
            if ((queryResult := this.QueryInterface(IAudioRenderEffectsManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioRenderEffectsManager2 := IAudioRenderEffectsManager2(outPtr)
        }

        return this.__IAudioRenderEffectsManager2.get_EffectsProviderSettingsLabel()
    }

    /**
     * Displays the audio effect settings page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audiorendereffectsmanager.showsettingsui
     */
    ShowSettingsUI() {
        if (!this.HasProp("__IAudioRenderEffectsManager2")) {
            if ((queryResult := this.QueryInterface(IAudioRenderEffectsManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioRenderEffectsManager2 := IAudioRenderEffectsManager2(outPtr)
        }

        return this.__IAudioRenderEffectsManager2.ShowSettingsUI()
    }

;@endregion Instance Methods
}
