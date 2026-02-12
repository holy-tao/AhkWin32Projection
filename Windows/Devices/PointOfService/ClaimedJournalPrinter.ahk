#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClaimedJournalPrinter.ahk
#Include .\ICommonClaimedPosPrinterStation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a journal printer station that has been claimed for use.
 * @remarks
 * To get a ClaimedJournalPrinter object, use the [ClaimedPosPrinter.Journal](claimedposprinter_journal.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ClaimedJournalPrinter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClaimedJournalPrinter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClaimedJournalPrinter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the number of characters per line for the journal printer station.
     * 
     * It is worth noting that changing this property can potentially change the [LineHeight](claimedjournalprinter_lineheight.md), [LineSpacing](claimedjournalprinter_linespacing.md) and [LineWidth](claimedjournalprinter_linewidth.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.charactersperline
     * @type {Integer} 
     */
    CharactersPerLine {
        get => this.get_CharactersPerLine()
        set => this.put_CharactersPerLine(value)
    }

    /**
     * Gets or sets the current height of the printed line for the journal printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * 
     * It is worth noting that changing this property can potentially change the [CharactersPerLine](claimedjournalprinter_charactersperline.md), [LineSpacing](claimedjournalprinter_linespacing.md) and [LineWidth](claimedjournalprinter_linewidth.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.lineheight
     * @type {Integer} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets the spacing of each single-high print line for the journal printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies. This spacing includes both the height of printed line and of the white space between each pair of lines.
     * 
     * It is worth noting that changing this property can potentially change the [CharactersPerLine](claimedjournalprinter_charactersperline.md), [LineHeight](claimedjournalprinter_lineheight.md) and [LineWidth](claimedjournalprinter_linewidth.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.linespacing
     * @type {Integer} 
     */
    LineSpacing {
        get => this.get_LineSpacing()
        set => this.put_LineSpacing(value)
    }

    /**
     * Gets the current width of the printed line for the journal printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * 
     * It is worth noting that changing this property can potentially change the [CharactersPerLine](claimedjournalprinter_charactersperline.md), [LineHeight](claimedjournalprinter_lineheight.md) and [LineSpacing](claimedjournalprinter_linespacing.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.linewidth
     * @type {Integer} 
     */
    LineWidth {
        get => this.get_LineWidth()
    }

    /**
     * Gets or sets whether the journal printer station prints with high quality or high speed. Note, this may throw an exception if the corresponding sensor is not available on the printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.isletterquality
     * @type {Boolean} 
     */
    IsLetterQuality {
        get => this.get_IsLetterQuality()
        set => this.put_IsLetterQuality(value)
    }

    /**
     * Gets whether the printer paper is near the end for the journal printer station. Note, this may throw an exception if the corresponding sensor is not available on the printer. See [JournalPrinterCapabilities](journalprintercapabilities.md) to verify sensor availability.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.ispapernearend
     * @type {Boolean} 
     */
    IsPaperNearEnd {
        get => this.get_IsPaperNearEnd()
    }

    /**
     * Gets or sets the color cartridge that the journal printer station should use when it prints. This property must agree with what is available through [ColorCartridgeCapabilities](journalprintercapabilities_colorcartridgecapabilities.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.colorcartridge
     * @type {Integer} 
     */
    ColorCartridge {
        get => this.get_ColorCartridge()
        set => this.put_ColorCartridge(value)
    }

    /**
     * Gets whether the printer cover for the journal printer station is open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.iscoveropen
     * @type {Boolean} 
     */
    IsCoverOpen {
        get => this.get_IsCoverOpen()
    }

    /**
     * Gets whether the cartridge for journal printer station has been removed. Note, this may throw an exception if the corresponding sensor is not available on the printer. See [JournalPrinterCapabilities](journalprintercapabilities.md) to verify sensor availability.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.iscartridgeremoved
     * @type {Boolean} 
     */
    IsCartridgeRemoved {
        get => this.get_IsCartridgeRemoved()
    }

    /**
     * Gets whether the printer cartridge for the journal printer station is empty. Note, this may throw an exception if the corresponding sensor is not available on the printer. See [JournalPrinterCapabilities](journalprintercapabilities.md) to verify sensor availability.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.iscartridgeempty
     * @type {Boolean} 
     */
    IsCartridgeEmpty {
        get => this.get_IsCartridgeEmpty()
    }

    /**
     * Gets whether the head for the journal printer station is currently cleaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.isheadcleaning
     * @type {Boolean} 
     */
    IsHeadCleaning {
        get => this.get_IsHeadCleaning()
    }

    /**
     * Gets whether the paper is empty for the journal printer station. Note, this may throw an exception if the corresponding sensor is not available on the printer. See [JournalPrinterCapabilities](journalprintercapabilities.md) to verify sensor availability.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.ispaperempty
     * @type {Boolean} 
     */
    IsPaperEmpty {
        get => this.get_IsPaperEmpty()
    }

    /**
     * Gets whether the journal printer station is ready to print. Note, this may throw an exception if the corresponding sensor is not available on the printer. See [JournalPrinterCapabilities](journalprintercapabilities.md) to verify sensor availability.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.isreadytoprint
     * @type {Boolean} 
     */
    IsReadyToPrint {
        get => this.get_IsReadyToPrint()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates a new print job for the journal printer station.
     * @returns {JournalPrintJob} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.createjob
     */
    CreateJob() {
        if (!this.HasProp("__IClaimedJournalPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedJournalPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedJournalPrinter := IClaimedJournalPrinter(outPtr)
        }

        return this.__IClaimedJournalPrinter.CreateJob()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharactersPerLine(value) {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.put_CharactersPerLine(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharactersPerLine() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_CharactersPerLine()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineHeight(value) {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.put_LineHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineHeight() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_LineHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineSpacing(value) {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.put_LineSpacing(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineSpacing() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_LineSpacing()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineWidth() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_LineWidth()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLetterQuality(value) {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.put_IsLetterQuality(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLetterQuality() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_IsLetterQuality()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaperNearEnd() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_IsPaperNearEnd()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorCartridge(value) {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.put_ColorCartridge(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorCartridge() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_ColorCartridge()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCoverOpen() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_IsCoverOpen()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCartridgeRemoved() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_IsCartridgeRemoved()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCartridgeEmpty() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_IsCartridgeEmpty()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHeadCleaning() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_IsHeadCleaning()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaperEmpty() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_IsPaperEmpty()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadyToPrint() {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.get_IsReadyToPrint()
    }

    /**
     * Determines if a [JournalPrintJob](journalprintjob.md) can successfully execute a print instruction with the specified data.
     * @param {HSTRING} data The data sequence that you want to validate before you use it with the [JournalPrintJob.Print](journalprintjob_print_1512698335.md) method. This sequence may include printable data and escape sequences.
     * 
     * If the sequence is not valid, and you use it with [JournalPrintJob.Print](journalprintjob_print_1512698335.md) anyways, the job fails when you run it with [JournalPrintJob.ExecuteAsync](journalprintjob_executeasync_2108924004.md). You cannot remove a print instruction that uses an invalid data sequence after you add the instruction to the job with [JournalPrintJob.Print](journalprintjob_print_1512698335.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedjournalprinter.validatedata
     */
    ValidateData(data) {
        if (!this.HasProp("__ICommonClaimedPosPrinterStation")) {
            if ((queryResult := this.QueryInterface(ICommonClaimedPosPrinterStation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonClaimedPosPrinterStation := ICommonClaimedPosPrinterStation(outPtr)
        }

        return this.__ICommonClaimedPosPrinterStation.ValidateData(data)
    }

;@endregion Instance Methods
}
