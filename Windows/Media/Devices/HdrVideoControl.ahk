#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHdrVideoControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * When supported, allows an app to enable High Dynamic Range (HDR) video recording on the capture device.
 * @remarks
 * Get an instance of this class by accessing the [VideoDeviceController.HdrVideoControl](videodevicecontroller_hdrvideocontrol.md) property.
 * 
 * For how-to guidance for using manual video capture controls, see [Manual camera controls for video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.hdrvideocontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class HdrVideoControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHdrVideoControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHdrVideoControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the [HdrVideoControl](hdrvideocontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.hdrvideocontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the list of [HdrVideoMode](hdrvideomode.md) values indicating the modes supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.hdrvideocontrol.supportedmodes
     * @type {IVectorView<Integer>} 
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * Gets or sets a value indicating the current High Dynamic Range (HDR) video recording mode of the capture device.
     * @remarks
     * When the **Mode** property is changed, the stream may freeze or restart in cases where the sensor has to be reprogrammed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.hdrvideocontrol.mode
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
        if (!this.HasProp("__IHdrVideoControl")) {
            if ((queryResult := this.QueryInterface(IHdrVideoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdrVideoControl := IHdrVideoControl(outPtr)
        }

        return this.__IHdrVideoControl.get_Supported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedModes() {
        if (!this.HasProp("__IHdrVideoControl")) {
            if ((queryResult := this.QueryInterface(IHdrVideoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdrVideoControl := IHdrVideoControl(outPtr)
        }

        return this.__IHdrVideoControl.get_SupportedModes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IHdrVideoControl")) {
            if ((queryResult := this.QueryInterface(IHdrVideoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdrVideoControl := IHdrVideoControl(outPtr)
        }

        return this.__IHdrVideoControl.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IHdrVideoControl")) {
            if ((queryResult := this.QueryInterface(IHdrVideoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdrVideoControl := IHdrVideoControl(outPtr)
        }

        return this.__IHdrVideoControl.put_Mode(value)
    }

;@endregion Instance Methods
}
