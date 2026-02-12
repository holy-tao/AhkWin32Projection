#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEConnectionPhy.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to retrieve info about about the Bluetooth LE physical layer (PHY).
  * 
  * For more information on connection parameters and PHY, please reference the [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/core-specification-5-3/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionphy
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEConnectionPhy extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEConnectionPhy

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEConnectionPhy.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the Bluetooth LE physical layer (PHY) for transmit.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionphy.transmitinfo
     * @type {BluetoothLEConnectionPhyInfo} 
     */
    TransmitInfo {
        get => this.get_TransmitInfo()
    }

    /**
     * Gets info about the Bluetooth LE physical layer (PHY) for receive.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionphy.receiveinfo
     * @type {BluetoothLEConnectionPhyInfo} 
     */
    ReceiveInfo {
        get => this.get_ReceiveInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BluetoothLEConnectionPhyInfo} 
     */
    get_TransmitInfo() {
        if (!this.HasProp("__IBluetoothLEConnectionPhy")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEConnectionPhy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEConnectionPhy := IBluetoothLEConnectionPhy(outPtr)
        }

        return this.__IBluetoothLEConnectionPhy.get_TransmitInfo()
    }

    /**
     * 
     * @returns {BluetoothLEConnectionPhyInfo} 
     */
    get_ReceiveInfo() {
        if (!this.HasProp("__IBluetoothLEConnectionPhy")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEConnectionPhy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEConnectionPhy := IBluetoothLEConnectionPhy(outPtr)
        }

        return this.__IBluetoothLEConnectionPhy.get_ReceiveInfo()
    }

;@endregion Instance Methods
}
