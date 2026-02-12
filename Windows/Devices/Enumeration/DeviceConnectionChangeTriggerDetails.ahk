#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceConnectionChangeTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the device that caused this trigger to fire.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceconnectionchangetriggerdetails
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceConnectionChangeTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceConnectionChangeTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceConnectionChangeTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device Id of the device that caused this trigger to fire.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceconnectionchangetriggerdetails.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IDeviceConnectionChangeTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IDeviceConnectionChangeTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceConnectionChangeTriggerDetails := IDeviceConnectionChangeTriggerDetails(outPtr)
        }

        return this.__IDeviceConnectionChangeTriggerDetails.get_DeviceId()
    }

;@endregion Instance Methods
}
