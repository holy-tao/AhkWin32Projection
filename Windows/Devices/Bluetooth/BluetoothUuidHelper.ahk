#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothUuidHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * A helper class that provides methods to convert between bluetooth device UUID and short ID.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothuuidhelper
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothUuidHelper extends IInspectable {
;@region Static Methods
    /**
     * Returns the bluetooth device UUID from a short ID.
     * @param {Integer} shortId The short ID.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothuuidhelper.fromshortid
     */
    static FromShortId(shortId) {
        if (!BluetoothUuidHelper.HasProp("__IBluetoothUuidHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothUuidHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothUuidHelperStatics.IID)
            BluetoothUuidHelper.__IBluetoothUuidHelperStatics := IBluetoothUuidHelperStatics(factoryPtr)
        }

        return BluetoothUuidHelper.__IBluetoothUuidHelperStatics.FromShortId(shortId)
    }

    /**
     * Attempts to get the short bluetooth device ID from a UUID.
     * @param {Guid} uuid The UUID.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothuuidhelper.trygetshortid
     */
    static TryGetShortId(uuid) {
        if (!BluetoothUuidHelper.HasProp("__IBluetoothUuidHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothUuidHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothUuidHelperStatics.IID)
            BluetoothUuidHelper.__IBluetoothUuidHelperStatics := IBluetoothUuidHelperStatics(factoryPtr)
        }

        return BluetoothUuidHelper.__IBluetoothUuidHelperStatics.TryGetShortId(uuid)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
