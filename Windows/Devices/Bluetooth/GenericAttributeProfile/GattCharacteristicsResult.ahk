#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattCharacteristicsResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the result of [GetCharacteristicsForUuidAsync](./gattdeviceservice_getcharacteristicsforuuidasync_1022371095.md) and [GetCharacteristicsAsync](./gattdeviceservice_getcharacteristicsasync_652132649.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicsresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattCharacteristicsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattCharacteristicsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattCharacteristicsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicsresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the protocol error, if there is one.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicsresult.protocolerror
     * @type {IReference<Integer>} 
     */
    ProtocolError {
        get => this.get_ProtocolError()
    }

    /**
     * Gets the characterisitics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicsresult.characteristics
     * @type {IVectorView<GattCharacteristic>} 
     */
    Characteristics {
        get => this.get_Characteristics()
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
        if (!this.HasProp("__IGattCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicsResult := IGattCharacteristicsResult(outPtr)
        }

        return this.__IGattCharacteristicsResult.get_Status()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolError() {
        if (!this.HasProp("__IGattCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicsResult := IGattCharacteristicsResult(outPtr)
        }

        return this.__IGattCharacteristicsResult.get_ProtocolError()
    }

    /**
     * 
     * @returns {IVectorView<GattCharacteristic>} 
     */
    get_Characteristics() {
        if (!this.HasProp("__IGattCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicsResult := IGattCharacteristicsResult(outPtr)
        }

        return this.__IGattCharacteristicsResult.get_Characteristics()
    }

;@endregion Instance Methods
}
