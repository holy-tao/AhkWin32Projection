#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICurrentMediaPlaybackItemChangedEventArgs.ahk
#Include .\ICurrentMediaPlaybackItemChangedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaPlaybackList.CurrentItemChanged](mediaplaybacklist_currentitemchanged.md) event.
 * @remarks
 * Get an instance of this class by handling the [MediaPlaybackList.CurrentItemChanged](mediaplaybacklist_currentitemchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.currentmediaplaybackitemchangedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class CurrentMediaPlaybackItemChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICurrentMediaPlaybackItemChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICurrentMediaPlaybackItemChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new current [MediaPlaybackItem](mediaplaybackitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.currentmediaplaybackitemchangedeventargs.newitem
     * @type {MediaPlaybackItem} 
     */
    NewItem {
        get => this.get_NewItem()
    }

    /**
     * Gets the previous current [MediaPlaybackItem](mediaplaybackitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.currentmediaplaybackitemchangedeventargs.olditem
     * @type {MediaPlaybackItem} 
     */
    OldItem {
        get => this.get_OldItem()
    }

    /**
     * Gets the reason why the current [MediaPlaybackItem](mediaplaybackitem.md) in a [MediaPlaybackList](mediaplaybacklist.md) changed, such as if the previous item completed playback successfully or if there was an error playing back the previous item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.currentmediaplaybackitemchangedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
    get_NewItem() {
        if (!this.HasProp("__ICurrentMediaPlaybackItemChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICurrentMediaPlaybackItemChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrentMediaPlaybackItemChangedEventArgs := ICurrentMediaPlaybackItemChangedEventArgs(outPtr)
        }

        return this.__ICurrentMediaPlaybackItemChangedEventArgs.get_NewItem()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_OldItem() {
        if (!this.HasProp("__ICurrentMediaPlaybackItemChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICurrentMediaPlaybackItemChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrentMediaPlaybackItemChangedEventArgs := ICurrentMediaPlaybackItemChangedEventArgs(outPtr)
        }

        return this.__ICurrentMediaPlaybackItemChangedEventArgs.get_OldItem()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__ICurrentMediaPlaybackItemChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(ICurrentMediaPlaybackItemChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrentMediaPlaybackItemChangedEventArgs2 := ICurrentMediaPlaybackItemChangedEventArgs2(outPtr)
        }

        return this.__ICurrentMediaPlaybackItemChangedEventArgs2.get_Reason()
    }

;@endregion Instance Methods
}
