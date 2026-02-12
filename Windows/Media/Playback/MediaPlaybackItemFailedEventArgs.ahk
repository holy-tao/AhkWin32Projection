#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackItemFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaPlaybackList.ItemFailed](mediaplaybacklist_itemfailed.md) event.
 * @remarks
 * Get an instance of this class by handling the [MediaPlaybackList.ItemFailed](mediaplaybacklist_itemfailed.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemfailedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackItemFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackItemFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackItemFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaPlaybackItem](mediaplaybackitem.md) associated with the error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemfailedeventargs.item
     * @type {MediaPlaybackItem} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * Gets a wrapper object for the [MediaPlaybackItem](mediaplaybackitem.md) error that provides high-level information about the cause of the error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemfailedeventargs.error
     * @type {MediaPlaybackItemError} 
     */
    Error {
        get => this.get_Error()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_Item() {
        if (!this.HasProp("__IMediaPlaybackItemFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItemFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItemFailedEventArgs := IMediaPlaybackItemFailedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackItemFailedEventArgs.get_Item()
    }

    /**
     * 
     * @returns {MediaPlaybackItemError} 
     */
    get_Error() {
        if (!this.HasProp("__IMediaPlaybackItemFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItemFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItemFailedEventArgs := IMediaPlaybackItemFailedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackItemFailedEventArgs.get_Error()
    }

;@endregion Instance Methods
}
