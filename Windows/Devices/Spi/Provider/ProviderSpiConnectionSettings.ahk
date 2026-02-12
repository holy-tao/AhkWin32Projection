#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProviderSpiConnectionSettings.ahk
#Include .\IProviderSpiConnectionSettingsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the provider settings for the connection to a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.providerspiconnectionsettings
 * @namespace Windows.Devices.Spi.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderSpiConnectionSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProviderSpiConnectionSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProviderSpiConnectionSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of [ProviderSpiConnectionSettings](providerspiconnectionsettings.md).
     * @param {Integer} chipSelectLine The chip select line on which the connection will be made.
     * @returns {ProviderSpiConnectionSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.providerspiconnectionsettings.#ctor
     */
    static Create(chipSelectLine) {
        if (!ProviderSpiConnectionSettings.HasProp("__IProviderSpiConnectionSettingsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Spi.Provider.ProviderSpiConnectionSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProviderSpiConnectionSettingsFactory.IID)
            ProviderSpiConnectionSettings.__IProviderSpiConnectionSettingsFactory := IProviderSpiConnectionSettingsFactory(factoryPtr)
        }

        return ProviderSpiConnectionSettings.__IProviderSpiConnectionSettingsFactory.Create(chipSelectLine)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the chip select line for the connection to the SPI device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.providerspiconnectionsettings.chipselectline
     * @type {Integer} 
     */
    ChipSelectLine {
        get => this.get_ChipSelectLine()
        set => this.put_ChipSelectLine(value)
    }

    /**
     * Gets or sets the [ProviderSpiMode](providerspimode.md) for this connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.providerspiconnectionsettings.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets or sets the bit length for data on this connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.providerspiconnectionsettings.databitlength
     * @type {Integer} 
     */
    DataBitLength {
        get => this.get_DataBitLength()
        set => this.put_DataBitLength(value)
    }

    /**
     * Gets or sets the clock frequency for the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.providerspiconnectionsettings.clockfrequency
     * @type {Integer} 
     */
    ClockFrequency {
        get => this.get_ClockFrequency()
        set => this.put_ClockFrequency(value)
    }

    /**
     * Gets or sets the sharing mode for the SPI connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.providerspiconnectionsettings.sharingmode
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
    get_ChipSelectLine() {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.get_ChipSelectLine()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ChipSelectLine(value) {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.put_ChipSelectLine(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.put_Mode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataBitLength() {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.get_DataBitLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataBitLength(value) {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.put_DataBitLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClockFrequency() {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.get_ClockFrequency()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClockFrequency(value) {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.put_ClockFrequency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.get_SharingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SharingMode(value) {
        if (!this.HasProp("__IProviderSpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(IProviderSpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderSpiConnectionSettings := IProviderSpiConnectionSettings(outPtr)
        }

        return this.__IProviderSpiConnectionSettings.put_SharingMode(value)
    }

;@endregion Instance Methods
}
