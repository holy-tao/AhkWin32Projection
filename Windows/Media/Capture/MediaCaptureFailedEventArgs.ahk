#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCaptureFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaCapture.Failed](mediacapture_failed.md) event.
 * @remarks
 * This object is not instantiated directly, it is created by the [MediaCapture.Failed](mediacapture_failed.md) event and is returned as an argument to the [MediaCaptureFailedEventHandler](mediacapturefailedeventhandler.md) delegate.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturefailedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCaptureFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCaptureFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A message string for the error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturefailedeventargs.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * The error code of the error that caused the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturefailedeventargs.code
     * @type {Integer} 
     */
    Code {
        get => this.get_Code()
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
    get_Message() {
        if (!this.HasProp("__IMediaCaptureFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureFailedEventArgs := IMediaCaptureFailedEventArgs(outPtr)
        }

        return this.__IMediaCaptureFailedEventArgs.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code() {
        if (!this.HasProp("__IMediaCaptureFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureFailedEventArgs := IMediaCaptureFailedEventArgs(outPtr)
        }

        return this.__IMediaCaptureFailedEventArgs.get_Code()
    }

;@endregion Instance Methods
}
