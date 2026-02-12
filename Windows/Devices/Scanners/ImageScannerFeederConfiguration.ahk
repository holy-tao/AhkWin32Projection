#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageScannerFormatConfiguration.ahk
#Include .\IImageScannerSourceConfiguration.ahk
#Include .\IImageScannerFeederConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the feeder scan source of the scanner.
 * @remarks
 * This runtime class implements the [IImageScannerFormatConfiguration](iimagescannerformatconfiguration.md), and [IImageScannerSourceConfiguration](iimagescannersourceconfiguration.md) interfaces.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerFeederConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageScannerFormatConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageScannerFormatConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the default file format for the scanner's feeder at the beginning of a new scan session.
     * @remarks
     * All WIA scanner devices support the Windows Device Independent Bitmap (DIB) format.
     * 
     * By default, these values in this order will be selected based on the file formats the device supports, from the smallest file size (in bytes) to the largest size:
     * 
     * 
     * + 1. Jpeg
     * + 2. Png
     * + 3. Bitmap
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.defaultformat
     * @type {Integer} 
     */
    DefaultFormat {
        get => this.get_DefaultFormat()
    }

    /**
     * Gets or sets the current file transfer format for image data acquisition from the scanner's feeder to the client app.
     * @remarks
     * When a new scan session starts, this property is set to the default file format. See the [DefaultFormat](imagescannerfeederconfiguration_defaultformat.md) property on how this is done.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * Gets the minimum scan area in inches. The minimum scan area is the smallest size a document can have in order for a feeder to scan it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.minscanarea
     * @type {SIZE} 
     */
    MinScanArea {
        get => this.get_MinScanArea()
    }

    /**
     * Gets the maximum scan area dimensions in inches. The maximum scan width is the widest a document can be in order for the scanner's feeder to scan it.
     * @remarks
     * For feeder scan sources, there are restrictions for the maximum scan area: 
     * + The currently selected page size, if page size auto-detection is not enabled.
     * + The dimensions of the selected page size, which becomes the new maximum dimensions of the permissible scan area.
     *  These limits are dictated by hardware for feeder, flatbed, and other types of scan sources.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.maxscanarea
     * @type {SIZE} 
     */
    MaxScanArea {
        get => this.get_MaxScanArea()
    }

    /**
     * Gets or sets the origin coordinates (horizontal and vertical) and dimensions (width and height) of the selected scan area, in inches. This property is ignored when the [AutoCroppingMode](imagescannerfeederconfiguration_autocroppingmode.md) property is not **Disabled**.
     * @remarks
     * This table describes the property's restrictions. Default values are set at the beginning of a new scan session.
     * 
     * <table>
     *    <tr><th>Name</th><th>Default value</th><th>Valid flatbed values</th><th>Valid feeder values</th></tr>
     *    <tr><td /><td>0</td><td>between 0 and  - 1</td><td>between 0 and </td></tr>
     *    <tr><td /><td>0</td><td>between 0 and  - 1</td><td>between 0 and </td></tr>
     *    <tr><td /><td /><td>between  and ( – )</td><td>between  and </td></tr>
     *    <tr><td /><td /><td>between  and ( – )</td><td>between  and </td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.selectedscanregion
     * @type {RECT} 
     */
    SelectedScanRegion {
        get => this.get_SelectedScanRegion()
        set => this.put_SelectedScanRegion(value)
    }

    /**
     * Gets or sets the automatic crop mode.
     * @remarks
     * When automatic detection is enabled on the scanner's feeder, the automatic crop mode indicates whether to scan one region or multiple regions. When a new scan session starts, the default value is **Disabled**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.autocroppingmode
     * @type {Integer} 
     */
    AutoCroppingMode {
        get => this.get_AutoCroppingMode()
        set => this.put_AutoCroppingMode(value)
    }

    /**
     * Gets the minimum horizontal and vertical scan resolution of the scanner's feeder in DPI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.minresolution
     * @type {ImageScannerResolution} 
     */
    MinResolution {
        get => this.get_MinResolution()
    }

    /**
     * Gets the maximum horizontal and vertical scan resolution of the scanner's feeder in DPI.
     * @remarks
     * Apps can scan at **MaxResolution** in a small area at the highest possible resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.maxresolution
     * @type {ImageScannerResolution} 
     */
    MaxResolution {
        get => this.get_MaxResolution()
    }

    /**
     * Gets the optical horizontal and vertical scan resolution of the scanner's feeder in DPI.
     * @remarks
     * Apps can scan at **OpticalResolution** for the best quality per pixel that the hardware device is capable of.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.opticalresolution
     * @type {ImageScannerResolution} 
     */
    OpticalResolution {
        get => this.get_OpticalResolution()
    }

    /**
     * Gets or sets the horizontal and vertical scan resolution for the scanner's feeder that the app requests, in DPI.
     * @remarks
     * See **Remarks** for [ImageScannerFlatbedConfiguration.DesiredResolution](imagescannerflatbedconfiguration_desiredresolution.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.desiredresolution
     * @type {ImageScannerResolution} 
     */
    DesiredResolution {
        get => this.get_DesiredResolution()
        set => this.put_DesiredResolution(value)
    }

    /**
     * Gets the actual horizontal and vertical scan resolution for the scanner's feeder, in DPI.
     * @remarks
     * See **Remarks** for [ImageScannerFlatbedConfiguration.ActualResolution](imagescannerflatbedconfiguration_actualresolution.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.actualresolution
     * @type {ImageScannerResolution} 
     */
    ActualResolution {
        get => this.get_ActualResolution()
    }

    /**
     * Gets the default color mode for the scanner's feeder.
     * @remarks
     * When a new scan session begins, this property chooses the default color mode based on the pixel data types and bit depths that each scanner device supports. This is the order of priority:
     * 
     * 
     * + AutoColor
     * + Color
     * + Grayscale
     * + BlackAndWhite
     * If the scanner device doesn't support any of the standard color modes, the current scan source will be considered unavailable and the app won’t be able to scan from there.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.defaultcolormode
     * @type {Integer} 
     */
    DefaultColorMode {
        get => this.get_DefaultColorMode()
    }

    /**
     * Gets or sets the color mode for the scanner's feeder.
     * @remarks
     * When a new scan session starts, this property is the same as the [DefaultColorMode](imagescannerfeederconfiguration_defaultcolormode.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.colormode
     * @type {Integer} 
     */
    ColorMode {
        get => this.get_ColorMode()
        set => this.put_ColorMode(value)
    }

    /**
     * Gets the minimum brightness level supported by the scanner's feeder.
     * @remarks
     * This property's value must be smaller than or equal to the value of the [MaxBrightness](imagescannerfeederconfiguration_maxbrightness.md) property. A scan source that doesn't allow brightness adjustments can have **MinBrightness**, **MaxBrightness** and [DefaultBrightness](imagescannerfeederconfiguration_defaultbrightness.md) set to the same value-oftentimes 0, and the [BrightnessStep](imagescannerfeederconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.minbrightness
     * @type {Integer} 
     */
    MinBrightness {
        get => this.get_MinBrightness()
    }

    /**
     * Gets the maximum brightness level supported by the scanner's feeder.
     * @remarks
     * This property's value must be greater than or equal to the value of the [MinBrightness](imagescannerfeederconfiguration_minbrightness.md) property. A scan source that doesn't allow brightness adjustments can have **MinBrightness**, **MaxBrightness** and [DefaultBrightness](imagescannerfeederconfiguration_defaultbrightness.md) set to the same value-oftentimes 0, and the [BrightnessStep](imagescannerfeederconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.maxbrightness
     * @type {Integer} 
     */
    MaxBrightness {
        get => this.get_MaxBrightness()
    }

    /**
     * Gets the step size at which the brightness levels of the data source can be increased or decreased between the minimum and maximum values.
     * @remarks
     * If the scanner doesn't allow brightness changes, then the **MinBrightness**, **MaxBrightness** and **DefaultBrightness** are set to the same value-oftentimes 0, and the **BrightnessStep** is set to 0. Your app can determine if the scan source doesn't support brightness adjustments by reading the **BrightnessStep** value. If the value is greater than 0, the scan source supports brightness adjustments.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.brightnessstep
     * @type {Integer} 
     */
    BrightnessStep {
        get => this.get_BrightnessStep()
    }

    /**
     * Gets the default brightness level for the scanner's feeder.
     * @remarks
     * A scan source that doesn't allow brightness adjustments can have [MinBrightness](imagescannerfeederconfiguration_minbrightness.md), [MaxBrightness](imagescannerfeederconfiguration_maxbrightness.md) and **DefaultBrightness** set to the same value-oftentimes 0, and the [BrightnessStep](imagescannerfeederconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.defaultbrightness
     * @type {Integer} 
     */
    DefaultBrightness {
        get => this.get_DefaultBrightness()
    }

    /**
     * Gets or sets the current brightness level for capturing image data from the scanner's feeder. At the beginning of a new scan session, this property is set to the [DefaultBrightness](imagescannerfeederconfiguration_defaultbrightness.md) property.
     * @remarks
     * Your app can set the value of this property to any [Int32](/dotnet/api/system.int32?view=dotnet-uwp-10.0&preserve-view=true) value between the [MinBrightness](imagescannerfeederconfiguration_minbrightness.md) and [MaxBrightness](imagescannerfeederconfiguration_maxbrightness.md) values, and also relates to the [BrightnessStep](imagescannerfeederconfiguration_brightnessstep.md) value with this equation:
     * 
     * **Brightness = MinBrightness + (N * BrightnessStep)**
     * 
     * where N is a positive integer smaller than or equal to **(MaxBrightness - MinBrightness) / BrightnessStep**.
     * 
     * The app can return the brightness level to default by setting the value of this property to [DefaultBrightness](imagescannerfeederconfiguration_defaultbrightness.md).
     * 
     * If the scanner doesn't allow brightness adjustments, **MinBrightness**, **MaxBrightness** and **DefaultBrightness** are set to the same value-oftentimes 0, the **BrightnessStep** value is 0, and the app can't set the **Brightness** property to a value other than **DefaultBrightness**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.brightness
     * @type {Integer} 
     */
    Brightness {
        get => this.get_Brightness()
        set => this.put_Brightness(value)
    }

    /**
     * Gets the minimum contrast level supported by the scanner's feeder.
     * @remarks
     * This property's value must be smaller than or equal to the value of the [MaxContrast](imagescannerfeederconfiguration_maxcontrast.md) property. A scan source that doesn't allow contrast adjustments can have **MinContrast**, **MaxContrast** and [DefaultContrast](imagescannerfeederconfiguration_defaultcontrast.md) set to the same value-oftentimes 0, and the [ContrastStep](imagescannerfeederconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.mincontrast
     * @type {Integer} 
     */
    MinContrast {
        get => this.get_MinContrast()
    }

    /**
     * Gets the maximum contrast level supported by the scanner's feeder.
     * @remarks
     * This property's value must be greater than or equal to the value of the [MinContrast](imagescannerfeederconfiguration_mincontrast.md) property. A scan source that doesn't allow contrast adjustments can have **MinContrast**, **MaxContrast** and [DefaultContrast](imagescannerfeederconfiguration_defaultcontrast.md) set to the same value-oftentimes 0, and the [ContrastStep](imagescannerfeederconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.maxcontrast
     * @type {Integer} 
     */
    MaxContrast {
        get => this.get_MaxContrast()
    }

    /**
     * Gets the step size at which the contrast levels of the data source can increase or decrease between the minimum and maximum values.
     * @remarks
     * If the scanner doesn't allow contrast changes, then the [MinContrast](imagescannerfeederconfiguration_mincontrast.md), [MaxContrast](imagescannerfeederconfiguration_maxcontrast.md) and [DefaultContrast](imagescannerfeederconfiguration_defaultcontrast.md) are set to the same value-oftentimes 0, and the **ContrastStep** value is set to 0. Your app can determine if the scan source doesn't support contrast adjustments by reading the **ContrastStep** value. If the value is greater than 0, then the scan source supports contrast adjustments.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.contraststep
     * @type {Integer} 
     */
    ContrastStep {
        get => this.get_ContrastStep()
    }

    /**
     * Gets the default contrast level for the scanner's feeder.
     * @remarks
     * A scan source that doesn't allow contrast adjustments can have [MinContrast](imagescannerfeederconfiguration_mincontrast.md), [MaxContrast](imagescannerfeederconfiguration_maxcontrast.md) and **DefaultContrast** set to the same value-oftentimes 0, and the [ContrastStep](imagescannerfeederconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.defaultcontrast
     * @type {Integer} 
     */
    DefaultContrast {
        get => this.get_DefaultContrast()
    }

    /**
     * Sets or gets the current contrast level for capturing image data from the scanner's feeder. At the beginning of a new scan session this property is set to the [DefaultContrast](imagescannerfeederconfiguration_defaultcontrast.md) property.
     * @remarks
     * Your app can set the value of this property to any [Int32](/dotnet/api/system.int32?view=dotnet-uwp-10.0&preserve-view=true) value between the [MinContrast](imagescannerfeederconfiguration_mincontrast.md) and [MaxContrast](imagescannerfeederconfiguration_maxcontrast.md) values, and also relates to the [ContrastStep](imagescannerfeederconfiguration_contraststep.md) value with this equation:
     * 
     * **Contrast = MinContrast + (N * ContrastStep)**
     * 
     * where N is a positive integer smaller than or equal to **(MaxContrast - MinContrast) / ContrastStep**.
     * 
     * The app can return the contrast level to default by setting the value of this property to [DefaultContrast](imagescannerfeederconfiguration_defaultcontrast.md).
     * 
     * If the scanner doesn't allow contrast adjustments, **MinContrast**, **MaxContrast** and **DefaultContrast** are set to the same value-oftentimes 0, the **ContrastStep** value is 0, and the app can't set the **Contrast** property to a value other than **DefaultContrast**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.contrast
     * @type {Integer} 
     */
    Contrast {
        get => this.get_Contrast()
        set => this.put_Contrast(value)
    }

    /**
     * Returns True if the device can automatically detect at scan time the size of the document pages scanned through the feeder; otherwise returns False.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.canautodetectpagesize
     * @type {Boolean} 
     */
    CanAutoDetectPageSize {
        get => this.get_CanAutoDetectPageSize()
    }

    /**
     * Gets or sets the page size automatic detection feature for the scanner's feeder.
     * @remarks
     * This property can be True only if [CanAutoDetectPageSize](imagescannerfeederconfiguration_canautodetectpagesize.md) property is True. When this property is True the [PageSize](imagescannerfeederconfiguration_pagesize.md) and [PageOrientation](imagescannerfeederconfiguration_pageorientation.md) values are ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.autodetectpagesize
     * @type {Boolean} 
     */
    AutoDetectPageSize {
        get => this.get_AutoDetectPageSize()
        set => this.put_AutoDetectPageSize(value)
    }

    /**
     * Gets or sets the currently selected page size to scan from the feeder.
     * @remarks
     * When the [AutoDetectPageSize](imagescannerfeederconfiguration_autodetectpagesize.md) property is True the scanner device automatically detects at scan time the size of the document pages to scan and the values of the PageSize and [PageOrientation](imagescannerfeederconfiguration_pageorientation.md) properties are ignored.
     * 
     * When the [AutoCroppingMode](imagescannerfeederconfiguration_autocroppingmode.md) property is SingleRegion or MultiRegion, the scanner device will detect crop regions (and scan them to separate images) while the feeder feeds and scans the specified document size.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.pagesize
     * @type {Integer} 
     */
    PageSize {
        get => this.get_PageSize()
        set => this.put_PageSize(value)
    }

    /**
     * Gets or sets the currently selected page orientation that tells how to place the documents in the scanner's feeder input tray.
     * @remarks
     * Some devices may not support all orientation values for all [PageSize](imagescannerfeederconfiguration_pagesize.md) values. For example, a [MaxScanArea.Width](imagescannerfeederconfiguration_maxscanarea.md) of 8500 (8.5”) and MaxScanArea.Height of 1100 (11”) can have a PageSize of NorthAmericaLetter and a PageOrientation of Portrait, but can't be Landscape. When the [AutoDetectPageSize](imagescannerfeederconfiguration_autodetectpagesize.md) property is True the scanner device automatically detects at scan time the size of the document pages being scanned and the values of the PageSize and PageOrientation properties are ignored. When the [AutoCroppingMode](imagescannerfeederconfiguration_autocroppingmode.md) property is SingleRegion or MultipleRegion, the scanner device will detect crop regions (and scan them to separate images) while the feeder feeds and scans the specified document size.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.pageorientation
     * @type {Integer} 
     */
    PageOrientation {
        get => this.get_PageOrientation()
        set => this.put_PageOrientation(value)
    }

    /**
     * Gets the dimensions (width and height) and orientation of the selected page size, in mil units (1/1000").
     * @remarks
     * When the [AutoDetectPageSize](imagescannerfeederconfiguration_autodetectpagesize.md) property is False this property describes the dimensions (width and height) and orientation of the page size, in mil (1/1000”) units. For example, a Portrait NorthAmericaLetter having dimensions 8.5" x 11” has a PageSizeDimensions.Width value of 8500 units and a PageSizeDimensions.Height value of 11000 units, while a Landscape NorthAmericaLetter having dimensions 11" x 8.5” has a PageSizeDimensions.Width value of 11000 units and a PageSizeDimensions.Height value of 8500 units.
     * 
     * When the **AutoDetectPageSize** property is True the value of this property is automatically set to MaximumScanArea.Width and MaximumScanArea.Height and the app should ignore it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.pagesizedimensions
     * @type {SIZE} 
     */
    PageSizeDimensions {
        get => this.get_PageSizeDimensions()
    }

    /**
     * Gets or sets the maximum number of pages-not images, the app can scan in one scan job, before the scanner stops.
     * @remarks
     * The default value is 1. If this property is 0, the scanner must scan until the feeder tray is empty. Each scanned page can produce one or more images. For example when scanning duplex with [AutoCroppingMode](imagescannerfeederconfiguration_autocroppingmode.md) set to [ImageScannerAutoCroppingMode.Disabled](imagescannerautocroppingmode.md) there are two images to acquire for each scanned page (one image from the front and another image from the back side of the scanned page).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.maxnumberofpages
     * @type {Integer} 
     */
    MaxNumberOfPages {
        get => this.get_MaxNumberOfPages()
        set => this.put_MaxNumberOfPages(value)
    }

    /**
     * Gets whether the scanner's feeder is capable of duplex scanning (scanning both document page sides, front and back). When scanning in duplex mode the same scan settings (such as color mode and scan resolution) are applied to scan both page sides.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.canscanduplex
     * @type {Boolean} 
     */
    CanScanDuplex {
        get => this.get_CanScanDuplex()
    }

    /**
     * Indicates whether the scanner's feeder can scan both document page sides.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.duplex
     * @type {Boolean} 
     */
    Duplex {
        get => this.get_Duplex()
        set => this.put_Duplex(value)
    }

    /**
     * Gets whether the scanner device is capable of scanning ahead from its feeder.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.canscanahead
     * @type {Boolean} 
     */
    CanScanAhead {
        get => this.get_CanScanAhead()
    }

    /**
     * Indicates whether or not to scan ahead.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.scanahead
     * @type {Boolean} 
     */
    ScanAhead {
        get => this.get_ScanAhead()
        set => this.put_ScanAhead(value)
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
    get_DefaultFormat() {
        if (!this.HasProp("__IImageScannerFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFormatConfiguration := IImageScannerFormatConfiguration(outPtr)
        }

        return this.__IImageScannerFormatConfiguration.get_DefaultFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__IImageScannerFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFormatConfiguration := IImageScannerFormatConfiguration(outPtr)
        }

        return this.__IImageScannerFormatConfiguration.get_Format()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Format(value) {
        if (!this.HasProp("__IImageScannerFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFormatConfiguration := IImageScannerFormatConfiguration(outPtr)
        }

        return this.__IImageScannerFormatConfiguration.put_Format(value)
    }

    /**
     * Determines whether the scanner's feeder supports the specified file format or not.
     * @param {Integer} value The file type.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.isformatsupported
     */
    IsFormatSupported(value) {
        if (!this.HasProp("__IImageScannerFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFormatConfiguration := IImageScannerFormatConfiguration(outPtr)
        }

        return this.__IImageScannerFormatConfiguration.IsFormatSupported(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MinScanArea() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_MinScanArea()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MaxScanArea() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_MaxScanArea()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_SelectedScanRegion() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_SelectedScanRegion()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_SelectedScanRegion(value) {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.put_SelectedScanRegion(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoCroppingMode() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_AutoCroppingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutoCroppingMode(value) {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.put_AutoCroppingMode(value)
    }

    /**
     * Returns whether the scanner's feeder supports the specified [ImageScannerAutoCroppingMode](imagescannerautocroppingmode.md).
     * @param {Integer} value The auto crop mode of the image to scan.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.isautocroppingmodesupported
     */
    IsAutoCroppingModeSupported(value) {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.IsAutoCroppingModeSupported(value)
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_MinResolution() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_MinResolution()
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_MaxResolution() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_MaxResolution()
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_OpticalResolution() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_OpticalResolution()
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_DesiredResolution() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_DesiredResolution()
    }

    /**
     * 
     * @param {ImageScannerResolution} value 
     * @returns {HRESULT} 
     */
    put_DesiredResolution(value) {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.put_DesiredResolution(value)
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_ActualResolution() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_ActualResolution()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultColorMode() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_DefaultColorMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorMode() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_ColorMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorMode(value) {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.put_ColorMode(value)
    }

    /**
     * Returns whether the scanner's feeder can scan and transfer images in the specified color mode.
     * @param {Integer} value The color mode.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.iscolormodesupported
     */
    IsColorModeSupported(value) {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.IsColorModeSupported(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinBrightness() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_MinBrightness()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBrightness() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_MaxBrightness()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BrightnessStep() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_BrightnessStep()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultBrightness() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_DefaultBrightness()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Brightness() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_Brightness()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Brightness(value) {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.put_Brightness(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinContrast() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_MinContrast()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxContrast() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_MaxContrast()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContrastStep() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_ContrastStep()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultContrast() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_DefaultContrast()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Contrast() {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.get_Contrast()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Contrast(value) {
        if (!this.HasProp("__IImageScannerSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerSourceConfiguration := IImageScannerSourceConfiguration(outPtr)
        }

        return this.__IImageScannerSourceConfiguration.put_Contrast(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanAutoDetectPageSize() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_CanAutoDetectPageSize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoDetectPageSize() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_AutoDetectPageSize()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoDetectPageSize(value) {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.put_AutoDetectPageSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageSize() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_PageSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PageSize(value) {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.put_PageSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageOrientation() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_PageOrientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PageOrientation(value) {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.put_PageOrientation(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_PageSizeDimensions() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_PageSizeDimensions()
    }

    /**
     * Returns whether the feeder can scan documents in the specified page size and orientation.
     * @param {Integer} pageSize The page size.
     * @param {Integer} pageOrientation The page orientation.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerfeederconfiguration.ispagesizesupported
     */
    IsPageSizeSupported(pageSize, pageOrientation) {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.IsPageSizeSupported(pageSize, pageOrientation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxNumberOfPages() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_MaxNumberOfPages()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxNumberOfPages(value) {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.put_MaxNumberOfPages(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanScanDuplex() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_CanScanDuplex()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Duplex() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_Duplex()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Duplex(value) {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.put_Duplex(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanScanAhead() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_CanScanAhead()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ScanAhead() {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.get_ScanAhead()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ScanAhead(value) {
        if (!this.HasProp("__IImageScannerFeederConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFeederConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFeederConfiguration := IImageScannerFeederConfiguration(outPtr)
        }

        return this.__IImageScannerFeederConfiguration.put_ScanAhead(value)
    }

;@endregion Instance Methods
}
