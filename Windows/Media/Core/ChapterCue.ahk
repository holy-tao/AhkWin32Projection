#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChapterCue.ahk
#Include .\IMediaCue.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a chapter cue that can be included in a [TimedMetadataTrack](timedmetadatatrack.md).
 * @remarks
 * A **ChapterCue** can be added to a [TimedMetadataTrack](timedmetadatatrack.md) with the [AddCue](timedmetadatatrack_addcue_1989081881.md) method. When the cue's start time is reached, the [CueEntered](timedmetadatatrack_cueentered.md) event is raised and you can use the [MediaCueEventArgs](mediacueeventargs.md) passed into the handler to get a copy of the **ChapterCue**.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.chaptercue
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ChapterCue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChapterCue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChapterCue.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the title of the chapter associated with the cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.chaptercue.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets the start time of the cue.
     * @remarks
     * When a cue's start time is reached, the [TimedMetadataTrack.CueEntered](timedmetadatatrack_cueentered.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.chaptercue.starttime
     * @type {TimeSpan} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Gets or sets a value that specifies the duration of the chapter associated with the cue.
     * @remarks
     * At the end of a cue's duration, the [TimedMetadataTrack.CueExited](timedmetadatatrack_cueexited.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.chaptercue.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets the identifier for the timed metadata track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.chaptercue.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **ChapterCue** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.ChapterCue")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IChapterCue")) {
            if ((queryResult := this.QueryInterface(IChapterCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChapterCue := IChapterCue(outPtr)
        }

        return this.__IChapterCue.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IChapterCue")) {
            if ((queryResult := this.QueryInterface(IChapterCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChapterCue := IChapterCue(outPtr)
        }

        return this.__IChapterCue.get_Title()
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
