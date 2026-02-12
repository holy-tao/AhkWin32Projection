#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISlipPrintJob.ahk
#Include .\IReceiptOrSlipJob.ahk
#Include .\IPosPrinterJob.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of printing instructions that you want to run on the slip printer station.
 * @remarks
 * To create a new print job for the slip printer, call [ClaimedSlipPrinter.CreateJob](claimedslipprinter_createjob_1417454808.md).
 * The created print job object is valid as long as the ClaimedSlipPrinter object that created it is valid.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class SlipPrintJob extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISlipPrintJob

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISlipPrintJob.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Adds an instruction to the print job to print the specified text and options on the slip printer station.
     * @param {HSTRING} data The text to print on the slip printer.
     * @param {PosPrinterPrintOptions} printOptions The print options of the text to print on the slip printer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.print
     */
    Print(data, printOptions) {
        if (!this.HasProp("__ISlipPrintJob")) {
            if ((queryResult := this.QueryInterface(ISlipPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrintJob := ISlipPrintJob(outPtr)
        }

        return this.__ISlipPrintJob.Print(data, printOptions)
    }

    /**
     * Adds an instruction to the print job to feed paper by line on the slip printer station.
     * @param {Integer} lineCount The number of lines to feed on the slip printer. Use a positive number to feed paper forward or a negative number to feed paper backward.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.feedpaperbyline
     */
    FeedPaperByLine(lineCount) {
        if (!this.HasProp("__ISlipPrintJob")) {
            if ((queryResult := this.QueryInterface(ISlipPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrintJob := ISlipPrintJob(outPtr)
        }

        return this.__ISlipPrintJob.FeedPaperByLine(lineCount)
    }

    /**
     * Adds an instruction to the print job to feed paper by map mode unit on the slip printer station.
     * @param {Integer} distance The number of map mode units to feed on the slip printer. Use a positive number to feed paper forward or a negative number to feed paper backward.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.feedpaperbymapmodeunit
     */
    FeedPaperByMapModeUnit(distance) {
        if (!this.HasProp("__ISlipPrintJob")) {
            if ((queryResult := this.QueryInterface(ISlipPrintJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrintJob := ISlipPrintJob(outPtr)
        }

        return this.__ISlipPrintJob.FeedPaperByMapModeUnit(distance)
    }

    /**
     * Sets the rotation of the barcode on the page on the slip printer station.
     * @param {Integer} value The rotation of the barcode on the page on the slip printer station.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.setbarcoderotation
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
     * Sets the rotation of the text or image on the page on the slip printer station.
     * @remarks
     * This rotation setting persists beyond the current print job.
     * @param {Integer} value The rotation of the text or image on the page.
     * @param {Boolean} includeBitmaps Whether bitmaps should also be rotated. This setting takes effect only for subsequent calls to [PrintBitmap](/uwp/api/windows.devices.pointofservice.slipprintjob.printbitmap), and may not apply to saved bitmaps that you print using [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.setprintrotation
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
     * Sets the area of the page on which the slip printer station can print the job.
     * @remarks
     * When you call this method for a print job, all instructions in the print job run within the specified print area, including the instructions that you added to the job before you called SlipPrintJob.SetPrintArea.
     * @param {RECT} value The area of the page on which the slip printer station can print the job.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.setprintarea
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
     * Saves information about a bitmap and a standard horizontal placement that you want to use to print that bitmap on the slip printer station, so that you can use the [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @remarks
     * If the printer for the print job has non-volatile bitmap storage, this method saves the bitmap to the printer hardware, which can cause wear and damage to the flash storage for the printer.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.setbitmap
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
     * Saves information about a bitmap, along with the width and a standard horizontal placement that you want to use to print that bitmap on the slip printer station, so that you can use the [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @remarks
     * If the printer for the print job has non-volatile bitmap storage, this method saves the bitmap to the printer hardware, which can cause wear and damage to the flash storage for the printer.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.setbitmap
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
     * Saves information about a bitmap and the distance from the leftmost print column at which you want to print that bitmap on the slip printer station, so that you can use the [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.setcustomalignedbitmap
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
     * Saves information about a bitmap, along with the width and the distance from the leftmost print column that you want to use to print that bitmap on the slip printer station, so that you can use the [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](slipprintjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.setcustomalignedbitmap
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
     * Adds an instruction to the print job to print a bitmap on the slip printer station by using the information that you saved about the bitmap and how to print it when you called the [SetBitmap](/uwp/api/windows.devices.pointofservice.slipprintjob.setbitmap) or [SetCustomAlignedBitmap](/uwp/api/windows.devices.pointofservice.slipprintjob.setcustomalignedbitmap) method.
     * @remarks
     * The bitmap rotation setting that you specify by calling [SlipPrintJob.SetPrintRotation](slipprintjob_setprintrotation_513865495.md) may not apply to bitmaps that you saved to the printer.
     * @param {Integer} bitmapNumber The number that you assigned to the bitmap that you want to print when you called [SetBitmap](/uwp/api/windows.devices.pointofservice.slipprintjob.setbitmap) or [SetCustomAlignedBitmap](/uwp/api/windows.devices.pointofservice.slipprintjob.setcustomalignedbitmap).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printsavedbitmap
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
     * Adds an instruction to the print job to print a drawn, ruled line on the paper of the slip printer station.
     * @param {HSTRING} positionList The position parameters for the ruled line. The character string for *positionList* differs depending on whether *lineDirection* specifies a horizontal ruled line or a vertical ruled line.
     * @param {Integer} lineDirection The direction in which to print the ruled line.
     * @param {Integer} lineWidth The width of the ruled line that the print should print. The unit of width is dot. If an unsupported value is specified, the best fit value for the printer is used.
     * @param {Integer} lineStyle The appearance of the ruled line, such as whether it is solid or broken, or single or double.
     * @param {Integer} lineColor The color of the ruled line, as an integer value that is equal to the value of the cartridge constant used in the [ClaimedSlipPrinter.ColorCartridge](claimedslipprinter_colorcartridge.md) property. If an unsupported value is specified, the printing results may be unpredictable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.drawruledline
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
     * Adds an instruction to the print job to print a barcode on the slip printer station with the specified data and symbology.
     * @param {HSTRING} data The data to represent as a barcode.
     * @param {Integer} symbology The symbology (encoding) of the barcode.
     * @param {Integer} height The height of the barcode, in pixels.
     * @param {Integer} width The width of the barcode, in pixels.
     * @param {Integer} textPosition The vertical position of the barcode text relative to the barcode.
     * @param {Integer} alignment The horizontal alignment of the barcode on the page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printbarcode
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
     * Adds an instruction to the print job to print a barcode on the slip printer station with the specified data, symbology, and custom alignment.
     * @param {HSTRING} data The data to represent as a barcode.
     * @param {Integer} symbology The symbology (encoding) of the barcode.
     * @param {Integer} height The height of the barcode, in pixels.
     * @param {Integer} width The width of the barcode, in pixels.
     * @param {Integer} textPosition The vertical position of the barcode text relative to the barcode.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the barcode, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printbarcodecustomalign
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
     * Adds an instruction to the print job to print the specified bitmap with the specified standard horizontal placement on the slip printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printbitmap
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
     * Adds an instruction to the print job to print the specified bitmap with the specified width and a standard horizontal placement on the slip printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printbitmap
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
     * Adds an instruction to the print job to print the specified bitmap at the specified distance from the leftmost print column on the slip printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printcustomalignedbitmap
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
     * Adds an instruction to the print job to print the specified bitmap with the specified width and at the specified distance from the leftmost print column on the slip printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printcustomalignedbitmap
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
     * Adds an instruction to the print job to print the specified text on the slip printer station.
     * @remarks
     * If [ClaimedPosPrinter.IsCharacterSetMappingEnabled](claimedposprinter_ischaractersetmappingenabled.md) is true, the text is mapped to the font on the printer that [ClaimedPosPrinter.CharacterSet](claimedposprinter_characterset.md) specifies. If [ClaimedPosPrinter.IsCharacterSetMappingEnabled](claimedposprinter_ischaractersetmappingenabled.md) is false, the driver or provider sends the low byte of each Unicode character to the printer verbatim.
     * @param {HSTRING} data The text to print on the slip printer station.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.print
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
     * Adds an instruction to the print job to print a line of text on the slip printer station.
     * @param {HSTRING} data The line of text to print.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printline
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
     * Adds an instruction to the print job to print a newline character on the slip printer station.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.printline
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
     * Runs the print job on the slip printer station asynchronously.
     * @remarks
     * The print job is sent to the claimed printer station object that created the print job.
     * The claimed printer station object must remain valid when calling this method.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintjob.executeasync
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
