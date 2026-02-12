#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\XamlCompositionBrushBase.ahk
#Include .\IRevealBrush.ahk
#Include .\IRevealBrushStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * > [!Important]
  * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
  * 
  * Base class for brushes that use composition effects and lighting to implement the reveal visual design treatment.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush](/windows/winui/api/microsoft.ui.xaml.media.revealbrush) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RevealBrush extends XamlCompositionBrushBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRevealBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRevealBrush.IID

    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * 
     * Identifies the Color dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.ColorProperty](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.colorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.colorproperty
     * @type {DependencyProperty} 
     */
    static ColorProperty {
        get => RevealBrush.get_ColorProperty()
    }

    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * 
     * Identifies the TargetTheme dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.TargetThemeProperty](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.targetthemeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.targetthemeproperty
     * @type {DependencyProperty} 
     */
    static TargetThemeProperty {
        get => RevealBrush.get_TargetThemeProperty()
    }

    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * 
     * Identifies the AlwaysUseFallback dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.AlwaysUseFallbackProperty](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.alwaysusefallbackproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.alwaysusefallbackproperty
     * @type {DependencyProperty} 
     */
    static AlwaysUseFallbackProperty {
        get => RevealBrush.get_AlwaysUseFallbackProperty()
    }

    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * 
     * Identifies the [RevealBrush.State](revealbrush_state.md) attached property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.StateProperty](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.stateproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.stateproperty
     * @type {DependencyProperty} 
     */
    static StateProperty {
        get => RevealBrush.get_StateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorProperty() {
        if (!RevealBrush.HasProp("__IRevealBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RevealBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRevealBrushStatics.IID)
            RevealBrush.__IRevealBrushStatics := IRevealBrushStatics(factoryPtr)
        }

        return RevealBrush.__IRevealBrushStatics.get_ColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetThemeProperty() {
        if (!RevealBrush.HasProp("__IRevealBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RevealBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRevealBrushStatics.IID)
            RevealBrush.__IRevealBrushStatics := IRevealBrushStatics(factoryPtr)
        }

        return RevealBrush.__IRevealBrushStatics.get_TargetThemeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlwaysUseFallbackProperty() {
        if (!RevealBrush.HasProp("__IRevealBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RevealBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRevealBrushStatics.IID)
            RevealBrush.__IRevealBrushStatics := IRevealBrushStatics(factoryPtr)
        }

        return RevealBrush.__IRevealBrushStatics.get_AlwaysUseFallbackProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StateProperty() {
        if (!RevealBrush.HasProp("__IRevealBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RevealBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRevealBrushStatics.IID)
            RevealBrush.__IRevealBrushStatics := IRevealBrushStatics(factoryPtr)
        }

        return RevealBrush.__IRevealBrushStatics.get_StateProperty()
    }

    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * 
     * Sets the value of the [RevealBrush.State](revealbrush_state.md) XAML attached property for a target element.
     * 
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.SetState(Windows.UI.Xaml.UIElement,Microsoft.UI.Xaml.Media.RevealBrushState)](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.setstate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {UIElement} element The object to which the property value is written.
     * @param {Integer} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.setstate
     */
    static SetState(element, value) {
        if (!RevealBrush.HasProp("__IRevealBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RevealBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRevealBrushStatics.IID)
            RevealBrush.__IRevealBrushStatics := IRevealBrushStatics(factoryPtr)
        }

        return RevealBrush.__IRevealBrushStatics.SetState(element, value)
    }

    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * 
     * Gets the value of the [RevealBrush.State](revealbrush_state.md) XAML attached property for the target element.
     * 
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.GetState(Windows.UI.Xaml.UIElement)](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.getstate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.getstate
     */
    static GetState(element) {
        if (!RevealBrush.HasProp("__IRevealBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RevealBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRevealBrushStatics.IID)
            RevealBrush.__IRevealBrushStatics := IRevealBrushStatics(factoryPtr)
        }

        return RevealBrush.__IRevealBrushStatics.GetState(element)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * Gets or sets a value that specifies the base background color for the brush.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.Color](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.color) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * 
     * Gets or sets a value that specifies the theme used to draw the brush and light, to ensure that the correct composition effect recipe is used for the desired theme.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.TargetTheme](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.targettheme) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.targettheme
     * @type {Integer} 
     */
    TargetTheme {
        get => this.get_TargetTheme()
        set => this.put_TargetTheme(value)
    }

    /**
     * > [!Important]
     * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
     * 
     * Gets or sets a value that specifies whether the brush is forced to the solid fallback color.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrush.AlwaysUseFallback](/windows/winui/api/microsoft.ui.xaml.media.revealbrush.alwaysusefallback) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * By default, the reveal effect is replaced with a solid color and default ambient lighting when one of the fallback conditions is met (such as entering battery saver mode). You can set this property to **true** to always replace the reveal effect with the fallback values. Setting this property will synchronously trigger a transition animation between the normal look and fallback color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrush.alwaysusefallback
     * @type {Boolean} 
     */
    AlwaysUseFallback {
        get => this.get_AlwaysUseFallback()
        set => this.put_AlwaysUseFallback(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__IRevealBrush")) {
            if ((queryResult := this.QueryInterface(IRevealBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevealBrush := IRevealBrush(outPtr)
        }

        return this.__IRevealBrush.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IRevealBrush")) {
            if ((queryResult := this.QueryInterface(IRevealBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevealBrush := IRevealBrush(outPtr)
        }

        return this.__IRevealBrush.put_Color(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TargetTheme() {
        if (!this.HasProp("__IRevealBrush")) {
            if ((queryResult := this.QueryInterface(IRevealBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevealBrush := IRevealBrush(outPtr)
        }

        return this.__IRevealBrush.get_TargetTheme()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TargetTheme(value) {
        if (!this.HasProp("__IRevealBrush")) {
            if ((queryResult := this.QueryInterface(IRevealBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevealBrush := IRevealBrush(outPtr)
        }

        return this.__IRevealBrush.put_TargetTheme(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysUseFallback() {
        if (!this.HasProp("__IRevealBrush")) {
            if ((queryResult := this.QueryInterface(IRevealBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevealBrush := IRevealBrush(outPtr)
        }

        return this.__IRevealBrush.get_AlwaysUseFallback()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysUseFallback(value) {
        if (!this.HasProp("__IRevealBrush")) {
            if ((queryResult := this.QueryInterface(IRevealBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevealBrush := IRevealBrush(outPtr)
        }

        return this.__IRevealBrush.put_AlwaysUseFallback(value)
    }

;@endregion Instance Methods
}
