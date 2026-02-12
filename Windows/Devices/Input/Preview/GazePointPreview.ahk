#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGazePointPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides basic properties for the gaze input point associated with a single eye-tracking device.
 * @remarks
 * The screen coordinates of the gaze point are in device-independent pixels (DIP) relative to, and constrained by, the application view (or gaze-enabled element).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazepointpreview
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazePointPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGazePointPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGazePointPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the eye-tracking device associated with the gaze input.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazepointpreview.sourcedevice
     * @type {GazeDevicePreview} 
     */
    SourceDevice {
        get => this.get_SourceDevice()
    }

    /**
     * Gets the location, derived from the position and orientation of the user's eyes, of the gaze point.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazepointpreview.eyegazeposition
     * @type {IReference<POINT>} 
     */
    EyeGazePosition {
        get => this.get_EyeGazePosition()
    }

    /**
     * Gets the location, derived from the user's head position and orientation, of the gaze point.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazepointpreview.headgazeposition
     * @type {IReference<POINT>} 
     */
    HeadGazePosition {
        get => this.get_HeadGazePosition()
    }

    /**
     * Gets the time of the gaze point input event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazepointpreview.timestamp
     * @type {Integer} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets a [Human Interface Device (HID)](https://www.usb.org/hid) input report for the eye-tracking device.
     * @remarks
     * Devices issue input reports to describe state changes, user-input, and other device-specific data. For example, A HID eye-tracking sensor would use an input report to signal a gaze event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazepointpreview.hidinputreport
     * @type {HidInputReport} 
     */
    HidInputReport {
        get => this.get_HidInputReport()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GazeDevicePreview} 
     */
    get_SourceDevice() {
        if (!this.HasProp("__IGazePointPreview")) {
            if ((queryResult := this.QueryInterface(IGazePointPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazePointPreview := IGazePointPreview(outPtr)
        }

        return this.__IGazePointPreview.get_SourceDevice()
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_EyeGazePosition() {
        if (!this.HasProp("__IGazePointPreview")) {
            if ((queryResult := this.QueryInterface(IGazePointPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazePointPreview := IGazePointPreview(outPtr)
        }

        return this.__IGazePointPreview.get_EyeGazePosition()
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_HeadGazePosition() {
        if (!this.HasProp("__IGazePointPreview")) {
            if ((queryResult := this.QueryInterface(IGazePointPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazePointPreview := IGazePointPreview(outPtr)
        }

        return this.__IGazePointPreview.get_HeadGazePosition()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IGazePointPreview")) {
            if ((queryResult := this.QueryInterface(IGazePointPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazePointPreview := IGazePointPreview(outPtr)
        }

        return this.__IGazePointPreview.get_Timestamp()
    }

    /**
     * 
     * @returns {HidInputReport} 
     */
    get_HidInputReport() {
        if (!this.HasProp("__IGazePointPreview")) {
            if ((queryResult := this.QueryInterface(IGazePointPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazePointPreview := IGazePointPreview(outPtr)
        }

        return this.__IGazePointPreview.get_HidInputReport()
    }

;@endregion Instance Methods
}
