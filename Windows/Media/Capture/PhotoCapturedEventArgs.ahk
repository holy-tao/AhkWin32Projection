#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoCapturedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the photo sequence [PhotoCaptured](lowlagphotosequencecapture_photocaptured.md) event.
 * @remarks
 * [Frame](photocapturedeventargs_frame.md) is the captured image associated with this event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.photocapturedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class PhotoCapturedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoCapturedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoCapturedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the captured image associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.photocapturedeventargs.frame
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * Gets a thumbnail version of the captured image associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.photocapturedeventargs.thumbnail
     * @type {CapturedFrame} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * Gets a value that indicates time offset in the photo sequence.
     * @remarks
     * A negative value indicates the image was taken prior to the start of the photo sequence, while a positive value indicates the image occurred after the photo sequence was started.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.photocapturedeventargs.capturetimeoffset
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
        if (!this.HasProp("__IPhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoCapturedEventArgs := IPhotoCapturedEventArgs(outPtr)
        }

        return this.__IPhotoCapturedEventArgs.get_Frame()
    }

    /**
     * 
     * @returns {CapturedFrame} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IPhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoCapturedEventArgs := IPhotoCapturedEventArgs(outPtr)
        }

        return this.__IPhotoCapturedEventArgs.get_Thumbnail()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CaptureTimeOffset() {
        if (!this.HasProp("__IPhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoCapturedEventArgs := IPhotoCapturedEventArgs(outPtr)
        }

        return this.__IPhotoCapturedEventArgs.get_CaptureTimeOffset()
    }

;@endregion Instance Methods
}
