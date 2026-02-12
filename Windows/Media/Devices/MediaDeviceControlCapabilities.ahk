#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaDeviceControlCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets the capabilities of a camera setting.
 * @remarks
 * To get an instance of this object, retrieve the [Capabilities](mediadevicecontrol_capabilities.md) property.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrolcapabilities
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class MediaDeviceControlCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaDeviceControlCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaDeviceControlCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the camera supports this camera setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrolcapabilities.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the minimum value of the camera setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrolcapabilities.min
     * @type {Float} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Sets the maximum value of the camera setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrolcapabilities.max
     * @type {Float} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Ges the step size for the setting. The step size is the smallest increment by which the property can change.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrolcapabilities.step
     * @type {Float} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * Gets the default value of the camera setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrolcapabilities.default
     * @type {Float} 
     */
    Default {
        get => this.get_Default()
    }

    /**
     * Queries whether the camera supports automatic adjustment of the setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevicecontrolcapabilities.automodesupported
     * @type {Boolean} 
     */
    AutoModeSupported {
        get => this.get_AutoModeSupported()
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
        if (!this.HasProp("__IMediaDeviceControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControlCapabilities := IMediaDeviceControlCapabilities(outPtr)
        }

        return this.__IMediaDeviceControlCapabilities.get_Supported()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Min() {
        if (!this.HasProp("__IMediaDeviceControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControlCapabilities := IMediaDeviceControlCapabilities(outPtr)
        }

        return this.__IMediaDeviceControlCapabilities.get_Min()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Max() {
        if (!this.HasProp("__IMediaDeviceControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControlCapabilities := IMediaDeviceControlCapabilities(outPtr)
        }

        return this.__IMediaDeviceControlCapabilities.get_Max()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Step() {
        if (!this.HasProp("__IMediaDeviceControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControlCapabilities := IMediaDeviceControlCapabilities(outPtr)
        }

        return this.__IMediaDeviceControlCapabilities.get_Step()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Default() {
        if (!this.HasProp("__IMediaDeviceControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControlCapabilities := IMediaDeviceControlCapabilities(outPtr)
        }

        return this.__IMediaDeviceControlCapabilities.get_Default()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoModeSupported() {
        if (!this.HasProp("__IMediaDeviceControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceControlCapabilities := IMediaDeviceControlCapabilities(outPtr)
        }

        return this.__IMediaDeviceControlCapabilities.get_AutoModeSupported()
    }

;@endregion Instance Methods
}
