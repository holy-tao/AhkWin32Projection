#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEPreferredConnectionParametersRequest.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Bluetooth LE preferred connection parameters request.
  * 
  * For more information on connection parameters and PHY, please reference the [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/core-specification-5-3/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparametersrequest
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEPreferredConnectionParametersRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEPreferredConnectionParametersRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEPreferredConnectionParametersRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparametersrequest.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IBluetoothLEPreferredConnectionParametersRequest")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEPreferredConnectionParametersRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEPreferredConnectionParametersRequest := IBluetoothLEPreferredConnectionParametersRequest(outPtr)
        }

        return this.__IBluetoothLEPreferredConnectionParametersRequest.get_Status()
    }

    /**
     * Closes the request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparametersrequest.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
