#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEPreferredConnectionParameters.ahk
#Include .\IBluetoothLEPreferredConnectionParametersStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents Bluetooth LE preferred connection parameters.
  * 
  * For more information on connection parameters and PHY, please reference the [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/core-specification-5-3/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparameters
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEPreferredConnectionParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEPreferredConnectionParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEPreferredConnectionParameters.IID

    /**
     * A static property that gets a balanced set of connection parameters, offering a balance between throughput and power usage.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparameters.balanced
     * @type {BluetoothLEPreferredConnectionParameters} 
     */
    static Balanced {
        get => BluetoothLEPreferredConnectionParameters.get_Balanced()
    }

    /**
     * A static property that gets a more aggressive set of connection parameters, optimized for faster throughput at the expense of power usage.
     * 
     * > [!NOTE]
     * > Also reduces the number of simultaneous connections that can be made to other Bluetooth devices.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparameters.throughputoptimized
     * @type {BluetoothLEPreferredConnectionParameters} 
     */
    static ThroughputOptimized {
        get => BluetoothLEPreferredConnectionParameters.get_ThroughputOptimized()
    }

    /**
     * A static property that gets a more power-efficient set of connection parameters. Optimized for power usage at the expense of throughput.
     * 
     * > [!NOTE]
     * > Also allows for more simultaneous connections to other Bluetooth devices.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparameters.poweroptimized
     * @type {BluetoothLEPreferredConnectionParameters} 
     */
    static PowerOptimized {
        get => BluetoothLEPreferredConnectionParameters.get_PowerOptimized()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {BluetoothLEPreferredConnectionParameters} 
     */
    static get_Balanced() {
        if (!BluetoothLEPreferredConnectionParameters.HasProp("__IBluetoothLEPreferredConnectionParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEPreferredConnectionParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEPreferredConnectionParametersStatics.IID)
            BluetoothLEPreferredConnectionParameters.__IBluetoothLEPreferredConnectionParametersStatics := IBluetoothLEPreferredConnectionParametersStatics(factoryPtr)
        }

        return BluetoothLEPreferredConnectionParameters.__IBluetoothLEPreferredConnectionParametersStatics.get_Balanced()
    }

    /**
     * 
     * @returns {BluetoothLEPreferredConnectionParameters} 
     */
    static get_ThroughputOptimized() {
        if (!BluetoothLEPreferredConnectionParameters.HasProp("__IBluetoothLEPreferredConnectionParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEPreferredConnectionParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEPreferredConnectionParametersStatics.IID)
            BluetoothLEPreferredConnectionParameters.__IBluetoothLEPreferredConnectionParametersStatics := IBluetoothLEPreferredConnectionParametersStatics(factoryPtr)
        }

        return BluetoothLEPreferredConnectionParameters.__IBluetoothLEPreferredConnectionParametersStatics.get_ThroughputOptimized()
    }

    /**
     * 
     * @returns {BluetoothLEPreferredConnectionParameters} 
     */
    static get_PowerOptimized() {
        if (!BluetoothLEPreferredConnectionParameters.HasProp("__IBluetoothLEPreferredConnectionParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEPreferredConnectionParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEPreferredConnectionParametersStatics.IID)
            BluetoothLEPreferredConnectionParameters.__IBluetoothLEPreferredConnectionParametersStatics := IBluetoothLEPreferredConnectionParametersStatics(factoryPtr)
        }

        return BluetoothLEPreferredConnectionParameters.__IBluetoothLEPreferredConnectionParametersStatics.get_PowerOptimized()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the connection link supervision timeout. The connection link supervision timeout is defined in 10ms increments, ranging from 0x000A to 0x0C80. Time(ms) = LinkTimeout * 10ms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparameters.linktimeout
     * @type {Integer} 
     */
    LinkTimeout {
        get => this.get_LinkTimeout()
    }

    /**
     * Gets the connection latency. The connection latency is defined in connection events, ranging from 0x0000 to 0x01F3.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparameters.connectionlatency
     * @type {Integer} 
     */
    ConnectionLatency {
        get => this.get_ConnectionLatency()
    }

    /**
     * Gets the minimum connection inverval. The connection inverval is defined as 1.25ms increments, ranging from 0x0006 to 0x0C80. Time(ms) = Interval * 1.25ms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparameters.minconnectioninterval
     * @type {Integer} 
     */
    MinConnectionInterval {
        get => this.get_MinConnectionInterval()
    }

    /**
     * Gets the maximum connection inverval. The connection inverval is defined as 1.25ms increments, ranging from 0x0006 to 0x0C80. Time(ms) = Interval * 1.25ms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparameters.maxconnectioninterval
     * @type {Integer} 
     */
    MaxConnectionInterval {
        get => this.get_MaxConnectionInterval()
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
        if (!this.HasProp("__IBluetoothLEPreferredConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEPreferredConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEPreferredConnectionParameters := IBluetoothLEPreferredConnectionParameters(outPtr)
        }

        return this.__IBluetoothLEPreferredConnectionParameters.get_LinkTimeout()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionLatency() {
        if (!this.HasProp("__IBluetoothLEPreferredConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEPreferredConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEPreferredConnectionParameters := IBluetoothLEPreferredConnectionParameters(outPtr)
        }

        return this.__IBluetoothLEPreferredConnectionParameters.get_ConnectionLatency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinConnectionInterval() {
        if (!this.HasProp("__IBluetoothLEPreferredConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEPreferredConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEPreferredConnectionParameters := IBluetoothLEPreferredConnectionParameters(outPtr)
        }

        return this.__IBluetoothLEPreferredConnectionParameters.get_MinConnectionInterval()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxConnectionInterval() {
        if (!this.HasProp("__IBluetoothLEPreferredConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEPreferredConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEPreferredConnectionParameters := IBluetoothLEPreferredConnectionParameters(outPtr)
        }

        return this.__IBluetoothLEPreferredConnectionParameters.get_MaxConnectionInterval()
    }

;@endregion Instance Methods
}
