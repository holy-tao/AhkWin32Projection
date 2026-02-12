#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Brush.ahk
#Include .\IXamlCompositionBrushBase.ahk
#Include .\IXamlCompositionBrushBaseProtected.ahk
#Include .\IXamlCompositionBrushBaseOverrides.ahk
#Include .\IXamlCompositionBrushBaseStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class used to create XAML brushes that paint an area with a [CompositionBrush](./../windows.ui.composition/compositionbrush.md).
 * @remarks
 * You can use XamlCompositionBrushBase to create custom brushes. 
 * 
 * For example, it can be used to create a brush that applies [effects](/windows/uwp/composition/composition-effects) to XAML UIElements using a [CompositionEffectBrush](/uwp/api/Windows.UI.Composition.CompositionEffectBrush), or a [SceneLightingEffect](/uwp/api/Windows.UI.Composition.Effects.SceneLightingEffect) that controls the reflective properties of elements when being lit by a [XamlLight](xamllight.md), or a whole series of effects chained together to produce something more complex.
 * 
 * When creating a brush, it's usually a good practice to delay creating a [CompositionBrush](./../windows.ui.composition/compositionbrush.md) and any related resources until the brush is being used. The [OnConnected](xamlcompositionbrushbase_onconnected_591765711.md) method is called when a brush is first used on screen to paint an element, so you can override [OnConnected](xamlcompositionbrushbase_onconnected_591765711.md) to safely create resources only when they're needed. This means you can create an instance of a brush in a ResourceDictionary then reference that brush resource later from other parts of UI definitions and only pay the cost of creating composition resources when the brush is actually in use.
 * 
 * It's also a good practice to dispose of composition resources when they're no longer in use. The [OnDisconnected](xamlcompositionbrushbase_ondisconnected_510183142.md) method is called when a brush instance is no longer in use anywhere on the screen, so you can override [OnDisconnected](xamlcompositionbrushbase_ondisconnected_510183142.md) to safely dispose of resources. If the brush is later used again after being disconnected then [OnConnected](xamlcompositionbrushbase_onconnected_591765711.md) will be called again.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamlcompositionbrushbase
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class XamlCompositionBrushBase extends Brush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlCompositionBrushBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlCompositionBrushBase.IID

    /**
     * Identifies the **FallbackColor** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamlcompositionbrushbase.fallbackcolorproperty
     * @type {DependencyProperty} 
     */
    static FallbackColorProperty {
        get => XamlCompositionBrushBase.get_FallbackColorProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FallbackColorProperty() {
        if (!XamlCompositionBrushBase.HasProp("__IXamlCompositionBrushBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.XamlCompositionBrushBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlCompositionBrushBaseStatics.IID)
            XamlCompositionBrushBase.__IXamlCompositionBrushBaseStatics := IXamlCompositionBrushBaseStatics(factoryPtr)
        }

        return XamlCompositionBrushBase.__IXamlCompositionBrushBaseStatics.get_FallbackColorProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The color to use for rendering in case the [CompositionBrush](./../windows.ui.composition/compositionbrush.md) can't be rendered.
     * @remarks
     * Some cases where the [CompositionBrush](./../windows.ui.composition/compositionbrush.md) can't be rendered include:
     * - in the Visual Studio visual designer
     * - when printing
     * - in software rendering mode
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamlcompositionbrushbase.fallbackcolor
     * @type {Color} 
     */
    FallbackColor {
        get => this.get_FallbackColor()
        set => this.put_FallbackColor(value)
    }

    /**
     * Gets or sets the [CompositionBrush](./../windows.ui.composition/compositionbrush.md) used by this XAML brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamlcompositionbrushbase.compositionbrush
     * @type {CompositionBrush} 
     */
    CompositionBrush {
        get => this.get_CompositionBrush()
        set => this.put_CompositionBrush(value)
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
    get_FallbackColor() {
        if (!this.HasProp("__IXamlCompositionBrushBase")) {
            if ((queryResult := this.QueryInterface(IXamlCompositionBrushBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlCompositionBrushBase := IXamlCompositionBrushBase(outPtr)
        }

        return this.__IXamlCompositionBrushBase.get_FallbackColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_FallbackColor(value) {
        if (!this.HasProp("__IXamlCompositionBrushBase")) {
            if ((queryResult := this.QueryInterface(IXamlCompositionBrushBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlCompositionBrushBase := IXamlCompositionBrushBase(outPtr)
        }

        return this.__IXamlCompositionBrushBase.put_FallbackColor(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_CompositionBrush() {
        if (!this.HasProp("__IXamlCompositionBrushBaseProtected")) {
            if ((queryResult := this.QueryInterface(IXamlCompositionBrushBaseProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlCompositionBrushBaseProtected := IXamlCompositionBrushBaseProtected(outPtr)
        }

        return this.__IXamlCompositionBrushBaseProtected.get_CompositionBrush()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_CompositionBrush(value) {
        if (!this.HasProp("__IXamlCompositionBrushBaseProtected")) {
            if ((queryResult := this.QueryInterface(IXamlCompositionBrushBaseProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlCompositionBrushBaseProtected := IXamlCompositionBrushBaseProtected(outPtr)
        }

        return this.__IXamlCompositionBrushBaseProtected.put_CompositionBrush(value)
    }

    /**
     * Invoked when a brush is first used on screen to paint an element. 
     * 
     * When implemented in a derived class, you can create a [CompositionBrush](./../windows.ui.composition/compositionbrush.md) instance and provide it to the framework by setting the [CompositionBrush](xamlcompositionbrushbase_compositionbrush.md) property.
     * 
     * [OnDisconnected](xamlcompositionbrushbase_ondisconnected_510183142.md) will be called when the brush is no longer being used to paint any elements.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamlcompositionbrushbase.onconnected
     */
    OnConnected() {
        if (!this.HasProp("__IXamlCompositionBrushBaseOverrides")) {
            if ((queryResult := this.QueryInterface(IXamlCompositionBrushBaseOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlCompositionBrushBaseOverrides := IXamlCompositionBrushBaseOverrides(outPtr)
        }

        return this.__IXamlCompositionBrushBaseOverrides.OnConnected()
    }

    /**
     * Invoked when the brush is no longer being used to paint any elements. 
     * 
     * When implemented in a derived class, you can safely dispose of the compostion brush and other composition resources.
     * 
     * [OnConnected](xamlcompositionbrushbase_onconnected_591765711.md) will be called again if the brush is later used to paint any elements after being disconnected.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamlcompositionbrushbase.ondisconnected
     */
    OnDisconnected() {
        if (!this.HasProp("__IXamlCompositionBrushBaseOverrides")) {
            if ((queryResult := this.QueryInterface(IXamlCompositionBrushBaseOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlCompositionBrushBaseOverrides := IXamlCompositionBrushBaseOverrides(outPtr)
        }

        return this.__IXamlCompositionBrushBaseOverrides.OnDisconnected()
    }

;@endregion Instance Methods
}
