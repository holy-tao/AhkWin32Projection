#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattReadResult.ahk
#Include .\IGattReadResult2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the result of an asynchronous read operation of a GATT Characteristic or Descriptor value.
 * @remarks
 * One of the [ReadValueAsync](gattcharacteristic_readvalueasync_2134129157.md) methods is used to retrieve a GattReadResult object.
 * 
 * The [Status](gattreadresult_status.md) property on the GattReadResult returned indicates if the result of the operation was successful.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattReadResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattReadResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattReadResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of an asynchronous operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the value read from the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadresult.value
     * @type {IBuffer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets the protocol error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadresult.protocolerror
     * @type {IReference<Integer>} 
     */
    ProtocolError {
        get => this.get_ProtocolError()
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
        if (!this.HasProp("__IGattReadResult")) {
            if ((queryResult := this.QueryInterface(IGattReadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadResult := IGattReadResult(outPtr)
        }

        return this.__IGattReadResult.get_Status()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Value() {
        if (!this.HasProp("__IGattReadResult")) {
            if ((queryResult := this.QueryInterface(IGattReadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadResult := IGattReadResult(outPtr)
        }

        return this.__IGattReadResult.get_Value()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolError() {
        if (!this.HasProp("__IGattReadResult2")) {
            if ((queryResult := this.QueryInterface(IGattReadResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadResult2 := IGattReadResult2(outPtr)
        }

        return this.__IGattReadResult2.get_ProtocolError()
    }

;@endregion Instance Methods
}
