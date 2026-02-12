#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaybackMediaMarkerReachedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for [PlaybackMediaMarkerReached](mediaplayer_playbackmediamarkerreached.md) events.
 * @remarks
 * Get an instance of this class by handling the [PlaybackMediaMarkerReached](mediaplayer_playbackmediamarkerreached.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarkerreachedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class PlaybackMediaMarkerReachedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaybackMediaMarkerReachedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaybackMediaMarkerReachedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [PlaybackMediaMarker](playbackmediamarker.md) that was reached.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarkerreachedeventargs.playbackmediamarker
     * @type {PlaybackMediaMarker} 
     */
    PlaybackMediaMarker {
        get => this.get_PlaybackMediaMarker()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PlaybackMediaMarker} 
     */
    get_PlaybackMediaMarker() {
        if (!this.HasProp("__IPlaybackMediaMarkerReachedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlaybackMediaMarkerReachedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackMediaMarkerReachedEventArgs := IPlaybackMediaMarkerReachedEventArgs(outPtr)
        }

        return this.__IPlaybackMediaMarkerReachedEventArgs.get_PlaybackMediaMarker()
    }

;@endregion Instance Methods
}
