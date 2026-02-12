#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IJournalPrintJob.ahk
#Include .\IPosPrinterJob.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of printing instructions that you want to run on the journal printer station.
 * @remarks
 * To create a new print job for the journal printer, call [ClaimedJournalPrinter.CreateJob](claimedjournalprinter_createjob_1417454808.md).
 * The created print job object is valid as long as the ClaimedJournalPrinter object that created it is valid.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintjob
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class JournalPrintJob extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJournalPrintJob

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJournalPrintJob.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Adds an instruction to the print job to print the specified text and options on the journal printer station.
     * @param {HSTRING} data The text to print on the journal printer.
     * @param {PosPrinterPrintOptions} printOptions The print options of the text to print on the journal printer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintjob.print
     */
    Print(data, printOptions) {
        if (!this.HasProp("__IJournalPrintJob")) {
            if ((queryResult := this.QueryInterface(IJournalPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrintJob := IJournalPrintJob(outPtr)
        }

        return this.__IJournalPrintJob.Print(data, printOptions)
    }

    /**
     * Adds an instruction to the print job to feed paper by line on the journal printer station.
     * @param {Integer} lineCount The number of lines to feed on the journal printer. Use a positive number to feed paper forward or a negative number to feed paper backward.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintjob.feedpaperbyline
     */
    FeedPaperByLine(lineCount) {
        if (!this.HasProp("__IJournalPrintJob")) {
            if ((queryResult := this.QueryInterface(IJournalPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrintJob := IJournalPrintJob(outPtr)
        }

        return this.__IJournalPrintJob.FeedPaperByLine(lineCount)
    }

    /**
     * Adds an instruction to the print job to feed paper by map mode unit on the journal printer station.
     * @param {Integer} distance The number of map mode units to feed on the journal printer. Use a positive number to feed paper forward or a negative number to feed paper backward.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintjob.feedpaperbymapmodeunit
     */
    FeedPaperByMapModeUnit(distance) {
        if (!this.HasProp("__IJournalPrintJob")) {
            if ((queryResult := this.QueryInterface(IJournalPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJournalPrintJob := IJournalPrintJob(outPtr)
        }

        return this.__IJournalPrintJob.FeedPaperByMapModeUnit(distance)
    }

    /**
     * Adds an instruction to the print job to print the specified text on the journal printer station.
     * @remarks
     * If [ClaimedPosPrinter.IsCharacterSetMappingEnabled](claimedposprinter_ischaractersetmappingenabled.md) is true, the text is mapped to the font on the printer that [ClaimedPosPrinter.CharacterSet](claimedposprinter_characterset.md) specifies. If [ClaimedPosPrinter.IsCharacterSetMappingEnabled](claimedposprinter_ischaractersetmappingenabled.md) is false, the driver or provider sends the low byte of each Unicode character to the printer verbatim.
     * @param {HSTRING} data The text to print on the journal printer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintjob.print
     */
    Print1(data) {
        if (!this.HasProp("__IPosPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPosPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterJob := IPosPrinterJob(outPtr)
        }

        return this.__IPosPrinterJob.Print(data)
    }

    /**
     * Adds an instruction to the print job to print the specified line of text on the journal printer station.
     * @param {HSTRING} data The line of text to print.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintjob.printline
     */
    PrintLine(data) {
        if (!this.HasProp("__IPosPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPosPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterJob := IPosPrinterJob(outPtr)
        }

        return this.__IPosPrinterJob.PrintLine(data)
    }

    /**
     * Adds an instruction to the print job to print a newline character on the journal printer station.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintjob.printline
     */
    PrintNewline() {
        if (!this.HasProp("__IPosPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPosPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterJob := IPosPrinterJob(outPtr)
        }

        return this.__IPosPrinterJob.PrintNewline()
    }

    /**
     * Runs the print job on the journal printer station asynchronously.
     * @remarks
     * The print job is sent to the claimed printer station object that created the print job.
     * The claimed printer station object must remain valid when calling this method.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.journalprintjob.executeasync
     */
    ExecuteAsync() {
        if (!this.HasProp("__IPosPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPosPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterJob := IPosPrinterJob(outPtr)
        }

        return this.__IPosPrinterJob.ExecuteAsync()
    }

;@endregion Instance Methods
}
