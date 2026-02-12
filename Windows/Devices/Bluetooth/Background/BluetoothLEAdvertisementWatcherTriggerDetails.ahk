#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementWatcherTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about a [BluetoothLEAdvertisementWatcher](/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementpublishertriggerdetails) trigger. You can obtain an instance of this class through a [BluetoothLEAdvertisementWatcher](/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementpublishertriggerdetails) trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementwatchertriggerdetails
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementWatcherTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementWatcherTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementWatcherTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error status for the trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementwatchertriggerdetails.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Gets a collection of Bluetooth LE advertisements.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementwatchertriggerdetails.advertisements
     * @type {IVectorView<BluetoothLEAdvertisementReceivedEventArgs>} 
     */
    Advertisements {
        get => this.get_Advertisements()
    }

    /**
     * Gets the parameters used to configure received signal strength indicator (RSSI)-based filtering.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetoothleadvertisementwatchertriggerdetails.signalstrengthfilter
     * @type {BluetoothSignalStrengthFilter} 
     */
    SignalStrengthFilter {
        get => this.get_SignalStrengthFilter()
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
    get_Error() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTriggerDetails := IBluetoothLEAdvertisementWatcherTriggerDetails(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTriggerDetails.get_Error()
    }

    /**
     * 
     * @returns {IVectorView<BluetoothLEAdvertisementReceivedEventArgs>} 
     */
    get_Advertisements() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTriggerDetails := IBluetoothLEAdvertisementWatcherTriggerDetails(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTriggerDetails.get_Advertisements()
    }

    /**
     * 
     * @returns {BluetoothSignalStrengthFilter} 
     */
    get_SignalStrengthFilter() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTriggerDetails := IBluetoothLEAdvertisementWatcherTriggerDetails(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTriggerDetails.get_SignalStrengthFilter()
    }

;@endregion Instance Methods
}
