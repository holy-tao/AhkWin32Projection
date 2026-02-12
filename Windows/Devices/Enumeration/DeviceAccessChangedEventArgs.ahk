#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceAccessChangedEventArgs.ahk
#Include .\IDeviceAccessChangedEventArgs2.ahk
#Include .\IDeviceAccessChangedEventArgs3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AccessChanged](deviceaccessinformation_accesschanged.md) event.
 * @remarks
 * This object is not instantiated directly, it is created by the [AccessChanged](deviceaccessinformation_accesschanged.md) event and is returned as an argument to the [AccessChanged](deviceaccessinformation_accesschanged.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccesschangedeventargs
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceAccessChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceAccessChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceAccessChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The new status of access to a device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccesschangedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the [DeviceInformation](deviceinformation.md) ID of the device referenced by [DeviceAccessChangedEventArgs](deviceaccesschangedeventargs.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccesschangedeventargs.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Boolean} 
     */
    UserPromptRequired {
        get => this.get_UserPromptRequired()
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
        if (!this.HasProp("__IDeviceAccessChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeviceAccessChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccessChangedEventArgs := IDeviceAccessChangedEventArgs(outPtr)
        }

        return this.__IDeviceAccessChangedEventArgs.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IDeviceAccessChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccessChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccessChangedEventArgs2 := IDeviceAccessChangedEventArgs2(outPtr)
        }

        return this.__IDeviceAccessChangedEventArgs2.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UserPromptRequired() {
        if (!this.HasProp("__IDeviceAccessChangedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IDeviceAccessChangedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccessChangedEventArgs3 := IDeviceAccessChangedEventArgs3(outPtr)
        }

        return this.__IDeviceAccessChangedEventArgs3.get_UserPromptRequired()
    }

;@endregion Instance Methods
}
