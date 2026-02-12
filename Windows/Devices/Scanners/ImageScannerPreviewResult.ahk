#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageScannerPreviewResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a preview scan job.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerpreviewresult
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerPreviewResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageScannerPreviewResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageScannerPreviewResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the scan preview was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerpreviewresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * Gets the format of the data for the scan preview. After preview this property is restored to the value before preview.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerpreviewresult.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
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
    get_Succeeded() {
        if (!this.HasProp("__IImageScannerPreviewResult")) {
            if ((queryResult := this.QueryInterface(IImageScannerPreviewResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerPreviewResult := IImageScannerPreviewResult(outPtr)
        }

        return this.__IImageScannerPreviewResult.get_Succeeded()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__IImageScannerPreviewResult")) {
            if ((queryResult := this.QueryInterface(IImageScannerPreviewResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerPreviewResult := IImageScannerPreviewResult(outPtr)
        }

        return this.__IImageScannerPreviewResult.get_Format()
    }

;@endregion Instance Methods
}
