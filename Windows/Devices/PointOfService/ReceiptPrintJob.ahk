#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IReceiptPrintJob.ahk
#Include .\IReceiptPrintJob2.ahk
#Include .\IReceiptOrSlipJob.ahk
#Include .\IPosPrinterJob.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of printing instructions that you want to run on the receipt printer.
 * @remarks
 * To create a new print job for the receipt printer, call [ClaimedReceiptPrinter.CreateJob](claimedreceiptprinter_createjob_1417454808.md).
 * The created print job object is valid as long as the ClaimedReceiptPrinter object that created it is valid.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ReceiptPrintJob extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IReceiptPrintJob

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IReceiptPrintJob.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Adds an instruction to the printer job to use the mark sensor of the receipt printer station to position the receipt paper.
     * @param {Integer} kind An enumeration value that specifies how to position the receipt paper.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.markfeed
     */
    MarkFeed(kind) {
        if (!this.HasProp("__IReceiptPrintJob")) {
            if ((queryResult := this.QueryInterface(IReceiptPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrintJob := IReceiptPrintJob(outPtr)
        }

        return this.__IReceiptPrintJob.MarkFeed(kind)
    }

    /**
     * Adds an instruction to the printer job to cut the specified percentage of the receipt paper.
     * @param {Float} percentage Decimal representation of the percentage of the receipt that the receipt printer should cut.
     * 
     * Many printers with paper cutting capability can perform both full and partial cuts. Some offer gradations of partial cuts, such as a perforated cut and an almost-full cut. Use the following general guidelines:
     * 
     * <table>
     *    <tr><th>Value</th><th>Meaning</th></tr>
     *    <tr><td>1.0</td><td>Fully cuts the paper.</td></tr>
     *    <tr><td>0.9</td><td>Leaves only a small part of paper for very easy final separation.</td></tr>
     *    <tr><td>0.7</td><td>Perforates the paper for final separation that is somewhat more difficult and unlikely to occur by accidental handling.</td></tr>
     *    <tr><td>0.5</td><td>Partial perforation of the paper.</td></tr>
     * </table>
     * 
     * Printer capabilities vary, so the actual result can be device-dependent.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.cutpaper
     */
    CutPaper(percentage) {
        if (!this.HasProp("__IReceiptPrintJob")) {
            if ((queryResult := this.QueryInterface(IReceiptPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrintJob := IReceiptPrintJob(outPtr)
        }

        return this.__IReceiptPrintJob.CutPaper(percentage)
    }

    /**
     * Adds an instruction to the printer job to cut the receipt paper completely.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.cutpaper
     */
    CutPaperDefault() {
        if (!this.HasProp("__IReceiptPrintJob")) {
            if ((queryResult := this.QueryInterface(IReceiptPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrintJob := IReceiptPrintJob(outPtr)
        }

        return this.__IReceiptPrintJob.CutPaperDefault()
    }

    /**
     * Adds an instruction to the print job to stamp on the receipt printer station.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.stamppaper
     */
    StampPaper() {
        if (!this.HasProp("__IReceiptPrintJob2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrintJob2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrintJob2 := IReceiptPrintJob2(outPtr)
        }

        return this.__IReceiptPrintJob2.StampPaper()
    }

    /**
     * Adds an instruction to the print job to print the specified text and options on the receipt printer station.
     * @param {HSTRING} data The text to print on the receipt printer.
     * @param {PosPrinterPrintOptions} printOptions The print options of the text to print on the receipt printer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.print
     */
    Print(data, printOptions) {
        if (!this.HasProp("__IReceiptPrintJob2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrintJob2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrintJob2 := IReceiptPrintJob2(outPtr)
        }

        return this.__IReceiptPrintJob2.Print(data, printOptions)
    }

    /**
     * Adds an instruction to the print job to feed paper by line on the receipt printer station.
     * @param {Integer} lineCount The number of lines to feed on the receipt printer. Use a positive number to feed paper forward or a negative number to feed paper backward.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.feedpaperbyline
     */
    FeedPaperByLine(lineCount) {
        if (!this.HasProp("__IReceiptPrintJob2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrintJob2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrintJob2 := IReceiptPrintJob2(outPtr)
        }

        return this.__IReceiptPrintJob2.FeedPaperByLine(lineCount)
    }

    /**
     * Adds an instruction to the print job to feed paper by map mode unit on the receipt printer station.
     * @param {Integer} distance The number of map mode units to feed on the receipt printer. Use a positive number to feed paper forward or a negative number to feed paper backward.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.feedpaperbymapmodeunit
     */
    FeedPaperByMapModeUnit(distance) {
        if (!this.HasProp("__IReceiptPrintJob2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrintJob2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrintJob2 := IReceiptPrintJob2(outPtr)
        }

        return this.__IReceiptPrintJob2.FeedPaperByMapModeUnit(distance)
    }

    /**
     * Sets the rotation of the barcode on the page on the receipt printer station.
     * @param {Integer} value The rotation of the barcode on the page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.setbarcoderotation
     */
    SetBarcodeRotation(value) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.SetBarcodeRotation(value)
    }

    /**
     * Sets the rotation of the text or image on the page for the receipt printer station.
     * @remarks
     * This rotation setting persists beyond the current print job.
     * @param {Integer} value The rotation of the text or image on the page for the receipt printer station.
     * @param {Boolean} includeBitmaps Whether bitmaps should also be rotated. This setting takes effect only for subsequent calls to [PrintBitmap](/uwp/api/windows.devices.pointofservice.receiptprintjob.printbitmap), and may not apply to saved bitmaps that you print using [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.setprintrotation
     */
    SetPrintRotation(value, includeBitmaps) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.SetPrintRotation(value, includeBitmaps)
    }

    /**
     * Sets the area of the page on which the receipt printer station can print the job.
     * @remarks
     * When you call this method for a print job, all instructions in the print job run within the specified print area, including the instructions that you added to the job before you called ReceiptPrintJob.SetPrintArea.
     * @param {RECT} value The area of the page on which the receipt printer can print the job.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.setprintarea
     */
    SetPrintArea(value) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.SetPrintArea(value)
    }

    /**
     * Saves information about a bitmap and a standard horizontal placement that you want to use to print that bitmap on the receipt printer station, so that you can use the [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @remarks
     * If the printer for the print job has non-volatile bitmap storage, this method saves the bitmap to the printer hardware, which can cause wear and damage to the flash storage for the printer.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.setbitmap
     */
    SetBitmap(bitmapNumber, bitmap_, alignment) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.SetBitmap(bitmapNumber, bitmap_, alignment)
    }

    /**
     * Saves information about a bitmap, along with the width and a standard horizontal placement that you want to use to print that bitmap on the receipt printer station, so that you can use the [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @remarks
     * If the printer for the print job has non-volatile bitmap storage, this method saves the bitmap to the printer hardware, which can cause wear and damage to the flash storage for the printer.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.setbitmap
     */
    SetBitmapCustomWidthStandardAlign(bitmapNumber, bitmap_, alignment, width) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.SetBitmapCustomWidthStandardAlign(bitmapNumber, bitmap_, alignment, width)
    }

    /**
     * Saves information about a bitmap and the distance from the leftmost print column at which you want to print that bitmap on the receipt printer station, so that you can use the [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.setcustomalignedbitmap
     */
    SetCustomAlignedBitmap(bitmapNumber, bitmap_, alignmentDistance) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.SetCustomAlignedBitmap(bitmapNumber, bitmap_, alignmentDistance)
    }

    /**
     * Saves information about a bitmap, along with the width and the distance from the leftmost print column that you want to use to print that bitmap on the receipt printer station, so that you can use the [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](receiptprintjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.setcustomalignedbitmap
     */
    SetBitmapCustomWidthCustomAlign(bitmapNumber, bitmap_, alignmentDistance, width) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.SetBitmapCustomWidthCustomAlign(bitmapNumber, bitmap_, alignmentDistance, width)
    }

    /**
     * Adds an instruction to the print job to print a bitmap on the receipt printer station by using the bitmap and information saved to the printer via [SetBitmap](/uwp/api/windows.devices.pointofservice.receiptprintjob.setbitmap) or [SetCustomAlignedBitmap](/uwp/api/windows.devices.pointofservice.receiptprintjob.setcustomalignedbitmap).
     * @remarks
     * The bitmap rotation setting that you specify by calling [ReceiptPrintJob.SetPrintRotation](receiptprintjob_setprintrotation_513865495.md) may not apply to bitmaps that you saved to the printer.
     * @param {Integer} bitmapNumber The number that you assigned to the bitmap that you want to print when you called [SetBitmap](/uwp/api/windows.devices.pointofservice.receiptprintjob.setbitmap) or [SetCustomAlignedBitmap](/uwp/api/windows.devices.pointofservice.receiptprintjob.setcustomalignedbitmap).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printsavedbitmap
     */
    PrintSavedBitmap(bitmapNumber) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.PrintSavedBitmap(bitmapNumber)
    }

    /**
     * Adds an instruction to the print job to print a drawn, ruled line on the paper of the receipt printer station.
     * @remarks
     * The *positionList* argument varies depending on whether a horizontal or vertical ruled line is being drawn.
     * 
     * For horizontal ruled lines, *positionList* consists of comma delimited numbers (units of measure are defined by the **MapMode** property),  which denote the starting position and length of each line. Each pair is followed by a semicolon if multiple ruled lines are specified. The pattern is repeated for all additional horizontal ruled lines. Consider this example:
     * 
     * ```csharp
     * positionList = "0,500"
     * ```
     * 
     * This *positionList* would result in a ruled line starting at MapMode unit position "0" continuing for 500 MapMode units of length. Here is another example demonstrating multiple horizontal lines:
     * 
     * ```csharp
     * positionList = "0,200;300,100"
     * ```
     * 
     * This *positionList* would result in a ruled line starting at unit position "0" and continuing for 200 units in length. Then, another line would begin at position 300 and continue for 100 units in length.
     * 
     * For vertical ruled lines, *positionList* consists of comma delimited numbers (units of measure are defined by the **MapMode** property) which denote the positions for the vertical drawn rules line(s). A continue vertical ruled line will be drawn from each position for the print lines that follow, until the vertical rules lines are changed or terminated by a call to **DrawRuledLine** or a ruled line escape sequence. An empty string in the *positionLine* argument causes the vertical ruled lines to be terminated. Consider this example:
     * 
     * ```csharp
     * positionList = "0,100,400,500"
     * ```
     * 
     * This *positionList* results in four drawn ruled lines starting at unit positions "0", "100", "400", and "500" when each line of data is printed.
     * @param {HSTRING} positionList The position parameters for the ruled line. The character string for *positionList* differs depending on whether *lineDirection* specifies a horizontal ruled line or a vertical ruled line (see remarks).
     * @param {Integer} lineDirection The direction in which to print the ruled line.
     * @param {Integer} lineWidth The width of the ruled line that the print should print. The unit of width is dot. If an unsupported value is specified, the best fit value for the printer is used.
     * @param {Integer} lineStyle The appearance of the ruled line, such as whether it is solid or broken, or single or double.
     * @param {Integer} lineColor The color of the ruled line, as an integer value that is equal to the value of the cartridge constant used in the [ClaimedReceiptPrinter.ColorCartridge](claimedreceiptprinter_colorcartridge.md) property. If an unsupported value is specified, the printing results may be unpredictable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.drawruledline
     */
    DrawRuledLine(positionList, lineDirection, lineWidth, lineStyle, lineColor) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.DrawRuledLine(positionList, lineDirection, lineWidth, lineStyle, lineColor)
    }

    /**
     * Adds an instruction to the print job to print a barcode with the specified data and symbology on the receipt printer station.
     * @param {HSTRING} data The data to be represented as a barcode.
     * @param {Integer} symbology The symbology (encoding) of the barcode. This can be determined based on the [BarcodeSymbologies](barcodesymbologies.md) class static methods.
     * @param {Integer} height The height of the barcode, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @param {Integer} width The width of the barcode.
     * 
     * This value is interpreted in one of two ways:
     * 
     * The width of the entire barcode, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * 
     * 
     * or, (though we discourage using this method) if the value is less than or equal to 6, it is interprested as described below:
     * 
     * ESC/POS control language is used for most Windows POS device communication, and ESC/POS only accepts integers from 2 to 6. Each value contains a matched measurement for the thin and thick elements of a barcode. In order for a barcode to be read properly, the width of the lines is crucial, especially when scaling. Additionally, the minimum width capability varies by printer model.
     * 
     * Actual sizes are dependent on the capabilities of the target printer, but approximate sizes for accepted values are:<table>
     *    <tr><th>Width Value</th><th>Thin Element</th><th>Thick Element</th></tr>
     *    <tr><td>2</td><td>0.250 - 0.282 mm</td><td>0.625 - 0.706 mm</td></tr>
     *    <tr><td>3</td><td>0.375 - 0.423 mm</td><td>1.000 - 1.129 mm</td></tr>
     *    <tr><td>4</td><td>0.500 - 0.564 mm</td><td>1.250 - 1.411 mm</td></tr>
     *    <tr><td>5</td><td>0.625 - 0.706 mm</td><td>1.625 - 1.834 mm</td></tr>
     *    <tr><td>6</td><td>0.750 - 0.847 mm</td><td>2.000 - 2.258 mm</td></tr>
     * </table>
     * 
     * See the remarks in [POS Printer](posprinter.md) for more information on ESC/POS.
     * @param {Integer} textPosition The vertical position of the barcode text relative to the barcode.
     * @param {Integer} alignment The horizontal alignment of the barcode on the page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printbarcode
     */
    PrintBarcode(data, symbology, height, width, textPosition, alignment) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.PrintBarcode(data, symbology, height, width, textPosition, alignment)
    }

    /**
     * Adds an instruction to the print job to print a barcode with the specified data, symbology, and custom alignment on the receipt printer station.
     * @param {HSTRING} data The data to be represented as a barcode.
     * @param {Integer} symbology The symbology (encoding) of the barcode.
     * @param {Integer} height The height of the barcode, in pixels.
     * @param {Integer} width The width of the barcode, in pixels.
     * @param {Integer} textPosition The vertical position of the barcode text relative to the barcode.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the barcode, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printbarcodecustomalign
     */
    PrintBarcodeCustomAlign(data, symbology, height, width, textPosition, alignmentDistance) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.PrintBarcodeCustomAlign(data, symbology, height, width, textPosition, alignmentDistance)
    }

    /**
     * Adds an instruction to the print job to print the specified bitmap with the specified standard horizontal placement on the receipt printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printbitmap
     */
    PrintBitmap(bitmap_, alignment) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.PrintBitmap(bitmap_, alignment)
    }

    /**
     * Adds an instruction to the print job to print the specified bitmap with the specified width and a standard horizontal placement on the receipt printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printbitmap
     */
    PrintBitmapCustomWidthStandardAlign(bitmap_, alignment, width) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.PrintBitmapCustomWidthStandardAlign(bitmap_, alignment, width)
    }

    /**
     * Adds an instruction to the print job to print the specified bitmap at the specified distance from the leftmost print column on the receipt printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printcustomalignedbitmap
     */
    PrintCustomAlignedBitmap(bitmap_, alignmentDistance) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.PrintCustomAlignedBitmap(bitmap_, alignmentDistance)
    }

    /**
     * Adds an instruction to the print job to print the specified bitmap with the specified width and at the specified distance from the leftmost print column on the receipt printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPriinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printcustomalignedbitmap
     */
    PrintBitmapCustomWidthCustomAlign(bitmap_, alignmentDistance, width) {
        if (!this.HasProp("__IReceiptOrSlipJob")) {
            if ((queryResult := this.QueryInterface(IReceiptOrSlipJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptOrSlipJob := IReceiptOrSlipJob(outPtr)
        }

        return this.__IReceiptOrSlipJob.PrintBitmapCustomWidthCustomAlign(bitmap_, alignmentDistance, width)
    }

    /**
     * Adds an instruction to the print job to print the specified text on the receipt printer station.
     * @remarks
     * If [ClaimedPosPrinter.IsCharacterSetMappingEnabled](claimedposprinter_ischaractersetmappingenabled.md) is true, the text is mapped to the font on the printer that [ClaimedPosPrinter.CharacterSet](claimedposprinter_characterset.md) specifies. If [ClaimedPosPrinter.IsCharacterSetMappingEnabled](claimedposprinter_ischaractersetmappingenabled.md) is false, the driver or provider sends the low byte of each Unicode character to the printer verbatim.
     * @param {HSTRING} data The text to print on the receipt printer station.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.print
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
     * Adds an instruction to the print job to print a line of text on the receipt printer station.
     * @param {HSTRING} data The line of text to print.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printline
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
     * Adds an instruction to the print job to print a newline character on the receipt printer station.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.printline
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
     * Runs the print job on the receipt printer station asynchronously.
     * @remarks
     * The print job is sent to the claimed printer station object that created the print job.
     * The claimed printer station object must remain valid when calling this method.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintjob.executeasync
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
