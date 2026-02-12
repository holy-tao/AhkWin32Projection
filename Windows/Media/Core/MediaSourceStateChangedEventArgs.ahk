#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaSourceStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [StateChanged](mediasource_statechanged.md) event of a [MediaSource](mediasource.md) object.
 * @remarks
 * Get an instance of this class by handling the [StateChanged](mediasource_statechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourcestatechangedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaSourceStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaSourceStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaSourceStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the previous state of the [MediaSource](mediasource.md) before the state changed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourcestatechangedeventargs.oldstate
     * @type {Integer} 
     */
    OldState {
        get => this.get_OldState()
    }

    /**
     * Gets the new current state of the [MediaSource](mediasource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourcestatechangedeventargs.newstate
     * @type {Integer} 
     */
    NewState {
        get => this.get_NewState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OldState() {
        if (!this.HasProp("__IMediaSourceStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaSourceStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSourceStateChangedEventArgs := IMediaSourceStateChangedEventArgs(outPtr)
        }

        return this.__IMediaSourceStateChangedEventArgs.get_OldState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewState() {
        if (!this.HasProp("__IMediaSourceStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaSourceStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSourceStateChangedEventArgs := IMediaSourceStateChangedEventArgs(outPtr)
        }

        return this.__IMediaSourceStateChangedEventArgs.get_NewState()
    }

;@endregion Instance Methods
}
