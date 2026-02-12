#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaSourceOpenOperationCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the MediaSource.MediaSourceOpenOperationCompleted event.
 * @remarks
 * Get an instance of this class by handling the MediaSource.MediaSourceOpenOperationCompleted event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourceopenoperationcompletedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaSourceOpenOperationCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaSourceOpenOperationCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaSourceOpenOperationCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Represents the error that occurred while asynchronously opening the [MediaSource](mediasource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourceopenoperationcompletedeventargs.error
     * @type {MediaSourceError} 
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
     * @returns {MediaSourceError} 
     */
    get_Error() {
        if (!this.HasProp("__IMediaSourceOpenOperationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaSourceOpenOperationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSourceOpenOperationCompletedEventArgs := IMediaSourceOpenOperationCompletedEventArgs(outPtr)
        }

        return this.__IMediaSourceOpenOperationCompletedEventArgs.get_Error()
    }

;@endregion Instance Methods
}
