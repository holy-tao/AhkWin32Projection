#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExposureControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the exposure settings on a capture device.
 * @remarks
 * The **ExposureControl** gives apps additional control over the exposure settings on a device.
 * 
 * To set an exposure value, call [SetValueAsync](exposurecontrol_setvalueasync_1247308686.md). To turn auto exposure on, call [SetAutoAsync](exposurecontrol_setautoasync_1168787363.md).
 * 
 * You can find out if a device supports this control by checking [ExposureControl.Supported](exposurecontrol_supported.md).
 * 
 * If the device does not support the ExposureControl, you can still use the [Exposure](videodevicecontroller_exposure.md) property on the [VideoCaptureDevice](https://msdn.microsoft.com/library/afba2768-11a0-4105-a5b1-c48bc961e9ed) to set the exposure value.
 * 
 * You can access the **ExposureControl** for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * For how-to guidance for using the **ExposureControl**, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ExposureControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExposureControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExposureControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies if the capture device supports the exposure control.
     * @remarks
     * If the device does not support the [ExposureControl](exposurecontrol.md), you can still use the [Exposure](videodevicecontroller_exposure.md) property on the [VideoDeviceController](videodevicecontroller_md) to set the exposure value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets a value that indicates if auto exposure is enabled.
     * @remarks
     * Automatic exposure mode is only supported while the preview stream is running. Check to make sure that the preview stream is running before turning on automatic exposure.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol.auto
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
    }

    /**
     * Gets the minimum EV compensation supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol.min
     * @type {TimeSpan} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * The maximum EV compensation supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol.max
     * @type {TimeSpan} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest exposure time increment supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol.step
     * @type {TimeSpan} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * Gets the EV compensation value.
     * @remarks
     * To set an exposure value, call [SetValueAsync](exposurecontrol_setvalueasync_1247308686.md) specifying a value between the [Min](exposurecontrol_min.md) and [Max](exposurecontrol_max.md) exposure values. To turn auto exposure on, call [SetAutoAsync](exposurecontrol_setautoasync_1168787363.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol.value
     * @type {TimeSpan} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        if (!this.HasProp("__IExposureControl")) {
            if ((queryResult := this.QueryInterface(IExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureControl := IExposureControl(outPtr)
        }

        return this.__IExposureControl.get_Supported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Auto() {
        if (!this.HasProp("__IExposureControl")) {
            if ((queryResult := this.QueryInterface(IExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureControl := IExposureControl(outPtr)
        }

        return this.__IExposureControl.get_Auto()
    }

    /**
     * Asynchronously enables or disable auto exposure.
     * @remarks
     * Automatic exposure adjustment is only supported while the preview stream is running. Check to make sure that the preview stream is running before turning on automatic exposure mode.
     * @param {Boolean} value Specifies whether or not to enable or disable auto exposure.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol.setautoasync
     */
    SetAutoAsync(value) {
        if (!this.HasProp("__IExposureControl")) {
            if ((queryResult := this.QueryInterface(IExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureControl := IExposureControl(outPtr)
        }

        return this.__IExposureControl.SetAutoAsync(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Min() {
        if (!this.HasProp("__IExposureControl")) {
            if ((queryResult := this.QueryInterface(IExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureControl := IExposureControl(outPtr)
        }

        return this.__IExposureControl.get_Min()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Max() {
        if (!this.HasProp("__IExposureControl")) {
            if ((queryResult := this.QueryInterface(IExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureControl := IExposureControl(outPtr)
        }

        return this.__IExposureControl.get_Max()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Step() {
        if (!this.HasProp("__IExposureControl")) {
            if ((queryResult := this.QueryInterface(IExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureControl := IExposureControl(outPtr)
        }

        return this.__IExposureControl.get_Step()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Value() {
        if (!this.HasProp("__IExposureControl")) {
            if ((queryResult := this.QueryInterface(IExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureControl := IExposureControl(outPtr)
        }

        return this.__IExposureControl.get_Value()
    }

    /**
     * Asynchronously sets the exposure time.
     * @param {TimeSpan} shutterDuration The exposure time to set the [Value](exposurecontrol_value.md) property to. The minimum and maximum values are specified by [Min](exposurecontrol_min.md) and [Max](exposurecontrol_max.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecontrol.setvalueasync
     */
    SetValueAsync(shutterDuration) {
        if (!this.HasProp("__IExposureControl")) {
            if ((queryResult := this.QueryInterface(IExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureControl := IExposureControl(outPtr)
        }

        return this.__IExposureControl.SetValueAsync(shutterDuration)
    }

;@endregion Instance Methods
}
