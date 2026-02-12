#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFontWeights.ahk
#Include .\IFontWeightsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a set of predefined font weights as static property values.
 * @remarks
 * In standard typography API, the weight of a font is expressed by using constant names, for example "Bold". Using constant names for setting a font weight property is supported through type converter behaviors and also by the FontWeights support class. For code access, the relevant information is expressed as the **Weight** factor of a [FontWeight](fontweight.md) value.
 * 
 * This image shows the various font weight values applied to text.
 * 
 * <img alt="Various font weight values applied to text" src="images/font-weights.png" />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class FontWeights extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFontWeights

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFontWeights.IID

    /**
     * Specifies a font weight value of 900.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.black
     * @type {FontWeight} 
     */
    static Black {
        get => FontWeights.get_Black()
    }

    /**
     * Specifies a font weight value of 700.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.bold
     * @type {FontWeight} 
     */
    static Bold {
        get => FontWeights.get_Bold()
    }

    /**
     * Specifies a font weight value of 950.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.extrablack
     * @type {FontWeight} 
     */
    static ExtraBlack {
        get => FontWeights.get_ExtraBlack()
    }

    /**
     * Specifies a font weight value of 800.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.extrabold
     * @type {FontWeight} 
     */
    static ExtraBold {
        get => FontWeights.get_ExtraBold()
    }

    /**
     * Specifies a font weight value of 200.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.extralight
     * @type {FontWeight} 
     */
    static ExtraLight {
        get => FontWeights.get_ExtraLight()
    }

    /**
     * Specifies a font weight value of 300.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.light
     * @type {FontWeight} 
     */
    static Light {
        get => FontWeights.get_Light()
    }

    /**
     * Specifies a font weight value of 500.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.medium
     * @type {FontWeight} 
     */
    static Medium {
        get => FontWeights.get_Medium()
    }

    /**
     * Specifies a font weight value of 400.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.normal
     * @type {FontWeight} 
     */
    static Normal {
        get => FontWeights.get_Normal()
    }

    /**
     * Specifies a font weight value of 600.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.semibold
     * @type {FontWeight} 
     */
    static SemiBold {
        get => FontWeights.get_SemiBold()
    }

    /**
     * Specifies a font weight value of 350.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.semilight
     * @type {FontWeight} 
     */
    static SemiLight {
        get => FontWeights.get_SemiLight()
    }

    /**
     * Specifies a font weight value of 100.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweights.thin
     * @type {FontWeight} 
     */
    static Thin {
        get => FontWeights.get_Thin()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {FontWeight} 
     */
    static get_Black() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_Black()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_Bold() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_Bold()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_ExtraBlack() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_ExtraBlack()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_ExtraBold() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_ExtraBold()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_ExtraLight() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_ExtraLight()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_Light() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_Light()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_Medium() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_Medium()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_Normal() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_Normal()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_SemiBold() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_SemiBold()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_SemiLight() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_SemiLight()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    static get_Thin() {
        if (!FontWeights.HasProp("__IFontWeightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.FontWeights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontWeightsStatics.IID)
            FontWeights.__IFontWeightsStatics := IFontWeightsStatics(factoryPtr)
        }

        return FontWeights.__IFontWeightsStatics.get_Thin()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
