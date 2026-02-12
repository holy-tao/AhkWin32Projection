#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattLocalDescriptorParameters.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class defines the parameters of a descriptor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptorparameters
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattLocalDescriptorParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattLocalDescriptorParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattLocalDescriptorParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the static value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptorparameters.staticvalue
     * @type {IBuffer} 
     */
    StaticValue {
        get => this.get_StaticValue()
        set => this.put_StaticValue(value)
    }

    /**
     * Gets or sets the read protection level.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptorparameters.readprotectionlevel
     * @type {Integer} 
     */
    ReadProtectionLevel {
        get => this.get_ReadProtectionLevel()
        set => this.put_ReadProtectionLevel(value)
    }

    /**
     * Gets or sets the write protection level.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptorparameters.writeprotectionlevel
     * @type {Integer} 
     */
    WriteProtectionLevel {
        get => this.get_WriteProtectionLevel()
        set => this.put_WriteProtectionLevel(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new GattLocalDescriptorParameters object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalDescriptorParameters")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_StaticValue(value) {
        if (!this.HasProp("__IGattLocalDescriptorParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptorParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptorParameters := IGattLocalDescriptorParameters(outPtr)
        }

        return this.__IGattLocalDescriptorParameters.put_StaticValue(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_StaticValue() {
        if (!this.HasProp("__IGattLocalDescriptorParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptorParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptorParameters := IGattLocalDescriptorParameters(outPtr)
        }

        return this.__IGattLocalDescriptorParameters.get_StaticValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadProtectionLevel(value) {
        if (!this.HasProp("__IGattLocalDescriptorParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptorParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptorParameters := IGattLocalDescriptorParameters(outPtr)
        }

        return this.__IGattLocalDescriptorParameters.put_ReadProtectionLevel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadProtectionLevel() {
        if (!this.HasProp("__IGattLocalDescriptorParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptorParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptorParameters := IGattLocalDescriptorParameters(outPtr)
        }

        return this.__IGattLocalDescriptorParameters.get_ReadProtectionLevel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WriteProtectionLevel(value) {
        if (!this.HasProp("__IGattLocalDescriptorParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptorParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptorParameters := IGattLocalDescriptorParameters(outPtr)
        }

        return this.__IGattLocalDescriptorParameters.put_WriteProtectionLevel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteProtectionLevel() {
        if (!this.HasProp("__IGattLocalDescriptorParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptorParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptorParameters := IGattLocalDescriptorParameters(outPtr)
        }

        return this.__IGattLocalDescriptorParameters.get_WriteProtectionLevel()
    }

;@endregion Instance Methods
}
