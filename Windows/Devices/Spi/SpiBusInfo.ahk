#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpiBusInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the info about a SPI bus.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spibusinfo
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class SpiBusInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpiBusInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpiBusInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of chip select lines available on the bus.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spibusinfo.chipselectlinecount
     * @type {Integer} 
     */
    ChipSelectLineCount {
        get => this.get_ChipSelectLineCount()
    }

    /**
     * Minimum clock cycle frequency of the bus.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spibusinfo.minclockfrequency
     * @type {Integer} 
     */
    MinClockFrequency {
        get => this.get_MinClockFrequency()
    }

    /**
     * Maximum clock cycle frequency of the bus.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spibusinfo.maxclockfrequency
     * @type {Integer} 
     */
    MaxClockFrequency {
        get => this.get_MaxClockFrequency()
    }

    /**
     * Gets the bit lengths that can be used on the bus for transmitting data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spibusinfo.supporteddatabitlengths
     * @type {IVectorView<Integer>} 
     */
    SupportedDataBitLengths {
        get => this.get_SupportedDataBitLengths()
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
    get_ChipSelectLineCount() {
        if (!this.HasProp("__ISpiBusInfo")) {
            if ((queryResult := this.QueryInterface(ISpiBusInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiBusInfo := ISpiBusInfo(outPtr)
        }

        return this.__ISpiBusInfo.get_ChipSelectLineCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinClockFrequency() {
        if (!this.HasProp("__ISpiBusInfo")) {
            if ((queryResult := this.QueryInterface(ISpiBusInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiBusInfo := ISpiBusInfo(outPtr)
        }

        return this.__ISpiBusInfo.get_MinClockFrequency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxClockFrequency() {
        if (!this.HasProp("__ISpiBusInfo")) {
            if ((queryResult := this.QueryInterface(ISpiBusInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiBusInfo := ISpiBusInfo(outPtr)
        }

        return this.__ISpiBusInfo.get_MaxClockFrequency()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedDataBitLengths() {
        if (!this.HasProp("__ISpiBusInfo")) {
            if ((queryResult := this.QueryInterface(ISpiBusInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiBusInfo := ISpiBusInfo(outPtr)
        }

        return this.__ISpiBusInfo.get_SupportedDataBitLengths()
    }

;@endregion Instance Methods
}
