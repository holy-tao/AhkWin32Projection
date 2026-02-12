#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Brush.ahk
#Include .\ISolidColorBrush.ahk
#Include .\ISolidColorBrushFactory.ahk
#Include .\ISolidColorBrushStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Paints an area with a solid color. The solid color is defined by a [Color](../windows.ui/color.md) value.
 * @remarks
 * A SolidColorBrush is the most common type of [Brush](brush.md) that is used for many possible UI properties that use a [Brush](brush.md) to fill some or all of an object's visual area in app UI. Examples of some of the most commonly-used properties that use a [Brush](brush.md) value include: [Control.Background](../windows.ui.xaml.controls/control_background.md), [Control.Foreground](../windows.ui.xaml.controls/control_foreground.md), [Shape.Fill](../windows.ui.xaml.shapes/shape_fill.md), [Control.BorderBrush](../windows.ui.xaml.controls/control_borderbrush.md), [Panel.Background](../windows.ui.xaml.controls/panel_background.md), [TextBlock.Foreground](../windows.ui.xaml.controls/textblock_foreground.md).
 * 
 * For these properties, a **null** value is often acceptable, and has the result that nothing is rendered there. If the element appears in the same coordinate space as other elements, the **null** value for a property such as **Background** causes that element to not register for purposes of hit-testing, and determining where an input event should be sourced from. Any pointer events, gestures or so on that occur on that point in the UI coordinate space are only detectable when there's a value other than **null** for the [Brush](brush.md) property that influences rendering for that point.
 * 
 * A SolidColorBrush can be created that uses the [Transparent](../windows.ui/colors_transparent.md) value, and although this doesn't visually apply any changes to UI (it's transparent), that point is detectable for hit-testing purposes. So this is different than a [Brush](brush.md) property with a **null** value. A [Transparent](../windows.ui/colors_transparent.md) brush can be useful for techniques such as creating overlay regions over UI elements where you want to intercept the hit testing with an element like a [Rectangle](../windows.ui.xaml.shapes/rectangle.md), [Border](../windows.ui.xaml.controls/border.md) or panel. You might do this if the elements underneath aren't able to do their own hit-testing, but you still want to detect input events. For more info on hit testing, see "Hit testing" section of [Mouse interactions](/windows/uwp/input-and-devices/mouse-interactions).
 * 
 * Properties using brushes can be animated as part of transitions or decorative animations. You don't typically animate an entire SolidColorBrush object, you'd have to use a discrete **Object** animation and that's neither efficient nor aesthetic. Instead, you use property targeting to animate just the [Color](solidcolorbrush_color.md) value, using one of the dedicated animation types that can animate a [Color](../windows.ui/color.md) value. This usually involves having `.(SolidColorBrush.Color)` be a part of the [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) value. For more info on property targeting and how to animate properties that use SolidColorBrush or other [Brush](brush.md) values, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * 
 * A SolidColorBrush is a shareable object, as are the other derived types of [Brush](brush.md) such as [LinearGradientBrush](lineargradientbrush.md) and [ImageBrush](imagebrush.md). Because it's shareable a SolidColorBrush is sometimes defined in XAML as a resource in a XAML [ResourceDictionary](../windows.ui.xaml/resourcedictionary.md). The advantage of using shareable resources from XAML is that you're only creating the value once and applying it to multiple properties.
 * 
 * Applying a [UIElement.Opacity](../windows.ui.xaml/uielement_opacity.md) value can change the color appearance of a SolidColorBrush property applied to an object. The [UIElement.Opacity](../windows.ui.xaml/uielement_opacity.md) value can be cumulative depending on the layout of objects that overlap. The colors appear as expected only when the net **Opacity** value is 1. There's also a [Brush.Opacity](brush_opacity.md) property that can affect the apparent color similarly. [Brush.Opacity](brush_opacity.md) is usually left at its default value of 1, unless it's being deliberately animated for a fade-in or fade-out effect.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.solidcolorbrush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class SolidColorBrush extends Brush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISolidColorBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISolidColorBrush.IID

    /**
     * Identifies the [Color](solidcolorbrush_color.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.solidcolorbrush.colorproperty
     * @type {DependencyProperty} 
     */
    static ColorProperty {
        get => SolidColorBrush.get_ColorProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [SolidColorBrush](solidcolorbrush.md) class with the specified [Color](../windows.ui/color.md).
     * @param {Color} color_ The color to apply to the brush.
     * @returns {SolidColorBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.solidcolorbrush.#ctor
     */
    static CreateInstanceWithColor(color_) {
        if (!SolidColorBrush.HasProp("__ISolidColorBrushFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.SolidColorBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISolidColorBrushFactory.IID)
            SolidColorBrush.__ISolidColorBrushFactory := ISolidColorBrushFactory(factoryPtr)
        }

        return SolidColorBrush.__ISolidColorBrushFactory.CreateInstanceWithColor(color_)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorProperty() {
        if (!SolidColorBrush.HasProp("__ISolidColorBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.SolidColorBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISolidColorBrushStatics.IID)
            SolidColorBrush.__ISolidColorBrushStatics := ISolidColorBrushStatics(factoryPtr)
        }

        return SolidColorBrush.__ISolidColorBrushStatics.get_ColorProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the color of this [SolidColorBrush](solidcolorbrush.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.solidcolorbrush.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SolidColorBrush](solidcolorbrush.md) class with no color.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.SolidColorBrush")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__ISolidColorBrush")) {
            if ((queryResult := this.QueryInterface(ISolidColorBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISolidColorBrush := ISolidColorBrush(outPtr)
        }

        return this.__ISolidColorBrush.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__ISolidColorBrush")) {
            if ((queryResult := this.QueryInterface(ISolidColorBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISolidColorBrush := ISolidColorBrush(outPtr)
        }

        return this.__ISolidColorBrush.put_Color(value)
    }

;@endregion Instance Methods
}
