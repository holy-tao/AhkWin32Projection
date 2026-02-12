#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattReliableWriteTransaction.ahk
#Include .\IGattReliableWriteTransaction2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Performs GATT reliable writes on the Bluetooth LE device, in the form of a transaction write operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreliablewritetransaction
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattReliableWriteTransaction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattReliableWriteTransaction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattReliableWriteTransaction.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new GattReliableWriteTransaction object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattReliableWriteTransaction")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Adds a new write operation to the transaction object.
     * @param {GattCharacteristic} characteristic The GattCharacteristic object on which to perform the write operation.
     * @param {IBuffer} value The Characteristic Value to be written to characteristic.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreliablewritetransaction.writevalue
     */
    WriteValue(characteristic, value) {
        if (!this.HasProp("__IGattReliableWriteTransaction")) {
            if ((queryResult := this.QueryInterface(IGattReliableWriteTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReliableWriteTransaction := IGattReliableWriteTransaction(outPtr)
        }

        return this.__IGattReliableWriteTransaction.WriteValue(characteristic, value)
    }

    /**
     * Performs all the queued writes, in sequence, writing the data to the device. Once a transaction object has been committed, no further operations are possible on the GattReliableWriteTransaction object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreliablewritetransaction.commitasync
     */
    CommitAsync() {
        if (!this.HasProp("__IGattReliableWriteTransaction")) {
            if ((queryResult := this.QueryInterface(IGattReliableWriteTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReliableWriteTransaction := IGattReliableWriteTransaction(outPtr)
        }

        return this.__IGattReliableWriteTransaction.CommitAsync()
    }

    /**
     * Performs all the queued writes, in sequence, writing the data to the device. Once a transaction object has been committed, no further operations are possible on the GattReliableWriteTransaction object.
     * @returns {IAsyncOperation<GattWriteResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreliablewritetransaction.commitwithresultasync
     */
    CommitWithResultAsync() {
        if (!this.HasProp("__IGattReliableWriteTransaction2")) {
            if ((queryResult := this.QueryInterface(IGattReliableWriteTransaction2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReliableWriteTransaction2 := IGattReliableWriteTransaction2(outPtr)
        }

        return this.__IGattReliableWriteTransaction2.CommitWithResultAsync()
    }

;@endregion Instance Methods
}
