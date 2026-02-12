#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAppearance.ahk
#Include .\IBluetoothLEAppearanceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality to determine the Bluetooth Low Energy (LE) Appearance information for a device. To get an instance of this class, call the [BluetoothLEAppearance.FromRawValue](bluetoothleappearance_fromrawvalue_1696697572.md) method or the [BluetoothLEAppearance.FromParts](bluetoothleappearance_fromparts_1479822747.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearance
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAppearance extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAppearance

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAppearance.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [BluetoothLEAppearance](bluetoothleappearance.md) object by supplying for raw integer values representing the Category and Subcategory of the Bluetooth LE device.
     * @param {Integer} rawValue The raw integer value representing the appearance category and subcategory.
     * @returns {BluetoothLEAppearance} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearance.fromrawvalue
     */
    static FromRawValue(rawValue) {
        if (!BluetoothLEAppearance.HasProp("__IBluetoothLEAppearanceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearance")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceStatics.IID)
            BluetoothLEAppearance.__IBluetoothLEAppearanceStatics := IBluetoothLEAppearanceStatics(factoryPtr)
        }

        return BluetoothLEAppearance.__IBluetoothLEAppearanceStatics.FromRawValue(rawValue)
    }

    /**
     * Creates a [BluetoothLEAppearance](bluetoothleappearance.md) object by supplying values for Category (see [BluetoothLEAppearanceCategories](bluetoothleappearancecategories.md)) and Subcategory (see [BluetoothLEAppearanceSubcategories](bluetoothleappearancesubcategories.md)) of the Bluetooth LE device.
     * @param {Integer} appearanceCategory The Bluetooth LE appearance category. See [BluetoothLEAppearanceCategories](bluetoothleappearancecategories.md).
     * @param {Integer} appearanceSubCategory The Bluetooth LE appearance subcategory. See [BluetoothLEAppearanceSubcategories](bluetoothleappearancesubcategories.md).
     * @returns {BluetoothLEAppearance} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearance.fromparts
     */
    static FromParts(appearanceCategory, appearanceSubCategory) {
        if (!BluetoothLEAppearance.HasProp("__IBluetoothLEAppearanceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEAppearance")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAppearanceStatics.IID)
            BluetoothLEAppearance.__IBluetoothLEAppearanceStatics := IBluetoothLEAppearanceStatics(factoryPtr)
        }

        return BluetoothLEAppearance.__IBluetoothLEAppearanceStatics.FromParts(appearanceCategory, appearanceSubCategory)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the appearance raw value of the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearance.rawvalue
     * @type {Integer} 
     */
    RawValue {
        get => this.get_RawValue()
    }

    /**
     * Gets the appearance category value of the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearance.category
     * @type {Integer} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * Gets the appearance subcategory value of the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothleappearance.subcategory
     * @type {Integer} 
     */
    SubCategory {
        get => this.get_SubCategory()
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
    get_RawValue() {
        if (!this.HasProp("__IBluetoothLEAppearance")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAppearance := IBluetoothLEAppearance(outPtr)
        }

        return this.__IBluetoothLEAppearance.get_RawValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Category() {
        if (!this.HasProp("__IBluetoothLEAppearance")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAppearance := IBluetoothLEAppearance(outPtr)
        }

        return this.__IBluetoothLEAppearance.get_Category()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubCategory() {
        if (!this.HasProp("__IBluetoothLEAppearance")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAppearance := IBluetoothLEAppearance(outPtr)
        }

        return this.__IBluetoothLEAppearance.get_SubCategory()
    }

;@endregion Instance Methods
}
