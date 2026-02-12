#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IZoomControl.ahk
#Include .\IZoomControl2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the zoom settings on a capture device.
 * @remarks
 * For how-to guidance for using the **FocusControl**, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * 
 * Get an instance of this class by accessing the [ZoomControl](videodevicecontroller_zoomcontrol.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ZoomControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IZoomControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IZoomControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether zoom control is supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the minimum zoom value supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol.min
     * @type {Float} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum zoom value supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol.max
     * @type {Float} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest zoom value increment supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol.step
     * @type {Float} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * Gets or sets the zoom value to be used by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol.value
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets the list of [ZoomTransitionMode](zoomtransitionmode.md) values indicating the modes supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol.supportedmodes
     * @type {IVectorView<Integer>} 
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * Gets a value indicating the current zoom transition mode.
     * @remarks
     * Set the zoom transition mode by creating an instance of the [ZoomSettings](zoomsettings.md) class and passing it into the [Configure](focuscontrol_configure_1968380006.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
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
        if (!this.HasProp("__IZoomControl")) {
            if ((queryResult := this.QueryInterface(IZoomControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl := IZoomControl(outPtr)
        }

        return this.__IZoomControl.get_Supported()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Min() {
        if (!this.HasProp("__IZoomControl")) {
            if ((queryResult := this.QueryInterface(IZoomControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl := IZoomControl(outPtr)
        }

        return this.__IZoomControl.get_Min()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Max() {
        if (!this.HasProp("__IZoomControl")) {
            if ((queryResult := this.QueryInterface(IZoomControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl := IZoomControl(outPtr)
        }

        return this.__IZoomControl.get_Max()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Step() {
        if (!this.HasProp("__IZoomControl")) {
            if ((queryResult := this.QueryInterface(IZoomControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl := IZoomControl(outPtr)
        }

        return this.__IZoomControl.get_Step()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        if (!this.HasProp("__IZoomControl")) {
            if ((queryResult := this.QueryInterface(IZoomControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl := IZoomControl(outPtr)
        }

        return this.__IZoomControl.get_Value()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IZoomControl")) {
            if ((queryResult := this.QueryInterface(IZoomControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl := IZoomControl(outPtr)
        }

        return this.__IZoomControl.put_Value(value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedModes() {
        if (!this.HasProp("__IZoomControl2")) {
            if ((queryResult := this.QueryInterface(IZoomControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl2 := IZoomControl2(outPtr)
        }

        return this.__IZoomControl2.get_SupportedModes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IZoomControl2")) {
            if ((queryResult := this.QueryInterface(IZoomControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl2 := IZoomControl2(outPtr)
        }

        return this.__IZoomControl2.get_Mode()
    }

    /**
     * Configures the zoom control with the provided zoom settings.
     * @param {ZoomSettings} settings The zoom settings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomcontrol.configure
     */
    Configure(settings) {
        if (!this.HasProp("__IZoomControl2")) {
            if ((queryResult := this.QueryInterface(IZoomControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomControl2 := IZoomControl2(outPtr)
        }

        return this.__IZoomControl2.Configure(settings)
    }

;@endregion Instance Methods
}
