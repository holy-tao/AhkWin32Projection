#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaDeviceControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets or sets a device setting on a camera.
 * @remarks
 * Various properties on the [VideoDeviceController](videodevicecontroller.md) object returns instances of the MediaDeviceControl object. Each [VideoDeviceController](videodevicecontroller.md) property represents a particular setting on the camera, such as brightness or focus. Use the MediaDeviceControl object to: 
 * + Get or set the camera setting.
 * + Enable automatic adjustment of the setting.
 * + Get the range of values that the camera supports for the setting.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class MediaDeviceControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaDeviceControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaDeviceControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the capabilities of the camera for this camera setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrol.capabilities
     * @type {MediaDeviceControlCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaDeviceControlCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__IMediaDeviceControl")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControl := IMediaDeviceControl(outPtr)
        }

        return this.__IMediaDeviceControl.get_Capabilities()
    }

    /**
     * Gets the value of the camera setting.
     * @param {Pointer<Double>} value The current value of the setting. The units depend on the setting.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrol.trygetvalue
     */
    TryGetValue(value) {
        if (!this.HasProp("__IMediaDeviceControl")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControl := IMediaDeviceControl(outPtr)
        }

        return this.__IMediaDeviceControl.TryGetValue(value)
    }

    /**
     * Sets the camera setting.
     * @param {Float} value The new value of the camera setting. The units depend on the setting.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrol.trysetvalue
     */
    TrySetValue(value) {
        if (!this.HasProp("__IMediaDeviceControl")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControl := IMediaDeviceControl(outPtr)
        }

        return this.__IMediaDeviceControl.TrySetValue(value)
    }

    /**
     * Indicates whether automatic adjustment of the camera setting is enabled.
     * 
     * 
     * <!--Note: This method returns two booleans: The "value" param indicates whether auto adjustment is enabled/disabled, and is returned as an [out] param, and the return value indicates success/failure of the method. But I have no idea how [out] params are projected in JS. This seems very weird.-->
     * @param {Pointer<Boolean>} value True if automatic adjustment is enabled; false otherwise.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrol.trygetauto
     */
    TryGetAuto(value) {
        if (!this.HasProp("__IMediaDeviceControl")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControl := IMediaDeviceControl(outPtr)
        }

        return this.__IMediaDeviceControl.TryGetAuto(value)
    }

    /**
     * Enables or disables automatic adjustment of the camera setting.
     * @remarks
     * Depending on the setting and the camera model, the camera might not support automatic adjustment.
     * @param {Boolean} value True to enable automatic adjustment; or false to disable automatic adjustment. If false, call [TrySetValue](mediadevicecontrol_trysetvalue_1874772851.md) to adjust the setting.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrol.trysetauto
     */
    TrySetAuto(value) {
        if (!this.HasProp("__IMediaDeviceControl")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControl := IMediaDeviceControl(outPtr)
        }

        return this.__IMediaDeviceControl.TrySetAuto(value)
    }

;@endregion Instance Methods
}
