#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementBytePattern.ahk
#Include .\IBluetoothLEAdvertisementBytePatternFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A Bluetooth LE advertisement byte pattern for filters to match.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementbytepattern
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementBytePattern extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementBytePattern

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementBytePattern.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Create a new [BluetoothLEAdvertisementBytePattern](bluetoothleadvertisementbytepattern.md) object with an advertisement data type to match, the advertisement data byte pattern to match, and the offset of the byte pattern from the beginning of the advertisement data section.
     * @param {Integer} dataType The Bluetooth LE advertisement data type to match.
     * @param {Integer} offset The offset of byte pattern from beginning of advertisement data section.
     * @param {IBuffer} data The Bluetooth LE advertisement data byte pattern to match.
     * @returns {BluetoothLEAdvertisementBytePattern} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementbytepattern.#ctor
     */
    static Create(dataType, offset, data) {
        if (!BluetoothLEAdvertisementBytePattern.HasProp("__IBluetoothLEAdvertisementBytePatternFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementBytePattern")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementBytePatternFactory.IID)
            BluetoothLEAdvertisementBytePattern.__IBluetoothLEAdvertisementBytePatternFactory := IBluetoothLEAdvertisementBytePatternFactory(factoryPtr)
        }

        return BluetoothLEAdvertisementBytePattern.__IBluetoothLEAdvertisementBytePatternFactory.Create(dataType, offset, data)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The Bluetooth LE advertisement data type defined by the Bluetooth Special Interest Group (SIG) to match.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementbytepattern.datatype
     * @type {Integer} 
     */
    DataType {
        get => this.get_DataType()
        set => this.put_DataType(value)
    }

    /**
     * The offset of byte pattern from beginning of advertisement data section.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementbytepattern.offset
     * @type {Integer} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * The Bluetooth LE advertisement data byte pattern to match.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementbytepattern.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Create a new [BluetoothLEAdvertisementBytePattern](bluetoothleadvertisementbytepattern.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementBytePattern")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataType() {
        if (!this.HasProp("__IBluetoothLEAdvertisementBytePattern")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementBytePattern.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementBytePattern := IBluetoothLEAdvertisementBytePattern(outPtr)
        }

        return this.__IBluetoothLEAdvertisementBytePattern.get_DataType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataType(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementBytePattern")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementBytePattern.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementBytePattern := IBluetoothLEAdvertisementBytePattern(outPtr)
        }

        return this.__IBluetoothLEAdvertisementBytePattern.put_DataType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Offset() {
        if (!this.HasProp("__IBluetoothLEAdvertisementBytePattern")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementBytePattern.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementBytePattern := IBluetoothLEAdvertisementBytePattern(outPtr)
        }

        return this.__IBluetoothLEAdvertisementBytePattern.get_Offset()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementBytePattern")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementBytePattern.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementBytePattern := IBluetoothLEAdvertisementBytePattern(outPtr)
        }

        return this.__IBluetoothLEAdvertisementBytePattern.put_Offset(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IBluetoothLEAdvertisementBytePattern")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementBytePattern.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementBytePattern := IBluetoothLEAdvertisementBytePattern(outPtr)
        }

        return this.__IBluetoothLEAdvertisementBytePattern.get_Data()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementBytePattern")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementBytePattern.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementBytePattern := IBluetoothLEAdvertisementBytePattern(outPtr)
        }

        return this.__IBluetoothLEAdvertisementBytePattern.put_Data(value)
    }

;@endregion Instance Methods
}
