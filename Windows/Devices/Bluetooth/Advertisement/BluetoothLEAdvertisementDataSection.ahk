#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementDataSection.ahk
#Include .\IBluetoothLEAdvertisementDataSectionFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A Bluetooth LE advertisement section. A Bluetooth LE advertisement packet can contain multiple instances of these BluetoothLEAdvertisementDataSection objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatasection
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementDataSection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementDataSection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementDataSection.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [BluetoothLEAdvertisementDataSection](bluetoothleadvertisementdatasection.md) object with the Bluetooth LE advertisement data type and the payload.
     * @param {Integer} dataType The Bluetooth LE advertisement data type as defined by the Bluetooth Special Interest Group (SIG).
     * @param {IBuffer} data The Bluetooth LE advertisement data payload.
     * @returns {BluetoothLEAdvertisementDataSection} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatasection.#ctor
     */
    static Create(dataType, data) {
        if (!BluetoothLEAdvertisementDataSection.HasProp("__IBluetoothLEAdvertisementDataSectionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataSection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementDataSectionFactory.IID)
            BluetoothLEAdvertisementDataSection.__IBluetoothLEAdvertisementDataSectionFactory := IBluetoothLEAdvertisementDataSectionFactory(factoryPtr)
        }

        return BluetoothLEAdvertisementDataSection.__IBluetoothLEAdvertisementDataSectionFactory.Create(dataType, data)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Bluetooth LE advertisement data type, as defined by the Bluetooth Special Interest Group (SIG). See [Assigned numbers and GAP](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile/).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatasection.datatype
     * @type {Integer} 
     */
    DataType {
        get => this.get_DataType()
        set => this.put_DataType(value)
    }

    /**
     * The Bluetooth LE advertisement data payload.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementdatasection.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [BluetoothLEAdvertisementDataSection](bluetoothleadvertisementdatasection.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementDataSection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataType() {
        if (!this.HasProp("__IBluetoothLEAdvertisementDataSection")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementDataSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementDataSection := IBluetoothLEAdvertisementDataSection(outPtr)
        }

        return this.__IBluetoothLEAdvertisementDataSection.get_DataType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataType(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementDataSection")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementDataSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementDataSection := IBluetoothLEAdvertisementDataSection(outPtr)
        }

        return this.__IBluetoothLEAdvertisementDataSection.put_DataType(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IBluetoothLEAdvertisementDataSection")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementDataSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementDataSection := IBluetoothLEAdvertisementDataSection(outPtr)
        }

        return this.__IBluetoothLEAdvertisementDataSection.get_Data()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementDataSection")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementDataSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementDataSection := IBluetoothLEAdvertisementDataSection(outPtr)
        }

        return this.__IBluetoothLEAdvertisementDataSection.put_Data(value)
    }

;@endregion Instance Methods
}
