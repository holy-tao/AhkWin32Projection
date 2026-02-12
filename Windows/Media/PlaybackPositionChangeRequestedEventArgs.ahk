#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaybackPositionChangeRequestedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for the [PlaybackPositionChangeRequested](systemmediatransportcontrols_playbackpositionchangerequested.md) event.
 * @remarks
 * Get an instance of this class by handling the [PlaybackPositionChangeRequested](systemmediatransportcontrols_playbackpositionchangerequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playbackpositionchangerequestedeventargs
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class PlaybackPositionChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaybackPositionChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaybackPositionChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the requested offset into the media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playbackpositionchangerequestedeventargs.requestedplaybackposition
     * @type {TimeSpan} 
     */
    RequestedPlaybackPosition {
        get => this.get_RequestedPlaybackPosition()
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
    get_RequestedPlaybackPosition() {
        if (!this.HasProp("__IPlaybackPositionChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlaybackPositionChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackPositionChangeRequestedEventArgs := IPlaybackPositionChangeRequestedEventArgs(outPtr)
        }

        return this.__IPlaybackPositionChangeRequestedEventArgs.get_RequestedPlaybackPosition()
    }

;@endregion Instance Methods
}
