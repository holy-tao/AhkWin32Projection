#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Configures the file format when a scanner input source transfers acquired image data to the app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannerformatconfiguration
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class IImageScannerFormatConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageScannerFormatConfiguration
     * @type {Guid}
     */
    static IID => Guid("{ae275d11-dadf-4010-bf10-cca5c83dcbb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultFormat", "get_Format", "put_Format", "IsFormatSupported"]

    /**
     * Gets the default file format for the scan source at the beginning of a new scan session.
     * @remarks
     * All WIA scanner devices support the Windows Device Independent Bitmap (DIB) format.
     * 
     * By default, these values in this order will be selected based on the file formats the device supports, from the smallest file size (in bytes) to the largest size:
     * 
     * 
     * + 1. Jpeg
     * + 2. Png
     * + 3. Bitmap
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannerformatconfiguration.defaultformat
     * @type {Integer} 
     */
    DefaultFormat {
        get => this.get_DefaultFormat()
    }

    /**
     * Gets or sets the current file transfer format for image data acquisition from the device to the client app.
     * @remarks
     * When a new scan session starts, this property is set to the default file format. See the [DefaultFormat](iimagescannerformatconfiguration_defaultformat.md) property on how this is done.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannerformatconfiguration.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultFormat() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_Format(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the input scanner supports the specified file format or not.
     * @param {Integer} value The file type.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannerformatconfiguration.isformatsupported
     */
    IsFormatSupported(value) {
        result := ComCall(9, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
