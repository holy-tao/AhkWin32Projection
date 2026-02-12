#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaSourceError.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an error that occurred with a [MediaSource](mediasource.md).
 * @remarks
 * Get an instance of this class by accessing the [MediaSourceOpenCompletedEventArgs.Error](mediasourceopenoperationcompletedeventargs_error.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourceerror
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaSourceError extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaSourceError

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaSourceError.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the extended error code for the [MediaSourceError](mediasourceerror.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourceerror.extendederror
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
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IMediaSourceError")) {
            if ((queryResult := this.QueryInterface(IMediaSourceError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSourceError := IMediaSourceError(outPtr)
        }

        return this.__IMediaSourceError.get_ExtendedError()
    }

;@endregion Instance Methods
}
