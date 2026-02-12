#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVariablePhotoCapturedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PhotoCaptured](variablephotosequencecapture_photocaptured.md) event.
 * @remarks
 * Handle the [VariablePhotoSequenceCapture.PhotoCaptured](variablephotosequencecapture_photocaptured.md) event to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotocapturedeventargs
 * @namespace Windows.Media.Capture.Core
 * @version WindowsRuntime 1.4
 */
class VariablePhotoCapturedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVariablePhotoCapturedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVariablePhotoCapturedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [CapturedFrame](variablephotocapturedeventargs_capturedframecontrolvalues.md) object representing a captured frame of a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotocapturedeventargs.frame
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * Gets the time offset of the capture of the associated frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotocapturedeventargs.capturetimeoffset
     * @type {TimeSpan} 
     */
    CaptureTimeOffset {
        get => this.get_CaptureTimeOffset()
    }

    /**
     * Gets an index value that indicates which element of the [DesiredFrameControllers](../windows.media.devices.core/variablephotosequencecontroller_desiredframecontrollers.md) vector was used to specify the requested control values for the associated frame of a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotocapturedeventargs.usedframecontrollerindex
     * @type {IReference<Integer>} 
     */
    UsedFrameControllerIndex {
        get => this.get_UsedFrameControllerIndex()
    }

    /**
     * Gets a CapturedFrameControlValues object that indicates the capture settings used for the associated frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotocapturedeventargs.capturedframecontrolvalues
     * @type {CapturedFrameControlValues} 
     */
    CapturedFrameControlValues {
        get => this.get_CapturedFrameControlValues()
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
        if (!this.HasProp("__IVariablePhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoCapturedEventArgs := IVariablePhotoCapturedEventArgs(outPtr)
        }

        return this.__IVariablePhotoCapturedEventArgs.get_Frame()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CaptureTimeOffset() {
        if (!this.HasProp("__IVariablePhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoCapturedEventArgs := IVariablePhotoCapturedEventArgs(outPtr)
        }

        return this.__IVariablePhotoCapturedEventArgs.get_CaptureTimeOffset()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_UsedFrameControllerIndex() {
        if (!this.HasProp("__IVariablePhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoCapturedEventArgs := IVariablePhotoCapturedEventArgs(outPtr)
        }

        return this.__IVariablePhotoCapturedEventArgs.get_UsedFrameControllerIndex()
    }

    /**
     * 
     * @returns {CapturedFrameControlValues} 
     */
    get_CapturedFrameControlValues() {
        if (!this.HasProp("__IVariablePhotoCapturedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoCapturedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoCapturedEventArgs := IVariablePhotoCapturedEventArgs(outPtr)
        }

        return this.__IVariablePhotoCapturedEventArgs.get_CapturedFrameControlValues()
    }

;@endregion Instance Methods
}
