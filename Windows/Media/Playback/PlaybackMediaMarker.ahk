#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaybackMediaMarker.ahk
#Include .\IPlaybackMediaMarkerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a marker at specific location in a media stream time-line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarker
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class PlaybackMediaMarker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaybackMediaMarker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaybackMediaMarker.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [PlaybackMediaMarker](playbackmediamarker.md) class with the specified offset into the media timeline.
     * @param {TimeSpan} value The media marker's offset into the media timeline.
     * @returns {PlaybackMediaMarker} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarker.#ctor
     */
    static CreateFromTime(value) {
        if (!PlaybackMediaMarker.HasProp("__IPlaybackMediaMarkerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.PlaybackMediaMarker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaybackMediaMarkerFactory.IID)
            PlaybackMediaMarker.__IPlaybackMediaMarkerFactory := IPlaybackMediaMarkerFactory(factoryPtr)
        }

        return PlaybackMediaMarker.__IPlaybackMediaMarkerFactory.CreateFromTime(value)
    }

    /**
     * Initializes a new instance of the [PlaybackMediaMarker](playbackmediamarker.md) class with the specified offset into the media timeline, type string, and text.
     * @param {TimeSpan} value The media marker's offset into the media timeline.
     * @param {HSTRING} mediaMarketType The type of the media marker.
     * @param {HSTRING} text The text of the media marker.
     * @returns {PlaybackMediaMarker} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarker.#ctor
     */
    static Create(value, mediaMarketType, text) {
        if (!PlaybackMediaMarker.HasProp("__IPlaybackMediaMarkerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.PlaybackMediaMarker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaybackMediaMarkerFactory.IID)
            PlaybackMediaMarker.__IPlaybackMediaMarkerFactory := IPlaybackMediaMarkerFactory(factoryPtr)
        }

        return PlaybackMediaMarker.__IPlaybackMediaMarkerFactory.Create(value, mediaMarketType, text)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the offset in the media timeline where the marker occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarker.time
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
    }

    /**
     * Gets the type of the media marker.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarker.mediamarkertype
     * @type {HSTRING} 
     */
    MediaMarkerType {
        get => this.get_MediaMarkerType()
    }

    /**
     * Gets the text associated with the marker.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarker.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Time() {
        if (!this.HasProp("__IPlaybackMediaMarker")) {
            if ((queryResult := this.QueryInterface(IPlaybackMediaMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackMediaMarker := IPlaybackMediaMarker(outPtr)
        }

        return this.__IPlaybackMediaMarker.get_Time()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaMarkerType() {
        if (!this.HasProp("__IPlaybackMediaMarker")) {
            if ((queryResult := this.QueryInterface(IPlaybackMediaMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackMediaMarker := IPlaybackMediaMarker(outPtr)
        }

        return this.__IPlaybackMediaMarker.get_MediaMarkerType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IPlaybackMediaMarker")) {
            if ((queryResult := this.QueryInterface(IPlaybackMediaMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackMediaMarker := IPlaybackMediaMarker(outPtr)
        }

        return this.__IPlaybackMediaMarker.get_Text()
    }

;@endregion Instance Methods
}
