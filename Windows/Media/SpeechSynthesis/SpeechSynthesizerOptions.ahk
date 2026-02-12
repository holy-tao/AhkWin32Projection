#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechSynthesizerOptions.ahk
#Include .\ISpeechSynthesizerOptions2.ahk
#Include .\ISpeechSynthesizerOptions3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to various speech synthesizer options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizeroptions
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class SpeechSynthesizerOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechSynthesizerOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechSynthesizerOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether word boundary metadata is added to a [SpeechSynthesisStream](speechsynthesisstream.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizeroptions.includewordboundarymetadata
     * @type {Boolean} 
     */
    IncludeWordBoundaryMetadata {
        get => this.get_IncludeWordBoundaryMetadata()
        set => this.put_IncludeWordBoundaryMetadata(value)
    }

    /**
     * Gets or sets whether sentence boundary metadata is added to a [SpeechSynthesisStream](speechsynthesisstream.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizeroptions.includesentenceboundarymetadata
     * @type {Boolean} 
     */
    IncludeSentenceBoundaryMetadata {
        get => this.get_IncludeSentenceBoundaryMetadata()
        set => this.put_IncludeSentenceBoundaryMetadata(value)
    }

    /**
     * Gets or sets the loudness of the speech synthesis utterance.
     * @remarks
     * If Speech Synthesis Markup Language (SSML) is used, [AudioVolume](speechsynthesizeroptions_audiovolume.md) is combined with prosody tags in the markup.
     * 
     * > [!NOTE]
     * > Prosody are properties of syllables and larger units of speech, not individual phonetic segments (vowels and consonants).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizeroptions.audiovolume
     * @type {Float} 
     */
    AudioVolume {
        get => this.get_AudioVolume()
        set => this.put_AudioVolume(value)
    }

    /**
     * Gets or sets the tempo (including pauses and hesitations) of the speech synthesis utterance.
     * @remarks
     * If Speech Synthesis Markup Language (SSML) is used, SpeakingRate is combined with any prosody tags in the markup.
     * 
     * > [!NOTE]
     * > Prosody are properties of syllables and larger units of speech, not individual phonetic segments (vowels and consonants).
     * 
     * By default, approximately 750ms of silence is appended after each utterance and each punctuation mark to ensure the utterance sounds as natural as possible. In some cases, such as accelerated playback or screen-reader descriptions of app content, this behavior is not required or needs to be configurable by the user. For more info, see [AppendedSilence](speechsynthesizeroptions_appendedsilence.md) and [PunctuationSilence](speechsynthesizeroptions_punctuationsilence.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizeroptions.speakingrate
     * @type {Float} 
     */
    SpeakingRate {
        get => this.get_SpeakingRate()
        set => this.put_SpeakingRate(value)
    }

    /**
     * Gets or sets the tone (relative highness or lowness) of the speech synthesis utterance.
     * @remarks
     * If Speech Synthesis Markup Language (SSML) is used, AudioPitch is combined with any prosody tags in the markup.
     * 
     * > [!NOTE]
     * > Prosody are properties of syllables and larger units of speech, not individual phonetic segments (vowels and consonants).
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizeroptions.audiopitch
     * @type {Float} 
     */
    AudioPitch {
        get => this.get_AudioPitch()
        set => this.put_AudioPitch(value)
    }

    /**
     * Gets or sets the amount of silence added to the end of the speech synthesis utterance (before another utterance begins).
     * @remarks
     * By default, approximately 750ms of silence is appended to the end of each generated utterance. If the utterance is not a complete sentence, this can complicate concatenation of multiple utterances. For example, a streaming app that reads text from a document as it downloads, might start reading from its cache at a predetermined number of words.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizeroptions.appendedsilence
     * @type {Integer} 
     */
    AppendedSilence {
        get => this.get_AppendedSilence()
        set => this.put_AppendedSilence(value)
    }

    /**
     * Gets or sets the amount of silence added after punctuation in the speech synthesis utterance (before another utterance begins).
     * @remarks
     * By default, approximately 750ms of silence is appended after each punctuation mark to ensure the utterance sounds as natural as possible. In some cases, such as accelerated playback or screen-reader descriptions of app content, this behavior is not required or needs to be configurable by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.media.speechsynthesis.speechsynthesizeroptions.punctuationsilence
     * @type {Integer} 
     */
    PunctuationSilence {
        get => this.get_PunctuationSilence()
        set => this.put_PunctuationSilence(value)
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
    get_IncludeWordBoundaryMetadata() {
        if (!this.HasProp("__ISpeechSynthesizerOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions := ISpeechSynthesizerOptions(outPtr)
        }

        return this.__ISpeechSynthesizerOptions.get_IncludeWordBoundaryMetadata()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeWordBoundaryMetadata(value) {
        if (!this.HasProp("__ISpeechSynthesizerOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions := ISpeechSynthesizerOptions(outPtr)
        }

        return this.__ISpeechSynthesizerOptions.put_IncludeWordBoundaryMetadata(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeSentenceBoundaryMetadata() {
        if (!this.HasProp("__ISpeechSynthesizerOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions := ISpeechSynthesizerOptions(outPtr)
        }

        return this.__ISpeechSynthesizerOptions.get_IncludeSentenceBoundaryMetadata()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeSentenceBoundaryMetadata(value) {
        if (!this.HasProp("__ISpeechSynthesizerOptions")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions := ISpeechSynthesizerOptions(outPtr)
        }

        return this.__ISpeechSynthesizerOptions.put_IncludeSentenceBoundaryMetadata(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AudioVolume() {
        if (!this.HasProp("__ISpeechSynthesizerOptions2")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions2 := ISpeechSynthesizerOptions2(outPtr)
        }

        return this.__ISpeechSynthesizerOptions2.get_AudioVolume()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AudioVolume(value) {
        if (!this.HasProp("__ISpeechSynthesizerOptions2")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions2 := ISpeechSynthesizerOptions2(outPtr)
        }

        return this.__ISpeechSynthesizerOptions2.put_AudioVolume(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpeakingRate() {
        if (!this.HasProp("__ISpeechSynthesizerOptions2")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions2 := ISpeechSynthesizerOptions2(outPtr)
        }

        return this.__ISpeechSynthesizerOptions2.get_SpeakingRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SpeakingRate(value) {
        if (!this.HasProp("__ISpeechSynthesizerOptions2")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions2 := ISpeechSynthesizerOptions2(outPtr)
        }

        return this.__ISpeechSynthesizerOptions2.put_SpeakingRate(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AudioPitch() {
        if (!this.HasProp("__ISpeechSynthesizerOptions2")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions2 := ISpeechSynthesizerOptions2(outPtr)
        }

        return this.__ISpeechSynthesizerOptions2.get_AudioPitch()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AudioPitch(value) {
        if (!this.HasProp("__ISpeechSynthesizerOptions2")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions2 := ISpeechSynthesizerOptions2(outPtr)
        }

        return this.__ISpeechSynthesizerOptions2.put_AudioPitch(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppendedSilence() {
        if (!this.HasProp("__ISpeechSynthesizerOptions3")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions3 := ISpeechSynthesizerOptions3(outPtr)
        }

        return this.__ISpeechSynthesizerOptions3.get_AppendedSilence()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AppendedSilence(value) {
        if (!this.HasProp("__ISpeechSynthesizerOptions3")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions3 := ISpeechSynthesizerOptions3(outPtr)
        }

        return this.__ISpeechSynthesizerOptions3.put_AppendedSilence(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PunctuationSilence() {
        if (!this.HasProp("__ISpeechSynthesizerOptions3")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions3 := ISpeechSynthesizerOptions3(outPtr)
        }

        return this.__ISpeechSynthesizerOptions3.get_PunctuationSilence()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PunctuationSilence(value) {
        if (!this.HasProp("__ISpeechSynthesizerOptions3")) {
            if ((queryResult := this.QueryInterface(ISpeechSynthesizerOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechSynthesizerOptions3 := ISpeechSynthesizerOptions3(outPtr)
        }

        return this.__ISpeechSynthesizerOptions3.put_PunctuationSilence(value)
    }

;@endregion Instance Methods
}
