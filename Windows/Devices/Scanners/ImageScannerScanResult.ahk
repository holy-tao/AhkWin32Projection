#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageScannerScanResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a scan job.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerscanresult
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerScanResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageScannerScanResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageScannerScanResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of scanned image files that was produced by the completed scan job.
     * @remarks
     * When nothing is scanned, the **IVectorView&lt;T&gt;.Size** property will be set to 0. The app should check the size to make sure there are actual files before attempting to access the files.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerscanresult.scannedfiles
     * @type {IVectorView<StorageFile>} 
     */
    ScannedFiles {
        get => this.get_ScannedFiles()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<StorageFile>} 
     */
    get_ScannedFiles() {
        if (!this.HasProp("__IImageScannerScanResult")) {
            if ((queryResult := this.QueryInterface(IImageScannerScanResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScannerScanResult := IImageScannerScanResult(outPtr)
        }

        return this.__IImageScannerScanResult.get_ScannedFiles()
    }

;@endregion Instance Methods
}
