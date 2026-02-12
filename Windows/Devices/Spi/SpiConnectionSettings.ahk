#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpiConnectionSettings.ahk
#Include .\ISpiConnectionSettingsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the settings for the connection with an [SpiDevice](/uwp/api/windows.devices.spi.spidevice).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spiconnectionsettings
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class SpiConnectionSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpiConnectionSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpiConnectionSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes new instance of [SpiConnectionSettings](spiconnectionsettings.md).
     * @param {Integer} chipSelectLine The chip select line on which the connection will be made.
     * @returns {SpiConnectionSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spiconnectionsettings.#ctor
     */
    static Create(chipSelectLine) {
        if (!SpiConnectionSettings.HasProp("__ISpiConnectionSettingsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Spi.SpiConnectionSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpiConnectionSettingsFactory.IID)
            SpiConnectionSettings.__ISpiConnectionSettingsFactory := ISpiConnectionSettingsFactory(factoryPtr)
        }

        return SpiConnectionSettings.__ISpiConnectionSettingsFactory.Create(chipSelectLine)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the chip select line for the connection to the SPI device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spiconnectionsettings.chipselectline
     * @type {Integer} 
     */
    ChipSelectLine {
        get => this.get_ChipSelectLine()
        set => this.put_ChipSelectLine(value)
    }

    /**
     * Gets or sets the [SpiMode](spimode.md) for this connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spiconnectionsettings.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets or sets the bit length for data on this connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spiconnectionsettings.databitlength
     * @type {Integer} 
     */
    DataBitLength {
        get => this.get_DataBitLength()
        set => this.put_DataBitLength(value)
    }

    /**
     * Gets or sets the clock frequency for the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spiconnectionsettings.clockfrequency
     * @type {Integer} 
     */
    ClockFrequency {
        get => this.get_ClockFrequency()
        set => this.put_ClockFrequency(value)
    }

    /**
     * Gets or sets the sharing mode for the SPI connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spiconnectionsettings.sharingmode
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
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.get_ChipSelectLine()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ChipSelectLine(value) {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.put_ChipSelectLine(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.put_Mode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataBitLength() {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.get_DataBitLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataBitLength(value) {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.put_DataBitLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClockFrequency() {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.get_ClockFrequency()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClockFrequency(value) {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.put_ClockFrequency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.get_SharingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SharingMode(value) {
        if (!this.HasProp("__ISpiConnectionSettings")) {
            if ((queryResult := this.QueryInterface(ISpiConnectionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiConnectionSettings := ISpiConnectionSettings(outPtr)
        }

        return this.__ISpiConnectionSettings.put_SharingMode(value)
    }

;@endregion Instance Methods
}
