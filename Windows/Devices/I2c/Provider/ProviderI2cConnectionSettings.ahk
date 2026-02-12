#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProviderI2cConnectionSettings.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the connection settings you want to use for an inter-integrated circuit (I<sup>2</sup> C) device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.provideri2cconnectionsettings
 * @namespace Windows.Devices.I2c.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderI2cConnectionSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProviderI2cConnectionSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProviderI2cConnectionSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the bus address of the inter-integrated circuit (I<sup>2</sup> C) device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.provideri2cconnectionsettings.slaveaddress
     * @type {Integer} 
     */
    SlaveAddress {
        get => this.get_SlaveAddress()
        set => this.put_SlaveAddress(value)
    }

    /**
     * Gets or sets the bus speed to use for connecting to an inter-integrated circuit (I<sup>2</sup> C) device. The bus speed is the frequency at which to clock the I<sup>2</sup> C bus when accessing the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.provideri2cconnectionsettings.busspeed
     * @type {Integer} 
     */
    BusSpeed {
        get => this.get_BusSpeed()
        set => this.put_BusSpeed(value)
    }

    /**
     * Gets or sets the sharing mode to use to connect to the inter-integrated circuit (I<sup>2</sup> C) bus address. This mode determines whether other connections to the I<sup>2</sup> C bus address can be opened while you are connect to the I<sup>2</sup> C bus address.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.provideri2cconnectionsettings.sharingmode
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
        if (!this.HasProp("__IProviderI2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderI2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderI2cConnectionSettings := IProviderI2cConnectionSettings(outPtr)
        }

        return this.__IProviderI2cConnectionSettings.get_SlaveAddress()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SlaveAddress(value) {
        if (!this.HasProp("__IProviderI2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderI2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderI2cConnectionSettings := IProviderI2cConnectionSettings(outPtr)
        }

        return this.__IProviderI2cConnectionSettings.put_SlaveAddress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BusSpeed() {
        if (!this.HasProp("__IProviderI2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderI2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderI2cConnectionSettings := IProviderI2cConnectionSettings(outPtr)
        }

        return this.__IProviderI2cConnectionSettings.get_BusSpeed()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BusSpeed(value) {
        if (!this.HasProp("__IProviderI2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderI2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderI2cConnectionSettings := IProviderI2cConnectionSettings(outPtr)
        }

        return this.__IProviderI2cConnectionSettings.put_BusSpeed(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        if (!this.HasProp("__IProviderI2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderI2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderI2cConnectionSettings := IProviderI2cConnectionSettings(outPtr)
        }

        return this.__IProviderI2cConnectionSettings.get_SharingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SharingMode(value) {
        if (!this.HasProp("__IProviderI2cConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderI2cConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderI2cConnectionSettings := IProviderI2cConnectionSettings(outPtr)
        }

        return this.__IProviderI2cConnectionSettings.put_SharingMode(value)
    }

;@endregion Instance Methods
}
