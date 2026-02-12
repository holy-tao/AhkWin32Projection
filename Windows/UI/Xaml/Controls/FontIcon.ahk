#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconElement.ahk
#Include .\IFontIcon.ahk
#Include .\IFontIcon2.ahk
#Include .\IFontIcon3.ahk
#Include .\IFontIconStatics2.ahk
#Include .\IFontIconStatics3.ahk
#Include .\IFontIconStatics.ahk
#Include .\IFontIconFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon that uses a glyph from the specified font.
 * @remarks
 * Use FontIcon to specify an icon using a [Glyph](fonticon_glyph.md) value from a [FontFamily](fonticon_fontfamily.md). You must have the font available for the glyphs to show. Glyph values are assigned by font developers to private Unicode values that don’t map to existing code points. Windows 10 uses the **Segoe MDL2 Assets** FontFamily, and the glyphs are included in the [Symbol](symbol.md) enumeration. 
 * 
 * You can set the [MirroredWhenRightToLeft](fonticon_mirroredwhenrighttoleft.md) property to have the glyph appear mirrored when the [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is [RightToLeft](../windows.ui.xaml/flowdirection.md). You typically use this property when a FontIcon is used to display an icon as part of a control template and the icon needs to be mirrored along with the rest of the control.
 * 
 * > [!NOTE]
 * > You can set the **Foreground** property on the [AppBarButton](appbarbutton.md) or on the FontIcon. If you set the [Foreground](control_foreground.md) on the [AppBarButton](appbarbutton.md), it's applied only to the default visual state. It's not applied to the other visual states defined in the [AppBarButton](appbarbutton.md) template, like `MouseOver`. If you set the [Foreground](iconelement_foreground.md) on the FontIcon, the color is applied to all visual states.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class FontIcon extends IconElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFontIcon

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFontIcon.IID

    /**
     * Identifies the [IsTextScaleFactorEnabled](fonticon_istextscalefactorenabled.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.istextscalefactorenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextScaleFactorEnabledProperty {
        get => FontIcon.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * Identifies the [MirroredWhenRightToLeft](fonticon_mirroredwhenrighttoleft.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.mirroredwhenrighttoleftproperty
     * @type {DependencyProperty} 
     */
    static MirroredWhenRightToLeftProperty {
        get => FontIcon.get_MirroredWhenRightToLeftProperty()
    }

    /**
     * Gets the identifier for the [Glyph](fonticon_glyph.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.glyphproperty
     * @type {DependencyProperty} 
     */
    static GlyphProperty {
        get => FontIcon.get_GlyphProperty()
    }

    /**
     * Gets the identifier for the [FontSize](fonticon_fontsize.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.fontsizeproperty
     * @type {DependencyProperty} 
     */
    static FontSizeProperty {
        get => FontIcon.get_FontSizeProperty()
    }

    /**
     * Gets the identifier for the [FontFamily](fonticon_fontfamily.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.fontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FontFamilyProperty {
        get => FontIcon.get_FontFamilyProperty()
    }

    /**
     * Gets the identifier for the [FontWeight](fonticon_fontweight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.fontweightproperty
     * @type {DependencyProperty} 
     */
    static FontWeightProperty {
        get => FontIcon.get_FontWeightProperty()
    }

    /**
     * Gets the identifier for the [FontStyle](fonticon_fontstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.fontstyleproperty
     * @type {DependencyProperty} 
     */
    static FontStyleProperty {
        get => FontIcon.get_FontStyleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextScaleFactorEnabledProperty() {
        if (!FontIcon.HasProp("__IFontIconStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconStatics2.IID)
            FontIcon.__IFontIconStatics2 := IFontIconStatics2(factoryPtr)
        }

        return FontIcon.__IFontIconStatics2.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MirroredWhenRightToLeftProperty() {
        if (!FontIcon.HasProp("__IFontIconStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconStatics3.IID)
            FontIcon.__IFontIconStatics3 := IFontIconStatics3(factoryPtr)
        }

        return FontIcon.__IFontIconStatics3.get_MirroredWhenRightToLeftProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlyphProperty() {
        if (!FontIcon.HasProp("__IFontIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconStatics.IID)
            FontIcon.__IFontIconStatics := IFontIconStatics(factoryPtr)
        }

        return FontIcon.__IFontIconStatics.get_GlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontSizeProperty() {
        if (!FontIcon.HasProp("__IFontIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconStatics.IID)
            FontIcon.__IFontIconStatics := IFontIconStatics(factoryPtr)
        }

        return FontIcon.__IFontIconStatics.get_FontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontFamilyProperty() {
        if (!FontIcon.HasProp("__IFontIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconStatics.IID)
            FontIcon.__IFontIconStatics := IFontIconStatics(factoryPtr)
        }

        return FontIcon.__IFontIconStatics.get_FontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontWeightProperty() {
        if (!FontIcon.HasProp("__IFontIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconStatics.IID)
            FontIcon.__IFontIconStatics := IFontIconStatics(factoryPtr)
        }

        return FontIcon.__IFontIconStatics.get_FontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStyleProperty() {
        if (!FontIcon.HasProp("__IFontIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconStatics.IID)
            FontIcon.__IFontIconStatics := IFontIconStatics(factoryPtr)
        }

        return FontIcon.__IFontIconStatics.get_FontStyleProperty()
    }

    /**
     * 
     * @returns {FontIcon} 
     */
    static CreateInstance() {
        if (!FontIcon.HasProp("__IFontIconFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconFactory.IID)
            FontIcon.__IFontIconFactory := IFontIconFactory(factoryPtr)
        }

        return FontIcon.__IFontIconFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the character code that identifies the icon glyph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.glyph
     * @type {HSTRING} 
     */
    Glyph {
        get => this.get_Glyph()
        set => this.put_Glyph(value)
    }

    /**
     * Gets or sets the size of the icon glyph.
     * @remarks
     * The unit measure for [FontSize](control_fontsize.md) is pixels, measuring the line height of the characters in the font. The apparent size of text in the UI can vary based on the current scaling. If you want to use different [FontSize](control_fontsize.md) values for different scalings, you can do this using the resources system.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.fontsize
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * Gets or sets the font used to display the icon glyph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.fontfamily
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * Gets or sets the thickness of the icon glyph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.fontweight
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * Gets or sets the font style for the icon glyph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets whether automatic text enlargement, to reflect the system text size setting, is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.istextscalefactorenabled
     * @type {Boolean} 
     */
    IsTextScaleFactorEnabled {
        get => this.get_IsTextScaleFactorEnabled()
        set => this.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the icon is mirrored when the [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is **RightToLeft**.
     * @remarks
     * You can set the MirroredWhenRightToLeft property to have the glyph appear mirrored when the [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is [RightToLeft](../windows.ui.xaml/flowdirection.md). You typically use this property when a [FontIcon](fonticon.md) is used to display an icon as part of a control template and the icon needs to be mirrored along with the rest of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticon.mirroredwhenrighttoleft
     * @type {Boolean} 
     */
    MirroredWhenRightToLeft {
        get => this.get_MirroredWhenRightToLeft()
        set => this.put_MirroredWhenRightToLeft(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Glyph() {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.get_Glyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Glyph(value) {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.put_Glyph(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontSize() {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.get_FontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontSize(value) {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.put_FontSize(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.get_FontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.put_FontFamily(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.get_FontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.put_FontWeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.get_FontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        if (!this.HasProp("__IFontIcon")) {
            if ((queryResult := this.QueryInterface(IFontIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon := IFontIcon(outPtr)
        }

        return this.__IFontIcon.put_FontStyle(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextScaleFactorEnabled() {
        if (!this.HasProp("__IFontIcon2")) {
            if ((queryResult := this.QueryInterface(IFontIcon2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon2 := IFontIcon2(outPtr)
        }

        return this.__IFontIcon2.get_IsTextScaleFactorEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextScaleFactorEnabled(value) {
        if (!this.HasProp("__IFontIcon2")) {
            if ((queryResult := this.QueryInterface(IFontIcon2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon2 := IFontIcon2(outPtr)
        }

        return this.__IFontIcon2.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MirroredWhenRightToLeft() {
        if (!this.HasProp("__IFontIcon3")) {
            if ((queryResult := this.QueryInterface(IFontIcon3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon3 := IFontIcon3(outPtr)
        }

        return this.__IFontIcon3.get_MirroredWhenRightToLeft()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MirroredWhenRightToLeft(value) {
        if (!this.HasProp("__IFontIcon3")) {
            if ((queryResult := this.QueryInterface(IFontIcon3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIcon3 := IFontIcon3(outPtr)
        }

        return this.__IFontIcon3.put_MirroredWhenRightToLeft(value)
    }

;@endregion Instance Methods
}
