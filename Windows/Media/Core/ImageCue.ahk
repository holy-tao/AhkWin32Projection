#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageCue.ahk
#Include .\IMediaCue.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a image cue that can be included in a [TimedMetadataTrack](timedmetadatatrack.md).
 * @remarks
 * An **ImageCue** can be added to a [TimedMetadataTrack](timedmetadatatrack.md) with the [AddCue](timedmetadatatrack_addcue_1989081881.md) method. When the cue's start time is reached, the [CueEntered](timedmetadatatrack_cueentered.md) event is raised and you can use the [MediaCueEventArgs](mediacueeventargs.md) passed into the handler to get a copy of the **ImageCue**.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.imagecue
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ImageCue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageCue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageCue.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the position of the image associated with the **ImageCue**, relative to the top left corner of the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imagecue.position
     * @type {TimedTextPoint} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets or sets the extent of the **ImageCue**, which is the rendered size of the assoociated image either in pixels or in percentage of available space.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imagecue.extent
     * @type {TimedTextSize} 
     */
    Extent {
        get => this.get_Extent()
        set => this.put_Extent(value)
    }

    /**
     * Gets or sets the image associated with the image cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imagecue.softwarebitmap
     * @type {SoftwareBitmap} 
     */
    SoftwareBitmap {
        get => this.get_SoftwareBitmap()
        set => this.put_SoftwareBitmap(value)
    }

    /**
     * Gets the start time of the cue.
     * @remarks
     * When a cue's start time is reached, the [TimedMetadataTrack.CueEntered](timedmetadatatrack_cueentered.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imagecue.starttime
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imagecue.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets the identifier for the timed metadata track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imagecue.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **ImageCue** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.ImageCue")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimedTextPoint} 
     */
    get_Position() {
        if (!this.HasProp("__IImageCue")) {
            if ((queryResult := this.QueryInterface(IImageCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageCue := IImageCue(outPtr)
        }

        return this.__IImageCue.get_Position()
    }

    /**
     * 
     * @param {TimedTextPoint} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IImageCue")) {
            if ((queryResult := this.QueryInterface(IImageCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageCue := IImageCue(outPtr)
        }

        return this.__IImageCue.put_Position(value)
    }

    /**
     * 
     * @returns {TimedTextSize} 
     */
    get_Extent() {
        if (!this.HasProp("__IImageCue")) {
            if ((queryResult := this.QueryInterface(IImageCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageCue := IImageCue(outPtr)
        }

        return this.__IImageCue.get_Extent()
    }

    /**
     * 
     * @param {TimedTextSize} value 
     * @returns {HRESULT} 
     */
    put_Extent(value) {
        if (!this.HasProp("__IImageCue")) {
            if ((queryResult := this.QueryInterface(IImageCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageCue := IImageCue(outPtr)
        }

        return this.__IImageCue.put_Extent(value)
    }

    /**
     * 
     * @param {SoftwareBitmap} value 
     * @returns {HRESULT} 
     */
    put_SoftwareBitmap(value) {
        if (!this.HasProp("__IImageCue")) {
            if ((queryResult := this.QueryInterface(IImageCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageCue := IImageCue(outPtr)
        }

        return this.__IImageCue.put_SoftwareBitmap(value)
    }

    /**
     * 
     * @returns {SoftwareBitmap} 
     */
    get_SoftwareBitmap() {
        if (!this.HasProp("__IImageCue")) {
            if ((queryResult := this.QueryInterface(IImageCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageCue := IImageCue(outPtr)
        }

        return this.__IImageCue.get_SoftwareBitmap()
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
