#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackItemError.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an error that occurred trying to resolve a [MediaPlaybackItem](mediaplaybackitem.md).
 * @remarks
 * The [ErrorCode](mediaplaybackitemerror_errorcode.md) property provides high-level information about the error that occurred resolving the playback item. The [ExtendedError](mediaplaybackitemerror_extendederror.md) method propagates the underlying exception that caused the error.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemerror
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackItemError extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackItemError

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackItemError.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error code associated with the playback item error.
     * @remarks
     * This value provides high-level information about the error that occurred resolving the playback item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemerror.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets the extended error code for the [MediaPlaybackItem](mediaplaybackitem.md) error.
     * @remarks
     * Get high-level information about the error that occurred resolving the playback item by checking the [ErrorCode](mediaplaybackitemerror_errorcode.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitemerror.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
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
    get_ErrorCode() {
        if (!this.HasProp("__IMediaPlaybackItemError")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItemError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItemError := IMediaPlaybackItemError(outPtr)
        }

        return this.__IMediaPlaybackItemError.get_ErrorCode()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IMediaPlaybackItemError")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItemError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItemError := IMediaPlaybackItemError(outPtr)
        }

        return this.__IMediaPlaybackItemError.get_ExtendedError()
    }

;@endregion Instance Methods
}
