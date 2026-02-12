#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageScannerFormatConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the auto-configured scan source of the scanner.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerautoconfiguration
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerAutoConfiguration extends IInspectable {
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
     * The default file format for the scan source at the beginning of a new scan session.
     * @remarks
     * All WIA scanner devices support the Windows Device Independent Bitmap (DIB) format.
     * 
     * By default, these values in this order will be selected based on the file formats the device supports, from the smallest file size (in bytes) to the largest size:
     * 
     * 
     * + 1. Jpeg
     * + 2. Png
     * + 3. Bitmap
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerautoconfiguration.defaultformat
     * @type {Integer} 
     */
    DefaultFormat {
        get => this.get_DefaultFormat()
    }

    /**
     * Gets or sets the current file transfer format for image data acquisition from the device to the client app.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerautoconfiguration.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
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
     * Determines if the input scanner supports the specified file format.
     * @param {Integer} value The file type.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerautoconfiguration.isformatsupported
     */
    IsFormatSupported(value) {
        if (!this.HasProp("__IImageScannerFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(IImageScannerFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerFormatConfiguration := IImageScannerFormatConfiguration(outPtr)
        }

        return this.__IImageScannerFormatConfiguration.IsFormatSupported(value)
    }

;@endregion Instance Methods
}
