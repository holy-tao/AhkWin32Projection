#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IReceiptPrinterCapabilities.ahk
#Include .\IReceiptPrinterCapabilities2.ahk
#Include .\ICommonReceiptSlipCapabilities.ahk
#Include .\ICommonPosPrintStationCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the capabilities of receipt station of a point-of-service printer.
 * @remarks
 * To get the capabilities of the receipt station of a point-of-service printer, use [PosPrinterCapabilities.Receipt](posprintercapabilities_receipt.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ReceiptPrinterCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IReceiptPrinterCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IReceiptPrinterCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the receipt printer station can perform paper cuts.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.cancutpaper
     * @type {Boolean} 
     */
    CanCutPaper {
        get => this.get_CanCutPaper()
    }

    /**
     * Gets whether the receipt printer station has a stamp capability.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isstampsupported
     * @type {Boolean} 
     */
    IsStampSupported {
        get => this.get_IsStampSupported()
    }

    /**
     * Gets the type of mark-sensed paper handling that is available for the receipt printer station.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.markfeedcapabilities
     * @type {Integer} 
     */
    MarkFeedCapabilities {
        get => this.get_MarkFeedCapabilities()
    }

    /**
     * Gets whether the receipt printer station can print characters in reverse-video style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isreversevideosupported
     * @type {Boolean} 
     */
    IsReverseVideoSupported {
        get => this.get_IsReverseVideoSupported()
    }

    /**
     * Gets whether the receipt printer station can print characters in strikethrough style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isstrikethroughsupported
     * @type {Boolean} 
     */
    IsStrikethroughSupported {
        get => this.get_IsStrikethroughSupported()
    }

    /**
     * Gets whether the receipt printer station can print characters in superscript style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.issuperscriptsupported
     * @type {Boolean} 
     */
    IsSuperscriptSupported {
        get => this.get_IsSuperscriptSupported()
    }

    /**
     * Gets whether the receipt printer station can print characters in subscript style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.issubscriptsupported
     * @type {Boolean} 
     */
    IsSubscriptSupported {
        get => this.get_IsSubscriptSupported()
    }

    /**
     * Gets whether the receipt printer station can reverse paper feed by line.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isreversepaperfeedbylinesupported
     * @type {Boolean} 
     */
    IsReversePaperFeedByLineSupported {
        get => this.get_IsReversePaperFeedByLineSupported()
    }

    /**
     * Gets whether the receipt printer station can reverse paper feed by map mode unit.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isreversepaperfeedbymapmodeunitsupported
     * @type {Boolean} 
     */
    IsReversePaperFeedByMapModeUnitSupported {
        get => this.get_IsReversePaperFeedByMapModeUnitSupported()
    }

    /**
     * Gets whether the receipt printer station can print barcodes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isbarcodesupported
     * @type {Boolean} 
     */
    IsBarcodeSupported {
        get => this.get_IsBarcodeSupported()
    }

    /**
     * Gets whether the receipt printer station can print bitmaps.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isbitmapsupported
     * @type {Boolean} 
     */
    IsBitmapSupported {
        get => this.get_IsBitmapSupported()
    }

    /**
     * Gets whether the receipt printer station can print information rotated 90 degrees to the left.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isleft90rotationsupported
     * @type {Boolean} 
     */
    IsLeft90RotationSupported {
        get => this.get_IsLeft90RotationSupported()
    }

    /**
     * Gets whether the receipt printer station can print information rotated 90 degrees to the right.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isright90rotationsupported
     * @type {Boolean} 
     */
    IsRight90RotationSupported {
        get => this.get_IsRight90RotationSupported()
    }

    /**
     * Gets whether the receipt printer station can print in a rotated upside-down mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.is180rotationsupported
     * @type {Boolean} 
     */
    Is180RotationSupported {
        get => this.get_Is180RotationSupported()
    }

    /**
     * Gets whether the receipt printer station supports setting a custom size for the area of the page on which the printer should print.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isprintareasupported
     * @type {Boolean} 
     */
    IsPrintAreaSupported {
        get => this.get_IsPrintAreaSupported()
    }

    /**
     * Gets information about the capabilities of the receipt printer station to draw ruled lines.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.ruledlinecapabilities
     * @type {Integer} 
     */
    RuledLineCapabilities {
        get => this.get_RuledLineCapabilities()
    }

    /**
     * Gets a list of the directions in which the receipt printer station can rotate a barcode when printing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.supportedbarcoderotations
     * @type {IVectorView<Integer>} 
     */
    SupportedBarcodeRotations {
        get => this.get_SupportedBarcodeRotations()
    }

    /**
     * Gets a list of the directions in which the receipt printer station can rotate a bitmap when printing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.supportedbitmaprotations
     * @type {IVectorView<Integer>} 
     */
    SupportedBitmapRotations {
        get => this.get_SupportedBitmapRotations()
    }

    /**
     * Gets whether a point-of-service printer with a station that prints receipts is present.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isprinterpresent
     * @type {Boolean} 
     */
    IsPrinterPresent {
        get => this.get_IsPrinterPresent()
    }

    /**
     * Gets whether the receipt printer station can print a dark color plus an alternate color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isdualcolorsupported
     * @type {Boolean} 
     */
    IsDualColorSupported {
        get => this.get_IsDualColorSupported()
    }

    /**
     * Gets the color cartridges that the receipt printer station can use to print in color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.colorcartridgecapabilities
     * @type {Integer} 
     */
    ColorCartridgeCapabilities {
        get => this.get_ColorCartridgeCapabilities()
    }

    /**
     * Gets information about the sensors that the receipt printer station has available to report the status of the printer station.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.cartridgesensors
     * @type {Integer} 
     */
    CartridgeSensors {
        get => this.get_CartridgeSensors()
    }

    /**
     * Gets whether the receipt printer station can print bold characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isboldsupported
     * @type {Boolean} 
     */
    IsBoldSupported {
        get => this.get_IsBoldSupported()
    }

    /**
     * Gets whether the receipt printer station can print italic characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isitalicsupported
     * @type {Boolean} 
     */
    IsItalicSupported {
        get => this.get_IsItalicSupported()
    }

    /**
     * Gets whether the receipt printer station can underline characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isunderlinesupported
     * @type {Boolean} 
     */
    IsUnderlineSupported {
        get => this.get_IsUnderlineSupported()
    }

    /**
     * Gets whether the receipt printer station can print double-high characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isdoublehighprintsupported
     * @type {Boolean} 
     */
    IsDoubleHighPrintSupported {
        get => this.get_IsDoubleHighPrintSupported()
    }

    /**
     * Gets whether the receipt printer station can print double-wide characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isdoublewideprintsupported
     * @type {Boolean} 
     */
    IsDoubleWidePrintSupported {
        get => this.get_IsDoubleWidePrintSupported()
    }

    /**
     * Gets whether the receipt printer station can print characters that are both double-high and double-wide.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.isdoublehighdoublewideprintsupported
     * @type {Boolean} 
     */
    IsDoubleHighDoubleWidePrintSupported {
        get => this.get_IsDoubleHighDoubleWidePrintSupported()
    }

    /**
     * Gets whether the receipt printer station has an out-of-paper sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.ispaperemptysensorsupported
     * @type {Boolean} 
     */
    IsPaperEmptySensorSupported {
        get => this.get_IsPaperEmptySensorSupported()
    }

    /**
     * Gets whether the receipt printer station has a low-paper sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.ispapernearendsensorsupported
     * @type {Boolean} 
     */
    IsPaperNearEndSensorSupported {
        get => this.get_IsPaperNearEndSensorSupported()
    }

    /**
     * Gets a collection of the line widths in characters per line that the receipt printer station supports.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.receiptprintercapabilities.supportedcharactersperline
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
    get_CanCutPaper() {
        if (!this.HasProp("__IReceiptPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities := IReceiptPrinterCapabilities(outPtr)
        }

        return this.__IReceiptPrinterCapabilities.get_CanCutPaper()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStampSupported() {
        if (!this.HasProp("__IReceiptPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities := IReceiptPrinterCapabilities(outPtr)
        }

        return this.__IReceiptPrinterCapabilities.get_IsStampSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MarkFeedCapabilities() {
        if (!this.HasProp("__IReceiptPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities := IReceiptPrinterCapabilities(outPtr)
        }

        return this.__IReceiptPrinterCapabilities.get_MarkFeedCapabilities()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReverseVideoSupported() {
        if (!this.HasProp("__IReceiptPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities2 := IReceiptPrinterCapabilities2(outPtr)
        }

        return this.__IReceiptPrinterCapabilities2.get_IsReverseVideoSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStrikethroughSupported() {
        if (!this.HasProp("__IReceiptPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities2 := IReceiptPrinterCapabilities2(outPtr)
        }

        return this.__IReceiptPrinterCapabilities2.get_IsStrikethroughSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuperscriptSupported() {
        if (!this.HasProp("__IReceiptPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities2 := IReceiptPrinterCapabilities2(outPtr)
        }

        return this.__IReceiptPrinterCapabilities2.get_IsSuperscriptSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSubscriptSupported() {
        if (!this.HasProp("__IReceiptPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities2 := IReceiptPrinterCapabilities2(outPtr)
        }

        return this.__IReceiptPrinterCapabilities2.get_IsSubscriptSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReversePaperFeedByLineSupported() {
        if (!this.HasProp("__IReceiptPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities2 := IReceiptPrinterCapabilities2(outPtr)
        }

        return this.__IReceiptPrinterCapabilities2.get_IsReversePaperFeedByLineSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReversePaperFeedByMapModeUnitSupported() {
        if (!this.HasProp("__IReceiptPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(IReceiptPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReceiptPrinterCapabilities2 := IReceiptPrinterCapabilities2(outPtr)
        }

        return this.__IReceiptPrinterCapabilities2.get_IsReversePaperFeedByMapModeUnitSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBarcodeSupported() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_IsBarcodeSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBitmapSupported() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_IsBitmapSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLeft90RotationSupported() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_IsLeft90RotationSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRight90RotationSupported() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_IsRight90RotationSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Is180RotationSupported() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_Is180RotationSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrintAreaSupported() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_IsPrintAreaSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RuledLineCapabilities() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_RuledLineCapabilities()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedBarcodeRotations() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_SupportedBarcodeRotations()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedBitmapRotations() {
        if (!this.HasProp("__ICommonReceiptSlipCapabilities")) {
            if ((queryResult := this.QueryInterface(ICommonReceiptSlipCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonReceiptSlipCapabilities := ICommonReceiptSlipCapabilities(outPtr)
        }

        return this.__ICommonReceiptSlipCapabilities.get_SupportedBitmapRotations()
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
