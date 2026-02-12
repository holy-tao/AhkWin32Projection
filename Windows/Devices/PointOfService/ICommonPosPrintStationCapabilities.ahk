#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the capabilities common to all types of stations for point-of-service printers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ICommonPosPrintStationCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommonPosPrintStationCapabilities
     * @type {Guid}
     */
    static IID => Guid("{de5b52ca-e02e-40e9-9e5e-1b488e6aacfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPrinterPresent", "get_IsDualColorSupported", "get_ColorCartridgeCapabilities", "get_CartridgeSensors", "get_IsBoldSupported", "get_IsItalicSupported", "get_IsUnderlineSupported", "get_IsDoubleHighPrintSupported", "get_IsDoubleWidePrintSupported", "get_IsDoubleHighDoubleWidePrintSupported", "get_IsPaperEmptySensorSupported", "get_IsPaperNearEndSensorSupported", "get_SupportedCharactersPerLine"]

    /**
     * Gets whether a printer station is present.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.isprinterpresent
     * @type {Boolean} 
     */
    IsPrinterPresent {
        get => this.get_IsPrinterPresent()
    }

    /**
     * Gets whether the printer station can print a dark color plus an alternate color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.isdualcolorsupported
     * @type {Boolean} 
     */
    IsDualColorSupported {
        get => this.get_IsDualColorSupported()
    }

    /**
     * Gets the color cartridges that the printer station can use to print in color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.colorcartridgecapabilities
     * @type {Integer} 
     */
    ColorCartridgeCapabilities {
        get => this.get_ColorCartridgeCapabilities()
    }

    /**
     * Gets information about the sensors that the printer station has available to report the status of the printer station.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.cartridgesensors
     * @type {Integer} 
     */
    CartridgeSensors {
        get => this.get_CartridgeSensors()
    }

    /**
     * Gets whether the printer station can print bold characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.isboldsupported
     * @type {Boolean} 
     */
    IsBoldSupported {
        get => this.get_IsBoldSupported()
    }

    /**
     * Gets whether the printer station can print italic characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.isitalicsupported
     * @type {Boolean} 
     */
    IsItalicSupported {
        get => this.get_IsItalicSupported()
    }

    /**
     * Gets whether the printer station can underline characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.isunderlinesupported
     * @type {Boolean} 
     */
    IsUnderlineSupported {
        get => this.get_IsUnderlineSupported()
    }

    /**
     * Gets whether the printer station can print double-high characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.isdoublehighprintsupported
     * @type {Boolean} 
     */
    IsDoubleHighPrintSupported {
        get => this.get_IsDoubleHighPrintSupported()
    }

    /**
     * Gets whether the printer station can print double-wide characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.isdoublewideprintsupported
     * @type {Boolean} 
     */
    IsDoubleWidePrintSupported {
        get => this.get_IsDoubleWidePrintSupported()
    }

    /**
     * Gets whether the printer station can print characters that are both double-high and double-wide.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.isdoublehighdoublewideprintsupported
     * @type {Boolean} 
     */
    IsDoubleHighDoubleWidePrintSupported {
        get => this.get_IsDoubleHighDoubleWidePrintSupported()
    }

    /**
     * Gets whether the printer station has an out-of-paper sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.ispaperemptysensorsupported
     * @type {Boolean} 
     */
    IsPaperEmptySensorSupported {
        get => this.get_IsPaperEmptySensorSupported()
    }

    /**
     * Gets whether the printer station has a low-paper sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.ispapernearendsensorsupported
     * @type {Boolean} 
     */
    IsPaperNearEndSensorSupported {
        get => this.get_IsPaperNearEndSensorSupported()
    }

    /**
     * Gets a collection of the line widths in characters per line that the printer station supports.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonposprintstationcapabilities.supportedcharactersperline
     * @type {IVectorView<Integer>} 
     */
    SupportedCharactersPerLine {
        get => this.get_SupportedCharactersPerLine()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrinterPresent() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDualColorSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorCartridgeCapabilities() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CartridgeSensors() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBoldSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsItalicSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUnderlineSupported() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleHighPrintSupported() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleWidePrintSupported() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleHighDoubleWidePrintSupported() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaperEmptySensorSupported() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaperNearEndSensorSupported() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCharactersPerLine() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
