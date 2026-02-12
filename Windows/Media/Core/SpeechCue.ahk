#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpeechCue.ahk
#Include .\IMediaCue.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a speech cue that can be included in a [TimedMetadataTrack](timedmetadatatrack.md). This cue can be used to receive events based on metadata included in a text-to-speech (TTS) stream, such as word boundaries, sentence boundaries, and Speech Sythesis Markup Language (SSML) bookmarks.
 * @remarks
 * A **SpeechCue** can be added to a [TimedMetadataTrack](timedmetadatatrack.md) with the [AddCue](timedmetadatatrack_addcue_1989081881.md) method. When the cue's start time is reached, the [CueEntered](timedmetadatatrack_cueentered.md) event is raised and you can use the [MediaCueEventArgs](mediacueeventargs.md) passed into the handler to get a copy of the **SpeechCue**. 
 * 
 * The [SpeechSynthesizer](./windows.media.speechsynthesis/speechsynthesizer.md) class generates metadata that uses the following values for the [TimedMetataTrack.Label](timedmetadatatrack_label.md) in order to identify the type of speech metadata included in a track.
 * 
 * <table>
 * <tr><th>Label</th><th>Description</th></tr>
 * <tr><td>SpeechBookmark</td><td>The metadata track contains SSML bookmarks.</td></tr>
 * <tr><td>SpeechSentence</td><td>The metadata track contains sentence boundaries.</td></tr>
 * <tr><td>SpeechWord</td><td>The metadata track contains word boundaries.</td></tr>
 * </table>
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.speechcue
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class SpeechCue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpeechCue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpeechCue.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the text associated with the speech cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.speechcue.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the offset into the string contained in the [Text](speechcue_text.md) property of the first character in the word or sentence associated with the cue.
     * @remarks
     * This value is exclusive of any surrounding or inline formatting of the string.
     * 
     * This value is null for SSML bookmarks.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.speechcue.startpositionininput
     * @type {IReference<Integer>} 
     */
    StartPositionInInput {
        get => this.get_StartPositionInInput()
        set => this.put_StartPositionInInput(value)
    }

    /**
     * Gets or sets the offset into the string contained in the [Text](speechcue_text.md) property of the last character in the word or sentence associated with the cue.
     * @remarks
     * This value is exclusive of any surrounding or inline formatting of the string.
     * 
     * This value is null for SSML bookmarks.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.speechcue.endpositionininput
     * @type {IReference<Integer>} 
     */
    EndPositionInInput {
        get => this.get_EndPositionInInput()
        set => this.put_EndPositionInInput(value)
    }

    /**
     * Gets the start time of the cue.
     * @remarks
     * When a cue's start time is reached, the [TimedMetadataTrack.CueEntered](timedmetadatatrack_cueentered.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.speechcue.starttime
     * @type {TimeSpan} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Gets or sets the duration of the cue.
     * @remarks
     * At the end of a cue's duration, the [TimedMetadataTrack.CueExited](timedmetadatatrack_cueexited.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.speechcue.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets the identifier for the timed metadata track
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.speechcue.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **SpeechCue** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.SpeechCue")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ISpeechCue")) {
            if ((queryResult := this.QueryInterface(ISpeechCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechCue := ISpeechCue(outPtr)
        }

        return this.__ISpeechCue.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ISpeechCue")) {
            if ((queryResult := this.QueryInterface(ISpeechCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechCue := ISpeechCue(outPtr)
        }

        return this.__ISpeechCue.put_Text(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_StartPositionInInput() {
        if (!this.HasProp("__ISpeechCue")) {
            if ((queryResult := this.QueryInterface(ISpeechCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechCue := ISpeechCue(outPtr)
        }

        return this.__ISpeechCue.get_StartPositionInInput()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_StartPositionInInput(value) {
        if (!this.HasProp("__ISpeechCue")) {
            if ((queryResult := this.QueryInterface(ISpeechCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechCue := ISpeechCue(outPtr)
        }

        return this.__ISpeechCue.put_StartPositionInInput(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_EndPositionInInput() {
        if (!this.HasProp("__ISpeechCue")) {
            if ((queryResult := this.QueryInterface(ISpeechCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechCue := ISpeechCue(outPtr)
        }

        return this.__ISpeechCue.get_EndPositionInInput()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_EndPositionInInput(value) {
        if (!this.HasProp("__ISpeechCue")) {
            if ((queryResult := this.QueryInterface(ISpeechCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpeechCue := ISpeechCue(outPtr)
        }

        return this.__ISpeechCue.put_EndPositionInInput(value)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.put_StartTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartTime() {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.get_StartTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.put_Duration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.get_Duration()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.get_Id()
    }

;@endregion Instance Methods
}
