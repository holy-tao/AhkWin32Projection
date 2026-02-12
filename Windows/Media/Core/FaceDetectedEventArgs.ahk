#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFaceDetectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [FaceDetected](facedetectioneffect_facedetected.md) event.
 * @remarks
 * Get an instance of this class by handling the [FaceDetected](facedetectioneffect_facedetected.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class FaceDetectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFaceDetectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFaceDetectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [FaceDetectionEffectFrame](facedetectioneffectframe.md) associated with a [FaceDetected](facedetectioneffect_facedetected.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectedeventargs.resultframe
     * @type {FaceDetectionEffectFrame} 
     */
    ResultFrame {
        get => this.get_ResultFrame()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {FaceDetectionEffectFrame} 
     */
    get_ResultFrame() {
        if (!this.HasProp("__IFaceDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IFaceDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectedEventArgs := IFaceDetectedEventArgs(outPtr)
        }

        return this.__IFaceDetectedEventArgs.get_ResultFrame()
    }

;@endregion Instance Methods
}
