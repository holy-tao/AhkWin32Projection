#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoConfirmationCapturedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [PhotoConfirmationCaptured](mediacapture_photoconfirmationcaptured.md) event.
 * @remarks
 * Handle the [MediaCapture.PhotoConfirmationCaptured](mediacapture_photoconfirmationcaptured.md) event to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.photoconfirmationcapturedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class PhotoConfirmationCapturedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoConfirmationCapturedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoConfirmationCapturedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the captured frame.
     * @remarks
     * The data returned in the Frame property is raw pixel data. In other words, it does not include an image file format header. Because of this, you can't pass the captured frame's stream to the bitmap's [SetSourceAsync](../windows.ui.xaml.media.imaging/bitmapsource_setsourceasync_1118221574.md) method directly. Instead, you must copy the pixel data manually into the bitmap's pixel buffer. The following code snippets show you how to copy the image data and provide a helper class that performs the operation.
     * 
     * First, you need to enable photo confirmation and hook up the [PhotoConfirmationCaptured](mediacapture_photoconfirmationcaptured.md) event.
     * 
     * 
     * 
     * 
     * 
     * [!code-csharp[EnablePhotoConfirmation](../windows.media.capture/code/MediaCaptureVideo/csharp/MainPage.xaml.cs#SnippetEnablePhotoConfirmation)]
     * 
     * 
     * 
     * 
     * 
     * [!code-csharp[PhotoConfirmationCaptured](../windows.media.capture/code/MediaCaptureVideo/csharp/MainPage.xaml.cs#SnippetPhotoConfirmationCaptured)]
     * 
     * 
     * 
     * The following code snippet shows the helper class that defines the extension methods for the copying captured frame data into the writeable bitmap's pixel data stream. The class provides synchronous and asynchronous methods and overloads that allow you to specify a copy buffer size or use a default size.
     * 
     * [!code-csharp[StreamExtenstions](../windows.media.capture/code/MediaCaptureVideo/csharp/MainPage.xaml.cs#SnippetStreamExtenstions)]
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.photoconfirmationcapturedeventargs.frame
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * Gets the time offset from when capture began to the capture of the frame associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.photoconfirmationcapturedeventargs.capturetimeoffset
     * @type {TimeSpan} 
     */
    CaptureTimeOffset {
        get => this.get_CaptureTimeOffset()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CapturedFrame} 
     */
    get_Frame() {
        if (!this.HasProp("__IPhotoConfirmationCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhotoConfirmationCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoConfirmationCapturedEventArgs := IPhotoConfirmationCapturedEventArgs(outPtr)
        }

        return this.__IPhotoConfirmationCapturedEventArgs.get_Frame()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CaptureTimeOffset() {
        if (!this.HasProp("__IPhotoConfirmationCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhotoConfirmationCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoConfirmationCapturedEventArgs := IPhotoConfirmationCapturedEventArgs(outPtr)
        }

        return this.__IPhotoConfirmationCapturedEventArgs.get_CaptureTimeOffset()
    }

;@endregion Instance Methods
}
