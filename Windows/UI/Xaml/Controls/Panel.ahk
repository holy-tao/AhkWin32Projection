#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IPanel.ahk
#Include .\IPanel2.ahk
#Include .\IPanelStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for all Panel elements. Use Panel elements to position and arrange child objects in a UI page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Panel extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPanel.IID

    /**
     * Identifies the [Background](panel_background.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel.backgroundproperty
     * @type {DependencyProperty} 
     */
    static BackgroundProperty {
        get => Panel.get_BackgroundProperty()
    }

    /**
     * Identifies the [IsItemsHost](panel_isitemshost.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel.isitemshostproperty
     * @type {DependencyProperty} 
     */
    static IsItemsHostProperty {
        get => Panel.get_IsItemsHostProperty()
    }

    /**
     * Identifies the [ChildrenTransitions](panel_childrentransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel.childrentransitionsproperty
     * @type {DependencyProperty} 
     */
    static ChildrenTransitionsProperty {
        get => Panel.get_ChildrenTransitionsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundProperty() {
        if (!Panel.HasProp("__IPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Panel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPanelStatics.IID)
            Panel.__IPanelStatics := IPanelStatics(factoryPtr)
        }

        return Panel.__IPanelStatics.get_BackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsItemsHostProperty() {
        if (!Panel.HasProp("__IPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Panel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPanelStatics.IID)
            Panel.__IPanelStatics := IPanelStatics(factoryPtr)
        }

        return Panel.__IPanelStatics.get_IsItemsHostProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildrenTransitionsProperty() {
        if (!Panel.HasProp("__IPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Panel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPanelStatics.IID)
            Panel.__IPanelStatics := IPanelStatics(factoryPtr)
        }

        return Panel.__IPanelStatics.get_ChildrenTransitionsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of child elements of the panel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel.children
     * @type {UIElementCollection} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * Gets or sets a [Brush](../windows.ui.xaml.media/brush.md) that fills the panel content area.
     * @remarks
     * The Background value for a [Panel](panel.md)-derived panel is visible underneath the inner area if the elements that are in the [Children](panel_children.md) collection have transparency or null brushes for any of their defining area. It displays in the child margin area for any case where a child element has a nonzero [Margin](../windows.ui.xaml/frameworkelement_margin.md) affecting its position. It is also visible between the layout positions of any child elements regardless of margin, although that can depend on how the panel implements its layout behavior. For example, in a [Canvas](canvas.md), any pixel in the content area where there's not an absolutely positioned element covering it will show the panel Background brush.
     * 
     * If you're using a [Panel](panel.md) class such as [Grid](grid.md) or [StackPanel](stackpanel.md) as the root element of a control template, it's a common practice to use a [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) to bind the panel's background to the [Control.Background](control_background.md) property of the template parent (the control class that uses your template).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel.background
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * Gets a value that indicates whether this [Panel](panel.md) is a container for UI items that are generated by an [ItemsControl](itemscontrol.md).
     * @remarks
     * IsItemsHost is a calculated property where the value results from the system checking the parents of the [Panel](panel.md) for an [ItemsControl](itemscontrol.md) implementation. If one exists, then the value is **true**.
     * 
     * In previous frameworks this property was settable. It's not settable in the Windows Runtime, and there should be no need to set it because the system has the calculation behavior. If you want a different relationship between a panel and a parent items control, just create it that way in your XAML control compositing.
     * 
     * 
     * <!--Could use a seealso to custom panel howto if one existed-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel.isitemshost
     * @type {Boolean} 
     */
    IsItemsHost {
        get => this.get_IsItemsHost()
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to child content of a [Panel](panel.md) subclass.
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in the UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel.childrentransitions
     * @type {TransitionCollection} 
     */
    ChildrenTransitions {
        get => this.get_ChildrenTransitions()
        set => this.put_ChildrenTransitions(value)
    }

    /**
     * Gets or sets an instance of BrushTransition to automatically animate changes to the Background property.
     * @remarks
     * Use this property to animate any change to the [Background](panel_background.md) property. When a new value is set from code or through data binding, the change is animated from the old value to the new value, rather than happening instantaneously.  
     * 
     * Even though the transition animation takes time, the change to the actual property value is instantaneous. For example, if you change a property from code and then read it back, you’ll see the new value, even though the visual effect of the property change is somewhere between the new and the old.
     * 
     * If a property value changes a second time while the first change is still animating, the animation will use the currently animated value as the "starting" value for the next animation, and then animate to the new "final" value. The duration will be reset.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panel.backgroundtransition
     * @type {BrushTransition} 
     */
    BackgroundTransition {
        get => this.get_BackgroundTransition()
        set => this.put_BackgroundTransition(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElementCollection} 
     */
    get_Children() {
        if (!this.HasProp("__IPanel")) {
            if ((queryResult := this.QueryInterface(IPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanel := IPanel(outPtr)
        }

        return this.__IPanel.get_Children()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        if (!this.HasProp("__IPanel")) {
            if ((queryResult := this.QueryInterface(IPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanel := IPanel(outPtr)
        }

        return this.__IPanel.get_Background()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__IPanel")) {
            if ((queryResult := this.QueryInterface(IPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanel := IPanel(outPtr)
        }

        return this.__IPanel.put_Background(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsItemsHost() {
        if (!this.HasProp("__IPanel")) {
            if ((queryResult := this.QueryInterface(IPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanel := IPanel(outPtr)
        }

        return this.__IPanel.get_IsItemsHost()
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ChildrenTransitions() {
        if (!this.HasProp("__IPanel")) {
            if ((queryResult := this.QueryInterface(IPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanel := IPanel(outPtr)
        }

        return this.__IPanel.get_ChildrenTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ChildrenTransitions(value) {
        if (!this.HasProp("__IPanel")) {
            if ((queryResult := this.QueryInterface(IPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanel := IPanel(outPtr)
        }

        return this.__IPanel.put_ChildrenTransitions(value)
    }

    /**
     * 
     * @returns {BrushTransition} 
     */
    get_BackgroundTransition() {
        if (!this.HasProp("__IPanel2")) {
            if ((queryResult := this.QueryInterface(IPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanel2 := IPanel2(outPtr)
        }

        return this.__IPanel2.get_BackgroundTransition()
    }

    /**
     * 
     * @param {BrushTransition} value 
     * @returns {HRESULT} 
     */
    put_BackgroundTransition(value) {
        if (!this.HasProp("__IPanel2")) {
            if ((queryResult := this.QueryInterface(IPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanel2 := IPanel2(outPtr)
        }

        return this.__IPanel2.put_BackgroundTransition(value)
    }

;@endregion Instance Methods
}
