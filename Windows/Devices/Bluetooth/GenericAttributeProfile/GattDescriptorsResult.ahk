#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattDescriptorsResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The result of descriptor operations like [GattCharacteristic.GetDescriptorsAsync](gattdescriptor_writevaluewithresultasync_525802224.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptorsresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattDescriptorsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattDescriptorsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattDescriptorsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptorsresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the GATT protocol error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptorsresult.protocolerror
     * @type {IReference<Integer>} 
     */
    ProtocolError {
        get => this.get_ProtocolError()
    }

    /**
     * Gets a vector of the GATT descriptors.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdescriptorsresult.descriptors
     * @type {IVectorView<GattDescriptor>} 
     */
    Descriptors {
        get => this.get_Descriptors()
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
        if (!this.HasProp("__IGattDescriptorsResult")) {
            if ((queryResult := this.QueryInterface(IGattDescriptorsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptorsResult := IGattDescriptorsResult(outPtr)
        }

        return this.__IGattDescriptorsResult.get_Status()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolError() {
        if (!this.HasProp("__IGattDescriptorsResult")) {
            if ((queryResult := this.QueryInterface(IGattDescriptorsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptorsResult := IGattDescriptorsResult(outPtr)
        }

        return this.__IGattDescriptorsResult.get_ProtocolError()
    }

    /**
     * 
     * @returns {IVectorView<GattDescriptor>} 
     */
    get_Descriptors() {
        if (!this.HasProp("__IGattDescriptorsResult")) {
            if ((queryResult := this.QueryInterface(IGattDescriptorsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDescriptorsResult := IGattDescriptorsResult(outPtr)
        }

        return this.__IGattDescriptorsResult.get_Descriptors()
    }

;@endregion Instance Methods
}
