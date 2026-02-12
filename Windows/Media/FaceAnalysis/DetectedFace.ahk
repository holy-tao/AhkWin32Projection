#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDetectedFace.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a face that was detected in a [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) or a [VideoFrame](../windows.media/videoframe.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.detectedface
 * @namespace Windows.Media.FaceAnalysis
 * @version WindowsRuntime 1.4
 */
class DetectedFace extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDetectedFace

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDetectedFace.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bounds the detected face occupies in the [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) or [VideoFrame](../windows.media/videoframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.faceanalysis.detectedface.facebox
     * @type {BitmapBounds} 
     */
    FaceBox {
        get => this.get_FaceBox()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BitmapBounds} 
     */
    get_FaceBox() {
        if (!this.HasProp("__IDetectedFace")) {
            if ((queryResult := this.QueryInterface(IDetectedFace.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectedFace := IDetectedFace(outPtr)
        }

        return this.__IDetectedFace.get_FaceBox()
    }

;@endregion Instance Methods
}
