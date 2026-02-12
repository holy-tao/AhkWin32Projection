#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IXamlLight.ahk
#Include .\IXamlLightProtected.ahk
#Include .\IXamlLightOverrides.ahk
#Include .\IXamlLightFactory.ahk
#Include .\IXamlLightStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class used to create XAML lights that use a [CompositionLight](./../windows.ui.composition/compositionlight.md) to apply lighting effects to XAML elements and brushes.
 * @remarks
 * You can use XamlLight to create custom lights.
 * 
 * For example, it can be used to create a light that applies a composition [SpotLight](/uwp/api/Windows.UI.Composition.SpotLight) to target elements to light them.
 * 
 * XamlLight provides methods for targeting UIElements or XAML Brushes, applying lights to trees of UIElements, and helping manage the lifetime of CompositionLight resources based on whether they're currently in use.
 * 
 * Custom XamlLights can be used in conjunction with custom Brushes derived from [XamlCompositionBrushBase](xamlcompositionbrushbase.md) which use a [SceneLightingEffect](/uwp/api/Windows.UI.Composition.Effects.SceneLightingEffect) to controls the reflective properties of elements when being lit by a XamlLight.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class XamlLight extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlLight

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlLight.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {XamlLight} 
     */
    static CreateInstance() {
        if (!XamlLight.HasProp("__IXamlLightFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.XamlLight")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlLightFactory.IID)
            XamlLight.__IXamlLightFactory := IXamlLightFactory(factoryPtr)
        }

        return XamlLight.__IXamlLightFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * Sets a [UIElement](/uwp/api/Windows.UI.Xaml.UIElement) as a target of a [XamlLight](XamlLight.md).
     * @param {HSTRING} lightId The identifier for the [XamlLight](XamlLight.md) that should target the [UIElement](/uwp/api/Windows.UI.Xaml.UIElement).
     * @param {UIElement} element The [UIElement](/uwp/api/Windows.UI.Xaml.UIElement) that the light should target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight.addtargetelement
     */
    static AddTargetElement(lightId, element) {
        if (!XamlLight.HasProp("__IXamlLightStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.XamlLight")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlLightStatics.IID)
            XamlLight.__IXamlLightStatics := IXamlLightStatics(factoryPtr)
        }

        return XamlLight.__IXamlLightStatics.AddTargetElement(lightId, element)
    }

    /**
     * Stops a [UIElement](/uwp/api/Windows.UI.Xaml.UIElement) from being a target of a [XamlLight](XamlLight.md).
     * @param {HSTRING} lightId The identifier for the [XamlLight](XamlLight.md) that should no longer target the [UIElement](/uwp/api/Windows.UI.Xaml.UIElement).
     * @param {UIElement} element The [UIElement](/uwp/api/Windows.UI.Xaml.UIElement) that the light should no longer target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight.removetargetelement
     */
    static RemoveTargetElement(lightId, element) {
        if (!XamlLight.HasProp("__IXamlLightStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.XamlLight")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlLightStatics.IID)
            XamlLight.__IXamlLightStatics := IXamlLightStatics(factoryPtr)
        }

        return XamlLight.__IXamlLightStatics.RemoveTargetElement(lightId, element)
    }

    /**
     * Sets a [Brush](/uwp/api/Windows.UI.Xaml.Media.Brush) as a target of a [XamlLight](XamlLight.md).
     * @param {HSTRING} lightId The identifier for the [XamlLight](XamlLight.md) that should target the [Brush](/uwp/api/Windows.UI.Xaml.Media.Brush).
     * @param {Brush} brush_ The [Brush](/uwp/api/Windows.UI.Xaml.Media.Brush) that the light should target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight.addtargetbrush
     */
    static AddTargetBrush(lightId, brush_) {
        if (!XamlLight.HasProp("__IXamlLightStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.XamlLight")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlLightStatics.IID)
            XamlLight.__IXamlLightStatics := IXamlLightStatics(factoryPtr)
        }

        return XamlLight.__IXamlLightStatics.AddTargetBrush(lightId, brush_)
    }

    /**
     * Stops a [Brush](/uwp/api/Windows.UI.Xaml.Media.Brush) from being a target of a [XamlLight](XamlLight.md).
     * @param {HSTRING} lightId The identifier for the [XamlLight](XamlLight.md) that should no longer target the [Brush](/uwp/api/Windows.UI.Xaml.Media.Brush).
     * @param {Brush} brush_ The [Brush](/uwp/api/Windows.UI.Xaml.Media.Brush) that the light should no longer target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight.removetargetbrush
     */
    static RemoveTargetBrush(lightId, brush_) {
        if (!XamlLight.HasProp("__IXamlLightStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.XamlLight")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlLightStatics.IID)
            XamlLight.__IXamlLightStatics := IXamlLightStatics(factoryPtr)
        }

        return XamlLight.__IXamlLightStatics.RemoveTargetBrush(lightId, brush_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [CompositionLight](./../windows.ui.composition/compositionlight.md) instance used to apply lighting effects.
     * @remarks
     * It's usually a good practice to manage the lifetime of the CompositionLight object by delaying its creation until needed and disposing of it when no longer in use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight.compositionlight
     * @type {CompositionLight} 
     */
    CompositionLight {
        get => this.get_CompositionLight()
        set => this.put_CompositionLight(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionLight} 
     */
    get_CompositionLight() {
        if (!this.HasProp("__IXamlLightProtected")) {
            if ((queryResult := this.QueryInterface(IXamlLightProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlLightProtected := IXamlLightProtected(outPtr)
        }

        return this.__IXamlLightProtected.get_CompositionLight()
    }

    /**
     * 
     * @param {CompositionLight} value 
     * @returns {HRESULT} 
     */
    put_CompositionLight(value) {
        if (!this.HasProp("__IXamlLightProtected")) {
            if ((queryResult := this.QueryInterface(IXamlLightProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlLightProtected := IXamlLightProtected(outPtr)
        }

        return this.__IXamlLightProtected.put_CompositionLight(value)
    }

    /**
     * Returns the identifier for the custom [XamlLight](xamllight.md) type.
     * 
     * In most cases you should use a unique identifier to prevent conflicts. For example, you can use the [FullName](/dotnet/api/system.type.fullname?view=dotnet-uwp-10.0&preserve-view=true) of your custom XamlLight type.
     * 
     * The identifier is used to add and remove Brushes and UIElements as targets for a specific light type.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight.getid
     */
    GetId() {
        if (!this.HasProp("__IXamlLightOverrides")) {
            if ((queryResult := this.QueryInterface(IXamlLightOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlLightOverrides := IXamlLightOverrides(outPtr)
        }

        return this.__IXamlLightOverrides.GetId()
    }

    /**
     * This method is automatically called when the XamlLight is first in use on the screen, or after being previously disconnected then used again.
     * 
     * This provides an opportunity to create resources such as the CompositionLight only when required.
     * 
     * [OnDisconnected](xamllight_ondisconnected_213178242.md) will be called when the XamlLight is no longer being used to light any UIElements or Brushes.
     * @param {UIElement} newElement The [UIElement](/uwp/api/Windows.UI.Xaml.UIElement) that the light is attached to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight.onconnected
     */
    OnConnected(newElement) {
        if (!this.HasProp("__IXamlLightOverrides")) {
            if ((queryResult := this.QueryInterface(IXamlLightOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlLightOverrides := IXamlLightOverrides(outPtr)
        }

        return this.__IXamlLightOverrides.OnConnected(newElement)
    }

    /**
     * This method is automatically called when the XamlLight is no longer in use anywhere on the screen.
     * 
     * This provides an opportunity to safely dispose of resources such as the CompositionLight when they aren't currently required.
     * 
     * [OnConnected](xamllight_onconnected_832156073.md) will be called again if the XamlLight is later used to light any UIElements or Brushes after being disconnected.
     * @param {UIElement} oldElement The [UIElement](/uwp/api/Windows.UI.Xaml.UIElement) that the light is attached to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.xamllight.ondisconnected
     */
    OnDisconnected(oldElement) {
        if (!this.HasProp("__IXamlLightOverrides")) {
            if ((queryResult := this.QueryInterface(IXamlLightOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlLightOverrides := IXamlLightOverrides(outPtr)
        }

        return this.__IXamlLightOverrides.OnDisconnected(oldElement)
    }

;@endregion Instance Methods
}
