#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlayerRateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the data for [MediaPlayerRateChanged](mediaplayer_mediaplayerratechanged.md) events.
 * @remarks
 * Get an instance of this class by handling the [MediaPlayerRateChanged](mediaplayer_mediaplayerratechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerratechangedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayerRateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlayerRateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlayerRateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new playback rate for the media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerratechangedeventargs.newrate
     * @type {Float} 
     */
    NewRate {
        get => this.get_NewRate()
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
    get_NewRate() {
        if (!this.HasProp("__IMediaPlayerRateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerRateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerRateChangedEventArgs := IMediaPlayerRateChangedEventArgs(outPtr)
        }

        return this.__IMediaPlayerRateChangedEventArgs.get_NewRate()
    }

;@endregion Instance Methods
}
