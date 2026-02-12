#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattLocalCharacteristicParameters.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class contains the local characteristic descriptor parameters.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicparameters
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattLocalCharacteristicParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattLocalCharacteristicParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattLocalCharacteristicParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the static value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicparameters.staticvalue
     * @type {IBuffer} 
     */
    StaticValue {
        get => this.get_StaticValue()
        set => this.put_StaticValue(value)
    }

    /**
     * Gets the properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicparameters.characteristicproperties
     * @type {Integer} 
     */
    CharacteristicProperties {
        get => this.get_CharacteristicProperties()
        set => this.put_CharacteristicProperties(value)
    }

    /**
     * Gets or sets the read protection level.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicparameters.readprotectionlevel
     * @type {Integer} 
     */
    ReadProtectionLevel {
        get => this.get_ReadProtectionLevel()
        set => this.put_ReadProtectionLevel(value)
    }

    /**
     * Gets and sets the write protection level.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicparameters.writeprotectionlevel
     * @type {Integer} 
     */
    WriteProtectionLevel {
        get => this.get_WriteProtectionLevel()
        set => this.put_WriteProtectionLevel(value)
    }

    /**
     * Gets or sets the user-friendly description.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicparameters.userdescription
     * @type {HSTRING} 
     */
    UserDescription {
        get => this.get_UserDescription()
        set => this.put_UserDescription(value)
    }

    /**
     * Gets or sets the presentation formats.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicparameters.presentationformats
     * @type {IVector<GattPresentationFormat>} 
     */
    PresentationFormats {
        get => this.get_PresentationFormats()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new GattLocalCharacteristicParameters object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalCharacteristicParameters")
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
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.put_StaticValue(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_StaticValue() {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.get_StaticValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacteristicProperties(value) {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.put_CharacteristicProperties(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacteristicProperties() {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.get_CharacteristicProperties()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadProtectionLevel(value) {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.put_ReadProtectionLevel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadProtectionLevel() {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.get_ReadProtectionLevel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WriteProtectionLevel(value) {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.put_WriteProtectionLevel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteProtectionLevel() {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.get_WriteProtectionLevel()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserDescription(value) {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.put_UserDescription(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDescription() {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.get_UserDescription()
    }

    /**
     * 
     * @returns {IVector<GattPresentationFormat>} 
     */
    get_PresentationFormats() {
        if (!this.HasProp("__IGattLocalCharacteristicParameters")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicParameters := IGattLocalCharacteristicParameters(outPtr)
        }

        return this.__IGattLocalCharacteristicParameters.get_PresentationFormats()
    }

;@endregion Instance Methods
}
