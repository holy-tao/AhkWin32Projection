#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGazeDevicePreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Supports the ability to identify and manage all connected eye-tracker devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicepreview
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazeDevicePreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGazeDevicePreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGazeDevicePreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a unique identifier for the eye-tracking device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicepreview.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets whether the eye-tracking device can detect and track the user's eyes.
     * @remarks
     * At this time, no eye-tracking devices report head position, orientation, and movement data. See [Get started with eye control in Windows 10](https://support.microsoft.com/help/4043921/windows-10-get-started-eye-control#supported-devices) for a list of supported eye-tracking devices.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicepreview.cantrackeyes
     * @type {Boolean} 
     */
    CanTrackEyes {
        get => this.get_CanTrackEyes()
    }

    /**
     * Gets whether the eye-tracking device can detect and track the user's head.
     * @remarks
     * At this time, no eye-tracking devices report head position, orientation, and movement data. See [Get started with eye control in Windows 10](https://support.microsoft.com/help/4043921/windows-10-get-started-eye-control#supported-devices) for a list of supported eye-tracking devices.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicepreview.cantrackhead
     * @type {Boolean} 
     */
    CanTrackHead {
        get => this.get_CanTrackHead()
    }

    /**
     * Gets the configuration state of the eye-tracking device.
     * @remarks
     * Use this property to confirm that the eye-tracking device is calibrated and ready to send gaze input events and data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicepreview.configurationstate
     * @type {Integer} 
     */
    ConfigurationState {
        get => this.get_ConfigurationState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IGazeDevicePreview")) {
            if ((queryResult := this.QueryInterface(IGazeDevicePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDevicePreview := IGazeDevicePreview(outPtr)
        }

        return this.__IGazeDevicePreview.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTrackEyes() {
        if (!this.HasProp("__IGazeDevicePreview")) {
            if ((queryResult := this.QueryInterface(IGazeDevicePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDevicePreview := IGazeDevicePreview(outPtr)
        }

        return this.__IGazeDevicePreview.get_CanTrackEyes()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTrackHead() {
        if (!this.HasProp("__IGazeDevicePreview")) {
            if ((queryResult := this.QueryInterface(IGazeDevicePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDevicePreview := IGazeDevicePreview(outPtr)
        }

        return this.__IGazeDevicePreview.get_CanTrackHead()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConfigurationState() {
        if (!this.HasProp("__IGazeDevicePreview")) {
            if ((queryResult := this.QueryInterface(IGazeDevicePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDevicePreview := IGazeDevicePreview(outPtr)
        }

        return this.__IGazeDevicePreview.get_ConfigurationState()
    }

    /**
     * Asynchronously requests the eye-tracking device start its calibration process.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicepreview.requestcalibrationasync
     */
    RequestCalibrationAsync() {
        if (!this.HasProp("__IGazeDevicePreview")) {
            if ((queryResult := this.QueryInterface(IGazeDevicePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDevicePreview := IGazeDevicePreview(outPtr)
        }

        return this.__IGazeDevicePreview.RequestCalibrationAsync()
    }

    /**
     * Retrieves the numeric control description for the eye-tracking device.
     * @param {Integer} usagePage The usage page for the eye-tracking device.
     * @param {Integer} usageId The usage identifier for the eye-tracking device.
     * @returns {IVectorView<HidNumericControlDescription>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicepreview.getnumericcontroldescriptions
     */
    GetNumericControlDescriptions(usagePage, usageId) {
        if (!this.HasProp("__IGazeDevicePreview")) {
            if ((queryResult := this.QueryInterface(IGazeDevicePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDevicePreview := IGazeDevicePreview(outPtr)
        }

        return this.__IGazeDevicePreview.GetNumericControlDescriptions(usagePage, usageId)
    }

    /**
     * Retrieves the boolean control descriptions for the eye-tracking device.
     * @param {Integer} usagePage The usage page for the eye-tracking device.
     * @param {Integer} usageId The usage identifier for the eye-tracking device.
     * @returns {IVectorView<HidBooleanControlDescription>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicepreview.getbooleancontroldescriptions
     */
    GetBooleanControlDescriptions(usagePage, usageId) {
        if (!this.HasProp("__IGazeDevicePreview")) {
            if ((queryResult := this.QueryInterface(IGazeDevicePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDevicePreview := IGazeDevicePreview(outPtr)
        }

        return this.__IGazeDevicePreview.GetBooleanControlDescriptions(usagePage, usageId)
    }

;@endregion Instance Methods
}
