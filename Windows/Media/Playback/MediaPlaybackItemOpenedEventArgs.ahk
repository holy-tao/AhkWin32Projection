#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackItemOpenedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaPlaybackList.ItemOpened](mediaplaybacklist_itemopened.md) event.
 * @remarks
 * Get an instance of this class by handling the [MediaPlaybackList.ItemOpened](mediaplaybacklist_itemopened.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemopenedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackItemOpenedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackItemOpenedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackItemOpenedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaPlaybackItem](mediaplaybackitem.md) that was successfully opened.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemopenedeventargs.item
     * @type {MediaPlaybackItem} 
     */
    Item {
        get => this.get_Item()
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
        if (!this.HasProp("__IMediaPlaybackItemOpenedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItemOpenedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItemOpenedEventArgs := IMediaPlaybackItemOpenedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackItemOpenedEventArgs.get_Item()
    }

;@endregion Instance Methods
}
