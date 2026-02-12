#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattLocalDescriptorResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The result of local characteristic descriptor operations like [CreateDescriptorAsync](gattlocalcharacteristic_createdescriptorasync_490182673.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptorresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattLocalDescriptorResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattLocalDescriptorResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattLocalDescriptorResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptorresult.descriptor
     * @type {GattLocalDescriptor} 
     */
    Descriptor {
        get => this.get_Descriptor()
    }

    /**
     * Gets the error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptorresult.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GattLocalDescriptor} 
     */
    get_Descriptor() {
        if (!this.HasProp("__IGattLocalDescriptorResult")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptorResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptorResult := IGattLocalDescriptorResult(outPtr)
        }

        return this.__IGattLocalDescriptorResult.get_Descriptor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IGattLocalDescriptorResult")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptorResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptorResult := IGattLocalDescriptorResult(outPtr)
        }

        return this.__IGattLocalDescriptorResult.get_Error()
    }

;@endregion Instance Methods
}
