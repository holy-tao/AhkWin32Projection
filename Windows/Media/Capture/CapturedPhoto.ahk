#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICapturedPhoto.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a photo taken from a capture device such as a webcam attached.
 * @remarks
 * Get an instance of this class by calling [LowLagPhotoCapture.CaptureAsync](lowlagphotocapture_captureasync_2078018041.md). For how-to guidance for using **LowLagPhotoCapture**, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedphoto
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CapturedPhoto extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICapturedPhoto

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICapturedPhoto.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the photo data, represented as [CapturedFrame](capturedframe.md) object, associated with the [CapturedPhoto](capturedphoto.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedphoto.frame
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * Represents a thumbnail image of the capture photo.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedphoto.thumbnail
     * @type {CapturedFrame} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
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
        if (!this.HasProp("__ICapturedPhoto")) {
            if ((queryResult := this.QueryInterface(ICapturedPhoto.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedPhoto := ICapturedPhoto(outPtr)
        }

        return this.__ICapturedPhoto.get_Frame()
    }

    /**
     * 
     * @returns {CapturedFrame} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__ICapturedPhoto")) {
            if ((queryResult := this.QueryInterface(ICapturedPhoto.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedPhoto := ICapturedPhoto(outPtr)
        }

        return this.__ICapturedPhoto.get_Thumbnail()
    }

;@endregion Instance Methods
}
