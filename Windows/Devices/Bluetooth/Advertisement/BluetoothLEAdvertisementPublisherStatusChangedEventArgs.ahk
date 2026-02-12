#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementPublisherStatusChangedEventArgs.ahk
#Include .\IBluetoothLEAdvertisementPublisherStatusChangedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for a [StatusChanged](bluetoothleadvertisementpublisher_statuschanged.md) event on a [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md).
 * @remarks
 * A BluetoothLEAdvertisementPublisherStatusChangedEventArgs instance is created when the [StatusChanged](bluetoothleadvertisementpublisher_statuschanged.md) event occurs on a [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisherstatuschangedeventargs
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementPublisherStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementPublisherStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementPublisherStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new status of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md).
     * @remarks
     * The current status of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) might have changed by the time this property is accessed. This property reflects the new status of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) at the time it was changed and the [StatusChanged](bluetoothleadvertisementpublisher_statuschanged.md) event occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisherstatuschangedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the error status for a [StatusChanged](bluetoothleadvertisementpublisher_statuschanged.md) event on a [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisherstatuschangedeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Represents the current transmit power selected by the Bluetooth adapter for the advertisement.
     * @remarks
     * This property is only valid when the advertisement publisher is in the Started state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisherstatuschangedeventargs.selectedtransmitpowerlevelindbm
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
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs := IBluetoothLEAdvertisementPublisherStatusChangedEventArgs(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs := IBluetoothLEAdvertisementPublisherStatusChangedEventArgs(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs.get_Error()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SelectedTransmitPowerLevelInDBm() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherStatusChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs2 := IBluetoothLEAdvertisementPublisherStatusChangedEventArgs2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherStatusChangedEventArgs2.get_SelectedTransmitPowerLevelInDBm()
    }

;@endregion Instance Methods
}
