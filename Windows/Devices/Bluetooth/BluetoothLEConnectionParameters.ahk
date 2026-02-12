#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEConnectionParameters.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents Bluetooth LE connection parameters.
  * 
  * For more information on connection parameters and PHY, please reference the [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/core-specification-5-3/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionparameters
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEConnectionParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEConnectionParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEConnectionParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the connection link supervision timeout. The connection link supervision timeout is defined in 10ms increments, ranging from 0x000A to 0x0C80. Time(ms) = LinkTimeout * 10ms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionparameters.linktimeout
     * @type {Integer} 
     */
    LinkTimeout {
        get => this.get_LinkTimeout()
    }

    /**
     * Gets the connection latency. The connection latency is defined in connection events, ranging from 0x0000 to 0x01F3.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionparameters.connectionlatency
     * @type {Integer} 
     */
    ConnectionLatency {
        get => this.get_ConnectionLatency()
    }

    /**
     * Gets the connection inverval. The connection inverval is defined as 1.25ms increments, ranging from 0x0006 to 0x0C80. Time(ms) = Interval * 1.25ms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionparameters.connectioninterval
     * @type {Integer} 
     */
    ConnectionInterval {
        get => this.get_ConnectionInterval()
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
    get_LinkTimeout() {
        if (!this.HasProp("__IBluetoothLEConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEConnectionParameters := IBluetoothLEConnectionParameters(outPtr)
        }

        return this.__IBluetoothLEConnectionParameters.get_LinkTimeout()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionLatency() {
        if (!this.HasProp("__IBluetoothLEConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEConnectionParameters := IBluetoothLEConnectionParameters(outPtr)
        }

        return this.__IBluetoothLEConnectionParameters.get_ConnectionLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionInterval() {
        if (!this.HasProp("__IBluetoothLEConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEConnectionParameters := IBluetoothLEConnectionParameters(outPtr)
        }

        return this.__IBluetoothLEConnectionParameters.get_ConnectionInterval()
    }

;@endregion Instance Methods
}
