#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClosedCaptionPropertiesStatics2.ahk
#Include .\IClosedCaptionPropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Exposes properties for retrieving the closed caption formatting settings that the user can set through the system's closed captioning settings page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties
 * @namespace Windows.Media.ClosedCaptioning
 * @version WindowsRuntime 1.4
 */
class ClosedCaptionProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets the font color for closed caption text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.fontcolor
     * @type {Integer} 
     */
    static FontColor {
        get => ClosedCaptionProperties.get_FontColor()
    }

    /**
     * Gets the computed font color for closed caption text.
     * @remarks
     * This property gets the font color computed by the system for optimal contrast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.computedfontcolor
     * @type {Color} 
     */
    static ComputedFontColor {
        get => ClosedCaptionProperties.get_ComputedFontColor()
    }

    /**
     * Gets the font opacity for closed caption text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.fontopacity
     * @type {Integer} 
     */
    static FontOpacity {
        get => ClosedCaptionProperties.get_FontOpacity()
    }

    /**
     * Gets the font size for closed caption text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.fontsize
     * @type {Integer} 
     */
    static FontSize {
        get => ClosedCaptionProperties.get_FontSize()
    }

    /**
     * Gets the font style for closed caption text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.fontstyle
     * @type {Integer} 
     */
    static FontStyle {
        get => ClosedCaptionProperties.get_FontStyle()
    }

    /**
     * Gets the font effect for closed caption text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.fonteffect
     * @type {Integer} 
     */
    static FontEffect {
        get => ClosedCaptionProperties.get_FontEffect()
    }

    /**
     * Gets the background color of lines of closed caption text.
     * @remarks
     * This property represents the color behind the character glyphs within individual lines of text. The background of the entire closed caption region can be determined with the [RegionColor](closedcaptionproperties_regioncolor.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.backgroundcolor
     * @type {Integer} 
     */
    static BackgroundColor {
        get => ClosedCaptionProperties.get_BackgroundColor()
    }

    /**
     * Gets the computed background color of lines of closed caption text.
     * @remarks
     * This property gets the background color computed by the system for optimal contrast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.computedbackgroundcolor
     * @type {Color} 
     */
    static ComputedBackgroundColor {
        get => ClosedCaptionProperties.get_ComputedBackgroundColor()
    }

    /**
     * Gets the background opacity of lines of closed caption text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.backgroundopacity
     * @type {Integer} 
     */
    static BackgroundOpacity {
        get => ClosedCaptionProperties.get_BackgroundOpacity()
    }

    /**
     * Gets the region color for closed caption text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.regioncolor
     * @type {Integer} 
     */
    static RegionColor {
        get => ClosedCaptionProperties.get_RegionColor()
    }

    /**
     * Gets the computed region color for closed caption text.
     * @remarks
     * This property gets the region color computed by the system for optimal contrast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.computedregioncolor
     * @type {Color} 
     */
    static ComputedRegionColor {
        get => ClosedCaptionProperties.get_ComputedRegionColor()
    }

    /**
     * Gets the region opacity for closed caption text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionproperties.regionopacity
     * @type {Integer} 
     */
    static RegionOpacity {
        get => ClosedCaptionProperties.get_RegionOpacity()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_PropertiesChanged(handler) {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics2.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics2 := IClosedCaptionPropertiesStatics2(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics2.add_PropertiesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_PropertiesChanged(token) {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics2.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics2 := IClosedCaptionPropertiesStatics2(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics2.remove_PropertiesChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_FontColor() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_FontColor()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_ComputedFontColor() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_ComputedFontColor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_FontOpacity() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_FontOpacity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_FontSize() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_FontSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_FontStyle() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_FontStyle()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_FontEffect() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_FontEffect()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BackgroundColor() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_BackgroundColor()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_ComputedBackgroundColor() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_ComputedBackgroundColor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BackgroundOpacity() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_BackgroundOpacity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RegionColor() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_RegionColor()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_ComputedRegionColor() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_ComputedRegionColor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RegionOpacity() {
        if (!ClosedCaptionProperties.HasProp("__IClosedCaptionPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.ClosedCaptioning.ClosedCaptionProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClosedCaptionPropertiesStatics.IID)
            ClosedCaptionProperties.__IClosedCaptionPropertiesStatics := IClosedCaptionPropertiesStatics(factoryPtr)
        }

        return ClosedCaptionProperties.__IClosedCaptionPropertiesStatics.get_RegionOpacity()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
