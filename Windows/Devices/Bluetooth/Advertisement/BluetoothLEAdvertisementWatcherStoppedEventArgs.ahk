#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementWatcherStoppedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for a [Stopped](bluetoothleadvertisementwatcher_stopped.md) event on a [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md). A BluetoothLEAdvertisementWatcherStoppedEventArgs instance is created when the [Stopped](bluetoothleadvertisementwatcher_stopped.md) event occurs on a [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcherstoppedeventargs
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementWatcherStoppedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementWatcherStoppedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementWatcherStoppedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error status for [Stopped](bluetoothleadvertisementwatcher_stopped.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcherstoppedeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
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
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherStoppedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherStoppedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherStoppedEventArgs := IBluetoothLEAdvertisementWatcherStoppedEventArgs(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherStoppedEventArgs.get_Error()
    }

;@endregion Instance Methods
}
