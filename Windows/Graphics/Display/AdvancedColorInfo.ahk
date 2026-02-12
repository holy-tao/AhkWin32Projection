#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdvancedColorInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains a snapshot of the Advanced Color-related information of a monitor or display driver.
 * @remarks
 * Advanced color is a Windows developer term indicating support for high dynamic range (HDR), wide color gamut (WCG), and high precision (bit depth) visual content such as videos, games and photos. To use advanced color, your computer must have an advanced color-capable GPU and display; further, the composition and display stack must enter a new advanced color mode that uses FP16 rendering and composition. 
 * 
 * To exploit advanced color, applications must be updated with enhanced rendering pipelines (for example, DirectX) and they must detect and adapt to the specific capabilities of the current display. In terms of API design, advanced color has similarities to features such as high DPI and stereoscopic 3D. 
 * 
 * * Apps need to understand the current feature state, such as if HDR active, and what kind of HDR is active. Apps mus also understand the quantitative display characteristics (for example, peak luminance, color primaries) and underlying capabilities of the hardware (for example, can HDR be enabled at all). 
 * 
 * * User action or OS policy can change the feature state and display characteristics at any time.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class AdvancedColorInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdvancedColorInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdvancedColorInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [AdvancedColorKind](advancedcolorkind.md) which is currently being set on the display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.currentadvancedcolorkind
     * @type {Integer} 
     */
    CurrentAdvancedColorKind {
        get => this.get_CurrentAdvancedColorKind()
    }

    /**
     * Gets the native Red color primary for the display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.redprimary
     * @type {POINT} 
     */
    RedPrimary {
        get => this.get_RedPrimary()
    }

    /**
     * Gets the native Green color primary for the display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.greenprimary
     * @type {POINT} 
     */
    GreenPrimary {
        get => this.get_GreenPrimary()
    }

    /**
     * Gets the native Blue color primary for the display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.blueprimary
     * @type {POINT} 
     */
    BluePrimary {
        get => this.get_BluePrimary()
    }

    /**
     * Gets the native white point for the display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.whitepoint
     * @type {POINT} 
     */
    WhitePoint {
        get => this.get_WhitePoint()
    }

    /**
     * Gets the maximum peak luminance of the display in nits, which is usually valid for a small part of the display.
     * @remarks
     * Contrast with [MaxAverageFullFrameLuminanceInNits](advancedcolorinfo_maxaveragefullframeluminanceinnits.md), which describes the luminance for the entire display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.maxluminanceinnits
     * @type {Float} 
     */
    MaxLuminanceInNits {
        get => this.get_MaxLuminanceInNits()
    }

    /**
     * Get the minimum luminance of the display in nits.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.minluminanceinnits
     * @type {Float} 
     */
    MinLuminanceInNits {
        get => this.get_MinLuminanceInNits()
    }

    /**
     * Gets the maximum frame average luminance of the display which can be achieved on the whole display.
     * @remarks
     * Contrast with [MaxLuminanceInNits](advancedcolorinfo_maxluminanceinnits.md), which generally refers to a small portion of the display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.maxaveragefullframeluminanceinnits
     * @type {Float} 
     */
    MaxAverageFullFrameLuminanceInNits {
        get => this.get_MaxAverageFullFrameLuminanceInNits()
    }

    /**
     * Get the luminance value, in nits, which is currently being used by the operating system for all the SDR content on this display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.sdrwhitelevelinnits
     * @type {Float} 
     */
    SdrWhiteLevelInNits {
        get => this.get_SdrWhiteLevelInNits()
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
    get_CurrentAdvancedColorKind() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_CurrentAdvancedColorKind()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_RedPrimary() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_RedPrimary()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_GreenPrimary() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_GreenPrimary()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_BluePrimary() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_BluePrimary()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_WhitePoint() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_WhitePoint()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxLuminanceInNits() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_MaxLuminanceInNits()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinLuminanceInNits() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_MinLuminanceInNits()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAverageFullFrameLuminanceInNits() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_MaxAverageFullFrameLuminanceInNits()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SdrWhiteLevelInNits() {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.get_SdrWhiteLevelInNits()
    }

    /**
     * Returns a boolean value that describes whether the specified HDR metadata format is supported by the display in its current state.
     * @param {Integer} format The HDR metadata format to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.ishdrmetadataformatcurrentlysupported
     */
    IsHdrMetadataFormatCurrentlySupported(format) {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.IsHdrMetadataFormatCurrentlySupported(format)
    }

    /**
     * Returns a boolean value that describes if the specified Advanced Color kind value is inherently supported by the monitor or display driver.
     * @remarks
     * This method returns the static capability of the system and has nothing to do with the current state.
     * @param {Integer} kind The Advanced Color kind to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorinfo.isadvancedcolorkindavailable
     */
    IsAdvancedColorKindAvailable(kind) {
        if (!this.HasProp("__IAdvancedColorInfo")) {
            if ((queryResult := this.QueryInterface(IAdvancedColorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedColorInfo := IAdvancedColorInfo(outPtr)
        }

        return this.__IAdvancedColorInfo.IsAdvancedColorKindAvailable(kind)
    }

;@endregion Instance Methods
}
