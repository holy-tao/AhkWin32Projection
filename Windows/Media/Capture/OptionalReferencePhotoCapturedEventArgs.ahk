#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOptionalReferencePhotoCapturedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the AdvancedPhotoCapture.OptionalReferencePhotoCaptured event.
 * @remarks
 * Get an instance of this class by handling the AdvancedPhotoCapture.OptionalReferencePhotoCaptured event.
 * 
 * Some devices support returning a reference photo from the capture operation that can be consumed by the calling app before all image frames for the operation have been captured or processed. On devices that do not support returning a reference photo, this event is never raised.
 * 
 * For how-to guidance for using [AdvancedPhotoCapture](advancedphotocapture.md), see [High dynamic range (HDR) and low-light photo capture](/windows/apps/develop/camera/hdr-low-light-photo-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.optionalreferencephotocapturedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class OptionalReferencePhotoCapturedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOptionalReferencePhotoCapturedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOptionalReferencePhotoCapturedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the captured frame containing the reference photo from the advanced photo capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.optionalreferencephotocapturedeventargs.frame
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * Gets the app-defined context object associated with the advanced photo capture operation, if one was provided in the call to [AdvancedPhotoCapture.CaptureAsync(Object)](advancedphotocapture_captureasync_651770772.md).
     * @remarks
     * One overload of [AdvancedPhotoCapture.CaptureAsync](/uwp/api/windows.media.capture.advancedphotocapture.captureasync) allows you to provide an app-defined object that conveys context information.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.optionalreferencephotocapturedeventargs.context
     * @type {IInspectable} 
     */
    Context {
        get => this.get_Context()
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
        if (!this.HasProp("__IOptionalReferencePhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IOptionalReferencePhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOptionalReferencePhotoCapturedEventArgs := IOptionalReferencePhotoCapturedEventArgs(outPtr)
        }

        return this.__IOptionalReferencePhotoCapturedEventArgs.get_Frame()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Context() {
        if (!this.HasProp("__IOptionalReferencePhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IOptionalReferencePhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOptionalReferencePhotoCapturedEventArgs := IOptionalReferencePhotoCapturedEventArgs(outPtr)
        }

        return this.__IOptionalReferencePhotoCapturedEventArgs.get_Context()
    }

;@endregion Instance Methods
}
