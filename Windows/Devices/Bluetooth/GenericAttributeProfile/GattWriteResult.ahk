#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattWriteResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the result of GATT write operations like [WriteValueWithResultAsync](./gattcharacteristic_writevaluewithresultasync_2074671654.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriteresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattWriteResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattWriteResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattWriteResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the write result.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriteresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the protocol error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriteresult.protocolerror
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
        if (!this.HasProp("__IGattWriteResult")) {
            if ((queryResult := this.QueryInterface(IGattWriteResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteResult := IGattWriteResult(outPtr)
        }

        return this.__IGattWriteResult.get_Status()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolError() {
        if (!this.HasProp("__IGattWriteResult")) {
            if ((queryResult := this.QueryInterface(IGattWriteResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteResult := IGattWriteResult(outPtr)
        }

        return this.__IGattWriteResult.get_ProtocolError()
    }

;@endregion Instance Methods
}
