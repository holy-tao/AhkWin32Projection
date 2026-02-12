#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RatingItemInfo.ahk
#Include .\IRatingItemFontInfo.ahk
#Include .\IRatingItemFontInfoStatics.ahk
#Include .\IRatingItemFontInfoFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information about the visual states of font elements that represent a rating.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RatingItemFontInfo extends RatingItemInfo {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRatingItemFontInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRatingItemFontInfo.IID

    /**
     * Identifies the DisabledGlyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.DisabledGlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.disabledglyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.disabledglyphproperty
     * @type {DependencyProperty} 
     */
    static DisabledGlyphProperty {
        get => RatingItemFontInfo.get_DisabledGlyphProperty()
    }

    /**
     * Identifies the Glyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.GlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.glyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.glyphproperty
     * @type {DependencyProperty} 
     */
    static GlyphProperty {
        get => RatingItemFontInfo.get_GlyphProperty()
    }

    /**
     * Identifies the PlaceholderGlyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.PlaceholderGlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.placeholderglyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.placeholderglyphproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderGlyphProperty {
        get => RatingItemFontInfo.get_PlaceholderGlyphProperty()
    }

    /**
     * Identifies the PointerOverGlyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.PointerOverGlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.pointeroverglyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.pointeroverglyphproperty
     * @type {DependencyProperty} 
     */
    static PointerOverGlyphProperty {
        get => RatingItemFontInfo.get_PointerOverGlyphProperty()
    }

    /**
     * Identifies the PointerOverPlaceholderGlyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.PointerOverPlaceholderGlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.pointeroverplaceholderglyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.pointeroverplaceholderglyphproperty
     * @type {DependencyProperty} 
     */
    static PointerOverPlaceholderGlyphProperty {
        get => RatingItemFontInfo.get_PointerOverPlaceholderGlyphProperty()
    }

    /**
     * Identifies the UnsetGlyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.UnsetGlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.unsetglyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.unsetglyphproperty
     * @type {DependencyProperty} 
     */
    static UnsetGlyphProperty {
        get => RatingItemFontInfo.get_UnsetGlyphProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisabledGlyphProperty() {
        if (!RatingItemFontInfo.HasProp("__IRatingItemFontInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemFontInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemFontInfoStatics.IID)
            RatingItemFontInfo.__IRatingItemFontInfoStatics := IRatingItemFontInfoStatics(factoryPtr)
        }

        return RatingItemFontInfo.__IRatingItemFontInfoStatics.get_DisabledGlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlyphProperty() {
        if (!RatingItemFontInfo.HasProp("__IRatingItemFontInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemFontInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemFontInfoStatics.IID)
            RatingItemFontInfo.__IRatingItemFontInfoStatics := IRatingItemFontInfoStatics(factoryPtr)
        }

        return RatingItemFontInfo.__IRatingItemFontInfoStatics.get_GlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderGlyphProperty() {
        if (!RatingItemFontInfo.HasProp("__IRatingItemFontInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemFontInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemFontInfoStatics.IID)
            RatingItemFontInfo.__IRatingItemFontInfoStatics := IRatingItemFontInfoStatics(factoryPtr)
        }

        return RatingItemFontInfo.__IRatingItemFontInfoStatics.get_PlaceholderGlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverGlyphProperty() {
        if (!RatingItemFontInfo.HasProp("__IRatingItemFontInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemFontInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemFontInfoStatics.IID)
            RatingItemFontInfo.__IRatingItemFontInfoStatics := IRatingItemFontInfoStatics(factoryPtr)
        }

        return RatingItemFontInfo.__IRatingItemFontInfoStatics.get_PointerOverGlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverPlaceholderGlyphProperty() {
        if (!RatingItemFontInfo.HasProp("__IRatingItemFontInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemFontInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemFontInfoStatics.IID)
            RatingItemFontInfo.__IRatingItemFontInfoStatics := IRatingItemFontInfoStatics(factoryPtr)
        }

        return RatingItemFontInfo.__IRatingItemFontInfoStatics.get_PointerOverPlaceholderGlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UnsetGlyphProperty() {
        if (!RatingItemFontInfo.HasProp("__IRatingItemFontInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemFontInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemFontInfoStatics.IID)
            RatingItemFontInfo.__IRatingItemFontInfoStatics := IRatingItemFontInfoStatics(factoryPtr)
        }

        return RatingItemFontInfo.__IRatingItemFontInfoStatics.get_UnsetGlyphProperty()
    }

    /**
     * 
     * @returns {RatingItemFontInfo} 
     */
    static CreateInstance() {
        if (!RatingItemFontInfo.HasProp("__IRatingItemFontInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemFontInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemFontInfoFactory.IID)
            RatingItemFontInfo.__IRatingItemFontInfoFactory := IRatingItemFontInfoFactory(factoryPtr)
        }

        return RatingItemFontInfo.__IRatingItemFontInfoFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a Segoe MDL2 Assets font glyph that represents a rating element that is disabled.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.DisabledGlyph](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.disabledglyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.disabledglyph
     * @type {HSTRING} 
     */
    DisabledGlyph {
        get => this.get_DisabledGlyph()
        set => this.put_DisabledGlyph(value)
    }

    /**
     * Gets or sets a Segoe MDL2 Assets font glyph that represents a rating element that has been set by the user.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.Glyph](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.glyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.glyph
     * @type {HSTRING} 
     */
    Glyph {
        get => this.get_Glyph()
        set => this.put_Glyph(value)
    }

    /**
     * Gets or sets a Segoe MDL2 Assets font glyph that represents a rating element that has the pointer over it.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.PointerOverGlyph](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.pointeroverglyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.pointeroverglyph
     * @type {HSTRING} 
     */
    PointerOverGlyph {
        get => this.get_PointerOverGlyph()
        set => this.put_PointerOverGlyph(value)
    }

    /**
     * Gets or sets a Segoe MDL2 Assets font glyph that represents a rating element showing a placeholder value with the pointer over it.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.PointerOverPlaceholderGlyph](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.pointeroverplaceholderglyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.pointeroverplaceholderglyph
     * @type {HSTRING} 
     */
    PointerOverPlaceholderGlyph {
        get => this.get_PointerOverPlaceholderGlyph()
        set => this.put_PointerOverPlaceholderGlyph(value)
    }

    /**
     * Gets or sets a Segoe MDL2 Assets font glyph that represents a rating element that is showing a placeholder value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.PlaceholderGlyph](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.placeholderglyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.placeholderglyph
     * @type {HSTRING} 
     */
    PlaceholderGlyph {
        get => this.get_PlaceholderGlyph()
        set => this.put_PlaceholderGlyph(value)
    }

    /**
     * Gets or sets a Segoe MDL2 Assets font glyph that represents a rating element that has not been set.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemFontInfo.UnsetGlyph](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemfontinfo.unsetglyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemfontinfo.unsetglyph
     * @type {HSTRING} 
     */
    UnsetGlyph {
        get => this.get_UnsetGlyph()
        set => this.put_UnsetGlyph(value)
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
    get_DisabledGlyph() {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.get_DisabledGlyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisabledGlyph(value) {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.put_DisabledGlyph(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Glyph() {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.get_Glyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Glyph(value) {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.put_Glyph(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PointerOverGlyph() {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.get_PointerOverGlyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PointerOverGlyph(value) {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.put_PointerOverGlyph(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PointerOverPlaceholderGlyph() {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.get_PointerOverPlaceholderGlyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PointerOverPlaceholderGlyph(value) {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.put_PointerOverPlaceholderGlyph(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderGlyph() {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.get_PlaceholderGlyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderGlyph(value) {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.put_PlaceholderGlyph(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnsetGlyph() {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.get_UnsetGlyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UnsetGlyph(value) {
        if (!this.HasProp("__IRatingItemFontInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemFontInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemFontInfo := IRatingItemFontInfo(outPtr)
        }

        return this.__IRatingItemFontInfo.put_UnsetGlyph(value)
    }

;@endregion Instance Methods
}
