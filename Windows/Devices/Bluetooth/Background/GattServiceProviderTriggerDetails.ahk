#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattServiceProviderTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the Bluetooth device that caused this trigger to fire.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattserviceprovidertriggerdetails
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class GattServiceProviderTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattServiceProviderTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattServiceProviderTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the connection that triggered the event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattserviceprovidertriggerdetails.connection
     * @type {GattServiceProviderConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GattServiceProviderConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IGattServiceProviderTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderTriggerDetails := IGattServiceProviderTriggerDetails(outPtr)
        }

        return this.__IGattServiceProviderTriggerDetails.get_Connection()
    }

;@endregion Instance Methods
}
