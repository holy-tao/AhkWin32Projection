#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechSynthesizer.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ISpeechSynthesizer2.ahk
#Include .\IInstalledVoicesStatic.ahk
#Include .\IInstalledVoicesStatic2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the functionality of an installed speech synthesis engine (voice) for Text-to-speech (TTS) services.
 * @remarks
 * Only Microsoft-signed voices installed on the system can be used to generate speech.
 * 
 * Windows includes various Microsoft-signed voices that can be used for a number of languages. Each voice generates synthesized speech in a single language, as spoken in a specific country/region.
 * 
 * By default, a new SpeechSynthesizer object uses the current system voice (call [DefaultVoice](speechsynthesizer_defaultvoice.md) to find out what the default voice is).
 * 
 * To specify any of the other speech synthesis (text-to-speech) voices installed on the user's system, use the [Voice](speechsynthesizer_voice.md) method (to find out which [voices](voiceinformation.md) are installed on the system, call [AllVoices](speechsynthesizer_allvoices.md)).
 * 
 * If you don't specify a language, the voice that most closely corresponds to the language selected in the Language control panel is loaded.
 * 
 * Use a SpeechSynthesizer object to:
 * 
 * - Generate speech from plain text using [SynthesizeTextToStreamAsync](speechsynthesizer_synthesizetexttostreamasync_2010301348.md), or [Speech Synthesis Markup Language (SSML) Version 1.1](https://www.w3.org/TR/speech-synthesis/) using [SynthesizeSsmlToStreamAsync](speechsynthesizer_synthesizessmltostreamasync_1873155127.md) (
 * - The generated audio stream is played through a [MediaElement](../windows.ui.xaml.controls/mediaelement.md) object), which lets you manage all media playback.
 * - Control the speech output with the various [SpeechSynthesizerOptions](speechsynthesizeroptions.md) settings exposed through [SpeechSynthesizer.Options](speechsynthesizer_options.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class SpeechSynthesizer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechSynthesizer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechSynthesizer.IID

    /**
     * Gets a collection of all installed speech synthesis engines (voices).
     * @remarks
     * Only Microsoft-signed voices installed on the system can be used to generate speech with a [SpeechSynthesizer](speechsynthesizer.md). Each voice generates synthesized speech in a single language, as spoken in a specific country/region.
     * 
     * By default, a new [SpeechSynthesizer](speechsynthesizer.md) object uses the current system voice (call [DefaultVoice](speechsynthesizer_defaultvoice.md) to find out what the default voice is).
     * 
     * To specify any of the other speech synthesis (text-to-speech) voices installed on the user's system, use the [Voice](speechsynthesizer_voice.md) method (to find out which [voices](voiceinformation.md) are installed on the system, call AllVoices).
     * 
     * If you don't specify a language, the voice that most closely corresponds to the language selected in the Language control panel is loaded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer.allvoices
     * @type {IVectorView<VoiceInformation>} 
     */
    static AllVoices {
        get => SpeechSynthesizer.get_AllVoices()
    }

    /**
     * Gets the default speech synthesis engine (voice).
     * @remarks
     * Only Microsoft-signed voices installed on the system can be used to generate speech with a [SpeechSynthesizer](speechsynthesizer.md). Each voice generates synthesized speech in a single language, as spoken in a specific country/region.
     * 
     * By default, a new [SpeechSynthesizer](speechsynthesizer.md) object uses the current system voice (call DefaultVoice to find out what the default voice is).
     * 
     * To specify any of the other speech synthesis (text-to-speech) voices installed on the user's system, use the [Voice](speechsynthesizer_voice.md) method (to find out which [voices](voiceinformation.md) are installed on the system, call [AllVoices](speechsynthesizer_allvoices.md)).
     * 
     * If you don't specify a language, the voice that most closely corresponds to the language selected in the Language control panel is loaded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer.defaultvoice
     * @type {VoiceInformation} 
     */
    static DefaultVoice {
        get => SpeechSynthesizer.get_DefaultVoice()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<VoiceInformation>} 
     */
    static get_AllVoices() {
        if (!SpeechSynthesizer.HasProp("__IInstalledVoicesStatic")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechSynthesis.SpeechSynthesizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInstalledVoicesStatic.IID)
            SpeechSynthesizer.__IInstalledVoicesStatic := IInstalledVoicesStatic(factoryPtr)
        }

        return SpeechSynthesizer.__IInstalledVoicesStatic.get_AllVoices()
    }

    /**
     * 
     * @returns {VoiceInformation} 
     */
    static get_DefaultVoice() {
        if (!SpeechSynthesizer.HasProp("__IInstalledVoicesStatic")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechSynthesis.SpeechSynthesizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInstalledVoicesStatic.IID)
            SpeechSynthesizer.__IInstalledVoicesStatic := IInstalledVoicesStatic(factoryPtr)
        }

        return SpeechSynthesizer.__IInstalledVoicesStatic.get_DefaultVoice()
    }

    /**
     * Asynchronously attempts to set the voice used for speech synthesis on an [IoT](https://developer.microsoft.com/windows/iot) device.
     * 
     * > [!NOTE]
     * > This method is available only in [Embedded mode](/windows/iot-core/develop-your-app/EmbeddedMode).
     * @remarks
     * Your app must declare the **systemManagement** capability, which lets apps access basic system administration privileges including locale, timezone, shut down, and reboot.
     * 
     * The systemManagement capability must include the iot namespace when you declare it in your app's package manifest.
     * 
     * ```xml
     * <Capabilities><iot:Capability Name="systemManagement"/></Capabilities>
     * ```
     * 
     * Use [Windows.Globalization.ApplicationLanguages.Languages](/uwp/api/windows.globalization.applicationlanguages.Languages) to get the ranked list of current runtime language values preferred by the user.
     * @param {VoiceInformation} voice One of the installed speech synthesis engines (voices).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer.trysetdefaultvoiceasync
     */
    static TrySetDefaultVoiceAsync(voice) {
        if (!SpeechSynthesizer.HasProp("__IInstalledVoicesStatic2")) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechSynthesis.SpeechSynthesizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInstalledVoicesStatic2.IID)
            SpeechSynthesizer.__IInstalledVoicesStatic2 := IInstalledVoicesStatic2(factoryPtr)
        }

        return SpeechSynthesizer.__IInstalledVoicesStatic2.TrySetDefaultVoiceAsync(voice)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the speech synthesis engine (voice).
     * @remarks
     * Only Microsoft-signed voices installed on the system can be used to generate speech with a [SpeechSynthesizer](speechsynthesizer.md). Each voice generates synthesized speech in a single language, as spoken in a specific country/region.
     * 
     * By default, a new [SpeechSynthesizer](speechsynthesizer.md) object uses the current system voice (call [DefaultVoice](speechsynthesizer_defaultvoice.md) to find out what the default voice is).
     * 
     * To specify any of the other speech synthesis (text-to-speech) voices installed on the user's system, use the Voice method (to find out which [voices](voiceinformation.md) are installed on the system, call [AllVoices](speechsynthesizer_allvoices.md)).
     * 
     * If you don't specify a language, the voice that most closely corresponds to the language selected in the Language control panel is loaded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer.voice
     * @type {VoiceInformation} 
     */
    Voice {
        get => this.get_Voice()
        set => this.put_Voice(value)
    }

    /**
     * Gets a reference to the collection of options that can be set on the SpeechSynthesizer object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer.options
     * @type {SpeechSynthesizerOptions} 
     */
    Options {
        get => this.get_Options()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [SpeechSynthesizer](speechsynthesizer.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.SpeechSynthesis.SpeechSynthesizer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Asynchronously generate speech output from a string.
     * @remarks
     * To generate speech from [Speech Synthesis Markup Language (SSML) Version 1.1](https://www.w3.org/TR/speech-synthesis/), see [SynthesizeSsmlToStreamAsync](speechsynthesizer_synthesizessmltostreamasync_1873155127.md).
     * @param {HSTRING} text The text to speak.
     * @returns {IAsyncOperation<SpeechSynthesisStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer.synthesizetexttostreamasync
     */
    SynthesizeTextToStreamAsync(text) {
        if (!this.HasProp("__ISpeechSynthesizer")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizer := ISpeechSynthesizer(outPtr)
        }

        return this.__ISpeechSynthesizer.SynthesizeTextToStreamAsync(text)
    }

    /**
     * Asynchronously generate and control speech output from a [Speech Synthesis Markup Language (SSML) Version 1.1](https://www.w3.org/TR/speech-synthesis/) string.
     * @remarks
     * Voice characteristics, pronunciation, volume, pitch, rate or speed, emphasis, and so on can be customized through [Speech Synthesis Markup Language (SSML) Version 1.1](https://www.w3.org/TR/speech-synthesis/).
     * 
     * To generate speech from plain text, see [SynthesizeTextToStreamAsync](speechsynthesizer_synthesizetexttostreamasync_2010301348.md).
     * @param {HSTRING} Ssml The SSML-modified text to speak.
     * @returns {IAsyncOperation<SpeechSynthesisStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer.synthesizessmltostreamasync
     */
    SynthesizeSsmlToStreamAsync(Ssml) {
        if (!this.HasProp("__ISpeechSynthesizer")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizer := ISpeechSynthesizer(outPtr)
        }

        return this.__ISpeechSynthesizer.SynthesizeSsmlToStreamAsync(Ssml)
    }

    /**
     * 
     * @param {VoiceInformation} value 
     * @returns {HRESULT} 
     */
    put_Voice(value) {
        if (!this.HasProp("__ISpeechSynthesizer")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizer := ISpeechSynthesizer(outPtr)
        }

        return this.__ISpeechSynthesizer.put_Voice(value)
    }

    /**
     * 
     * @returns {VoiceInformation} 
     */
    get_Voice() {
        if (!this.HasProp("__ISpeechSynthesizer")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizer := ISpeechSynthesizer(outPtr)
        }

        return this.__ISpeechSynthesizer.get_Voice()
    }

    /**
     * Closes the [SpeechSynthesizer](speechsynthesizer.md) and releases system resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizer.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @returns {SpeechSynthesizerOptions} 
     */
    get_Options() {
        if (!this.HasProp("__ISpeechSynthesizer2")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizer2 := ISpeechSynthesizer2(outPtr)
        }

        return this.__ISpeechSynthesizer2.get_Options()
    }

;@endregion Instance Methods
}
