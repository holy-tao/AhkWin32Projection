#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEConnectionPhyInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents info about the Bluetooth LE physical layer (PHY).
  * 
  * For more information on connection parameters and PHY, please reference the [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/core-specification-5-3/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionphyinfo
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEConnectionPhyInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEConnectionPhyInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEConnectionPhyInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether or not the Bluetooth LE physical layer (PHY) is (uncoded) LE 1M.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionphyinfo.isuncoded1mphy
     * @type {Boolean} 
     */
    IsUncoded1MPhy {
        get => this.get_IsUncoded1MPhy()
    }

    /**
     * Gets a value indicating whether or not the Bluetooth LE physical layer (PHY) is (uncoded) LE 2M.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionphyinfo.isuncoded2mphy
     * @type {Boolean} 
     */
    IsUncoded2MPhy {
        get => this.get_IsUncoded2MPhy()
    }

    /**
     * Gets a value indicating whether or not the Bluetooth LE physical layer (PHY) is LE Coded.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleconnectionphyinfo.iscodedphy
     * @type {Boolean} 
     */
    IsCodedPhy {
        get => this.get_IsCodedPhy()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUncoded1MPhy() {
        if (!this.HasProp("__IBluetoothLEConnectionPhyInfo")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEConnectionPhyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEConnectionPhyInfo := IBluetoothLEConnectionPhyInfo(outPtr)
        }

        return this.__IBluetoothLEConnectionPhyInfo.get_IsUncoded1MPhy()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUncoded2MPhy() {
        if (!this.HasProp("__IBluetoothLEConnectionPhyInfo")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEConnectionPhyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEConnectionPhyInfo := IBluetoothLEConnectionPhyInfo(outPtr)
        }

        return this.__IBluetoothLEConnectionPhyInfo.get_IsUncoded2MPhy()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCodedPhy() {
        if (!this.HasProp("__IBluetoothLEConnectionPhyInfo")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEConnectionPhyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEConnectionPhyInfo := IBluetoothLEConnectionPhyInfo(outPtr)
        }

        return this.__IBluetoothLEConnectionPhyInfo.get_IsCodedPhy()
    }

;@endregion Instance Methods
}
