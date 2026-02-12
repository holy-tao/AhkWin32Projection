#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattPresentationFormat.ahk
#Include .\IGattPresentationFormatStatics2.ahk
#Include .\IGattPresentationFormatStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of a single Presentation Format GATT Descriptor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformat
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattPresentationFormat extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattPresentationFormat

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattPresentationFormat.IID

    /**
     * Gets the value of the Bluetooth SIG Assigned Numbers Namespace.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformat.bluetoothsigassignednumbers
     * @type {Integer} 
     */
    static BluetoothSigAssignedNumbers {
        get => GattPresentationFormat.get_BluetoothSigAssignedNumbers()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a GattPresentationFormat object from parts.
     * @param {Integer} formatType The Format Type.
     * @param {Integer} exponent The exponent.
     * @param {Integer} unit_ The unit.
     * @param {Integer} namespaceId The namespace ID.
     * @param {Integer} description The description.
     * @returns {GattPresentationFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformat.fromparts
     */
    static FromParts(formatType, exponent, unit_, namespaceId, description) {
        if (!GattPresentationFormat.HasProp("__IGattPresentationFormatStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormat")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatStatics2.IID)
            GattPresentationFormat.__IGattPresentationFormatStatics2 := IGattPresentationFormatStatics2(factoryPtr)
        }

        return GattPresentationFormat.__IGattPresentationFormatStatics2.FromParts(formatType, exponent, unit_, namespaceId, description)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BluetoothSigAssignedNumbers() {
        if (!GattPresentationFormat.HasProp("__IGattPresentationFormatStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormat")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattPresentationFormatStatics.IID)
            GattPresentationFormat.__IGattPresentationFormatStatics := IGattPresentationFormatStatics(factoryPtr)
        }

        return GattPresentationFormat.__IGattPresentationFormatStatics.get_BluetoothSigAssignedNumbers()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the Format Type of the GattPresentationFormat object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformat.formattype
     * @type {Integer} 
     */
    FormatType {
        get => this.get_FormatType()
    }

    /**
     * Gets the Exponent of the GattPresentationFormat object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformat.exponent
     * @type {Integer} 
     */
    Exponent {
        get => this.get_Exponent()
    }

    /**
     * Gets the Unit of the GattPresentationFormat object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformat.unit
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
    }

    /**
     * Gets the Namespace of the GattPresentationFormat object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformat.namespace
     * @type {Integer} 
     */
    Namespace {
        get => this.get_Namespace()
    }

    /**
     * Gets the Description of the GattPresentationFormat object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattpresentationformat.description
     * @type {Integer} 
     */
    Description {
        get => this.get_Description()
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
    get_FormatType() {
        if (!this.HasProp("__IGattPresentationFormat")) {
            if ((queryResult := this.QueryInterface(IGattPresentationFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattPresentationFormat := IGattPresentationFormat(outPtr)
        }

        return this.__IGattPresentationFormat.get_FormatType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Exponent() {
        if (!this.HasProp("__IGattPresentationFormat")) {
            if ((queryResult := this.QueryInterface(IGattPresentationFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattPresentationFormat := IGattPresentationFormat(outPtr)
        }

        return this.__IGattPresentationFormat.get_Exponent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
        if (!this.HasProp("__IGattPresentationFormat")) {
            if ((queryResult := this.QueryInterface(IGattPresentationFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattPresentationFormat := IGattPresentationFormat(outPtr)
        }

        return this.__IGattPresentationFormat.get_Unit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Namespace() {
        if (!this.HasProp("__IGattPresentationFormat")) {
            if ((queryResult := this.QueryInterface(IGattPresentationFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattPresentationFormat := IGattPresentationFormat(outPtr)
        }

        return this.__IGattPresentationFormat.get_Namespace()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Description() {
        if (!this.HasProp("__IGattPresentationFormat")) {
            if ((queryResult := this.QueryInterface(IGattPresentationFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattPresentationFormat := IGattPresentationFormat(outPtr)
        }

        return this.__IGattPresentationFormat.get_Description()
    }

;@endregion Instance Methods
}
