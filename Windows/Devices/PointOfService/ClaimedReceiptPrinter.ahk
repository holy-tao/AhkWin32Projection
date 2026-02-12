#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClaimedReceiptPrinter.ahk
#Include .\ICommonClaimedPosPrinterStation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a receipt printer station that has been claimed for use.
 * @remarks
 * To get a ClaimedReceiptPrinter object, use the [ClaimedPosPrinter.Receipt](claimedposprinter_receipt.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ClaimedReceiptPrinter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClaimedReceiptPrinter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClaimedReceiptPrinter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of lines that the receipt printer station can print in sideways mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.sidewaysmaxlines
     * @type {Integer} 
     */
    SidewaysMaxLines {
        get => this.get_SidewaysMaxLines()
    }

    /**
     * Gets the maximum number of characters that the receipt printer station can print on each line in sideways mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.sidewaysmaxchars
     * @type {Integer} 
     */
    SidewaysMaxChars {
        get => this.get_SidewaysMaxChars()
    }

    /**
     * Gets the number of lines that must be advanced before cutting the receipt paper.
     * @remarks
     * Some printers position the cutting blade above the print head.
     * This value specifies the number of blank lines required
     * after the last line of a receipt
     * in order to advance the last printed line past the cutting blade.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.linestopapercut
     * @type {Integer} 
     */
    LinesToPaperCut {
        get => this.get_LinesToPaperCut()
    }

    /**
     * Gets the size of paper that the claimed receipt printer station currently uses.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.pagesize
     * @type {SIZE} 
     */
    PageSize {
        get => this.get_PageSize()
    }

    /**
     * Gets the print area for the receipt printer station, expressed in the unit of measurement that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.printarea
     * @type {RECT} 
     */
    PrintArea {
        get => this.get_PrintArea()
    }

    /**
     * Gets or sets the number of characters the receipt printer station can print per line of text.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.charactersperline
     * @type {Integer} 
     */
    CharactersPerLine {
        get => this.get_CharactersPerLine()
        set => this.put_CharactersPerLine(value)
    }

    /**
     * Gets or sets the current height of the printed line for the receipt printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.lineheight
     * @type {Integer} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets the spacing of each single-high print line for the receipt printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies. This spacing includes both the height of printed line and of the white space between each pair of lines.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.linespacing
     * @type {Integer} 
     */
    LineSpacing {
        get => this.get_LineSpacing()
        set => this.put_LineSpacing(value)
    }

    /**
     * Gets the current width of the printed line for the receipt printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.linewidth
     * @type {Integer} 
     */
    LineWidth {
        get => this.get_LineWidth()
    }

    /**
     * Gets or sets whether the receipt printer station prints with high quality or high speed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.isletterquality
     * @type {Boolean} 
     */
    IsLetterQuality {
        get => this.get_IsLetterQuality()
        set => this.put_IsLetterQuality(value)
    }

    /**
     * Gets whether the receipt printer station is almost out of paper.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.ispapernearend
     * @type {Boolean} 
     */
    IsPaperNearEnd {
        get => this.get_IsPaperNearEnd()
    }

    /**
     * Gets or sets the color cartridge that the receipt printer station should use when it prints.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.colorcartridge
     * @type {Integer} 
     */
    ColorCartridge {
        get => this.get_ColorCartridge()
        set => this.put_ColorCartridge(value)
    }

    /**
     * Gets whether the cover of the receipt printer station is currently open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.iscoveropen
     * @type {Boolean} 
     */
    IsCoverOpen {
        get => this.get_IsCoverOpen()
    }

    /**
     * Gets whether the cartridge of the receipt printer station is currently removed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.iscartridgeremoved
     * @type {Boolean} 
     */
    IsCartridgeRemoved {
        get => this.get_IsCartridgeRemoved()
    }

    /**
     * Gets whether the cartridge of the receipt printer station is currently out of ink or toner.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.iscartridgeempty
     * @type {Boolean} 
     */
    IsCartridgeEmpty {
        get => this.get_IsCartridgeEmpty()
    }

    /**
     * Gets whether the receipt printer station is currently cleaning its print head.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.isheadcleaning
     * @type {Boolean} 
     */
    IsHeadCleaning {
        get => this.get_IsHeadCleaning()
    }

    /**
     * Gets whether the receipt printer station needs paper.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.ispaperempty
     * @type {Boolean} 
     */
    IsPaperEmpty {
        get => this.get_IsPaperEmpty()
    }

    /**
     * Gets whether the receipt printer station is on and accepting print jobs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.isreadytoprint
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
     * 
     * @returns {Integer} 
     */
    get_SidewaysMaxLines() {
        if (!this.HasProp("__IClaimedReceiptPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedReceiptPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedReceiptPrinter := IClaimedReceiptPrinter(outPtr)
        }

        return this.__IClaimedReceiptPrinter.get_SidewaysMaxLines()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidewaysMaxChars() {
        if (!this.HasProp("__IClaimedReceiptPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedReceiptPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedReceiptPrinter := IClaimedReceiptPrinter(outPtr)
        }

        return this.__IClaimedReceiptPrinter.get_SidewaysMaxChars()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LinesToPaperCut() {
        if (!this.HasProp("__IClaimedReceiptPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedReceiptPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedReceiptPrinter := IClaimedReceiptPrinter(outPtr)
        }

        return this.__IClaimedReceiptPrinter.get_LinesToPaperCut()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_PageSize() {
        if (!this.HasProp("__IClaimedReceiptPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedReceiptPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedReceiptPrinter := IClaimedReceiptPrinter(outPtr)
        }

        return this.__IClaimedReceiptPrinter.get_PageSize()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_PrintArea() {
        if (!this.HasProp("__IClaimedReceiptPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedReceiptPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedReceiptPrinter := IClaimedReceiptPrinter(outPtr)
        }

        return this.__IClaimedReceiptPrinter.get_PrintArea()
    }

    /**
     * Creates a new print job for the receipt printer station.
     * @returns {ReceiptPrintJob} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.createjob
     */
    CreateJob() {
        if (!this.HasProp("__IClaimedReceiptPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedReceiptPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedReceiptPrinter := IClaimedReceiptPrinter(outPtr)
        }

        return this.__IClaimedReceiptPrinter.CreateJob()
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
     * Determines whether a data sequence, possibly including one or more escape sequences, is valid for the receipt printer station, before you use that data sequence when you call the [ReceiptPrintJob.Print](receiptprintjob_print_1512698335.md) and [ReceiptPrintJob.ExecuteAsync](receiptprintjob_executeasync_2108924004.md) methods.
     * @param {HSTRING} data The data sequence that you want to validate before you use it with the [ReceiptPrintJob.Print](receiptprintjob_print_1512698335.md) method. This sequence may include printable data and escape sequences.
     * 
     * If the sequence is not valid, and you use it with [ReceiptPrintJob.Print](receiptprintjob_print_1512698335.md) anyways, the job fails when you run it with [ReceiptPrintJob.ExecuteAsync](receiptprintjob_executeasync_2108924004.md). You cannot remove a print instruction that uses an invalid data sequence after you add the instruction to the job with [ReceiptPrintJob.Print](receiptprintjob_print_1512698335.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedreceiptprinter.validatedata
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
