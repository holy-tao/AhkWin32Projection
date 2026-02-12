#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoDeviceControllerGetDevicePropertyResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of an operation to get the value of a video device controller driver property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontrollergetdevicepropertyresult
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class VideoDeviceControllerGetDevicePropertyResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoDeviceControllerGetDevicePropertyResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoDeviceControllerGetDevicePropertyResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies the status of an operation to get the value of a video device controller driver property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontrollergetdevicepropertyresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets an object representing the result value of an operation to get the value of a video device controller driver property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontrollergetdevicepropertyresult.value
     * @type {IInspectable} 
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
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IVideoDeviceControllerGetDevicePropertyResult")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceControllerGetDevicePropertyResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceControllerGetDevicePropertyResult := IVideoDeviceControllerGetDevicePropertyResult(outPtr)
        }

        return this.__IVideoDeviceControllerGetDevicePropertyResult.get_Status()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        if (!this.HasProp("__IVideoDeviceControllerGetDevicePropertyResult")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceControllerGetDevicePropertyResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceControllerGetDevicePropertyResult := IVideoDeviceControllerGetDevicePropertyResult(outPtr)
        }

        return this.__IVideoDeviceControllerGetDevicePropertyResult.get_Value()
    }

;@endregion Instance Methods
}
