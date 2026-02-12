#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementPublisherTriggerDetails.ahk
#Include .\IBluetoothLEAdvertisementPublisherTriggerDetails2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about a [BluetoothLEAdvertisementPublisher](../windows.devices.bluetooth.advertisement/bluetoothleadvertisementpublisher.md) trigger. You can obtain an instance of this class through a [BluetoothLEAdvertisementPublisher](../windows.devices.bluetooth.advertisement/bluetoothleadvertisementpublisher.md) trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementpublishertriggerdetails
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementPublisherTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementPublisherTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementPublisherTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current status of the [BluetoothLEAdvertisementPublisher](../windows.devices.bluetooth.advertisement/bluetoothleadvertisementpublisher.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementpublishertriggerdetails.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the error status for the trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementpublishertriggerdetails.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Represents the current transmit power selected by the Bluetooth adapter for the advertisement.
     * @remarks
     * This property is only valid when the advertisement publisher is in the Started state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementpublishertriggerdetails.selectedtransmitpowerlevelindbm
     * @type {IReference<Integer>} 
     */
    SelectedTransmitPowerLevelInDBm {
        get => this.get_SelectedTransmitPowerLevelInDBm()
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
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTriggerDetails := IBluetoothLEAdvertisementPublisherTriggerDetails(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTriggerDetails.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTriggerDetails := IBluetoothLEAdvertisementPublisherTriggerDetails(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTriggerDetails.get_Error()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SelectedTransmitPowerLevelInDBm() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTriggerDetails2 := IBluetoothLEAdvertisementPublisherTriggerDetails2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTriggerDetails2.get_SelectedTransmitPowerLevelInDBm()
    }

;@endregion Instance Methods
}
