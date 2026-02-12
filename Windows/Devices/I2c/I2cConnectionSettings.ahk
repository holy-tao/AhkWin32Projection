#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\II2cConnectionSettings.ahk
#Include .\II2cConnectionSettingsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the connection settings you want to use for an inter-integrated circuit (I<sup>2</sup> C) device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cconnectionsettings
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class I2cConnectionSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => II2cConnectionSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => II2cConnectionSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the I2cConnectionSettings class for inter-integrated circuit (I<sup>2</sup> C) device with specified bus address, using the default settings of the standard mode for the bus speed and exclusive sharing mode.
     * @param {Integer} slaveAddress The bus address of the inter-integrated circuit (I<sup>2</sup> C) device to which the settings of the I2cConnectionSettings should apply. Only 7-bit addressing is supported, so the range of values that are valid is from 8 to 119.
     * @returns {I2cConnectionSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cconnectionsettings.#ctor
     */
    static Create(slaveAddress) {
        if (!I2cConnectionSettings.HasProp("__II2cConnectionSettingsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.I2c.I2cConnectionSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, II2cConnectionSettingsFactory.IID)
            I2cConnectionSettings.__II2cConnectionSettingsFactory := II2cConnectionSettingsFactory(factoryPtr)
        }

        return I2cConnectionSettings.__II2cConnectionSettingsFactory.Create(slaveAddress)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the bus address of the inter-integrated circuit (I<sup>2</sup> C) device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cconnectionsettings.slaveaddress
     * @type {Integer} 
     */
    SlaveAddress {
        get => this.get_SlaveAddress()
        set => this.put_SlaveAddress(value)
    }

    /**
     * Gets or sets the bus speed to use for connecting to an inter-integrated circuit (I<sup>2</sup> C) device. The bus speed is the frequency at which to clock the I<sup>2</sup> C bus when accessing the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cconnectionsettings.busspeed
     * @type {Integer} 
     */
    BusSpeed {
        get => this.get_BusSpeed()
        set => this.put_BusSpeed(value)
    }

    /**
     * Gets or sets the sharing mode to use to connect to the inter-integrated circuit (I<sup>2</sup> C) bus address. This mode determines whether other connections to the I<sup>2</sup> C bus address can be opened while you are connect to the I<sup>2</sup> C bus address.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2cconnectionsettings.sharingmode
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
        set => this.put_SharingMode(value)
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
    get_SlaveAddress() {
        if (!this.HasProp("__II2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(II2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cConnectionSettings := II2cConnectionSettings(outPtr)
        }

        return this.__II2cConnectionSettings.get_SlaveAddress()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SlaveAddress(value) {
        if (!this.HasProp("__II2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(II2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cConnectionSettings := II2cConnectionSettings(outPtr)
        }

        return this.__II2cConnectionSettings.put_SlaveAddress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BusSpeed() {
        if (!this.HasProp("__II2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(II2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cConnectionSettings := II2cConnectionSettings(outPtr)
        }

        return this.__II2cConnectionSettings.get_BusSpeed()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BusSpeed(value) {
        if (!this.HasProp("__II2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(II2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cConnectionSettings := II2cConnectionSettings(outPtr)
        }

        return this.__II2cConnectionSettings.put_BusSpeed(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        if (!this.HasProp("__II2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(II2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cConnectionSettings := II2cConnectionSettings(outPtr)
        }

        return this.__II2cConnectionSettings.get_SharingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SharingMode(value) {
        if (!this.HasProp("__II2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(II2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cConnectionSettings := II2cConnectionSettings(outPtr)
        }

        return this.__II2cConnectionSettings.put_SharingMode(value)
    }

;@endregion Instance Methods
}
