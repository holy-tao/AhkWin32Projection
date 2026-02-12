#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEManufacturerData.ahk
#Include .\IBluetoothLEManufacturerDataFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A Bluetooth LE manufacturer-specific data section (one particular type of LE advertisement section). A Bluetooth LE advertisement packet can contain multiple instances of these BluetoothLEManufacturerData objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothlemanufacturerdata
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEManufacturerData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEManufacturerData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEManufacturerData.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [BluetoothLEManufacturerData](bluetoothlemanufacturerdata.md) object with a company identifier code and manufacterer-specific section data.
     * @param {Integer} companyId The Bluetooth LE company identifier code as defined by the Bluetooth Special Interest Group (SIG).
     * @param {IBuffer} data Bluetooth LE manufacturer-specific section data.
     * @returns {BluetoothLEManufacturerData} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothlemanufacturerdata.#ctor
     */
    static Create(companyId, data) {
        if (!BluetoothLEManufacturerData.HasProp("__IBluetoothLEManufacturerDataFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEManufacturerData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEManufacturerDataFactory.IID)
            BluetoothLEManufacturerData.__IBluetoothLEManufacturerDataFactory := IBluetoothLEManufacturerDataFactory(factoryPtr)
        }

        return BluetoothLEManufacturerData.__IBluetoothLEManufacturerDataFactory.Create(companyId, data)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The Bluetooth LE company identifier code as defined by the Bluetooth Special Interest Group (SIG).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothlemanufacturerdata.companyid
     * @type {Integer} 
     */
    CompanyId {
        get => this.get_CompanyId()
        set => this.put_CompanyId(value)
    }

    /**
     * Bluetooth LE manufacturer-specific section data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothlemanufacturerdata.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [BluetoothLEManufacturerData](bluetoothlemanufacturerdata.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEManufacturerData")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompanyId() {
        if (!this.HasProp("__IBluetoothLEManufacturerData")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEManufacturerData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEManufacturerData := IBluetoothLEManufacturerData(outPtr)
        }

        return this.__IBluetoothLEManufacturerData.get_CompanyId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CompanyId(value) {
        if (!this.HasProp("__IBluetoothLEManufacturerData")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEManufacturerData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEManufacturerData := IBluetoothLEManufacturerData(outPtr)
        }

        return this.__IBluetoothLEManufacturerData.put_CompanyId(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IBluetoothLEManufacturerData")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEManufacturerData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEManufacturerData := IBluetoothLEManufacturerData(outPtr)
        }

        return this.__IBluetoothLEManufacturerData.get_Data()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IBluetoothLEManufacturerData")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEManufacturerData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEManufacturerData := IBluetoothLEManufacturerData(outPtr)
        }

        return this.__IBluetoothLEManufacturerData.put_Data(value)
    }

;@endregion Instance Methods
}
