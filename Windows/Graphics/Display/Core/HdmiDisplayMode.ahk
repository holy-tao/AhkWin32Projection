#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHdmiDisplayMode.ahk
#Include .\IHdmiDisplayMode2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the display mode of a connected device such as a TV or a monitor. It provides info about the display capabilities of the device, such as the number of bits per pixel, colorspace, type of pixel encoding, refresh rate, and more.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class HdmiDisplayMode extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHdmiDisplayMode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHdmiDisplayMode.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device's resolution width in raw pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.resolutionwidthinrawpixels
     * @type {Integer} 
     */
    ResolutionWidthInRawPixels {
        get => this.get_ResolutionWidthInRawPixels()
    }

    /**
     * Gets the device's resolution height in raw pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.resolutionheightinrawpixels
     * @type {Integer} 
     */
    ResolutionHeightInRawPixels {
        get => this.get_ResolutionHeightInRawPixels()
    }

    /**
     * Gets the device's refresh rate, in Hertz (Hz).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.refreshrate
     * @type {Float} 
     */
    RefreshRate {
        get => this.get_RefreshRate()
    }

    /**
     * Gets the value that indicates whether stereoscorpic 3D is enabled on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.stereoenabled
     * @type {Boolean} 
     */
    StereoEnabled {
        get => this.get_StereoEnabled()
    }

    /**
     * Gets the number of bits per pixel. It specifies the number of bits used in a pixel.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.bitsperpixel
     * @type {Integer} 
     */
    BitsPerPixel {
        get => this.get_BitsPerPixel()
    }

    /**
     * Gets the color space.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.colorspace
     * @type {Integer} 
     */
    ColorSpace {
        get => this.get_ColorSpace()
    }

    /**
     * Gets the type of pixel encoding the device uses for rendering display content.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.pixelencoding
     * @type {Integer} 
     */
    PixelEncoding {
        get => this.get_PixelEncoding()
    }

    /**
     * Gets the value that indicates whether standard dynamic range (SDR) luminance levels are supported by the device.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.issdrluminancesupported
     * @type {Boolean} 
     */
    IsSdrLuminanceSupported {
        get => this.get_IsSdrLuminanceSupported()
    }

    /**
     * Gets the value that indicates whether the SMPTE (Society of Motion Picture and Television Engineers) ST 2084 electo-optical transfer function (EOTF) is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.issmpte2084supported
     * @type {Boolean} 
     */
    IsSmpte2084Supported {
        get => this.get_IsSmpte2084Supported()
    }

    /**
     * Indicates whether 10 bit display metadata is supported on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.is2086metadatasupported
     * @type {Boolean} 
     */
    Is2086MetadataSupported {
        get => this.get_Is2086MetadataSupported()
    }

    /**
     * Indicates whether the low-latency profile for Dolby Vision is supported on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.isdolbyvisionlowlatencysupported
     * @type {Boolean} 
     */
    IsDolbyVisionLowLatencySupported {
        get => this.get_IsDolbyVisionLowLatencySupported()
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
    get_ResolutionWidthInRawPixels() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_ResolutionWidthInRawPixels()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResolutionHeightInRawPixels() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_ResolutionHeightInRawPixels()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RefreshRate() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_RefreshRate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StereoEnabled() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_StereoEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerPixel() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_BitsPerPixel()
    }

    /**
     * Checks to see whether the current display mode is equal to a specific display mode.
     * @param {HdmiDisplayMode} mode_ 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaymode.isequal
     */
    IsEqual(mode_) {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.IsEqual(mode_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpace() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_ColorSpace()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelEncoding() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_PixelEncoding()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSdrLuminanceSupported() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_IsSdrLuminanceSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSmpte2084Supported() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_IsSmpte2084Supported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Is2086MetadataSupported() {
        if (!this.HasProp("__IHdmiDisplayMode")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode := IHdmiDisplayMode(outPtr)
        }

        return this.__IHdmiDisplayMode.get_Is2086MetadataSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDolbyVisionLowLatencySupported() {
        if (!this.HasProp("__IHdmiDisplayMode2")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayMode2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayMode2 := IHdmiDisplayMode2(outPtr)
        }

        return this.__IHdmiDisplayMode2.get_IsDolbyVisionLowLatencySupported()
    }

;@endregion Instance Methods
}
