#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClaimedSlipPrinter.ahk
#Include .\ICommonClaimedPosPrinterStation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a slip printer station that has been claimed for use.
 * @remarks
 * To get a [ClaimedSlipPrinter  object, use the [ClaimedPosPrinter.Slip](claimedposprinter_slip.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ClaimedSlipPrinter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClaimedSlipPrinter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClaimedSlipPrinter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of lines that the slip printer station can print in sideways mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.sidewaysmaxlines
     * @type {Integer} 
     */
    SidewaysMaxLines {
        get => this.get_SidewaysMaxLines()
    }

    /**
     * Gets the maximum number of characters that the slip printer station can print on each line in sideways mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.sidewaysmaxchars
     * @type {Integer} 
     */
    SidewaysMaxChars {
        get => this.get_SidewaysMaxChars()
    }

    /**
     * Gets the maximum number of lines that the slip printer station can print on a form.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.maxlines
     * @type {Integer} 
     */
    MaxLines {
        get => this.get_MaxLines()
    }

    /**
     * Gets the number of lines that the slip printer station can print after the [ClaimedSlipPrinter.IsPaperNearEnd](claimedslipprinter_ispapernearend.md) property is set to **true** but before the printer reaches the end of the slip.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.linesnearendtoend
     * @type {Integer} 
     */
    LinesNearEndToEnd {
        get => this.get_LinesNearEndToEnd()
    }

    /**
     * Gets the side of the sheet on which the claimed slip printer station is currently printing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.printside
     * @type {Integer} 
     */
    PrintSide {
        get => this.get_PrintSide()
    }

    /**
     * Gets the size of paper that the claimed slip printer station currently uses, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.pagesize
     * @type {SIZE} 
     */
    PageSize {
        get => this.get_PageSize()
    }

    /**
     * Gets the print area for the slip printer station, expressed in the unit of measurement that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.printarea
     * @type {RECT} 
     */
    PrintArea {
        get => this.get_PrintArea()
    }

    /**
     * Gets or sets the number of characters the slip printer station can print per line of text.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.charactersperline
     * @type {Integer} 
     */
    CharactersPerLine {
        get => this.get_CharactersPerLine()
        set => this.put_CharactersPerLine(value)
    }

    /**
     * Gets or sets the current height of the printed line for the slip printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.lineheight
     * @type {Integer} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets the spacing of each single-high print line for the slip printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies. This spacing includes both the height of printed line and of the white space between each pair of lines.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.linespacing
     * @type {Integer} 
     */
    LineSpacing {
        get => this.get_LineSpacing()
        set => this.put_LineSpacing(value)
    }

    /**
     * Gets the current width of the printed line for the slip printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.linewidth
     * @type {Integer} 
     */
    LineWidth {
        get => this.get_LineWidth()
    }

    /**
     * Gets or sets whether the slip printer station prints with high quality or high speed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.isletterquality
     * @type {Boolean} 
     */
    IsLetterQuality {
        get => this.get_IsLetterQuality()
        set => this.put_IsLetterQuality(value)
    }

    /**
     * Gets whether the slip printer station is almost out of paper.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.ispapernearend
     * @type {Boolean} 
     */
    IsPaperNearEnd {
        get => this.get_IsPaperNearEnd()
    }

    /**
     * Gets or sets the color cartridge that the slip printer station should use when it prints.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.colorcartridge
     * @type {Integer} 
     */
    ColorCartridge {
        get => this.get_ColorCartridge()
        set => this.put_ColorCartridge(value)
    }

    /**
     * Gets whether the cover of the slip printer station is currently open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.iscoveropen
     * @type {Boolean} 
     */
    IsCoverOpen {
        get => this.get_IsCoverOpen()
    }

    /**
     * Gets whether the cartridge of the slip printer station is currently removed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.iscartridgeremoved
     * @type {Boolean} 
     */
    IsCartridgeRemoved {
        get => this.get_IsCartridgeRemoved()
    }

    /**
     * Gets whether the cartridge of the slip printer station is currently out of ink or toner.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.iscartridgeempty
     * @type {Boolean} 
     */
    IsCartridgeEmpty {
        get => this.get_IsCartridgeEmpty()
    }

    /**
     * Gets whether the slip printer station is currently cleaning its print head.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.isheadcleaning
     * @type {Boolean} 
     */
    IsHeadCleaning {
        get => this.get_IsHeadCleaning()
    }

    /**
     * Gets whether the slip printer station needs paper.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.ispaperempty
     * @type {Boolean} 
     */
    IsPaperEmpty {
        get => this.get_IsPaperEmpty()
    }

    /**
     * Gets whether the slip printer station is on and accepting print jobs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.isreadytoprint
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
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.get_SidewaysMaxLines()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidewaysMaxChars() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.get_SidewaysMaxChars()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLines() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.get_MaxLines()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LinesNearEndToEnd() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.get_LinesNearEndToEnd()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrintSide() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.get_PrintSide()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_PageSize() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.get_PageSize()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_PrintArea() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.get_PrintArea()
    }

    /**
     * Opens the mechanism that holds the slip in place while the slip printer station is printing, typically before the user inserts or removes the slip.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.openjaws
     */
    OpenJaws() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.OpenJaws()
    }

    /**
     * Closes the mechanism that holds the slip in place while the slip printer station is printing, typically after the user inserts or removes the slip.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.closejaws
     */
    CloseJaws() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.CloseJaws()
    }

    /**
     * Waits for the user to insert a slip into the slip printer station.
     * @param {TimeSpan} timeout The interval of time that the operation should wait for the user to insert the slip before exiting.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.insertslipasync
     */
    InsertSlipAsync(timeout) {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.InsertSlipAsync(timeout)
    }

    /**
     * Waits for the user to remove a slip from the slip printer station.
     * @param {TimeSpan} timeout The interval of time that the operation should wait for the user to remove the slip before exiting.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.removeslipasync
     */
    RemoveSlipAsync(timeout) {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.RemoveSlipAsync(timeout)
    }

    /**
     * Changes the side of the sheet on which the claimed slip printer station is currently printing.
     * @param {Integer} printSide The side of the sheet on which the claimed slip printer station is currently printing.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.changeprintside
     */
    ChangePrintSide(printSide) {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.ChangePrintSide(printSide)
    }

    /**
     * Creates a new print job for the slip printer stiation.
     * @returns {SlipPrintJob} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.createjob
     */
    CreateJob() {
        if (!this.HasProp("__IClaimedSlipPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedSlipPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedSlipPrinter := IClaimedSlipPrinter(outPtr)
        }

        return this.__IClaimedSlipPrinter.CreateJob()
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
     * Determines whether a data sequence, possibly including one or more escape sequences, is valid for the slip printer station, before you use that data sequence when you call the [SlipPrintJob.Print](slipprintjob_print_1512698335.md) and [SlipPrintJob.ExecuteAsync](slipprintjob_executeasync_2108924004.md) methods.
     * @param {HSTRING} data The data sequence that you want to validate before you use it with the [SlipPrintJob.Print](slipprintjob_print_1512698335.md) method. This sequence may include printable data and escape sequences.
     * 
     * If the sequence is not valid, and you use it with [SlipPrintJob.Print](slipprintjob_print_1512698335.md) anyways, the job fails when you run it with [SlipPrintJob.ExecuteAsync](slipprintjob_executeasync_2108924004.md). You cannot remove a print instruction that uses an invalid data sequence after you add the instruction to the job with [SlipPrintJob.Print](slipprintjob_print_1512698335.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedslipprinter.validatedata
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
