#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlayerFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the data for [MediaFailed](mediaplayer_mediafailed.md) events.
 * @remarks
 * Get an instance of this class by handling the [MediaFailed](mediaplayer_mediafailed.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerfailedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayerFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlayerFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlayerFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaPlayerError](mediaplayererror.md) value for the error that triggered the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerfailedeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Gets an [HResult](../windows.foundation/hresult.md) that indicates any extra data about the error that occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerfailedeventargs.extendederrorcode
     * @type {HRESULT} 
     */
    ExtendedErrorCode {
        get => this.get_ExtendedErrorCode()
    }

    /**
     * Gets a string describing the error that occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayerfailedeventargs.errormessage
     * @type {HSTRING} 
     */
    ErrorMessage {
        get => this.get_ErrorMessage()
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
    get_Error() {
        if (!this.HasProp("__IMediaPlayerFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerFailedEventArgs := IMediaPlayerFailedEventArgs(outPtr)
        }

        return this.__IMediaPlayerFailedEventArgs.get_Error()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedErrorCode() {
        if (!this.HasProp("__IMediaPlayerFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerFailedEventArgs := IMediaPlayerFailedEventArgs(outPtr)
        }

        return this.__IMediaPlayerFailedEventArgs.get_ExtendedErrorCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ErrorMessage() {
        if (!this.HasProp("__IMediaPlayerFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerFailedEventArgs := IMediaPlayerFailedEventArgs(outPtr)
        }

        return this.__IMediaPlayerFailedEventArgs.get_ErrorMessage()
    }

;@endregion Instance Methods
}
