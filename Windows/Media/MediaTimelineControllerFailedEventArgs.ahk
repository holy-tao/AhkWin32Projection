#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaTimelineControllerFailedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for the [Failed](mediatimelinecontroller_failed.md) event, which occurs when the timeline controller encounters an error and can't continue playback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontrollerfailedeventargs
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaTimelineControllerFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaTimelineControllerFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaTimelineControllerFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the extended error code associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontrollerfailedeventargs.extendederror
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
        if (!this.HasProp("__IMediaTimelineControllerFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineControllerFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineControllerFailedEventArgs := IMediaTimelineControllerFailedEventArgs(outPtr)
        }

        return this.__IMediaTimelineControllerFailedEventArgs.get_ExtendedError()
    }

;@endregion Instance Methods
}
