#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageScannerFormatConfiguration.ahk
#Include .\IImageScannerSourceConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the flatbed scan source of the scanner.
 * @remarks
 * This runtime class implements the [IImageScannerSourceConfiguration](iimagescannersourceconfiguration.md) interface and the [IImageScannerFormatConfiguration](iimagescannerformatconfiguration.md) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerFlatbedConfiguration extends IInspectable {
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
     * Gets the default file format for the scanner's flatbed at the beginning of a new scan session.
     * @remarks
     * All WIA scanner devices support the Windows Device Independent Bitmap (DIB) format.
     * 
     * By default, these values in this order will be selected based on the file formats the device supports, from the smallest file size (in bytes) to the largest size:
     * 
     * 
     * + 1. Jpeg
     * + 2. Png
     * + 3. Bitmap
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.defaultformat
     * @type {Integer} 
     */
    DefaultFormat {
        get => this.get_DefaultFormat()
    }

    /**
     * Gets or sets the current file transfer format for image data acquisition from the scanner's flatbed to the client app.
     * @remarks
     * When a new scan session starts, this property is set to the default file format. See the [DefaultFormat](imagescannerflatbedconfiguration_defaultformat.md) property on how this is done.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * Gets the minimum scan area in inches. The minimum scan area is the smallest size a document can have in order for a flatbed to scan it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.minscanarea
     * @type {SIZE} 
     */
    MinScanArea {
        get => this.get_MinScanArea()
    }

    /**
     * Gets the maximum scan area dimensions in inches. The maximum scan width is the widest a document can be in order for the scanner's flatbed to scan it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.maxscanarea
     * @type {SIZE} 
     */
    MaxScanArea {
        get => this.get_MaxScanArea()
    }

    /**
     * Gets or sets the origin coordinates (horizontal and vertical) and dimensions (width and height) of the selected scan area, in inches. This property is ignored when the [AutoCroppingMode](imagescannerflatbedconfiguration_autocroppingmode.md) property is not **Disabled**.
     * @remarks
     * This table describes the property's restrictions. Default values are set at the beginning of a new scan session.
     * 
     * <table>
     *    <tr><th>Name</th><th>Default value</th><th>Valid flatbed values</th><th>Valid feeder values</th></tr>
     *    <tr><td>SelectedScanRegion.X</td><td>0</td><td>between 0 and MaximumScanArea.Width - 1</td><td>between 0 and PageSizeDimenstions.Width</td></tr>
     *    <tr><td>SelectedScanRegion.Y</td><td>0</td><td>between 0 and MaximumScanArea.Height - 1</td><td>between 0 and PageSizeDimenstions.Height</td></tr>
     *    <tr><td>SelectedScanRegion.Width</td><td>MaximumScanArea.Width</td><td>between MinimumScanArea.Width and (MaximumScanArea.Width – SelectedScanRegion.X)</td><td>between MinimumScanArea.Width and PageSizeDimensions.Width</td></tr>
     *    <tr><td>SelectedScanRegion.Height</td><td>MaximumScanArea.Height</td><td>between MinimumScanAreaHeight and (MaximumScanAreaHeight – SelectedScanRegion.Y)</td><td>between MinimumScanArea.Height and PageSizeDimensions.Height</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.selectedscanregion
     * @type {RECT} 
     */
    SelectedScanRegion {
        get => this.get_SelectedScanRegion()
        set => this.put_SelectedScanRegion(value)
    }

    /**
     * Gets or sets the automatic crop mode.
     * @remarks
     * When automatic detection is enabled on the scanner's flatbed, the automatic crop mode indicates whether to scan one region or multiple regions. When a new scan session starts, the default value is **Disabled**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.autocroppingmode
     * @type {Integer} 
     */
    AutoCroppingMode {
        get => this.get_AutoCroppingMode()
        set => this.put_AutoCroppingMode(value)
    }

    /**
     * Gets the minimum horizontal and vertical scan resolution of the scanner's flatbed in DPI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.minresolution
     * @type {ImageScannerResolution} 
     */
    MinResolution {
        get => this.get_MinResolution()
    }

    /**
     * Gets the maximum horizontal and vertical scan resolution of the scanner's flatbed in DPI.
     * @remarks
     * Apps can scan at **MaxResolution** in a small area at the highest possible resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.maxresolution
     * @type {ImageScannerResolution} 
     */
    MaxResolution {
        get => this.get_MaxResolution()
    }

    /**
     * Gets the optical scan resolution of the flatbed scanner in DPI.
     * @remarks
     * Apps can scan at **OpticalResolution** for the best quality per pixel that the hardware device is capable of.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.opticalresolution
     * @type {ImageScannerResolution} 
     */
    OpticalResolution {
        get => this.get_OpticalResolution()
    }

    /**
     * Gets or sets the horizontal and vertical scan resolution for the scanner's flatbed that the app requests, in DPI.
     * @remarks
     * The actual resolution used for scanning (see [ActualResolution](imagescannerflatbedconfiguration_actualresolution.md)) will be set to the closest resolution supported by the scanner.
     * 
     * Scanners support either:
     * * A fixed list of resolutions (for example, 75x75dpi, 150x150dpi, 300x300dpi, 450x450dpi, and 600x600dpi), or
     * * A resolution range between [MinResolution](imagescannerflatbedconfiguration_minresolution.md) and [MaxResolution](imagescannerflatbedconfiguration_maxresolution.md) in *resolution-step* increments. For example, 75x75dpi up to 600x600dpi, in increments of 25dpi.
     * 
     * For the fixed list example above, setting **DesiredResolution** to 125x125dpi (for example) would result in an **ActualResolution** of 150x150dpi being used for scanning, because that's the closest match in that example list of supported resolutions (rounding up, if equidistant from supported resolution values).
     * 
     * For the resolution range example above, setting **DesiredResolution** to 130x130dpi (for example) would result in an **ActualResolution** of 125x125dpi being used for scanning, because that's the closest supported matching resolution in that example range.
     * 
     * You can also set **DesiredResolution** to [OpticalResolution](imagescannerflatbedconfiguration_opticalresolution.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.desiredresolution
     * @type {ImageScannerResolution} 
     */
    DesiredResolution {
        get => this.get_DesiredResolution()
        set => this.put_DesiredResolution(value)
    }

    /**
     * Gets the actual horizontal and vertical scan resolution to be used for the flatbed scanner, in dots-per-inch (DPI).
     * @remarks
     * The actual resolution is set by the system based on the **DesiredResolution** set by the app, rounded to the nearest resolution supported by the scanner. See **Remarks** in [DesiredResolution](imagescannerflatbedconfiguration_desiredresolution.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.actualresolution
     * @type {ImageScannerResolution} 
     */
    ActualResolution {
        get => this.get_ActualResolution()
    }

    /**
     * Gets the default color mode for the scanner's flatbed.
     * @remarks
     * When a new scan session begins, this property chooses the default color mode based on the pixel data types and bit depths that each scanner device supports. This is the order of priority:
     * 
     * 
     * + AutoColor
     * + Color
     * + Grayscale
     * + BlackAndWhite
     * If the scanner device doesn't support any of the standard color modes, the current scan source will be considered unavailable and the app won’t be able to scan from there.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.defaultcolormode
     * @type {Integer} 
     */
    DefaultColorMode {
        get => this.get_DefaultColorMode()
    }

    /**
     * Gets or sets the color mode for the flatbed scanner.
     * @remarks
     * When a new scan session starts, this property is the same as the [DefaultColorMode](imagescannerflatbedconfiguration_defaultcolormode.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.colormode
     * @type {Integer} 
     */
    ColorMode {
        get => this.get_ColorMode()
        set => this.put_ColorMode(value)
    }

    /**
     * Gets the minimum brightness level supported by the scanner's flatbed.
     * @remarks
     * This property's value must be smaller than or equal to the value of the [MaxBrightness](imagescannerflatbedconfiguration_maxbrightness.md) property. A scan source that doesn't allow brightness adjustments can have **MinBrightness**, **MaxBrightness** and [DefaultBrightness](imagescannerflatbedconfiguration_defaultbrightness.md) set to the same value-oftentimes 0, and the [BrightnessStep](imagescannerflatbedconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.minbrightness
     * @type {Integer} 
     */
    MinBrightness {
        get => this.get_MinBrightness()
    }

    /**
     * Gets the maximum brightness level supported by the scanner's flatbed.
     * @remarks
     * This property's value must be greater than or equal to the value of the [MinBrightness](imagescannerflatbedconfiguration_minbrightness.md) property. A scan source that doesn't allow brightness adjustments can have **MinBrightness**, **MaxBrightness** and [DefaultBrightness](imagescannerflatbedconfiguration_defaultbrightness.md) set to the same value-oftentimes 0, and the [BrightnessStep](imagescannerflatbedconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.maxbrightness
     * @type {Integer} 
     */
    MaxBrightness {
        get => this.get_MaxBrightness()
    }

    /**
     * Gets the step size at which the brightness levels of the data source can be increased or decreased between the minimum and maximum values.
     * @remarks
     * If the scanner doesn't allow brightness changes, then the **MinBrightness**, **MaxBrightness** and **DefaultBrightness** are set to the same value-oftentimes 0, and the **BrightnessStep** is set to 0. Your app can determine if the scan source doesn't support brightness adjustments by reading the **BrightnessStep** value. If the value is greater than 0, the scan source supports brightness adjustments.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.brightnessstep
     * @type {Integer} 
     */
    BrightnessStep {
        get => this.get_BrightnessStep()
    }

    /**
     * Gets the default brightness level for the scanner's flatbed.
     * @remarks
     * A scan source that doesn't allow brightness adjustments can have [MinBrightness](imagescannerflatbedconfiguration_minbrightness.md), [MaxBrightness](imagescannerflatbedconfiguration_maxbrightness.md) and **DefaultBrightness** set to the same value-oftentimes 0, and the [BrightnessStep](imagescannerflatbedconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.defaultbrightness
     * @type {Integer} 
     */
    DefaultBrightness {
        get => this.get_DefaultBrightness()
    }

    /**
     * Gets or sets the current brightness level for capturing image data from the scanner's flatbed. At the beginning of a new scan session, this property is set to the [DefaultBrightness](imagescannerflatbedconfiguration_defaultbrightness.md) property.
     * @remarks
     * Your app can set the value of this property to any [Int32](/dotnet/api/system.int32?view=dotnet-uwp-10.0&preserve-view=true) value between the [MinBrightness](imagescannerflatbedconfiguration_minbrightness.md) and [MaxBrightness](imagescannerflatbedconfiguration_maxbrightness.md) values, and also relates to the [BrightnessStep](imagescannerflatbedconfiguration_brightnessstep.md) value with this equation:
     * 
     * **Brightness = MinBrightness + (N * BrightnessStep)**
     * 
     * where N is a positive integer smaller than or equal to **(MaxBrightness - MinBrightness) / BrightnessStep**.
     * 
     * The app can return the brightness level to default by setting the value of this property to [DefaultBrightness](imagescannerflatbedconfiguration_defaultbrightness.md).
     * 
     * If the scanner doesn't allow brightness adjustments, **MinBrightness**, **MaxBrightness** and **DefaultBrightness** are set to the same value-oftentimes 0, the **BrightnessStep** value is 0, and the app can't set the **Brightness** property to a value other than **DefaultBrightness**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.brightness
     * @type {Integer} 
     */
    Brightness {
        get => this.get_Brightness()
        set => this.put_Brightness(value)
    }

    /**
     * Gets the minimum contrast level supported by the scanner's flatbed.
     * @remarks
     * This property's value must be smaller than or equal to the value of the [MaxContrast](imagescannerflatbedconfiguration_maxcontrast.md) property. A scan source that doesn't allow contrast adjustments can have **MinContrast**, **MaxContrast** and [DefaultContrast](imagescannerflatbedconfiguration_defaultcontrast.md) set to the same value-oftentimes 0, and the [ContrastStep](imagescannerflatbedconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.mincontrast
     * @type {Integer} 
     */
    MinContrast {
        get => this.get_MinContrast()
    }

    /**
     * Gets the maximum contrast level supported by the scanner's flatbed.
     * @remarks
     * This property's value must be greater than or equal to the value of the [MinContrast](imagescannerflatbedconfiguration_mincontrast.md) property. A scan source that doesn't allow contrast adjustments can have **MinContrast**, **MaxContrast** and [DefaultContrast](imagescannerflatbedconfiguration_defaultcontrast.md) set to the same value-oftentimes 0, and the [ContrastStep](imagescannerflatbedconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.maxcontrast
     * @type {Integer} 
     */
    MaxContrast {
        get => this.get_MaxContrast()
    }

    /**
     * Gets the step size at which the contrast levels of the data source can increase or decrease between the minimum and maximum values.
     * @remarks
     * If the scanner doesn't allow contrast changes, then the [MinContrast](imagescannerflatbedconfiguration_mincontrast.md), [MaxContrast](imagescannerflatbedconfiguration_maxcontrast.md) and [DefaultContrast](imagescannerflatbedconfiguration_defaultcontrast.md) are set to the same value-oftentimes 0, and the **ContrastStep** value is set to 0. Your app can determine if the scan source doesn't support contrast adjustments by reading the **ContrastStep** value. If the value is greater than 0, then the scan source supports contrast adjustments.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.contraststep
     * @type {Integer} 
     */
    ContrastStep {
        get => this.get_ContrastStep()
    }

    /**
     * Gets the default contrast level for the scanner's flatbed.
     * @remarks
     * A scan source that doesn't allow contrast adjustments can have [MinContrast](imagescannerflatbedconfiguration_mincontrast.md), [MaxContrast](imagescannerflatbedconfiguration_maxcontrast.md) and **DefaultContrast** set to the same value-oftentimes 0, and the [ContrastStep](imagescannerflatbedconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.defaultcontrast
     * @type {Integer} 
     */
    DefaultContrast {
        get => this.get_DefaultContrast()
    }

    /**
     * Sets or gets the current contrast level for capturing image data from the scan source. At the beginning of a new scan session this property is set to the [DefaultContrast](imagescannerflatbedconfiguration_defaultcontrast.md) property.
     * @remarks
     * Your app can set the value of this property to any [Int32](/dotnet/api/system.int32?view=dotnet-uwp-10.0&preserve-view=true) value between the [MinContrast](imagescannerflatbedconfiguration_mincontrast.md) and [MaxContrast](imagescannerflatbedconfiguration_maxcontrast.md) values, and also relates to the [ContrastStep](imagescannerflatbedconfiguration_contraststep.md) value with this equation:
     * 
     * **Contrast = MinContrast + (N * ContrastStep)**
     * 
     * where N is a positive integer smaller than or equal to **(MaxContrast - MinContrast) / ContrastStep**.
     * 
     * The app can return the contrast level to default by setting the value of this property to [DefaultContrast](imagescannerflatbedconfiguration_defaultcontrast.md).
     * 
     * If the scanner doesn't allow contrast adjustments, **MinContrast**, **MaxContrast** and **DefaultContrast** are set to the same value-oftentimes 0, the **ContrastStep** value is 0, and the app can't set the **Contrast** property to a value other than **DefaultContrast**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.contrast
     * @type {Integer} 
     */
    Contrast {
        get => this.get_Contrast()
        set => this.put_Contrast(value)
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
     * Determines whether the scanner's flatbed supports the specified file format or not.
     * @param {Integer} value The file type.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.isformatsupported
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
     * Returns whether the scanner's flatbed supports the specified [ImageScannerAutoCroppingMode](imagescannerautocroppingmode.md).
     * @param {Integer} value The auto crop mode of the image to scan.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.isautocroppingmodesupported
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
     * Returns whether the scanner's flatbed can scan and transfer images in the specified color mode.
     * @param {Integer} value The color mode.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerflatbedconfiguration.iscolormodesupported
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

;@endregion Instance Methods
}
