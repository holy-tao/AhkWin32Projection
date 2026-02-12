#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include .\ImageScannerResolution.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Queries and configures scan settings that are common to both flatbed and feeder sources.
  * 
  * The scan settings are:
  * 
  * 
  * + Scan region coordinates
  * + Scan resolution
  * + Color mode
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class IImageScannerSourceConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageScannerSourceConfiguration
     * @type {Guid}
     */
    static IID => Guid("{bfb50055-0b44-4c82-9e89-205f9c234e59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinScanArea", "get_MaxScanArea", "get_SelectedScanRegion", "put_SelectedScanRegion", "get_AutoCroppingMode", "put_AutoCroppingMode", "IsAutoCroppingModeSupported", "get_MinResolution", "get_MaxResolution", "get_OpticalResolution", "get_DesiredResolution", "put_DesiredResolution", "get_ActualResolution", "get_DefaultColorMode", "get_ColorMode", "put_ColorMode", "IsColorModeSupported", "get_MinBrightness", "get_MaxBrightness", "get_BrightnessStep", "get_DefaultBrightness", "get_Brightness", "put_Brightness", "get_MinContrast", "get_MaxContrast", "get_ContrastStep", "get_DefaultContrast", "get_Contrast", "put_Contrast"]

    /**
     * Gets the minimum scan area in inches. The minimum scan area is the smallest size a document can have in order for a flatbed or feeder to scan it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.minscanarea
     * @type {SIZE} 
     */
    MinScanArea {
        get => this.get_MinScanArea()
    }

    /**
     * Gets the maximum scan area dimensions in inches. The maximum scan width is the longest width a document can have in order for the feeder and flatbed to scan it.
     * @remarks
     * For feeder scan sources, there are restrictions for the maximum scan area: 
     * + The currently selected page size, if page size auto-detection is not enabled.
     * + The dimensions of the selected page size, which becomes the new maximum dimensions of the permissible scan area.
     *  These limits are dictated by hardware for feeder, flatbed, and other types of scan sources.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.maxscanarea
     * @type {SIZE} 
     */
    MaxScanArea {
        get => this.get_MaxScanArea()
    }

    /**
     * Gets or sets the origin coordinates (horizontal and vertical) and dimensions (width and height) of the selected scan area, in inches. This property is ignored when the [AutoCroppingMode](iimagescannersourceconfiguration_autocroppingmode.md) property is not set to **Disabled**.
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.selectedscanregion
     * @type {RECT} 
     */
    SelectedScanRegion {
        get => this.get_SelectedScanRegion()
        set => this.put_SelectedScanRegion(value)
    }

    /**
     * Gets or sets the automatic crop mode.
     * 
     * When automatic detection is enabled on the scan source, the automatic crop mode indicates whether to scan one region or multiple regions. When a new scan session starts, the default value is **Disabled**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.autocroppingmode
     * @type {Integer} 
     */
    AutoCroppingMode {
        get => this.get_AutoCroppingMode()
        set => this.put_AutoCroppingMode(value)
    }

    /**
     * Gets the minimum horizontal and vertical scan resolution of the scan source in DPI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.minresolution
     * @type {ImageScannerResolution} 
     */
    MinResolution {
        get => this.get_MinResolution()
    }

    /**
     * Gets the maximum horizontal and vertical scan resolution of the scan source in DPI.
     * @remarks
     * Apps can scan at **MaxResolution** in a small area at the highest possible resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.maxresolution
     * @type {ImageScannerResolution} 
     */
    MaxResolution {
        get => this.get_MaxResolution()
    }

    /**
     * Gets the optical horizontal and vertical scan resolution of the scan source in DPI.
     * @remarks
     * Apps can scan at **OpticalResolution** for the best quality per pixel that the hardware device is capable of.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.opticalresolution
     * @type {ImageScannerResolution} 
     */
    OpticalResolution {
        get => this.get_OpticalResolution()
    }

    /**
     * Gets or sets the horizontal and vertical scan resolution for the scan source that the app requests, in DPI.
     * @remarks
     * This property value can be [MinResolution](iimagescannersourceconfiguration_minresolution.md), [MaxResolution](iimagescannersourceconfiguration_maxresolution.md), or [OpticalResolution](iimagescannersourceconfiguration_opticalresolution.md). But, if your app sets this value to other resolutions, this property will choose the closest resolution values. See [ActualResolution](iimagescannersourceconfiguration_actualresolution.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.desiredresolution
     * @type {ImageScannerResolution} 
     */
    DesiredResolution {
        get => this.get_DesiredResolution()
        set => this.put_DesiredResolution(value)
    }

    /**
     * Gets the actual horizontal and vertical scan resolution for the scan source, in DPI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.actualresolution
     * @type {ImageScannerResolution} 
     */
    ActualResolution {
        get => this.get_ActualResolution()
    }

    /**
     * Gets the default color mode for this scan source.
     * @remarks
     * When a new scan session begins, this property chooses the default color mode based on the pixel data types and bit depths that each scanner device supports. This order of priority is used:
     * 
     * 
     * + AutoColor
     * + Color
     * + Grayscale
     * + BlackAndWhite
     * If the scanner device doesn't support any of the standard color modes, the current scan source will be considered unavailable and the app won’t be able to scan from there.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.defaultcolormode
     * @type {Integer} 
     */
    DefaultColorMode {
        get => this.get_DefaultColorMode()
    }

    /**
     * Gets or sets the color mode for the scan source. When a new scan session starts, this property is the same as the [DefaultColorMode](iimagescannersourceconfiguration_defaultcolormode.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.colormode
     * @type {Integer} 
     */
    ColorMode {
        get => this.get_ColorMode()
        set => this.put_ColorMode(value)
    }

    /**
     * Gets the minimum brightness level supported by the scan source.
     * @remarks
     * This property's value must be smaller than or equal to the value of the [MaxBrightness](iimagescannersourceconfiguration_maxbrightness.md) property. A scan source that doesn't allow brightness adjustments can have **MinBrightness**, **MaxBrightness** and [DefaultBrightness](iimagescannersourceconfiguration_defaultbrightness.md) set to the same value-oftentimes 0, and the [BrightnessStep](iimagescannersourceconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.minbrightness
     * @type {Integer} 
     */
    MinBrightness {
        get => this.get_MinBrightness()
    }

    /**
     * Gets the maximum brightness level supported by the scan source.
     * @remarks
     * This property's value must be greater than or equal to the value of the [MinBrightness](iimagescannersourceconfiguration_minbrightness.md) property. A scan source that doesn't allow brightness adjustments can have **MinBrightness**, **MaxBrightness** and [DefaultBrightness](iimagescannersourceconfiguration_defaultbrightness.md) set to the same value-oftentimes 0, and the [BrightnessStep](iimagescannersourceconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.maxbrightness
     * @type {Integer} 
     */
    MaxBrightness {
        get => this.get_MaxBrightness()
    }

    /**
     * Gets the step size at which the brightness levels of the data source can be increased or decreased between the minimum and maximum values.
     * @remarks
     * If the scanner doesn't allow brightness changes, then the **MinBrightness**, **MaxBrightness** and **DefaultBrightness** are set to the same value-oftentimes 0, and the **BrightnessStep** is set to 0. Your app can determine if the scan source doesn't support brightness adjustments by reading the **BrightnessStep** value. If the value is greater than 0, the scan source supports brightness adjustments.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.brightnessstep
     * @type {Integer} 
     */
    BrightnessStep {
        get => this.get_BrightnessStep()
    }

    /**
     * Gets the default brightness level for the scan source.
     * @remarks
     * A scan source that doesn't allow brightness adjustments can have [MinBrightness](iimagescannersourceconfiguration_minbrightness.md), [MaxBrightness](iimagescannersourceconfiguration_maxbrightness.md) and **DefaultBrightness** set to the same value-oftentimes 0, and the [BrightnessStep](iimagescannersourceconfiguration_brightnessstep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.defaultbrightness
     * @type {Integer} 
     */
    DefaultBrightness {
        get => this.get_DefaultBrightness()
    }

    /**
     * Configures the current brightness level for capturing image data from the scan source. On a new scan session, the value of this property is the [DefaultBrightness](iimagescannersourceconfiguration_defaultbrightness.md) property.
     * @remarks
     * This property's value must be between [MinBrightness](iimagescannersourceconfiguration_minbrightness.md) and [MaxBrightness](iimagescannersourceconfiguration_maxbrightness.md), and is related to [BrightnessStep](iimagescannersourceconfiguration_brightnessstep.md) with this equation:
     * 
     * **Brightness = MinBrightness + (N*BrightnessStep)**
     * 
     * where N is a positive integer smaller than or equal to **(MaxBrightness - MinBrightness) / BrightnessStep**.
     * 
     * Your app can return the brightness level to default by setting the value of this property to the [DefaultBrightness](iimagescannersourceconfiguration_defaultbrightness.md) property value. If the scanner doesn't allow brightness changes, **MinBrightness**, **MaxBrightness** and **DefaultBrightness** are set to the same value-oftentimes 0, the **BrightnessStep** is set to 0, and the app can't change the **Brightness** property to a different value other than **DefaultBrightness**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.brightness
     * @type {Integer} 
     */
    Brightness {
        get => this.get_Brightness()
        set => this.put_Brightness(value)
    }

    /**
     * Gets the minimum contrast level supported by the scan source.
     * @remarks
     * This property's value must be smaller than or equal to the value of the [MaxContrast](iimagescannersourceconfiguration_maxcontrast.md) property. A scan source that doesn't allow contrast adjustments can have **MinContrast**, **MaxContrast** and [DefaultContrast](iimagescannersourceconfiguration_defaultcontrast.md) set to the same value-oftentimes 0, and the [ContrastStep](iimagescannersourceconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.mincontrast
     * @type {Integer} 
     */
    MinContrast {
        get => this.get_MinContrast()
    }

    /**
     * Gets the maximum contrast level supported by the scan source.
     * @remarks
     * This property's value must be greater than or equal to the value of the [MinContrast](iimagescannersourceconfiguration_mincontrast.md) property. A scan source that doesn't allow contrast adjustments can have **MinContrast**, **MaxContrast** and [DefaultContrast](iimagescannersourceconfiguration_defaultcontrast.md) set to the same value-oftentimes 0, and the [ContrastStep](iimagescannersourceconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.maxcontrast
     * @type {Integer} 
     */
    MaxContrast {
        get => this.get_MaxContrast()
    }

    /**
     * Gets the step size at which the contrast levels of the data source can increase or decrease between the minimum and maximum values.
     * @remarks
     * If the scanner doesn't allow contrast changes, then the [MinContrast](iimagescannersourceconfiguration_mincontrast.md), [MaxContrast](iimagescannersourceconfiguration_maxcontrast.md) and [DefaultContrast](iimagescannersourceconfiguration_defaultcontrast.md) are set to the same value-oftentimes 0, and the **ContrastStep** value is set to 0. Your app can determine if the scan source doesn't support contrast adjustments by reading the **ContrastStep** value. If the value is greater than 0, then the scan source supports contrast adjustments.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.contraststep
     * @type {Integer} 
     */
    ContrastStep {
        get => this.get_ContrastStep()
    }

    /**
     * Gets the default contrast level for the scan source.
     * @remarks
     * A scan source that doesn't allow contrast adjustments can have [MinContrast](iimagescannersourceconfiguration_mincontrast.md), [MaxContrast](iimagescannersourceconfiguration_maxcontrast.md) and **DefaultContrast** set to the same value-oftentimes 0, and the [ContrastStep](iimagescannersourceconfiguration_contraststep.md) value set to 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.defaultcontrast
     * @type {Integer} 
     */
    DefaultContrast {
        get => this.get_DefaultContrast()
    }

    /**
     * Sets or gets the current contrast level for capturing image data from the scan source. At the beginning of a new scan session this property is set to the [DefaultContrast](iimagescannersourceconfiguration_defaultcontrast.md) property.
     * @remarks
     * Your app can set the value of this property to any [Int32](/dotnet/api/system.int32?view=dotnet-uwp-10.0&preserve-view=true) value between the [MinContrast](iimagescannersourceconfiguration_mincontrast.md) and [MaxContrast](iimagescannersourceconfiguration_maxcontrast.md) values, and also relates to the [ContrastStep](iimagescannersourceconfiguration_contraststep.md) value with this equation:
     * 
     * **Contrast = MinContrast + (N * ContrastStep)**
     * 
     * where N is a positive integer smaller than or equal to **(MaxContrast - MinContrast) / ContrastStep**.
     * 
     * The app can return the contrast level to default by setting the value of this property to [DefaultContrast](iimagescannersourceconfiguration_defaultcontrast.md).
     * 
     * If the scanner doesn't allow contrast adjustments, **MinContrast**, **MaxContrast** and **DefaultContrast** are set to the same value-oftentimes 0, the [ContrastStep](iimagescannersourceconfiguration_contraststep.md) value is 0, and the app can't set the **Contrast** property to a value other than **DefaultContrast**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.contrast
     * @type {Integer} 
     */
    Contrast {
        get => this.get_Contrast()
        set => this.put_Contrast(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MinScanArea() {
        value := SIZE()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MaxScanArea() {
        value := SIZE()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_SelectedScanRegion() {
        value := RECT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_SelectedScanRegion(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoCroppingMode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutoCroppingMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines if the scan source supports the specified [ImageScannerAutoCroppingMode](imagescannerautocroppingmode.md).
     * @param {Integer} value The auto crop mode of the image to scan.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.isautocroppingmodesupported
     */
    IsAutoCroppingModeSupported(value) {
        result := ComCall(12, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_MinResolution() {
        value := ImageScannerResolution()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_MaxResolution() {
        value := ImageScannerResolution()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_OpticalResolution() {
        value := ImageScannerResolution()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_DesiredResolution() {
        value := ImageScannerResolution()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {ImageScannerResolution} value 
     * @returns {HRESULT} 
     */
    put_DesiredResolution(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ImageScannerResolution} 
     */
    get_ActualResolution() {
        value := ImageScannerResolution()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultColorMode() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorMode() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorMode(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines if the scan source can scan and transfer images in the specified color mode.
     * @param {Integer} value The color mode.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannersourceconfiguration.iscolormodesupported
     */
    IsColorModeSupported(value) {
        result := ComCall(22, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinBrightness() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBrightness() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BrightnessStep() {
        result := ComCall(25, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultBrightness() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Brightness() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Brightness(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinContrast() {
        result := ComCall(29, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxContrast() {
        result := ComCall(30, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContrastStep() {
        result := ComCall(31, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultContrast() {
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Contrast() {
        result := ComCall(33, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Contrast(value) {
        result := ComCall(34, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
