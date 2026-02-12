#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IBorder.ahk
#Include .\IBorder2.ahk
#Include .\IBorderStatics2.ahk
#Include .\IBorderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Draws a border, background, or both, around another object.
 * @remarks
 * Border is a container control that draws a border, background, or both, around another object. Here's a gray border around two rectangles.
 * 
 * <img alt="A border around 2 rectangles" src="images/controls/Border.png" />
 * 
 * You can specify basic properties of a Border by setting its [Width](../windows.ui.xaml/frameworkelement_width.md), [Height](../windows.ui.xaml/frameworkelement_height.md), [BorderBrush](border_borderbrush.md), [BorderThickness](border_borderthickness.md), and [Background](border_background.md) color. In addition, you can round the border corners by setting the [CornerRadius](border_cornerradius.md) property, and you can position the object inside the Border by setting the [Padding](border_padding.md) property.
 * 
 * A Border can contain only one child object. If you want to put a border around multiple objects, wrap them in a container object such as [StackPanel](stackpanel.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Border extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBorder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBorder.IID

    /**
     * Identifies the BackgroundSizing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.backgroundsizingproperty
     * @type {DependencyProperty} 
     */
    static BackgroundSizingProperty {
        get => Border.get_BackgroundSizingProperty()
    }

    /**
     * Identifies the [BorderBrush](border_borderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.borderbrushproperty
     * @type {DependencyProperty} 
     */
    static BorderBrushProperty {
        get => Border.get_BorderBrushProperty()
    }

    /**
     * Identifies the [BorderThickness](border_borderthickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.borderthicknessproperty
     * @type {DependencyProperty} 
     */
    static BorderThicknessProperty {
        get => Border.get_BorderThicknessProperty()
    }

    /**
     * Identifies the [Background](border_background.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.backgroundproperty
     * @type {DependencyProperty} 
     */
    static BackgroundProperty {
        get => Border.get_BackgroundProperty()
    }

    /**
     * Identifies the [CornerRadius](border_cornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.cornerradiusproperty
     * @type {DependencyProperty} 
     */
    static CornerRadiusProperty {
        get => Border.get_CornerRadiusProperty()
    }

    /**
     * Identifies the [Padding](border_padding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => Border.get_PaddingProperty()
    }

    /**
     * Identifies the [ChildTransitions](border_childtransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.childtransitionsproperty
     * @type {DependencyProperty} 
     */
    static ChildTransitionsProperty {
        get => Border.get_ChildTransitionsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundSizingProperty() {
        if (!Border.HasProp("__IBorderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Border")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBorderStatics2.IID)
            Border.__IBorderStatics2 := IBorderStatics2(factoryPtr)
        }

        return Border.__IBorderStatics2.get_BackgroundSizingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderBrushProperty() {
        if (!Border.HasProp("__IBorderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Border")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBorderStatics.IID)
            Border.__IBorderStatics := IBorderStatics(factoryPtr)
        }

        return Border.__IBorderStatics.get_BorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderThicknessProperty() {
        if (!Border.HasProp("__IBorderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Border")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBorderStatics.IID)
            Border.__IBorderStatics := IBorderStatics(factoryPtr)
        }

        return Border.__IBorderStatics.get_BorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundProperty() {
        if (!Border.HasProp("__IBorderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Border")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBorderStatics.IID)
            Border.__IBorderStatics := IBorderStatics(factoryPtr)
        }

        return Border.__IBorderStatics.get_BackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CornerRadiusProperty() {
        if (!Border.HasProp("__IBorderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Border")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBorderStatics.IID)
            Border.__IBorderStatics := IBorderStatics(factoryPtr)
        }

        return Border.__IBorderStatics.get_CornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!Border.HasProp("__IBorderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Border")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBorderStatics.IID)
            Border.__IBorderStatics := IBorderStatics(factoryPtr)
        }

        return Border.__IBorderStatics.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildTransitionsProperty() {
        if (!Border.HasProp("__IBorderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Border")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBorderStatics.IID)
            Border.__IBorderStatics := IBorderStatics(factoryPtr)
        }

        return Border.__IBorderStatics.get_ChildTransitionsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) that is applied to the edge area of the [Border](border.md).
     * @remarks
     * The [BorderThickness](border_borderthickness.md) value must be greater than 0 in order to see the BorderBrush value take effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.borderbrush
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
        set => this.put_BorderBrush(value)
    }

    /**
     * Gets or sets the thickness of the border.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.borderthickness
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
        set => this.put_BorderThickness(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) that fills the background (inner area) of the border.
     * @remarks
     * The Background value for a [Border](border.md) is visible underneath the inner area if the element that is the [Child](border_child.md) element has transparency or null value brushes for any of its defining area. It is also visible between the border edge and the [Child](border_child.md) content if nonzero values are applied for a [Padding](border_padding.md) value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.background
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * Gets or sets the radius for the corners of the border.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.cornerradius
     * @type {CornerRadius} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * Gets or sets the distance between the border and its child object.
     * @remarks
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets the child element to draw the border around.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.child
     * @type {UIElement} 
     */
    Child {
        get => this.get_Child()
        set => this.put_Child(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to child content of a [Border](border.md).
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in the UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * 
     * It's not common to set the value of the ChildTransitions property directly on a [Border](border.md) that is a direct element of app UI. It's more common to have a transitions collection be a part of a visual state, template or style. In this case you use mechanisms such as [Setter](../windows.ui.xaml/setter.md) of a [Style](../windows.ui.xaml/style.md) to specify the ChildTransitions property. Styles are typically stored as a XAML resource.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.childtransitions
     * @type {TransitionCollection} 
     */
    ChildTransitions {
        get => this.get_ChildTransitions()
        set => this.put_ChildTransitions(value)
    }

    /**
     * Gets or sets a value that indicates how far the background extends in relation to this element's border.
     * @remarks
     * You can set this property to **OuterBorderEdge** to make the element's background extend under the border. If the border is transparent, the background will show through it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.backgroundsizing
     * @type {Integer} 
     */
    BackgroundSizing {
        get => this.get_BackgroundSizing()
        set => this.put_BackgroundSizing(value)
    }

    /**
     * Gets or sets an instance of BrushTransition to automatically animate changes to the Background property.
     * @remarks
     * Use this property to animate any change to the [Background](border_background.md) property. When a new value is set from code or through data binding, the change is animated from the old value to the new value, rather than happening instantaneously.  
     * 
     * Even though the transition animation takes time, the change to the actual property value is instantaneous. For example, if you change a property from code and then read it back, you’ll see the new value, even though the visual effect of the property change is somewhere between the new and the old.
     * 
     * If a property value changes a second time while the first change is still animating, the animation will use the currently animated value as the "starting" value for the next animation, and then animate to the new "final" value. The duration will be reset.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.border.backgroundtransition
     * @type {BrushTransition} 
     */
    BackgroundTransition {
        get => this.get_BackgroundTransition()
        set => this.put_BackgroundTransition(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Border](border.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Border")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.get_BorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BorderBrush(value) {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.put_BorderBrush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.get_BorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_BorderThickness(value) {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.put_BorderThickness(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.get_Background()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.put_Background(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CornerRadius() {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.get_CornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CornerRadius(value) {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.put_CornerRadius(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.put_Padding(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Child() {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.get_Child()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Child(value) {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.put_Child(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ChildTransitions() {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.get_ChildTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ChildTransitions(value) {
        if (!this.HasProp("__IBorder")) {
            if ((queryResult := this.QueryInterface(IBorder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder := IBorder(outPtr)
        }

        return this.__IBorder.put_ChildTransitions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSizing() {
        if (!this.HasProp("__IBorder2")) {
            if ((queryResult := this.QueryInterface(IBorder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder2 := IBorder2(outPtr)
        }

        return this.__IBorder2.get_BackgroundSizing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackgroundSizing(value) {
        if (!this.HasProp("__IBorder2")) {
            if ((queryResult := this.QueryInterface(IBorder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder2 := IBorder2(outPtr)
        }

        return this.__IBorder2.put_BackgroundSizing(value)
    }

    /**
     * 
     * @returns {BrushTransition} 
     */
    get_BackgroundTransition() {
        if (!this.HasProp("__IBorder2")) {
            if ((queryResult := this.QueryInterface(IBorder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder2 := IBorder2(outPtr)
        }

        return this.__IBorder2.get_BackgroundTransition()
    }

    /**
     * 
     * @param {BrushTransition} value 
     * @returns {HRESULT} 
     */
    put_BackgroundTransition(value) {
        if (!this.HasProp("__IBorder2")) {
            if ((queryResult := this.QueryInterface(IBorder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBorder2 := IBorder2(outPtr)
        }

        return this.__IBorder2.put_BackgroundTransition(value)
    }

;@endregion Instance Methods
}
