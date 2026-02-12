#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPosPrinterCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the capabilities of the point-of-service printer.
 * @remarks
 * To get the capabilities of the point-of-service printer, use the [PosPrinter.Capabilities](posprinter_capabilities.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPosPrinterCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPosPrinterCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the power reporting capabilities of the point-of-service printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.powerreportingtype
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * Gets whether the point-of-service printer supports reporting statistics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.isstatisticsreportingsupported
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * Gets whether the point-of-service printer supports updating statistics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.isstatisticsupdatingsupported
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * Gets the character set that the point-of-service printer uses by default.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.defaultcharacterset
     * @type {Integer} 
     */
    DefaultCharacterSet {
        get => this.get_DefaultCharacterSet()
    }

    /**
     * Gets whether the point-of-service printer has a sensor that detects if the printer cover is open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.hascoversensor
     * @type {Boolean} 
     */
    HasCoverSensor {
        get => this.get_HasCoverSensor()
    }

    /**
     * Gets whether the point-of-service printer can map the characters that the application sends (in the character set that the [ClaimedPosPrinter.CharacterSet](claimedposprinter_characterset.md) property defines) to the character sets that the [PosPrinter.SupportedCharacterSets](posprinter_supportedcharactersets.md) property defines.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.canmapcharacterset
     * @type {Boolean} 
     */
    CanMapCharacterSet {
        get => this.get_CanMapCharacterSet()
    }

    /**
     * Gets whether the point-of-service printer supports printer transactions.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.istransactionsupported
     * @type {Boolean} 
     */
    IsTransactionSupported {
        get => this.get_IsTransactionSupported()
    }

    /**
     * Gets the capabilities of the receipt station for the point-of-service printer.
     * 
     * The receipt station is used to print transaction information that is typically given to the customer, or for store reports. Receipt contains either a knife to automatically cut the paper between transactions, or a tear bar to manually cut the paper.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.receipt
     * @type {ReceiptPrinterCapabilities} 
     */
    Receipt {
        get => this.get_Receipt()
    }

    /**
     * Gets the capabilities of the slip station for the point-of-service printer.
     * 
     * The slip station is used to print information on a form that is typically given to the customer, or to print validation information on a form. The form type is usually a check or credit card slip.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.slip
     * @type {SlipPrinterCapabilities} 
     */
    Slip {
        get => this.get_Slip()
    }

    /**
     * Gets the capabilities of the journal station for the point-of-service printer.
     * 
     * The journal station is used for simple text messages that log transaction and activity information kept by the store for audit and other purposes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercapabilities.journal
     * @type {JournalPrinterCapabilities} 
     */
    Journal {
        get => this.get_Journal()
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
    get_PowerReportingType() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_PowerReportingType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsReportingSupported() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_IsStatisticsReportingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsUpdatingSupported() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_IsStatisticsUpdatingSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultCharacterSet() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_DefaultCharacterSet()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasCoverSensor() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_HasCoverSensor()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMapCharacterSet() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_CanMapCharacterSet()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransactionSupported() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_IsTransactionSupported()
    }

    /**
     * 
     * @returns {ReceiptPrinterCapabilities} 
     */
    get_Receipt() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_Receipt()
    }

    /**
     * 
     * @returns {SlipPrinterCapabilities} 
     */
    get_Slip() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_Slip()
    }

    /**
     * 
     * @returns {JournalPrinterCapabilities} 
     */
    get_Journal() {
        if (!this.HasProp("__IPosPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IPosPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterCapabilities := IPosPrinterCapabilities(outPtr)
        }

        return this.__IPosPrinterCapabilities.get_Journal()
    }

;@endregion Instance Methods
}
