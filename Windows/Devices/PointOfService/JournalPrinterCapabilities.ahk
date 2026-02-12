#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IJournalPrinterCapabilities.ahk
#Include .\IJournalPrinterCapabilities2.ahk
#Include .\ICommonPosPrintStationCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the capabilities of journal station of a point-of-service printer.
 * @remarks
 * To get the capabilities of the journal station of a point-of-service printer, use [PosPrinterCapabilities.Journal](posprintercapabilities_journal.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class JournalPrinterCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJournalPrinterCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJournalPrinterCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the journal printer station can print characters in reverse-video style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isreversevideosupported
     * @type {Boolean} 
     */
    IsReverseVideoSupported {
        get => this.get_IsReverseVideoSupported()
    }

    /**
     * Gets whether the journal printer station can print characters in strikethrough style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isstrikethroughsupported
     * @type {Boolean} 
     */
    IsStrikethroughSupported {
        get => this.get_IsStrikethroughSupported()
    }

    /**
     * Gets whether the journal printer station can print characters in superscript style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.issuperscriptsupported
     * @type {Boolean} 
     */
    IsSuperscriptSupported {
        get => this.get_IsSuperscriptSupported()
    }

    /**
     * Gets whether the journal printer station can print characters in subscript style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.issubscriptsupported
     * @type {Boolean} 
     */
    IsSubscriptSupported {
        get => this.get_IsSubscriptSupported()
    }

    /**
     * Gets whether the journal printer station can reverse paper feed by line.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isreversepaperfeedbylinesupported
     * @type {Boolean} 
     */
    IsReversePaperFeedByLineSupported {
        get => this.get_IsReversePaperFeedByLineSupported()
    }

    /**
     * Gets whether the journal printer station can reverse paper feed by map mode unit.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isreversepaperfeedbymapmodeunitsupported
     * @type {Boolean} 
     */
    IsReversePaperFeedByMapModeUnitSupported {
        get => this.get_IsReversePaperFeedByMapModeUnitSupported()
    }

    /**
     * Gets whether a point-of-service printer with a station that functions as a journal printer station is present.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isprinterpresent
     * @type {Boolean} 
     */
    IsPrinterPresent {
        get => this.get_IsPrinterPresent()
    }

    /**
     * Gets whether the journal printer station can print a dark color plus an alternate color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isdualcolorsupported
     * @type {Boolean} 
     */
    IsDualColorSupported {
        get => this.get_IsDualColorSupported()
    }

    /**
     * Gets the color cartridges that the journal printer station can use to print in color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.colorcartridgecapabilities
     * @type {Integer} 
     */
    ColorCartridgeCapabilities {
        get => this.get_ColorCartridgeCapabilities()
    }

    /**
     * Gets information about the sensors that the journal printer station has available to report the status of the printer cartridge.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.cartridgesensors
     * @type {Integer} 
     */
    CartridgeSensors {
        get => this.get_CartridgeSensors()
    }

    /**
     * Gets whether the journal printer station can print bold characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isboldsupported
     * @type {Boolean} 
     */
    IsBoldSupported {
        get => this.get_IsBoldSupported()
    }

    /**
     * Gets whether the journal printer station can print italic characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isitalicsupported
     * @type {Boolean} 
     */
    IsItalicSupported {
        get => this.get_IsItalicSupported()
    }

    /**
     * Gets whether the journal printer station can underline characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isunderlinesupported
     * @type {Boolean} 
     */
    IsUnderlineSupported {
        get => this.get_IsUnderlineSupported()
    }

    /**
     * Gets whether the journal printer station can print double-high characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isdoublehighprintsupported
     * @type {Boolean} 
     */
    IsDoubleHighPrintSupported {
        get => this.get_IsDoubleHighPrintSupported()
    }

    /**
     * Gets whether the journal printer station can print double-wide characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isdoublewideprintsupported
     * @type {Boolean} 
     */
    IsDoubleWidePrintSupported {
        get => this.get_IsDoubleWidePrintSupported()
    }

    /**
     * Gets whether the journal printer station can print characters that are both double-high and double-wide.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.isdoublehighdoublewideprintsupported
     * @type {Boolean} 
     */
    IsDoubleHighDoubleWidePrintSupported {
        get => this.get_IsDoubleHighDoubleWidePrintSupported()
    }

    /**
     * Gets whether the journal printer station has an out-of-paper sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.ispaperemptysensorsupported
     * @type {Boolean} 
     */
    IsPaperEmptySensorSupported {
        get => this.get_IsPaperEmptySensorSupported()
    }

    /**
     * Gets whether the journal printer station has a low-paper sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.ispapernearendsensorsupported
     * @type {Boolean} 
     */
    IsPaperNearEndSensorSupported {
        get => this.get_IsPaperNearEndSensorSupported()
    }

    /**
     * Gets a collection of the line widths in characters per line that the journal printer station supports.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintercapabilities.supportedcharactersperline
     * @type {IVectorView<Integer>} 
     */
    SupportedCharactersPerLine {
        get => this.get_SupportedCharactersPerLine()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReverseVideoSupported() {
        if (!this.HasProp("__IJournalPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IJournalPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrinterCapabilities2 := IJournalPrinterCapabilities2(outPtr)
        }

        return this.__IJournalPrinterCapabilities2.get_IsReverseVideoSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStrikethroughSupported() {
        if (!this.HasProp("__IJournalPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IJournalPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrinterCapabilities2 := IJournalPrinterCapabilities2(outPtr)
        }

        return this.__IJournalPrinterCapabilities2.get_IsStrikethroughSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuperscriptSupported() {
        if (!this.HasProp("__IJournalPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IJournalPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrinterCapabilities2 := IJournalPrinterCapabilities2(outPtr)
        }

        return this.__IJournalPrinterCapabilities2.get_IsSuperscriptSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSubscriptSupported() {
        if (!this.HasProp("__IJournalPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IJournalPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrinterCapabilities2 := IJournalPrinterCapabilities2(outPtr)
        }

        return this.__IJournalPrinterCapabilities2.get_IsSubscriptSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReversePaperFeedByLineSupported() {
        if (!this.HasProp("__IJournalPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IJournalPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrinterCapabilities2 := IJournalPrinterCapabilities2(outPtr)
        }

        return this.__IJournalPrinterCapabilities2.get_IsReversePaperFeedByLineSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReversePaperFeedByMapModeUnitSupported() {
        if (!this.HasProp("__IJournalPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IJournalPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrinterCapabilities2 := IJournalPrinterCapabilities2(outPtr)
        }

        return this.__IJournalPrinterCapabilities2.get_IsReversePaperFeedByMapModeUnitSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrinterPresent() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsPrinterPresent()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDualColorSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsDualColorSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorCartridgeCapabilities() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_ColorCartridgeCapabilities()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CartridgeSensors() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_CartridgeSensors()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBoldSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsBoldSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsItalicSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsItalicSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUnderlineSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsUnderlineSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleHighPrintSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsDoubleHighPrintSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleWidePrintSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsDoubleWidePrintSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleHighDoubleWidePrintSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsDoubleHighDoubleWidePrintSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaperEmptySensorSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsPaperEmptySensorSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaperNearEndSensorSupported() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_IsPaperNearEndSensorSupported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCharactersPerLine() {
        if (!this.HasProp("__ICommonPosPrintStationCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonPosPrintStationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonPosPrintStationCapabilities := ICommonPosPrintStationCapabilities(outPtr)
        }

        return this.__ICommonPosPrintStationCapabilities.get_SupportedCharactersPerLine()
    }

;@endregion Instance Methods
}
