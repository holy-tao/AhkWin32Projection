#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedTextCue.ahk
#Include .\IMediaCue.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a text cue in a [TimedMetadataTrack](timedmetadatatrack.md).
 * @remarks
 * After creating a **TimeTextCue**, you can add it to a [TimedMetadataTrack](timedmetadatatrack.md) by calling [AddCue](timedmetadatatrack_addcue_1989081881.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextcue
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextCue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedTextCue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedTextCue.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the [TimedTextRegion](timedtextregion.md) of the cue, which defines the style of the rendering area for the cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextcue.cueregion
     * @type {TimedTextRegion} 
     */
    CueRegion {
        get => this.get_CueRegion()
        set => this.put_CueRegion(value)
    }

    /**
     * Gets or sets the [TimedTextStyle](timedtextstyle.md) of the cue, which defines the style of the rendered text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextcue.cuestyle
     * @type {TimedTextStyle} 
     */
    CueStyle {
        get => this.get_CueStyle()
        set => this.put_CueStyle(value)
    }

    /**
     * Gets the collection of [TimedTextLine](timedtextline.md) objects that convey the text of the cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextcue.lines
     * @type {IVector<TimedTextLine>} 
     */
    Lines {
        get => this.get_Lines()
    }

    /**
     * Gets the start time of the cue.
     * @remarks
     * When a cue's start time is reached, the [TimedMetadataTrack.CueEntered](timedmetadatatrack_cueentered.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextcue.starttime
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextcue.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets an identifier for the cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextcue.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimedTextCue](timedtextcue.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextCue")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimedTextRegion} 
     */
    get_CueRegion() {
        if (!this.HasProp("__ITimedTextCue")) {
            if ((queryResult := this.QueryInterface(ITimedTextCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextCue := ITimedTextCue(outPtr)
        }

        return this.__ITimedTextCue.get_CueRegion()
    }

    /**
     * 
     * @param {TimedTextRegion} value 
     * @returns {HRESULT} 
     */
    put_CueRegion(value) {
        if (!this.HasProp("__ITimedTextCue")) {
            if ((queryResult := this.QueryInterface(ITimedTextCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextCue := ITimedTextCue(outPtr)
        }

        return this.__ITimedTextCue.put_CueRegion(value)
    }

    /**
     * 
     * @returns {TimedTextStyle} 
     */
    get_CueStyle() {
        if (!this.HasProp("__ITimedTextCue")) {
            if ((queryResult := this.QueryInterface(ITimedTextCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextCue := ITimedTextCue(outPtr)
        }

        return this.__ITimedTextCue.get_CueStyle()
    }

    /**
     * 
     * @param {TimedTextStyle} value 
     * @returns {HRESULT} 
     */
    put_CueStyle(value) {
        if (!this.HasProp("__ITimedTextCue")) {
            if ((queryResult := this.QueryInterface(ITimedTextCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextCue := ITimedTextCue(outPtr)
        }

        return this.__ITimedTextCue.put_CueStyle(value)
    }

    /**
     * 
     * @returns {IVector<TimedTextLine>} 
     */
    get_Lines() {
        if (!this.HasProp("__ITimedTextCue")) {
            if ((queryResult := this.QueryInterface(ITimedTextCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextCue := ITimedTextCue(outPtr)
        }

        return this.__ITimedTextCue.get_Lines()
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
