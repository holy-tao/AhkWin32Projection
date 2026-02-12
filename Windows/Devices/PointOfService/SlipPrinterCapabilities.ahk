#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISlipPrinterCapabilities.ahk
#Include .\ISlipPrinterCapabilities2.ahk
#Include .\ICommonReceiptSlipCapabilities.ahk
#Include .\ICommonPosPrintStationCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the capabilities of slip station of a point-of-service printer.
 * @remarks
 * To get the capabilities of the slip station of a point-of-service printer, use [PosPrinterCapabilities.Slip](posprintercapabilities_slip.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class SlipPrinterCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISlipPrinterCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISlipPrinterCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the slip printer station can print full-length forms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isfulllengthsupported
     * @type {Boolean} 
     */
    IsFullLengthSupported {
        get => this.get_IsFullLengthSupported()
    }

    /**
     * Gets whether the slip printer station supports printing on both sides of the document.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isbothsidesprintingsupported
     * @type {Boolean} 
     */
    IsBothSidesPrintingSupported {
        get => this.get_IsBothSidesPrintingSupported()
    }

    /**
     * Gets whether the slip printer station can print characters in reverse-video style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isreversevideosupported
     * @type {Boolean} 
     */
    IsReverseVideoSupported {
        get => this.get_IsReverseVideoSupported()
    }

    /**
     * Gets whether the slip printer station can print characters in strikethrough style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isstrikethroughsupported
     * @type {Boolean} 
     */
    IsStrikethroughSupported {
        get => this.get_IsStrikethroughSupported()
    }

    /**
     * Gets whether the slip printer station can print characters in superscript style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.issuperscriptsupported
     * @type {Boolean} 
     */
    IsSuperscriptSupported {
        get => this.get_IsSuperscriptSupported()
    }

    /**
     * Gets whether the slip printer station can print characters in subscript style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.issubscriptsupported
     * @type {Boolean} 
     */
    IsSubscriptSupported {
        get => this.get_IsSubscriptSupported()
    }

    /**
     * Gets whether the slip printer station can reverse paper feed by line.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isreversepaperfeedbylinesupported
     * @type {Boolean} 
     */
    IsReversePaperFeedByLineSupported {
        get => this.get_IsReversePaperFeedByLineSupported()
    }

    /**
     * Gets whether the slip printer station can reverse paper feed by map mode unit.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isreversepaperfeedbymapmodeunitsupported
     * @type {Boolean} 
     */
    IsReversePaperFeedByMapModeUnitSupported {
        get => this.get_IsReversePaperFeedByMapModeUnitSupported()
    }

    /**
     * Gets whether the slip printer station can print barcodes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isbarcodesupported
     * @type {Boolean} 
     */
    IsBarcodeSupported {
        get => this.get_IsBarcodeSupported()
    }

    /**
     * Gets whether the slip printer station can print bitmaps.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isbitmapsupported
     * @type {Boolean} 
     */
    IsBitmapSupported {
        get => this.get_IsBitmapSupported()
    }

    /**
     * Gets whether the slip printer station can print information rotated 90 degrees to the left.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isleft90rotationsupported
     * @type {Boolean} 
     */
    IsLeft90RotationSupported {
        get => this.get_IsLeft90RotationSupported()
    }

    /**
     * Gets whether the slip printer station can print information rotated 90 degrees to the right.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isright90rotationsupported
     * @type {Boolean} 
     */
    IsRight90RotationSupported {
        get => this.get_IsRight90RotationSupported()
    }

    /**
     * Gets whether the slip printer station can print in a rotated upside-down mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.is180rotationsupported
     * @type {Boolean} 
     */
    Is180RotationSupported {
        get => this.get_Is180RotationSupported()
    }

    /**
     * Gets whether the slip printer station supports setting a custom size for the area of the page on which the printer station should print.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isprintareasupported
     * @type {Boolean} 
     */
    IsPrintAreaSupported {
        get => this.get_IsPrintAreaSupported()
    }

    /**
     * Gets information about the capabilities of the slip printer station to draw ruled lines.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.ruledlinecapabilities
     * @type {Integer} 
     */
    RuledLineCapabilities {
        get => this.get_RuledLineCapabilities()
    }

    /**
     * Gets a list of the directions in which the slip printer station can rotate a barcode when printing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.supportedbarcoderotations
     * @type {IVectorView<Integer>} 
     */
    SupportedBarcodeRotations {
        get => this.get_SupportedBarcodeRotations()
    }

    /**
     * Gets a list of the directions in which the slip printer station can rotate a bitmap when printing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.supportedbitmaprotations
     * @type {IVectorView<Integer>} 
     */
    SupportedBitmapRotations {
        get => this.get_SupportedBitmapRotations()
    }

    /**
     * Gets whether a point-of-service printer with a station that prints forms such as checks or credit card slips is present.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isprinterpresent
     * @type {Boolean} 
     */
    IsPrinterPresent {
        get => this.get_IsPrinterPresent()
    }

    /**
     * Gets whether the slip printer station can print a dark color plus an alternate color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isdualcolorsupported
     * @type {Boolean} 
     */
    IsDualColorSupported {
        get => this.get_IsDualColorSupported()
    }

    /**
     * Gets the color cartridges that the slip printer station can use to print in color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.colorcartridgecapabilities
     * @type {Integer} 
     */
    ColorCartridgeCapabilities {
        get => this.get_ColorCartridgeCapabilities()
    }

    /**
     * Gets information about the sensors that the slip printer station has available to report the status of the printer station.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.cartridgesensors
     * @type {Integer} 
     */
    CartridgeSensors {
        get => this.get_CartridgeSensors()
    }

    /**
     * Gets whether the slip printer station can print bold characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isboldsupported
     * @type {Boolean} 
     */
    IsBoldSupported {
        get => this.get_IsBoldSupported()
    }

    /**
     * Gets whether the slip printer station can print italic characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isitalicsupported
     * @type {Boolean} 
     */
    IsItalicSupported {
        get => this.get_IsItalicSupported()
    }

    /**
     * Gets whether the slip printer station can underline characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isunderlinesupported
     * @type {Boolean} 
     */
    IsUnderlineSupported {
        get => this.get_IsUnderlineSupported()
    }

    /**
     * Gets whether the slip printer station can print double-high characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isdoublehighprintsupported
     * @type {Boolean} 
     */
    IsDoubleHighPrintSupported {
        get => this.get_IsDoubleHighPrintSupported()
    }

    /**
     * Gets whether the slip printer station can print double-wide characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isdoublewideprintsupported
     * @type {Boolean} 
     */
    IsDoubleWidePrintSupported {
        get => this.get_IsDoubleWidePrintSupported()
    }

    /**
     * Gets whether the slip printer station can print characters that are both double-high and double-wide.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.isdoublehighdoublewideprintsupported
     * @type {Boolean} 
     */
    IsDoubleHighDoubleWidePrintSupported {
        get => this.get_IsDoubleHighDoubleWidePrintSupported()
    }

    /**
     * Gets whether the slip printer station has an out-of-paper sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.ispaperemptysensorsupported
     * @type {Boolean} 
     */
    IsPaperEmptySensorSupported {
        get => this.get_IsPaperEmptySensorSupported()
    }

    /**
     * Gets whether the slip printer station has a low-paper sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.ispapernearendsensorsupported
     * @type {Boolean} 
     */
    IsPaperNearEndSensorSupported {
        get => this.get_IsPaperNearEndSensorSupported()
    }

    /**
     * Gets a collection of the line widths in characters per line that the slip printer station supports.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.slipprintercapabilities.supportedcharactersperline
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
    get_IsFullLengthSupported() {
        if (!this.HasProp("__ISlipPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(ISlipPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrinterCapabilities := ISlipPrinterCapabilities(outPtr)
        }

        return this.__ISlipPrinterCapabilities.get_IsFullLengthSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBothSidesPrintingSupported() {
        if (!this.HasProp("__ISlipPrinterCapabilities")) {
            if ((queryResult := this.QueryInterface(ISlipPrinterCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrinterCapabilities := ISlipPrinterCapabilities(outPtr)
        }

        return this.__ISlipPrinterCapabilities.get_IsBothSidesPrintingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReverseVideoSupported() {
        if (!this.HasProp("__ISlipPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(ISlipPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrinterCapabilities2 := ISlipPrinterCapabilities2(outPtr)
        }

        return this.__ISlipPrinterCapabilities2.get_IsReverseVideoSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStrikethroughSupported() {
        if (!this.HasProp("__ISlipPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(ISlipPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrinterCapabilities2 := ISlipPrinterCapabilities2(outPtr)
        }

        return this.__ISlipPrinterCapabilities2.get_IsStrikethroughSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuperscriptSupported() {
        if (!this.HasProp("__ISlipPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(ISlipPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrinterCapabilities2 := ISlipPrinterCapabilities2(outPtr)
        }

        return this.__ISlipPrinterCapabilities2.get_IsSuperscriptSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSubscriptSupported() {
        if (!this.HasProp("__ISlipPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(ISlipPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrinterCapabilities2 := ISlipPrinterCapabilities2(outPtr)
        }

        return this.__ISlipPrinterCapabilities2.get_IsSubscriptSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReversePaperFeedByLineSupported() {
        if (!this.HasProp("__ISlipPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(ISlipPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrinterCapabilities2 := ISlipPrinterCapabilities2(outPtr)
        }

        return this.__ISlipPrinterCapabilities2.get_IsReversePaperFeedByLineSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReversePaperFeedByMapModeUnitSupported() {
        if (!this.HasProp("__ISlipPrinterCapabilities2")) {
            if ((queryResult := this.QueryInterface(ISlipPrinterCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlipPrinterCapabilities2 := ISlipPrinterCapabilities2(outPtr)
        }

        return this.__ISlipPrinterCapabilities2.get_IsReversePaperFeedByMapModeUnitSupported()
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
