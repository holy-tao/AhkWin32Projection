#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOpticalImageStabilizationControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * When supported, allows an app to enable optical image stabilization on the capture device.
 * @remarks
 * Get an instance of this class by accessing the [VideoDeviceController.OpticalImageStabilizationControl](videodevicecontroller_opticalimagestabilizationcontrol.md) property.
 * 
 * For how-to guidance for using the **OpticalImageStabilizationControl**, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.opticalimagestabilizationcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class OpticalImageStabilizationControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOpticalImageStabilizationControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOpticalImageStabilizationControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the [OpticalImageStabilizationControl](opticalimagestabilizationcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.opticalimagestabilizationcontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the list of [OpticalImageStabilizationMode](opticalimagestabilizationmode.md) values indicating the modes supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.opticalimagestabilizationcontrol.supportedmodes
     * @type {IVectorView<Integer>} 
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * Gets or sets a value indicating the current optical image stabilization mode of the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.opticalimagestabilizationcontrol.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
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
        if (!this.HasProp("__IOpticalImageStabilizationControl")) {
            if ((queryResult := this.QueryInterface(IOpticalImageStabilizationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOpticalImageStabilizationControl := IOpticalImageStabilizationControl(outPtr)
        }

        return this.__IOpticalImageStabilizationControl.get_Supported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedModes() {
        if (!this.HasProp("__IOpticalImageStabilizationControl")) {
            if ((queryResult := this.QueryInterface(IOpticalImageStabilizationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOpticalImageStabilizationControl := IOpticalImageStabilizationControl(outPtr)
        }

        return this.__IOpticalImageStabilizationControl.get_SupportedModes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IOpticalImageStabilizationControl")) {
            if ((queryResult := this.QueryInterface(IOpticalImageStabilizationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOpticalImageStabilizationControl := IOpticalImageStabilizationControl(outPtr)
        }

        return this.__IOpticalImageStabilizationControl.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IOpticalImageStabilizationControl")) {
            if ((queryResult := this.QueryInterface(IOpticalImageStabilizationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOpticalImageStabilizationControl := IOpticalImageStabilizationControl(outPtr)
        }

        return this.__IOpticalImageStabilizationControl.put_Mode(value)
    }

;@endregion Instance Methods
}
