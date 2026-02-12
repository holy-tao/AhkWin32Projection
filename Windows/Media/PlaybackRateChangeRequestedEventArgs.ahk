#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaybackRateChangeRequestedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for the [PlaybackRateChangeRequested](systemmediatransportcontrols_playbackratechangerequested.md) event.
 * @remarks
 * Get an instance of this class by handling the [PlaybackRateChangeRequested](systemmediatransportcontrols_playbackratechangerequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playbackratechangerequestedeventargs
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class PlaybackRateChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaybackRateChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaybackRateChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the requested playback rate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playbackratechangerequestedeventargs.requestedplaybackrate
     * @type {Float} 
     */
    RequestedPlaybackRate {
        get => this.get_RequestedPlaybackRate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RequestedPlaybackRate() {
        if (!this.HasProp("__IPlaybackRateChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlaybackRateChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackRateChangeRequestedEventArgs := IPlaybackRateChangeRequestedEventArgs(outPtr)
        }

        return this.__IPlaybackRateChangeRequestedEventArgs.get_RequestedPlaybackRate()
    }

;@endregion Instance Methods
}
