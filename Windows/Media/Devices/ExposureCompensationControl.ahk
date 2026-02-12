#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExposureCompensationControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for modifying exposure levels of captured photos.
 * @remarks
 * ExposureCompensationControl enables apps to modify exposure levels of captured photos.
 * 
 * You can find out if a device supports this control by checking [ExposureCompensationControl.Supported](exposurecompensationcontrol_supported.md).
 * 
 * You can access the ExposureCompensationControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * For how-to guidance for using the **ExposureCompensationControl**, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecompensationcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ExposureCompensationControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExposureCompensationControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExposureCompensationControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies if the capture device supports the exposure compensation control.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecompensationcontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the minimum exposure time.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecompensationcontrol.min
     * @type {Float} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum exposure time.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecompensationcontrol.max
     * @type {Float} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest exposure compensation increment supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecompensationcontrol.step
     * @type {Float} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * Gets the exposure compensation level.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecompensationcontrol.value
     * @type {Float} 
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
        if (!this.HasProp("__IExposureCompensationControl")) {
            if ((queryResult := this.QueryInterface(IExposureCompensationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureCompensationControl := IExposureCompensationControl(outPtr)
        }

        return this.__IExposureCompensationControl.get_Supported()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Min() {
        if (!this.HasProp("__IExposureCompensationControl")) {
            if ((queryResult := this.QueryInterface(IExposureCompensationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureCompensationControl := IExposureCompensationControl(outPtr)
        }

        return this.__IExposureCompensationControl.get_Min()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Max() {
        if (!this.HasProp("__IExposureCompensationControl")) {
            if ((queryResult := this.QueryInterface(IExposureCompensationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureCompensationControl := IExposureCompensationControl(outPtr)
        }

        return this.__IExposureCompensationControl.get_Max()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Step() {
        if (!this.HasProp("__IExposureCompensationControl")) {
            if ((queryResult := this.QueryInterface(IExposureCompensationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureCompensationControl := IExposureCompensationControl(outPtr)
        }

        return this.__IExposureCompensationControl.get_Step()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        if (!this.HasProp("__IExposureCompensationControl")) {
            if ((queryResult := this.QueryInterface(IExposureCompensationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureCompensationControl := IExposureCompensationControl(outPtr)
        }

        return this.__IExposureCompensationControl.get_Value()
    }

    /**
     * Asynchronously sets the exposure compensation.
     * @remarks
     * The supplied value must be between [Min](exposurecompensationcontrol_min.md) and [Max](exposurecompensationcontrol_max.md), inclusive, in increments of [Step](exposurecompensationcontrol_step.md). If you supply an arbitrary value that does not meet these requirements, the value will not be rounded. Instead, an exception will be thrown.
     * @param {Float} value The exposure compensation level to set the [Value](exposurecompensationcontrol_value.md) property to. The minimum and maximum values are specified by [Min](exposurecompensationcontrol_min.md) and [Max](exposurecompensationcontrol_max.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurecompensationcontrol.setvalueasync
     */
    SetValueAsync(value) {
        if (!this.HasProp("__IExposureCompensationControl")) {
            if ((queryResult := this.QueryInterface(IExposureCompensationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposureCompensationControl := IExposureCompensationControl(outPtr)
        }

        return this.__IExposureCompensationControl.SetValueAsync(value)
    }

;@endregion Instance Methods
}
