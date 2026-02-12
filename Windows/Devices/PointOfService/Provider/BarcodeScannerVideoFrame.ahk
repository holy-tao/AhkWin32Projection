#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerVideoFrame.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents data from a video frame that was acquired by using a [BarcodeScannerFrameReader](barcodescannerframereader.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannervideoframe
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerVideoFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerVideoFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerVideoFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the format of the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannervideoframe.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * Gets the width of the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannervideoframe.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannervideoframe.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the pixel data of the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannervideoframe.pixeldata
     * @type {IBuffer} 
     */
    PixelData {
        get => this.get_PixelData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__IBarcodeScannerVideoFrame")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerVideoFrame := IBarcodeScannerVideoFrame(outPtr)
        }

        return this.__IBarcodeScannerVideoFrame.get_Format()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IBarcodeScannerVideoFrame")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerVideoFrame := IBarcodeScannerVideoFrame(outPtr)
        }

        return this.__IBarcodeScannerVideoFrame.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IBarcodeScannerVideoFrame")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerVideoFrame := IBarcodeScannerVideoFrame(outPtr)
        }

        return this.__IBarcodeScannerVideoFrame.get_Height()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_PixelData() {
        if (!this.HasProp("__IBarcodeScannerVideoFrame")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerVideoFrame := IBarcodeScannerVideoFrame(outPtr)
        }

        return this.__IBarcodeScannerVideoFrame.get_PixelData()
    }

    /**
     * Disposes of the video frame and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannervideoframe.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
