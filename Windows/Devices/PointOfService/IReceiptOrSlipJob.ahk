#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to jobs for receipt and slip printer stations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IReceiptOrSlipJob extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReceiptOrSlipJob
     * @type {Guid}
     */
    static IID => Guid("{532199be-c8c3-4dc2-89e9-5c4a37b34ddc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBarcodeRotation", "SetPrintRotation", "SetPrintArea", "SetBitmap", "SetBitmapCustomWidthStandardAlign", "SetCustomAlignedBitmap", "SetBitmapCustomWidthCustomAlign", "PrintSavedBitmap", "DrawRuledLine", "PrintBarcode", "PrintBarcodeCustomAlign", "PrintBitmap", "PrintBitmapCustomWidthStandardAlign", "PrintCustomAlignedBitmap", "PrintBitmapCustomWidthCustomAlign"]

    /**
     * Sets the rotation of the barcode on the page for the receipt or slip printer station.
     * @param {Integer} value The rotation of the barcode on the page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setbarcoderotation
     */
    SetBarcodeRotation(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the rotation of the text or image on the page for the receipt or slip printer station.
     * @remarks
     * This rotation setting persists beyond the current print job.
     * @param {Integer} value The rotation of the text or image on the page.
     * @param {Boolean} includeBitmaps Whether bitmaps should be rotated as well. This setting takes effect only for subsequent calls to [PrintBitmap](/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.printbitmap), and may not apply to saved bitmaps that you print using [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setprintrotation
     */
    SetPrintRotation(value, includeBitmaps) {
        result := ComCall(7, this, "int", value, "int", includeBitmaps, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the area of the page on which the receipt or slip printer station can print the job.
     * @remarks
     * When you call this method for a print job, all instructions in the print job run within the specified print area, including the instructions that you added to the job before you called IReceiptOrSlipJob.SetPrintArea.
     * @param {RECT} value The area of the page on which the receipt or slip printer station can print the job.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setprintarea
     */
    SetPrintArea(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves information about a bitmap and a standard horizontal placement that you want to use to print that bitmap on the receipt or slip printer station, so that you can use the [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @remarks
     * If the printer for the print job has non-volatile bitmap storage, this method saves the bitmap to the printer hardware, which can cause wear and damage to the flash storage for the printer.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setbitmap
     */
    SetBitmap(bitmapNumber, bitmap_, alignment) {
        result := ComCall(9, this, "uint", bitmapNumber, "ptr", bitmap_, "int", alignment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves information about a bitmap, along with the width and a standard horizontal placement that you want to use to print that bitmap on the receipt or slip printer station, so that you can use the [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @remarks
     * If the printer for the print job has non-volatile bitmap storage, this method saves the bitmap to the printer hardware, which can cause wear and damage to the flash storage for the printer.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setbitmap
     */
    SetBitmapCustomWidthStandardAlign(bitmapNumber, bitmap_, alignment, width) {
        result := ComCall(10, this, "uint", bitmapNumber, "ptr", bitmap_, "int", alignment, "uint", width, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves information about a bitmap and the distance from the leftmost print column at which you want to print that bitmap on the receipt or slip printer station, so that you can use the [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setcustomalignedbitmap
     */
    SetCustomAlignedBitmap(bitmapNumber, bitmap_, alignmentDistance) {
        result := ComCall(11, this, "uint", bitmapNumber, "ptr", bitmap_, "uint", alignmentDistance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves information about a bitmap, along with the width and the distance from the leftmost print column that you want to use to print that bitmap on the receipt or slip printer station, so that you can use the [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md) method to add that information to the print job later.
     * @param {Integer} bitmapNumber The number that you want to assign to this bitmap. You can set two bitmaps, numbered 1 and 2. Use this number with the [PrintSavedBitmap](ireceiptorslipjob_printsavedbitmap_1902948304.md) method later to add the print instructions to the print job.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setcustomalignedbitmap
     */
    SetBitmapCustomWidthCustomAlign(bitmapNumber, bitmap_, alignmentDistance, width) {
        result := ComCall(12, this, "uint", bitmapNumber, "ptr", bitmap_, "uint", alignmentDistance, "uint", width, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print a bitmap on the receipt or slip printer station by using the information that you saved about the bitmap and how to print it when you called the [SetBitmap](/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setbitmap) or [SetCustomAlignedBitmap](/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setcustomalignedbitmap) method.
     * @remarks
     * The bitmap rotation setting that you specify by calling [IReceiptOrSlipJob.SetPrintRotation](ireceiptorslipjob_setprintrotation_513865495.md) may not apply to bitmaps that you saved to the printer.
     * @param {Integer} bitmapNumber The number that you assigned to the bitmap that you want to print when you called [SetBitmap](/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setbitmap) or [SetCustomAlignedBitmap](/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.setcustomalignedbitmap).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.printsavedbitmap
     */
    PrintSavedBitmap(bitmapNumber) {
        result := ComCall(13, this, "uint", bitmapNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print a drawn, ruled line on the paper of the receipt or slip printer station.
     * @param {HSTRING} positionList The position parameters for the ruled line. The character string for *positionList* differs depending on whether *lineDirection* specifies a horizontal ruled line or a vertical ruled line.
     * @param {Integer} lineDirection The direction in which to print the ruled line.
     * @param {Integer} lineWidth The width of the ruled line that the printer station should print. The unit of width is dot. If an unsupported value is specified, the best fit value for the printer station is used.
     * @param {Integer} lineStyle The appearance of the ruled line, such as whether it is solid or broken, or single or double.
     * @param {Integer} lineColor The color of the ruled line, as an integer value that is equal to the value of the cartridge constant used in the [ICommonClaimedPosPrinterStation.ColorCartridge](claimedjournalprinter_colorcartridge.md) property. If an unsupported value is specified, the printing results may be unpredictable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.drawruledline
     */
    DrawRuledLine(positionList, lineDirection, lineWidth, lineStyle, lineColor) {
        if(positionList is String) {
            pin := HSTRING.Create(positionList)
            positionList := pin.Value
        }
        positionList := positionList is Win32Handle ? NumGet(positionList, "ptr") : positionList

        result := ComCall(14, this, "ptr", positionList, "int", lineDirection, "uint", lineWidth, "int", lineStyle, "uint", lineColor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print a barcode on the receipt or slip printer station with the specified data and symbology.
     * @param {HSTRING} data The data to represent as a barcode.
     * @param {Integer} symbology The symbology (encoding) of the barcode.
     * @param {Integer} height The height of the barcode, in pixels.
     * @param {Integer} width The width of the barcode, in pixels.
     * @param {Integer} textPosition The vertical position of the barcode text relative to the barcode.
     * @param {Integer} alignment The horizontal alignment of the barcode on the page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.printbarcode
     */
    PrintBarcode(data, symbology, height, width, textPosition, alignment) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(15, this, "ptr", data, "uint", symbology, "uint", height, "uint", width, "int", textPosition, "int", alignment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print a barcode on a receipt or slip printer station with the specified data, symbology, and custom alignment.
     * @param {HSTRING} data The data to represent as a barcode.
     * @param {Integer} symbology The symbology (encoding) of the barcode.
     * @param {Integer} height The height of the barcode, in pixels.
     * @param {Integer} width The width of the barcode, in pixels.
     * @param {Integer} textPosition The vertical position of the barcode text relative to the barcode.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the barcode, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.printbarcodecustomalign
     */
    PrintBarcodeCustomAlign(data, symbology, height, width, textPosition, alignmentDistance) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(16, this, "ptr", data, "uint", symbology, "uint", height, "uint", width, "int", textPosition, "uint", alignmentDistance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print the specified bitmap with the specified standard horizontal placement on the receipt or slip printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.printbitmap
     */
    PrintBitmap(bitmap_, alignment) {
        result := ComCall(17, this, "ptr", bitmap_, "int", alignment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print the specified bitmap with the specified width and a standard horizontal placement on the receipt or slip printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignment An enumeration value that specifies a standard horizontal placement on the page for the bitmap, such as left-aligned, centered, or right-aligned.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.printbitmap
     */
    PrintBitmapCustomWidthStandardAlign(bitmap_, alignment, width) {
        result := ComCall(18, this, "ptr", bitmap_, "int", alignment, "uint", width, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print the specified bitmap at the specified distance from the leftmost print column on the receipt or slip printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.printcustomalignedbitmap
     */
    PrintCustomAlignedBitmap(bitmap_, alignmentDistance) {
        result := ComCall(19, this, "ptr", bitmap_, "uint", alignmentDistance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an instruction to the print job to print the specified bitmap with the specified width and at the specified distance from the leftmost print column on the receipt or slip printer station.
     * @param {BitmapFrame} bitmap_ Information about the bitmap that you want to print.
     * @param {Integer} alignmentDistance The distance from the leftmost print column to the start of the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @param {Integer} width The width to use for printing the bitmap, expressed in the unit of measurement indicated by the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.ireceiptorslipjob.printcustomalignedbitmap
     */
    PrintBitmapCustomWidthCustomAlign(bitmap_, alignmentDistance, width) {
        result := ComCall(20, this, "ptr", bitmap_, "uint", alignmentDistance, "uint", width, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
