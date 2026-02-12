#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RoutedEventArgs.ahk
#Include .\IExceptionRoutedEventArgs.ahk
#Include .\IExceptionRoutedEventArgsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for exceptions that are raised as events by asynchronous operations, such as [ImageFailed](../windows.ui.xaml.controls/image_imagefailed.md).
 * @remarks
 * Don't display [ErrorMessage](exceptionroutedeventargs_errormessage.md) strings to end users. Instead, use substrings and codes within the string to positively identify the error condition, and have your app take appropriate action or display user-appropriate information in the app UI.
 * 
 * ExceptionRoutedEventArgs is the event data for several events that use the [ExceptionRoutedEventHandler](exceptionroutedeventhandler.md) delegate. These include:
 * + [Image.ImageFailed](../windows.ui.xaml.controls/image_imagefailed.md)
 * + [ImageBrush.ImageFailed](../windows.ui.xaml.media/imagebrush_imagefailed.md)
 * + [BitmapImage.ImageFailed](../windows.ui.xaml.media.imaging/bitmapimage_imagefailed.md)
 * + [MediaElement.MediaFailed](../windows.ui.xaml.controls/mediaelement_mediafailed.md); for this event you can cast the event data to the more specific [MediaFailedRoutedEventArgs](mediafailedroutedeventargs.md) result.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.exceptionroutedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ExceptionRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExceptionRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExceptionRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the message component of the exception, as a string.
     * @remarks
     * Don't display ErrorMessage strings to end users. Instead, use substrings and codes within the string to positively identify the error condition, and have your app take appropriate action or display user-appropriate information in the app UI.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.exceptionroutedeventargs.errormessage
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
     * @returns {HSTRING} 
     */
    get_ErrorMessage() {
        if (!this.HasProp("__IExceptionRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IExceptionRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExceptionRoutedEventArgs := IExceptionRoutedEventArgs(outPtr)
        }

        return this.__IExceptionRoutedEventArgs.get_ErrorMessage()
    }

;@endregion Instance Methods
}
