#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ExceptionRoutedEventArgs.ahk
#Include .\IMediaFailedRoutedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for media failed events.
 * @remarks
 * MediaFailedRoutedEventArgs is the event data for the [MediaFailed](../windows.ui.xaml.controls/mediaelement_mediafailed.md) event. MediaFailedRoutedEventArgs extends [ExceptionRoutedEventArgs](exceptionroutedeventargs.md) by adding the [ErrorTrace](mediafailedroutedeventargs_errortrace.md) property. In a handler for [MediaFailed](../windows.ui.xaml.controls/mediaelement_mediafailed.md), cast the [ExceptionRoutedEventArgs](exceptionroutedeventargs.md) data as MediaFailedRoutedEventArgs so that you can use the [ErrorTrace](mediafailedroutedeventargs_errortrace.md) information. Otherwise, if you're only interested in the message, you can access [ErrorMessage](exceptionroutedeventargs_errormessage.md) without casting.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.mediafailedroutedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class MediaFailedRoutedEventArgs extends ExceptionRoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFailedRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFailedRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the trace information for a media failed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.mediafailedroutedeventargs.errortrace
     * @type {HSTRING} 
     */
    ErrorTrace {
        get => this.get_ErrorTrace()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ErrorTrace() {
        if (!this.HasProp("__IMediaFailedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaFailedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFailedRoutedEventArgs := IMediaFailedRoutedEventArgs(outPtr)
        }

        return this.__IMediaFailedRoutedEventArgs.get_ErrorTrace()
    }

;@endregion Instance Methods
}
