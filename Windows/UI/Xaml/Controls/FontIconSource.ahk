#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconSource.ahk
#Include .\IFontIconSource.ahk
#Include .\IFontIconSourceStatics.ahk
#Include .\IFontIconSourceFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon source that uses a glyph from the specified font.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class FontIconSource extends IconSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFontIconSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFontIconSource.IID

    /**
     * Gets the identifier for the Glyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.GlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.glyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.glyphproperty
     * @type {DependencyProperty} 
     */
    static GlyphProperty {
        get => FontIconSource.get_GlyphProperty()
    }

    /**
     * Gets the identifier for the FontSize dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.FontSizeProperty](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.fontsizeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.fontsizeproperty
     * @type {DependencyProperty} 
     */
    static FontSizeProperty {
        get => FontIconSource.get_FontSizeProperty()
    }

    /**
     * Gets the identifier for the FontFamily dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.FontFamilyProperty](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.fontfamilyproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.fontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FontFamilyProperty {
        get => FontIconSource.get_FontFamilyProperty()
    }

    /**
     * Gets the identifier for the FontWeight dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.FontWeightProperty](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.fontweightproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.fontweightproperty
     * @type {DependencyProperty} 
     */
    static FontWeightProperty {
        get => FontIconSource.get_FontWeightProperty()
    }

    /**
     * Gets the identifier for the FontStyle dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.FontStyleProperty](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.fontstyleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.fontstyleproperty
     * @type {DependencyProperty} 
     */
    static FontStyleProperty {
        get => FontIconSource.get_FontStyleProperty()
    }

    /**
     * Gets the identifier for the IsTextScaleFactorEnabled dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.IsTextScaleFactorEnabledProperty](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.istextscalefactorenabledproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.istextscalefactorenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextScaleFactorEnabledProperty {
        get => FontIconSource.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * Gets the identifier for the MirroredWhenRightToLeft dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.MirroredWhenRightToLeftProperty](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.mirroredwhenrighttoleftproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.mirroredwhenrighttoleftproperty
     * @type {DependencyProperty} 
     */
    static MirroredWhenRightToLeftProperty {
        get => FontIconSource.get_MirroredWhenRightToLeftProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlyphProperty() {
        if (!FontIconSource.HasProp("__IFontIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconSourceStatics.IID)
            FontIconSource.__IFontIconSourceStatics := IFontIconSourceStatics(factoryPtr)
        }

        return FontIconSource.__IFontIconSourceStatics.get_GlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontSizeProperty() {
        if (!FontIconSource.HasProp("__IFontIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconSourceStatics.IID)
            FontIconSource.__IFontIconSourceStatics := IFontIconSourceStatics(factoryPtr)
        }

        return FontIconSource.__IFontIconSourceStatics.get_FontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontFamilyProperty() {
        if (!FontIconSource.HasProp("__IFontIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconSourceStatics.IID)
            FontIconSource.__IFontIconSourceStatics := IFontIconSourceStatics(factoryPtr)
        }

        return FontIconSource.__IFontIconSourceStatics.get_FontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontWeightProperty() {
        if (!FontIconSource.HasProp("__IFontIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconSourceStatics.IID)
            FontIconSource.__IFontIconSourceStatics := IFontIconSourceStatics(factoryPtr)
        }

        return FontIconSource.__IFontIconSourceStatics.get_FontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStyleProperty() {
        if (!FontIconSource.HasProp("__IFontIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconSourceStatics.IID)
            FontIconSource.__IFontIconSourceStatics := IFontIconSourceStatics(factoryPtr)
        }

        return FontIconSource.__IFontIconSourceStatics.get_FontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextScaleFactorEnabledProperty() {
        if (!FontIconSource.HasProp("__IFontIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconSourceStatics.IID)
            FontIconSource.__IFontIconSourceStatics := IFontIconSourceStatics(factoryPtr)
        }

        return FontIconSource.__IFontIconSourceStatics.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MirroredWhenRightToLeftProperty() {
        if (!FontIconSource.HasProp("__IFontIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconSourceStatics.IID)
            FontIconSource.__IFontIconSourceStatics := IFontIconSourceStatics(factoryPtr)
        }

        return FontIconSource.__IFontIconSourceStatics.get_MirroredWhenRightToLeftProperty()
    }

    /**
     * 
     * @returns {FontIconSource} 
     */
    static CreateInstance() {
        if (!FontIconSource.HasProp("__IFontIconSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FontIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontIconSourceFactory.IID)
            FontIconSource.__IFontIconSourceFactory := IFontIconSourceFactory(factoryPtr)
        }

        return FontIconSource.__IFontIconSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the character code that identifies the icon glyph.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.Glyph](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.glyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.glyph
     * @type {HSTRING} 
     */
    Glyph {
        get => this.get_Glyph()
        set => this.put_Glyph(value)
    }

    /**
     * Gets or sets the size of the icon glyph.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.FontSize](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.fontsize) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The unit measure for [FontSize](control_fontsize.md) is pixels, measuring the line height of the characters in the font. The apparent size of text in the UI can vary based on the current scaling. If you want to use different [FontSize](control_fontsize.md) values for different scalings, you can do this using the resources system.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.fontsize
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * Gets or sets the font used to display the icon glyph.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.FontFamily](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.fontfamily) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.fontfamily
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * Gets or sets the thickness of the icon glyph.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.FontWeight](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.fontweight) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.fontweight
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * Gets or sets the font style for the icon glyph.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.FontStyle](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.fontstyle) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets a value that indicates whether automatic text enlargement, to reflect the system text size setting, is enabled.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.IsTextScaleFactorEnabled](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.istextscalefactorenabled) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.istextscalefactorenabled
     * @type {Boolean} 
     */
    IsTextScaleFactorEnabled {
        get => this.get_IsTextScaleFactorEnabled()
        set => this.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the icon is mirrored when its containing element's [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is **RightToLeft**.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.FontIconSource.MirroredWhenRightToLeft](/windows/winui/api/microsoft.ui.xaml.controls.fonticonsource.mirroredwhenrighttoleft) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * You can set the [MirroredWhenRightToLeft](fonticon_mirroredwhenrighttoleft.md) property to have the glyph appear mirrored when its containing element's [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is [RightToLeft](../windows.ui.xaml/flowdirection.md). You typically use this property when a [FontIcon](fonticon.md) is used to display an icon as part of a control template and the icon needs to be mirrored along with the rest of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.fonticonsource.mirroredwhenrighttoleft
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
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.get_Glyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Glyph(value) {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.put_Glyph(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontSize() {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.get_FontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontSize(value) {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.put_FontSize(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.get_FontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.put_FontFamily(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.get_FontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.put_FontWeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.get_FontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.put_FontStyle(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextScaleFactorEnabled() {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.get_IsTextScaleFactorEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextScaleFactorEnabled(value) {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MirroredWhenRightToLeft() {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.get_MirroredWhenRightToLeft()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MirroredWhenRightToLeft(value) {
        if (!this.HasProp("__IFontIconSource")) {
            if ((queryResult := this.QueryInterface(IFontIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontIconSource := IFontIconSource(outPtr)
        }

        return this.__IFontIconSource.put_MirroredWhenRightToLeft(value)
    }

;@endregion Instance Methods
}
