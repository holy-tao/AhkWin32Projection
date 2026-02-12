#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\XamlCompositionBrushBase.ahk
#Include .\IAcrylicBrush.ahk
#Include .\IAcrylicBrush2.ahk
#Include .\IAcrylicBrushStatics2.ahk
#Include .\IAcrylicBrushFactory.ahk
#Include .\IAcrylicBrushStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Paints an area with a semi-transparent material that uses multiple effects including blur and a noise texture.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class AcrylicBrush extends XamlCompositionBrushBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAcrylicBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAcrylicBrush.IID

    /**
     * Identifies the [TintLuminosityOpacity](acrylicbrush_tintluminosityopacity.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.TintLuminosityOpacityProperty](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.tintluminosityopacityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.tintluminosityopacityproperty
     * @type {DependencyProperty} 
     */
    static TintLuminosityOpacityProperty {
        get => AcrylicBrush.get_TintLuminosityOpacityProperty()
    }

    /**
     * Identifies the BackgroundSource dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.BackgroundSourceProperty](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.backgroundsourceproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.backgroundsourceproperty
     * @type {DependencyProperty} 
     */
    static BackgroundSourceProperty {
        get => AcrylicBrush.get_BackgroundSourceProperty()
    }

    /**
     * Identifies the TintColor dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.TintColorProperty](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.tintcolorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.tintcolorproperty
     * @type {DependencyProperty} 
     */
    static TintColorProperty {
        get => AcrylicBrush.get_TintColorProperty()
    }

    /**
     * Identifies the TintOpacity dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.TintOpacityProperty](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.tintopacityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.tintopacityproperty
     * @type {DependencyProperty} 
     */
    static TintOpacityProperty {
        get => AcrylicBrush.get_TintOpacityProperty()
    }

    /**
     * Identifies the TintTransitionDuration dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.TintTransitionDurationProperty](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.tinttransitiondurationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.tinttransitiondurationproperty
     * @type {DependencyProperty} 
     */
    static TintTransitionDurationProperty {
        get => AcrylicBrush.get_TintTransitionDurationProperty()
    }

    /**
     * Identifies the AlwaysUseFallback dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.AlwaysUseFallbackProperty](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.alwaysusefallbackproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.alwaysusefallbackproperty
     * @type {DependencyProperty} 
     */
    static AlwaysUseFallbackProperty {
        get => AcrylicBrush.get_AlwaysUseFallbackProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TintLuminosityOpacityProperty() {
        if (!AcrylicBrush.HasProp("__IAcrylicBrushStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.AcrylicBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcrylicBrushStatics2.IID)
            AcrylicBrush.__IAcrylicBrushStatics2 := IAcrylicBrushStatics2(factoryPtr)
        }

        return AcrylicBrush.__IAcrylicBrushStatics2.get_TintLuminosityOpacityProperty()
    }

    /**
     * 
     * @returns {AcrylicBrush} 
     */
    static CreateInstance() {
        if (!AcrylicBrush.HasProp("__IAcrylicBrushFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.AcrylicBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcrylicBrushFactory.IID)
            AcrylicBrush.__IAcrylicBrushFactory := IAcrylicBrushFactory(factoryPtr)
        }

        return AcrylicBrush.__IAcrylicBrushFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundSourceProperty() {
        if (!AcrylicBrush.HasProp("__IAcrylicBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.AcrylicBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcrylicBrushStatics.IID)
            AcrylicBrush.__IAcrylicBrushStatics := IAcrylicBrushStatics(factoryPtr)
        }

        return AcrylicBrush.__IAcrylicBrushStatics.get_BackgroundSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TintColorProperty() {
        if (!AcrylicBrush.HasProp("__IAcrylicBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.AcrylicBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcrylicBrushStatics.IID)
            AcrylicBrush.__IAcrylicBrushStatics := IAcrylicBrushStatics(factoryPtr)
        }

        return AcrylicBrush.__IAcrylicBrushStatics.get_TintColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TintOpacityProperty() {
        if (!AcrylicBrush.HasProp("__IAcrylicBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.AcrylicBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcrylicBrushStatics.IID)
            AcrylicBrush.__IAcrylicBrushStatics := IAcrylicBrushStatics(factoryPtr)
        }

        return AcrylicBrush.__IAcrylicBrushStatics.get_TintOpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TintTransitionDurationProperty() {
        if (!AcrylicBrush.HasProp("__IAcrylicBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.AcrylicBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcrylicBrushStatics.IID)
            AcrylicBrush.__IAcrylicBrushStatics := IAcrylicBrushStatics(factoryPtr)
        }

        return AcrylicBrush.__IAcrylicBrushStatics.get_TintTransitionDurationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlwaysUseFallbackProperty() {
        if (!AcrylicBrush.HasProp("__IAcrylicBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.AcrylicBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcrylicBrushStatics.IID)
            AcrylicBrush.__IAcrylicBrushStatics := IAcrylicBrushStatics(factoryPtr)
        }

        return AcrylicBrush.__IAcrylicBrushStatics.get_AlwaysUseFallbackProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that specifies whether the brush samples from the app content or from the content behind the app window.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.BackgroundSource](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.backgroundsource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.backgroundsource
     * @type {Integer} 
     */
    BackgroundSource {
        get => this.get_BackgroundSource()
        set => this.put_BackgroundSource(value)
    }

    /**
     * Gets or sets the color tint for the semi-transparent acrylic material.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.TintColor](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.tintcolor) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.tintcolor
     * @type {Color} 
     */
    TintColor {
        get => this.get_TintColor()
        set => this.put_TintColor(value)
    }

    /**
     * Gets or sets the degree of opacity of the color tint.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.TintOpacity](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.tintopacity) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.tintopacity
     * @type {Float} 
     */
    TintOpacity {
        get => this.get_TintOpacity()
        set => this.put_TintOpacity(value)
    }

    /**
     * Gets or sets the length of the automatic transition animation used when the TintColor changes.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.TintTransitionDuration](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.tinttransitionduration) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.tinttransitionduration
     * @type {TimeSpan} 
     */
    TintTransitionDuration {
        get => this.get_TintTransitionDuration()
        set => this.put_TintTransitionDuration(value)
    }

    /**
     * Gets or sets a value that specifies whether the brush is forced to the solid fallback color.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.AlwaysUseFallback](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.alwaysusefallback) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * By default, the acrylic material is replaced with a solid color when one of the fallback conditions is met (such as entering battery saver mode). You can set this property to **true** to always replace the acrylic material with a solid color. Setting this property will synchronously trigger a transition animation between the normal look and fallback color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.alwaysusefallback
     * @type {Boolean} 
     */
    AlwaysUseFallback {
        get => this.get_AlwaysUseFallback()
        set => this.put_AlwaysUseFallback(value)
    }

    /**
     * Gets or sets the brightness amount between the TintColor and the underlying pixels behind the Acrylic surface.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBrush.TintLuminosityOpacity](/windows/winui/api/microsoft.ui.xaml.media.acrylicbrush.tintluminosityopacity) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The TintLuminosityOpacity determines how much brightness, from the underlying pixels behind the Acrylic, to let through the blurred surface. A lower value means more brightness from the underlying pixels will be allowed through and a higher value means more brightness from the [TintColor](/uwp/api/microsoft.ui.xaml.media.acrylicbrush.tintcolor?view=winui-2.2) property will be applied across the Acrylic surface.
     * 
     * TintLuminosityOpacity also helps balance any blacks or whites behind the Acrylic.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbrush.tintluminosityopacity
     * @type {IReference<Float>} 
     */
    TintLuminosityOpacity {
        get => this.get_TintLuminosityOpacity()
        set => this.put_TintLuminosityOpacity(value)
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
    get_BackgroundSource() {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.get_BackgroundSource()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackgroundSource(value) {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.put_BackgroundSource(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_TintColor() {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.get_TintColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_TintColor(value) {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.put_TintColor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TintOpacity() {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.get_TintOpacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TintOpacity(value) {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.put_TintOpacity(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TintTransitionDuration() {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.get_TintTransitionDuration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TintTransitionDuration(value) {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.put_TintTransitionDuration(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysUseFallback() {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.get_AlwaysUseFallback()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysUseFallback(value) {
        if (!this.HasProp("__IAcrylicBrush")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush := IAcrylicBrush(outPtr)
        }

        return this.__IAcrylicBrush.put_AlwaysUseFallback(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_TintLuminosityOpacity() {
        if (!this.HasProp("__IAcrylicBrush2")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush2 := IAcrylicBrush2(outPtr)
        }

        return this.__IAcrylicBrush2.get_TintLuminosityOpacity()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_TintLuminosityOpacity(value) {
        if (!this.HasProp("__IAcrylicBrush2")) {
            if ((queryResult := this.QueryInterface(IAcrylicBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcrylicBrush2 := IAcrylicBrush2(outPtr)
        }

        return this.__IAcrylicBrush2.put_TintLuminosityOpacity(value)
    }

;@endregion Instance Methods
}
