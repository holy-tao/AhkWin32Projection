#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UIElement.ahk
#Include .\IFrameworkElement.ahk
#Include .\IFrameworkElement2.ahk
#Include .\IFrameworkElement3.ahk
#Include .\IFrameworkElement4.ahk
#Include .\IFrameworkElement6.ahk
#Include .\IFrameworkElement7.ahk
#Include .\IFrameworkElementProtected7.ahk
#Include .\IFrameworkElementOverrides.ahk
#Include .\IFrameworkElementOverrides2.ahk
#Include .\IFrameworkElementStatics6.ahk
#Include .\IFrameworkElementStatics5.ahk
#Include .\IFrameworkElementStatics2.ahk
#Include .\IFrameworkElementStatics.ahk
#Include .\IFrameworkElementStatics4.ahk
#Include .\RoutedEventHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\RoutedEventArgs.ahk
#Include .\SizeChangedEventHandler.ahk
#Include .\SizeChangedEventArgs.ahk
#Include ..\..\Foundation\EventHandler.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\FrameworkElement.ahk
#Include .\DataContextChangedEventArgs.ahk
#Include .\EffectiveViewportChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides a base element class for Windows Runtime UI objects. FrameworkElement defines common API that support UI interaction and the automatic layout system. FrameworkElement  also defines API related to data binding, defining and examining the object tree, and tracking object lifetime.
 * @remarks
 * FrameworkElement is a base element: it's a class that many other Windows Runtime classes inherit from in order to support the XAML UI element model. Properties, methods and events that FrameworkElement defines are inherited by hundreds of other Windows Runtime classes.
 * 
 * Many common XAML UI classes derive from FrameworkElement, either directly or through intermediate base classes such as [Panel](../windows.ui.xaml.controls/panel.md) or [Control](../windows.ui.xaml.controls/control.md). Typically, you don't derive classes directly from FrameworkElement, because certain expected services for a class that is intended for a UI representation (such as template support) are not fully implemented there. More commonly used base classes for derived custom classes are:
 * 
 * + Specific controls that are not sealed (for example, [TextBox](../windows.ui.xaml.controls/textbox.md)).
 * + Control base classes ([Control](../windows.ui.xaml.controls/control.md), [ContentControl](../windows.ui.xaml.controls/contentcontrol.md), [UserControl](../windows.ui.xaml.controls/usercontrol.md)).
 * + Navigation elements ([Page](../windows.ui.xaml.controls/page.md), [Frame](../windows.ui.xaml.controls/frame.md)).
 * + Panel classes (the base class [Panel](../windows.ui.xaml.controls/panel.md), or specific non-sealed implementations such as [Grid](../windows.ui.xaml.controls/grid.md)).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FrameworkElement extends UIElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameworkElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameworkElement.IID

    /**
     * Identifies the ActualTheme dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.actualthemeproperty
     * @type {DependencyProperty} 
     */
    static ActualThemeProperty {
        get => FrameworkElement.get_ActualThemeProperty()
    }

    /**
     * Identifies the [RequestedTheme](frameworkelement_requestedtheme.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.requestedthemeproperty
     * @type {DependencyProperty} 
     */
    static RequestedThemeProperty {
        get => FrameworkElement.get_RequestedThemeProperty()
    }

    /**
     * Identifies the [Tag](frameworkelement_tag.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.tagproperty
     * @type {DependencyProperty} 
     */
    static TagProperty {
        get => FrameworkElement.get_TagProperty()
    }

    /**
     * Identifies the [Language](frameworkelement_language.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.languageproperty
     * @type {DependencyProperty} 
     */
    static LanguageProperty {
        get => FrameworkElement.get_LanguageProperty()
    }

    /**
     * Identifies the [ActualWidth](frameworkelement_actualwidth.md)  dependency property. See Remarks.
     * @remarks
     * > [!NOTE]
     * > Although it has an ActualWidthProperty backing field, [ActualWidth](frameworkelement_actualwidth.md) does not raise property change notifications and it should be thought of as a regular CLR property and not a dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.actualwidthproperty
     * @type {DependencyProperty} 
     */
    static ActualWidthProperty {
        get => FrameworkElement.get_ActualWidthProperty()
    }

    /**
     * Identifies the [ActualHeight](frameworkelement_actualheight.md)  dependency property. See Remarks.
     * @remarks
     * > [!NOTE]
     * > Although it has an ActualHeightProperty backing field, [ActualHeight](frameworkelement_actualheight.md) does not raise property change notifications and it should be thought of as a regular CLR property and not a dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.actualheightproperty
     * @type {DependencyProperty} 
     */
    static ActualHeightProperty {
        get => FrameworkElement.get_ActualHeightProperty()
    }

    /**
     * Identifies the [Width](frameworkelement_width.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.widthproperty
     * @type {DependencyProperty} 
     */
    static WidthProperty {
        get => FrameworkElement.get_WidthProperty()
    }

    /**
     * Identifies the [Height](frameworkelement_height.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.heightproperty
     * @type {DependencyProperty} 
     */
    static HeightProperty {
        get => FrameworkElement.get_HeightProperty()
    }

    /**
     * Identifies the [MinWidth](frameworkelement_minwidth.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.minwidthproperty
     * @type {DependencyProperty} 
     */
    static MinWidthProperty {
        get => FrameworkElement.get_MinWidthProperty()
    }

    /**
     * Identifies the [MaxWidth](frameworkelement_maxwidth.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.maxwidthproperty
     * @type {DependencyProperty} 
     */
    static MaxWidthProperty {
        get => FrameworkElement.get_MaxWidthProperty()
    }

    /**
     * Identifies the [MinHeight](frameworkelement_minheight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.minheightproperty
     * @type {DependencyProperty} 
     */
    static MinHeightProperty {
        get => FrameworkElement.get_MinHeightProperty()
    }

    /**
     * Identifies the [MaxHeight](frameworkelement_maxheight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.maxheightproperty
     * @type {DependencyProperty} 
     */
    static MaxHeightProperty {
        get => FrameworkElement.get_MaxHeightProperty()
    }

    /**
     * Identifies the [HorizontalAlignment](frameworkelement_horizontalalignment.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.horizontalalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalAlignmentProperty {
        get => FrameworkElement.get_HorizontalAlignmentProperty()
    }

    /**
     * Identifies the [VerticalAlignment](frameworkelement_verticalalignment.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.verticalalignmentproperty
     * @type {DependencyProperty} 
     */
    static VerticalAlignmentProperty {
        get => FrameworkElement.get_VerticalAlignmentProperty()
    }

    /**
     * Identifies the [Margin](frameworkelement_margin.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.marginproperty
     * @type {DependencyProperty} 
     */
    static MarginProperty {
        get => FrameworkElement.get_MarginProperty()
    }

    /**
     * Identifies the [Name](frameworkelement_name.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.nameproperty
     * @type {DependencyProperty} 
     */
    static NameProperty {
        get => FrameworkElement.get_NameProperty()
    }

    /**
     * Identifies the [DataContext](frameworkelement_datacontext.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.datacontextproperty
     * @type {DependencyProperty} 
     */
    static DataContextProperty {
        get => FrameworkElement.get_DataContextProperty()
    }

    /**
     * Identifies the [Style](frameworkelement_style.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.styleproperty
     * @type {DependencyProperty} 
     */
    static StyleProperty {
        get => FrameworkElement.get_StyleProperty()
    }

    /**
     * Identifies the [FlowDirection](frameworkelement_flowdirection.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.flowdirectionproperty
     * @type {DependencyProperty} 
     */
    static FlowDirectionProperty {
        get => FrameworkElement.get_FlowDirectionProperty()
    }

    /**
     * Identifies for the [AllowFocusOnInteraction](frameworkelement_allowfocusoninteraction.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.allowfocusoninteractionproperty
     * @type {DependencyProperty} 
     */
    static AllowFocusOnInteractionProperty {
        get => FrameworkElement.get_AllowFocusOnInteractionProperty()
    }

    /**
     * Identifies the [FocusVisualMargin](frameworkelement_focusvisualmargin.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualmarginproperty
     * @type {DependencyProperty} 
     */
    static FocusVisualMarginProperty {
        get => FrameworkElement.get_FocusVisualMarginProperty()
    }

    /**
     * Identifies the [FocusVisualSecondaryThickness](frameworkelement_focusvisualsecondarythickness.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualsecondarythicknessproperty
     * @type {DependencyProperty} 
     */
    static FocusVisualSecondaryThicknessProperty {
        get => FrameworkElement.get_FocusVisualSecondaryThicknessProperty()
    }

    /**
     * Identifies the [FocusVisualPrimaryThickness](frameworkelement_focusvisualprimarythickness.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualprimarythicknessproperty
     * @type {DependencyProperty} 
     */
    static FocusVisualPrimaryThicknessProperty {
        get => FrameworkElement.get_FocusVisualPrimaryThicknessProperty()
    }

    /**
     * Identifies the [FocusVisualSecondaryBrush](frameworkelement_focusvisualsecondarybrush.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualsecondarybrushproperty
     * @type {DependencyProperty} 
     */
    static FocusVisualSecondaryBrushProperty {
        get => FrameworkElement.get_FocusVisualSecondaryBrushProperty()
    }

    /**
     * Identifies the [FocusVisualPrimaryBrush](frameworkelement_focusvisualprimarybrush.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualprimarybrushproperty
     * @type {DependencyProperty} 
     */
    static FocusVisualPrimaryBrushProperty {
        get => FrameworkElement.get_FocusVisualPrimaryBrushProperty()
    }

    /**
     * Identifies the [AllowFocusWhenDisabled](frameworkelement_allowfocuswhendisabled.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.allowfocuswhendisabledproperty
     * @type {DependencyProperty} 
     */
    static AllowFocusWhenDisabledProperty {
        get => FrameworkElement.get_AllowFocusWhenDisabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ActualThemeProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics6.IID)
            FrameworkElement.__IFrameworkElementStatics6 := IFrameworkElementStatics6(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics6.get_ActualThemeProperty()
    }

    /**
     * Removes the specified element from the XAML visual tree in a way that it can be undeferred later.
     * @remarks
     * This API is part of the implementation detail of x:Load, and should not be used directly. Instead use the generated UnloadObject API in a page or user control. This will also release any references due to x:Name or x:Bind.
     * @param {DependencyObject} element The element to remove from the XAML visual tree.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.defertree
     */
    static DeferTree(element) {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics5.IID)
            FrameworkElement.__IFrameworkElementStatics5 := IFrameworkElementStatics5(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics5.DeferTree(element)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RequestedThemeProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics2.IID)
            FrameworkElement.__IFrameworkElementStatics2 := IFrameworkElementStatics2(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics2.get_RequestedThemeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TagProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_TagProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LanguageProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_LanguageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ActualWidthProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_ActualWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ActualHeightProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_ActualHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_WidthProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_WidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeightProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_HeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinWidthProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_MinWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxWidthProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_MaxWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinHeightProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_MinHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxHeightProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_MaxHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalAlignmentProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_HorizontalAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalAlignmentProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_VerticalAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MarginProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_MarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NameProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_NameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DataContextProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_DataContextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StyleProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_StyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FlowDirectionProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics.IID)
            FrameworkElement.__IFrameworkElementStatics := IFrameworkElementStatics(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics.get_FlowDirectionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AllowFocusOnInteractionProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics4.IID)
            FrameworkElement.__IFrameworkElementStatics4 := IFrameworkElementStatics4(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics4.get_AllowFocusOnInteractionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusVisualMarginProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics4.IID)
            FrameworkElement.__IFrameworkElementStatics4 := IFrameworkElementStatics4(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics4.get_FocusVisualMarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusVisualSecondaryThicknessProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics4.IID)
            FrameworkElement.__IFrameworkElementStatics4 := IFrameworkElementStatics4(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics4.get_FocusVisualSecondaryThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusVisualPrimaryThicknessProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics4.IID)
            FrameworkElement.__IFrameworkElementStatics4 := IFrameworkElementStatics4(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics4.get_FocusVisualPrimaryThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusVisualSecondaryBrushProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics4.IID)
            FrameworkElement.__IFrameworkElementStatics4 := IFrameworkElementStatics4(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics4.get_FocusVisualSecondaryBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusVisualPrimaryBrushProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics4.IID)
            FrameworkElement.__IFrameworkElementStatics4 := IFrameworkElementStatics4(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics4.get_FocusVisualPrimaryBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AllowFocusWhenDisabledProperty() {
        if (!FrameworkElement.HasProp("__IFrameworkElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementStatics4.IID)
            FrameworkElement.__IFrameworkElementStatics4 := IFrameworkElementStatics4(factoryPtr)
        }

        return FrameworkElement.__IFrameworkElementStatics4.get_AllowFocusWhenDisabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of triggers for animations that are defined for a [FrameworkElement](frameworkelement.md). Not commonly used. See Remarks.
     * @remarks
     * Triggers, [EventTrigger](eventtrigger.md), [Actions](eventtrigger_actions.md) and [BeginStoryboard](../windows.ui.xaml.media.animation/beginstoryboard.md) are not commonly used. These API mainly exist for compatibility in XAML originally used for Microsoft Silverlight. For most scenarios where event triggers were used previously, you should use built-in animations, visual states, or start animations by writing a [Loaded](frameworkelement_loaded.md) handler that looks up an animation in page-level resources and then calls [Begin](../windows.ui.xaml.media.animation/storyboard_begin_1621727531.md) on the animation's main [Storyboard](../windows.ui.xaml.media.animation/storyboard.md). For more info, see [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)) or [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.triggers
     * @type {TriggerCollection} 
     */
    Triggers {
        get => this.get_Triggers()
    }

    /**
     * Gets the locally defined resource dictionary. In XAML, you can establish resource items as child object elements of a `frameworkElement.Resources` property element, through XAML implicit collection syntax.
     * @remarks
     * The primary purpose of the items in a Resources collection is to refer to them from other parts of your XAML, using a [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension) reference (or the similar [{ThemeResource} markup extension](/windows/uwp/xaml-platform/themeresource-markup-extension) reference). If you want to access the Resources collection at run time, you can use the API of the relevant template to query, add, or remove items in the [ResourceDictionary](resourcedictionary.md).
     * 
     * For more info and examples, see [ResourceDictionary and XAML resource references](/windows/apps/design/style/xaml-resource-dictionary).
     * 
     * A [ResourceDictionary](resourcedictionary.md) is a keyed collection, which is based on an [IMap<K,V>](../windows.foundation.collections/imap_2.md) template if you are programming with Visual C++ component extensions (C++/CX), or an [IDictionary&lt;TKey,TValue&gt;](XREF:TODO:T:System.Collections.Generic.IDictionary`2) template if you are programming with C# or Microsoft Visual Basic. The API you use in code to work with the dictionary and its items are reflective of the underlying template and thus of the language you're using for your app.
     * 
     * [Application](application.md) also has a [Resources](application_resources.md) property, which can be used to store resources that should be accessible from more than one page in the app. Resources for custom controls can also be stored in a separate XAML file that is created by the default project template of a templated control.
     * 
     * The items that you see in a XAML [Resources](application_resources.md) collection are not necessarily the entirety of XAML-defined resources available at runtime. Other resources are available at runtime, due to the influence of the [MergedDictionaries](resourcedictionary_mergeddictionaries.md) property on a [ResourceDictionary](resourcedictionary.md). The [MergedDictionaries](resourcedictionary_mergeddictionaries.md) value can introduce other dictionaries such as the resources defined by the system, such as resources from the default XAML control templates. Runtime theme-specific resources are also available from the similar [ThemeDictionaries](resourcedictionary_themedictionaries.md) property. If you access a [Resources](application_resources.md) collection at runtime and query for a specific key using the [Item](/dotnet/api/system.windows.resourcedictionary.item) indexer or [Lookup](resourcedictionary_lookup_786690417.md) method, you can access and retrieve these resources. For more info, see [ResourceDictionary and XAML resource references](/windows/apps/design/style/xaml-resource-dictionary). Also, [Application.Resources](application_resources.md) can provide resources that are available for any XAML reference in the app and thus extend the resources in any given FrameworkElement.Resources dictionary.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.resources
     * @type {ResourceDictionary} 
     */
    Resources {
        get => this.get_Resources()
        set => this.put_Resources(value)
    }

    /**
     * Gets or sets an arbitrary object value that can be used to store custom information about this object.
     * @remarks
     * The scenario for the Tag property is to provide an general-purpose property on all [FrameworkElement](frameworkelement.md) classes that supports data binding, animation and styles for itself but where the property's value does not have any implicit meaning to platform subsystems like layout, app model, text, input and so on. For example, you might put a value in the Tag property that has no meaning to the [FrameworkElement](frameworkelement.md) where it is set, but which could be useful as an [ElementName](../windows.ui.xaml.data/binding_elementname.md) binding value to some other element that uses the [FrameworkElement](frameworkelement.md) as a [DataContext](frameworkelement_datacontext.md) and processes the Tag value in its own way. Or you might use Tag as a way for an applied style to get a value from an arbitrary [FrameworkElement](frameworkelement.md) parent into a specific applied template using [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension), without requiring XAML namespace mapping of a specific instance property in app XAML.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.tag
     * @type {IInspectable} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets or sets localization/globalization language information that applies to a [FrameworkElement](frameworkelement.md), and also to all child elements of the current [FrameworkElement](frameworkelement.md) in the object representation and in UI.
     * @remarks
     * The Language property is intended for setting a per-element language setting on selected elements in a larger UI. The main reason for doing this is to influence text-related properties and settings, such as what the default or fallback [FontFamily](../windows.ui.xaml.media/fontfamily.md) should be for text presentation.
     * 
     * The default value for this property is the top language from the app language list, which is derived from the user's ranked list of preferred languages. We recommend that you leave the default for this property, as it will provide the best end user experience in terms of font fallback. For example, if the app is displaying East Asian content and the user has specified an East Asian language in their user profile, the content will most reliability show up in the desired East Asian font.
     * 
     * The Language property is mainly relevant for these [FrameworkElement](frameworkelement.md) subclasses: 
     * + [TextBlock](../windows.ui.xaml.controls/textblock.md)
     * + [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md)
     * + [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md)
     * + [TextBox](../windows.ui.xaml.controls/textbox.md)
     * + [RichEditBox](../windows.ui.xaml.controls/richeditbox.md)
     * + [PasswordBox](../windows.ui.xaml.controls/passwordbox.md)
     * 
     * 
     * The [TextElement](../windows.ui.xaml.documents/textelement.md) class also has a [Language](../windows.ui.xaml.documents/textelement_language.md) property, and it has similar purpose and behavior for [TextElement](../windows.ui.xaml.documents/textelement.md) subclasses such as [Run](../windows.ui.xaml.documents/run.md).
     * 
     * If it's not specifically set as an attribute, the default value for Language is determined by other, larger factors that influence the globalization and localization settings for your app. This includes the user's system settings. For more info, see [Globalizing your app](/previous-versions/windows/apps/hh965328(v=win.10)).
     * 
     * Setting Language on UI elements is only a small part of what you might do to prepare an app for localization and globalization. For example, you typically need to name or load resources such as strings and images and include these resources in your app package. You also need to apply [x:Uid directive](/windows/uwp/xaml-platform/x-uid-directive) values to any elements that should use resource qualifiers to obtain the language-specific resource. For more info, see [Globalizing your app](/previous-versions/windows/apps/hh965328(v=win.10)).
     * 
     * When you set Language in markup, you should consider using a RESW resources file to specify the BCP 47 string, rather than hard-coding a string in the markup. Specify an [x:Uid directive](/windows/uwp/xaml-platform/x-uid-directive) value on that element where you want to specify Language so that the resource system can target the element. Then provide a string resource of the BCP 47 string that matches the resources folder name the resource comes from. You'll probably already have a RESW file in your project that is providing the conventional localized UI strings. For more info, see [Quickstart: Translating UI resources](/previous-versions/windows/apps/hh965329(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets the rendered width of a [FrameworkElement](frameworkelement.md). See Remarks.
     * @remarks
     * > [!NOTE]
     * > Although it has an [ActualWidthProperty](frameworkelement_actualwidthproperty.md) backing field, ActualWidth does not raise property change notifications and it should be thought of as a regular CLR property and not a dependency property.
     * 
     * ActualWidth is a calculated property. The calculations are a result of a layout pass, where the object is sized in layout according to the logic of its successive layout parents. For more info see [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * 
     * 
     * <!--BUG this is a terrible formoreinfo. Need meaty stuff about how layout actually works.-->
     * ActualWidth can have multiple or incremental reported changes to the value because of operations by the layout system. If you get the value while layout is still iterating, the layout system might still be calculating the required measure of space for child objects, constraints by the parent object, and so on. Because the value is based on an actual rendering pass, it may lag slightly behind the set value of properties like [Width](frameworkelement_width.md), which can be the basis of the input change.
     * 
     * For purposes of [ElementName](../windows.ui.xaml.data/binding_elementname.md) binding, ActualWidth does not post updates when it changes (due to its asynchronous and run-time calculated nature). Do not attempt to use ActualWidth as a binding source for an [ElementName](../windows.ui.xaml.data/binding_elementname.md) binding. If you have a scenario that requires updates based on ActualWidth, use a [SizeChanged](frameworkelement_sizechanged.md) handler.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.actualwidth
     * @type {Float} 
     */
    ActualWidth {
        get => this.get_ActualWidth()
    }

    /**
     * Gets the rendered height of a [FrameworkElement](frameworkelement.md). See Remarks.
     * @remarks
     * > [!NOTE]
     * > Although it has an [ActualHeightProperty](frameworkelement_actualheightproperty.md) backing field, ActualHeight does not raise property change notifications and it should be thought of as a regular property and not a dependency property.
     * 
     * ActualHeight is a calculated property. The calculations are a result of a layout pass, where the object is sized in layout according to the logic of its successive layout parents. For more info see [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * 
     * 
     * <!--BUG this is a terrible formoreinfo. Need meaty stuff about how layout actually works.-->
     * ActualHeight can have multiple or incremental reported changes to the value because of operations by the layout system. If you get the value while layout is still iterating, the layout system might still be calculating the required measure of space for child objects, constraints by the parent object, and so on. Because the value is based on an actual rendering pass, it may lag slightly behind the set value of properties like [Height](frameworkelement_height.md), which can be the basis of the input change.
     * 
     * For purposes of [ElementName](../windows.ui.xaml.data/binding_elementname.md) binding, ActualHeight does not post updates when it changes (due to its asynchronous and run-time calculated nature). Do not attempt to use ActualHeight as a binding source for an [ElementName](../windows.ui.xaml.data/binding_elementname.md) binding. If you have a scenario that requires updates based on ActualHeight, use a [SizeChanged](frameworkelement_sizechanged.md) handler.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.actualheight
     * @type {Float} 
     */
    ActualHeight {
        get => this.get_ActualHeight()
    }

    /**
     * Gets or sets the width of a [FrameworkElement](frameworkelement.md).
     * @remarks
     * Width is one of three writable properties on [FrameworkElement](frameworkelement.md) that specify width information. The other two are [MinWidth](frameworkelement_minwidth.md) and [MaxWidth](frameworkelement_maxwidth.md). If there is a conflict between these values, the order of application for actual width determination is that first [MinWidth](frameworkelement_minwidth.md) must be honored, then [MaxWidth](frameworkelement_maxwidth.md), and finally, if it is within bounds, Width.
     * 
     * Several of the [FrameworkElement](frameworkelement.md) derived types are also derived from [Shape](../windows.ui.xaml.shapes/shape.md). Not all of the [Shape](../windows.ui.xaml.shapes/shape.md) classes use [Height](frameworkelement_height.md) or Width to specify their appearance, and instead use specific properties that might define a set of points. In this case a [Height](frameworkelement_height.md) or Width is calculated, but is not typically set directly.
     * 
     * Custom classes might have similar considerations where the class might have properties that are more meaningful for specifying dimensions than are [Height](frameworkelement_height.md) or Width. [Height](frameworkelement_height.md) or Width are both still available as members and are settable. 
     * <!--In critical cases, it might be useful to shadow the Height and Width properties to prevent them from being set directly by consumers of the class. TODO can you shadow in WinRT?-->
     * 
     * The object where the [Height](frameworkelement_height.md) or Width properties are set is almost always a child object in another parent's child collection, and setting [Height](frameworkelement_height.md) or Width to a value is only a suggested value for the layout process. The layout system as well as the particular layout logic of the parent's class will use the value as a nonbinding input during the layout process, and might have to clip, resize the object, resize the container, or some combination of these behaviors that spans multiple participating objects in layout. Margin and padding also influences the available size. For more info, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding).
     * 
     * The return value of this property is always the same as any value that was set to it. In contrast, the value of the [ActualWidth](frameworkelement_actualwidth.md) property may vary. The variance can occur either statically, because the layout rejected the suggested size, or momentarily. The layout system itself works asynchronously relative to the property system's set of Width, and the layout system might not have processed that sizing property change yet.
     * 
     * Negative values for Width are not permitted. 
     * <!--Non-integral values for Height are technically permitted, but should generally be avoided and are normally rounded by the default layout rounding behavior. For more information, see Layout Rounding.
     * TODO investigate voldemort layout rounding-->
     * Also, do not set Width to a value that is significantly larger than the maximum size of any possible visual display.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.width
     * @type {Float} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * Gets or sets the suggested height of a [FrameworkElement](frameworkelement.md).
     * @remarks
     * Height is one of three writable properties on [FrameworkElement](frameworkelement.md) that specify height information. The other two are [MinHeight](frameworkelement_minheight.md) and [MaxHeight](frameworkelement_maxheight.md). If there is a conflict between these values, the order of application for actual height determination is that first [MinHeight](frameworkelement_minheight.md) must be honored, then [MaxHeight](frameworkelement_maxheight.md), and finally, if it is within bounds, Height.
     * 
     * Several of the [FrameworkElement](frameworkelement.md) derived types are also derived from [Shape](../windows.ui.xaml.shapes/shape.md). Not all of the [Shape](../windows.ui.xaml.shapes/shape.md) classes use Height or [Width](frameworkelement_width.md) to specify their appearance, and instead use specific properties that might define a set of points. In this case a Height or [Width](frameworkelement_width.md) is calculated, but is not typically set directly.
     * 
     * Custom classes might have similar considerations where the class might have properties that are more meaningful for specifying dimensions than are Height or [Width](frameworkelement_width.md). Height or [Width](frameworkelement_width.md) are both still available as members and are settable. 
     * <!--In critical cases, it might be useful to shadow the Height and Width properties to prevent them from being set directly by consumers of the class. TODO can you shadow in WinRT?-->
     * 
     * The object where the Height or [Width](frameworkelement_width.md) properties are set is almost always a child object in another parent's child collection, and setting Height or [Width](frameworkelement_width.md) to a value is only a suggested value for the layout process. The layout system as well as the particular layout logic of the parent's class will use the value as a nonbinding input during the layout process, and might have to clip, resize the object, resize the container, or some combination of these behaviors that spans multiple participating objects in layout. Margin and padding also influences the available size. For more info, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding).
     * 
     * The return value of this property is always the same as any value that was set to it. In contrast, the value of the [ActualHeight](frameworkelement_actualheight.md) property may vary. The variance can occur either statically, because the layout rejected the suggested size, or momentarily. The layout system itself works asynchronously relative to the property system's set of Height, and the layout system might not have processed that sizing property change yet.
     * 
     * Negative values for Height are not permitted. 
     * <!--Non-integral values for Height are technically permitted, but should generally be avoided and are normally rounded by the default layout rounding behavior. For more information, see Layout Rounding.
     * TODO investigate voldemort layout rounding-->
     * Also, do not set Height to a value that is significantly larger than the maximum size of any possible visual display.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.height
     * @type {Float} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * Gets or sets the minimum width constraint of a [FrameworkElement](frameworkelement.md).
     * @remarks
     * MinWidth is one of three writable properties on [FrameworkElement](frameworkelement.md) that specify width information. The other two are [MaxWidth](frameworkelement_maxwidth.md) and [Width](frameworkelement_width.md). If there is a conflict between these values, the order of application for actual width determination is that first MinWidth must be honored, then [MaxWidth](frameworkelement_maxwidth.md), and finally, if it is within bounds, [Width](frameworkelement_width.md). All of these properties are recommendations to the layout behavior of the element's parent in the object tree. The width of the object after layout runs is available as the [ActualWidth](frameworkelement_actualwidth.md) property value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.minwidth
     * @type {Float} 
     */
    MinWidth {
        get => this.get_MinWidth()
        set => this.put_MinWidth(value)
    }

    /**
     * Gets or sets the maximum width constraint of a [FrameworkElement](frameworkelement.md).
     * @remarks
     * MaxWidth is one of three writable properties on [FrameworkElement](frameworkelement.md) that specify width information. The other two are [MinWidth](frameworkelement_minwidth.md) and [Width](frameworkelement_width.md). If there is a conflict between these values, the order of application for actual width determination is that first [MinWidth](frameworkelement_minwidth.md) must be honored, then MaxWidth, and finally, if it is within bounds, [Width](frameworkelement_width.md). All of these properties are recommendations to the layout behavior of the element's parent in the object tree. The width of the object after layout runs is available as the [ActualWidth](frameworkelement_actualwidth.md) property value.
     * 
     * The final [ActualWidth](frameworkelement_actualwidth.md) of an element might exceed MaxWidth. For example, if [UseLayoutRounding](uielement_uselayoutrounding.md) is set to **true** and your app is running on a display with a Resolution Scale greater than 100%, then the [ActualWidth](frameworkelement_actualwidth.md) may be rounded up to help ensure your UI doesn't look blurry when scaled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.maxwidth
     * @type {Float} 
     */
    MaxWidth {
        get => this.get_MaxWidth()
        set => this.put_MaxWidth(value)
    }

    /**
     * Gets or sets the minimum height constraint of a [FrameworkElement](frameworkelement.md).
     * @remarks
     * MinHeight is one of three writable properties on [FrameworkElement](frameworkelement.md) that specify height information. The other two are [Height](frameworkelement_height.md) and [MaxHeight](frameworkelement_maxheight.md). If there is a conflict between these values, the order of application for actual height determination is that first MinHeight must be honored, then [MaxHeight](frameworkelement_maxheight.md), and finally, if it is within bounds, [Height](frameworkelement_height.md). All of these properties are recommendations to the layout behavior of the element's parent in the object tree. The height of the object after layout runs is available as the [ActualHeight](frameworkelement_actualheight.md) property value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.minheight
     * @type {Float} 
     */
    MinHeight {
        get => this.get_MinHeight()
        set => this.put_MinHeight(value)
    }

    /**
     * Gets or sets the maximum height constraint of a [FrameworkElement](frameworkelement.md).
     * @remarks
     * MaxHeight is one of three writable properties on [FrameworkElement](frameworkelement.md) that specify height information. The other two are [Height](frameworkelement_height.md) and [MinHeight](frameworkelement_minheight.md). If there is a conflict between these values, the order of application for actual height determination is that first [MinHeight](frameworkelement_minheight.md) must be honored, then MaxHeight, and finally, if it is within bounds, [Height](frameworkelement_height.md). All of these properties are recommendations to the layout behavior of the element's parent in the object tree. The height of the object after layout runs is available as the [ActualHeight](frameworkelement_actualheight.md) property value.
     * 
     * The final [ActualHeight](frameworkelement_actualheight.md) of an element might exceed MaxHeight. For example, if [UseLayoutRounding](uielement_uselayoutrounding.md) is set to **true** and your app is running on a display with a Resolution Scale greater than 100%, then the [ActualHeight](frameworkelement_actualheight.md) may be rounded up to help ensure your UI doesn't look blurry when scaled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.maxheight
     * @type {Float} 
     */
    MaxHeight {
        get => this.get_MaxHeight()
        set => this.put_MaxHeight(value)
    }

    /**
     * Gets or sets the horizontal alignment characteristics that are applied to a [FrameworkElement](frameworkelement.md) when it is composed in a layout parent, such as a panel or items control.
     * @remarks
     * Alignment properties are intended to hint the desired layout to an adaptive layout container. They're typically set on [FrameworkElement](frameworkelement.md) children and interpreted by another [FrameworkElement](frameworkelement.md) container parent (typically a [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) derived class or a [Panel](../windows.ui.xaml.controls/panel.md) derived class, or perhaps a presenter). Setting alignment properties on a child element is no guarantee that anything happens; the behavior depends on the layout composition and the parent elements involved.
     * 
     * When the [Height](frameworkelement_height.md) and [Width](frameworkelement_width.md) properties are explicitly set or calculated on an object, those measurements are more important to typical layout logic, and can cancel the effects of setting HorizontalAlignment to [Stretch](horizontalalignment.md). Layout constraint properties (such as [MaxWidth](frameworkelement_maxwidth.md)) also affect the maximum or minimum layout size for a **Stretch** layout situation. **Stretch** is the default so that it's easier to use adaptive layout techniques in the cases where there is no explicit measurement. But if there are either [Height](frameworkelement_height.md) and [Width](frameworkelement_width.md) or clipping, the layout acts as if the value is **Top** for [VerticalAlignment](frameworkelement_verticalalignment.md), typically **Left** for HorizontalAlignment (**Right** for right-to-left culture info or explicit [FlowDirection](frameworkelement_flowdirection.md) values). For more info, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding).
     * 
     * [Canvas](../windows.ui.xaml.controls/canvas.md) does not use HorizontalAlignment when composing layout, because [Canvas](../windows.ui.xaml.controls/canvas.md) is based on absolute positioning. In general, the value of HorizontalAlignment is potentially treated differently by any object that is capable of having one or more [FrameworkElement](frameworkelement.md) objects as child content. Each such parent object can have its own layout logic.
     * 
     * Each XAML UI element might apply this property differently based on the [Style](style.md) setters for the implicit style. The apparent "default value" for HorizontalAlignment in each UI element can be different. For example, a [Button](../windows.ui.xaml.controls/button.md) control starts with the value **Left**. If the UI element is a control, the HorizontalAlignment value might also affect the control's visual template.
     * 
     * In content controls, the control template often uses [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) expressions to bind the [HorizontalContentAlignment](../windows.ui.xaml.controls/control_horizontalcontentalignment.md) property to a HorizontalAlignment property on some element within its template, such as the presenter or the element used as the content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.horizontalalignment
     * @type {Integer} 
     */
    HorizontalAlignment {
        get => this.get_HorizontalAlignment()
        set => this.put_HorizontalAlignment(value)
    }

    /**
     * Gets or sets the vertical alignment characteristics that are applied to a [FrameworkElement](frameworkelement.md) when it is composed in a parent object such as a panel or items control.
     * @remarks
     * Alignment properties are intended to hint the desired layout to an adaptive layout container. They're typically set on [FrameworkElement](frameworkelement.md) children and interpreted by another [FrameworkElement](frameworkelement.md) container parent (typically a [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) derived class or a [Panel](../windows.ui.xaml.controls/panel.md) derived class, or perhaps a presenter). Setting alignment properties on a child element is no guarantee that anything happens; the behavior depends on the layout composition and the parent elements involved.
     * 
     * When the [Height](frameworkelement_height.md) and [Width](frameworkelement_width.md) properties are explicitly set or calculated on an object, those measurements are more important to typical layout logic, and can cancel the effects of setting VerticalAlignment to [Stretch](horizontalalignment.md). Layout constraint properties (such as [MaxHeight](frameworkelement_maxheight.md)) also affect the maximum or minimum layout size for a **Stretch** layout situation. **Stretch** is the default so that it's easier to use adaptive layout techniques in the cases where there is no explicit measurement. But if there are either [Height](frameworkelement_height.md) and [Width](frameworkelement_width.md) or clipping, the layout acts as if the value is **Top** for VerticalAlignment, typically **Left** for [HorizontalAlignment](frameworkelement_horizontalalignment.md) (**Right** for right-to-left culture info or explicit [FlowDirection](frameworkelement_flowdirection.md) values). For more info, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding).
     * 
     * [Canvas](../windows.ui.xaml.controls/canvas.md) does not use VerticalAlignment when composing layout, because [Canvas](../windows.ui.xaml.controls/canvas.md) is based on absolute positioning. In general, the value of VerticalAlignment is potentially treated differently by any object that is capable of having one or more [FrameworkElement](frameworkelement.md) objects as child content. Each such parent object can have its own layout logic.
     * 
     * Each XAML UI element might apply this property differently based on the [Style](style.md) setters for the implicit style. The apparent "default value" for VerticalAlignment in each UI element can be different. For example, a [Button](../windows.ui.xaml.controls/button.md) control starts with the value **Center**. If the UI element is a control, the VerticalAlignment value might also affect the control's visual template.
     * 
     * In content controls, the control template often uses [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) expressions to bind the [VerticalContentAlignment](../windows.ui.xaml.controls/control_verticalcontentalignment.md) property to a VerticalAlignment property on some element within its template, such as the presenter or the element used as the content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.verticalalignment
     * @type {Integer} 
     */
    VerticalAlignment {
        get => this.get_VerticalAlignment()
        set => this.put_VerticalAlignment(value)
    }

    /**
     * Gets or sets the outer margin of a [FrameworkElement](frameworkelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.margin
     * @type {Thickness} 
     */
    Margin {
        get => this.get_Margin()
        set => this.put_Margin(value)
    }

    /**
     * Gets or sets the identifying name of the object. When a XAML processor creates the object tree from XAML markup, run-time code can refer to the XAML-declared object by this name.
     * @remarks
     * The most common usage of this property is to specify the [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) for an object in XAML markup, or to read that value as it was set in markup. In most ways, the **x:Name** attribute and the Name property are equivalent. On any single element, the **x:Name** attribute and the Name property are mutually exclusive as XAML attributes; if you attempt to set both **x:Name** and Name on the same object element in markup, a parser error is thrown.
     * 
     * When you use the default **Page** build actions for XAML, any XAML element that has a [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) or Name generates field references that are eventually populated by **InitializeComponent** when the XAML is loaded. The field references enable a programming model whereby objects can be directly referenced by name in your page-specific code-behind, once the XAML object tree is loaded into a page or app.
     * 
     * Names must be unique in a XAML namescope. Generally, the XAML namescope is defined by the XAML page, but certain features such as templates or calls to API such as [XamlReader.Load](../windows.ui.xaml.markup/xamlreader_load_1077941801.md) can define separate XAML namescopes. For more info, see [XAML namescopes](/windows/uwp/xaml-platform/xaml-namescopes).
     * 
     * Name should never be localized. Name is used as a field name variable in code-behind. Such code is typically inaccessible to the localizer who might otherwise have access to XAML files that define the UI, although this depends on your deployment model and localization procedures. This is one reason why you should not display any strings that come from Name in your app UI.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets a Uniform Resource Identifier (URI) that represents the base Uniform Resource Identifier (URI) for an XAML-constructed object at XAML load time. This property is useful for Uniform Resource Identifier (URI) resolution at run time.
     * @remarks
     * The XAML parser can evaluate references to resources based on the context of the object in a page, and can thus evaluate what appear to be partial paths in a Uniform Resource Identifier (URI) property. For run-time code, the definition rules for the Uniform Resource Identifier (URI) types don't permit partial paths. At run time, you can use BaseUri from the scope of an object that was created by parsing a XAML page in order to get the "path" part of a Uniform Resource Identifier (URI), and then complete the Uniform Resource Identifier (URI) with a particular resource reference.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
    }

    /**
     * Gets or sets the data context for a [FrameworkElement](frameworkelement.md). A common use of a data context is when a **FrameworkElement** uses the [{Binding}](/windows/uwp/xaml-platform/binding-markup-extension) markup extension and participates in data binding.
     * @remarks
     * *Data context* is a concept where objects can inherit data binding information from successive parent objects in an object relationship hierarchy.
     * 
     * The most important aspect of data context is the data source that is used for data binding. A typical use of DataContext is to set it directly to a data source object. This data source might be an instance of a class such as a business object. Or you can create a data source as an observable collection, so that the data context enables detecting changes in the backing collection. If the data source is defined by a library that is also included in the project, setting a DataContext is often combined with instantiating the data source as a keyed resource in a [ResourceDictionary](resourcedictionary.md), and then setting the DataContext in XAML with a [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension) reference.
     * 
     * Another technique for setting DataContext is to add it to the root of the runtime object tree, as part of app initialization logic, just after calling **InitializeComponent**. This technique is shown in [Data binding overview](/windows/uwp/data-binding/data-binding-quickstart).
     * 
     * In addition to specifying the source, a data context can also store additional characteristics of a binding declaration, such as a path into the data source.
     * 
     * Setting a DataContext is convenient for setting several bindings of different properties on the same object to a shared data context. However, it is valid for a DataContext to be undefined, and for all the necessary binding qualifications to exist in separate binding statements.
     * 
     * How you implement the object data source varies depending on your requirements and your programming language. For more info, see [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
     * 
     * A common scenario for C# and Microsoft Visual Basic data contexts is to use a CLR-defined business object that supports change notification. For a business object, the custom class used as data context typically implements [INotifyPropertyChanged](../windows.ui.xaml.data/inotifypropertychanged.md), so that updates to the data can update a one-way or two-way binding. If the data source is a collection of business objects, it can implement [INotifyCollectionChanged](../windows.ui.xaml.interop/inotifycollectionchanged.md) plus list support ([IList<T>](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true) or [List<T>](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true)), or derive from [ObservableCollection<T>](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.datacontext
     * @type {IInspectable} 
     */
    DataContext {
        get => this.get_DataContext()
        set => this.put_DataContext(value)
    }

    /**
     * Gets or sets an instance [Style](style.md) that is applied for this object during layout and rendering.
     * @remarks
     * Setting the Style property directly is not the most common way to style a UI element's appearance. Instead, you influence a UI element's appearance through one of the these techniques:
     * + You often set individual UI properties of a UI element as attributes in XAML. **FrameworkElement.Style** only applies to the current element, and any value from a Style**FrameworkElement.Style** is overwritten by a local property value, so setting the local value is more direct and more predictable. For more info on how a [Style](style.md) value and a local property value relate, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * + Control authors typically write a control that is templatable, but also comes with a default template. Your app can use the control and change its appearance by providing a new [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md), which is part of a [Style](style.md) defined in resources. This style is typically applied using the *implicit style* feature, not by setting Style. For more info, see [Styling controls](/windows/uwp/controls-and-patterns/styling-controls).
     * + Control authors also expose properties that reference parts of a control that can have styles or values applied to just that part, so you don't have to totally retemplate the control. Here you're setting a more specific property, not **FrameworkElement.Style**.
     * + The visual state model frequently resets the style of control at run time in response to changes in states that manifest themselves to the users visually. For example, control templates typically have a "Focused" state that adds a visual focus indicator to the control appearance so that a keyboard user can see which element in UI has the current keyboard focus. For more info on the visual state concept, see [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)).
     * 
     * 
     * You can change the values of individual properties that have been set within a style. For example, you can set the [Template](../windows.ui.xaml.controls/control_template.md) property at run time even if this property has been set by a style. Or you can add setters to the collection in [Setters](style_setters.md). However, as soon as that style is placed in use by a loaded object, the [Style](style.md) should be considered sealed. You can detect this state by checking the value of [IsSealed](style_issealed.md) for the [Style](style.md). A style is considered to be in use as soon as it is referenced by a loaded object that is connected to the object tree of a displayed page of UI. A [Style](style.md) and its [Setters](style_setters.md) can also be considered sealed when the object using that style raises its [Loaded](frameworkelement_loaded.md) event. Attempting to change an individual property of an in-use style (such as a property in the [Setters](style_setters.md) collection) throws an exception.
     * 
     * Classes derived from [Control](../windows.ui.xaml.controls/control.md) have an additional entry point that is useful to control authors in regard to style and template application. [FrameworkElement](frameworkelement.md) defines the virtual callback [OnApplyTemplate](frameworkelement_onapplytemplate_1955470198.md) that is invoked prior to [Loaded](frameworkelement_loaded.md). Classes derived from [Control](../windows.ui.xaml.controls/control.md) can override this callback to adjust the property values that were set by templates before the style is in use.
     * 
     * If queried at run time, the Style property does not return styles that come from an applied template, or active visual states. It only returns styles that were explicitly set by the Style property. In addition, it does not return implicit styles.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.style
     * @type {Style} 
     */
    Style {
        get => this.get_Style()
        set => this.put_Style(value)
    }

    /**
     * Gets the parent object of this [FrameworkElement](frameworkelement.md) in the object tree.
     * @remarks
     * Parent can be null if an object was instantiated, but is not attached to an object that eventually connects to a page object root. In the default Windows Runtime classes, the parent of a [FrameworkElement](frameworkelement.md) can also be expected to be a [FrameworkElement](frameworkelement.md) subclass if it's not null. But custom classes might introduce a content model where this assumption is not true.
     * 
     * Note that the parent of an object can change if you adjust your app's object tree at run time. You typically should get the parent object value immediately before you need it for other operations, and should not rely on the value past this point.
     * 
     *  Parent is read-only. You can change the parent of an object in most cases, but is done through manipulation of collections of the existing parent and a new parent. For example, you can add or remove from [Children](../windows.ui.xaml.controls/panel_children.md) of a [Panel](../windows.ui.xaml.controls/panel.md).
     * 
     * Generally, you can conceive of the object tree of a UWP app using C++, C#, or Visual Basic as representing a nested series of objects and property values. If a given object has one or more contained children held in some type of **Content** or **Children** property, then Parent describes the inverse of that relationship. Most of the time, Parent is the same value as returned by [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md)  API. However, there may be cases where Parent reports a different parent than [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md) does.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.parent
     * @type {DependencyObject} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * Gets or sets the direction in which text and other UI elements flow within any parent element that controls their layout. This property can be set to either **LeftToRight** or **RightToLeft**. Setting FlowDirection to **RightToLeft** on any element sets the alignment to the right, the reading order to right-to-left and the layout of the control to flow from right to left.
     * @remarks
     * FlowDirection is intended for support of right-to-left layout for apps. Basically, setting FlowDirection to **RightToLeft** should produce an appropriate right-to-left behavior and rendering of any XAML control that it is applied to. Specific XAML controls may have further handling within their templates or logic that responds to FlowDirection of **RightToLeft** that isn't noted in this topic, and this might be noted in the reference topics for those XAML controls.
     * 
     * An object inherits the FlowDirection value from its parent in the object tree. Any element can override the value it gets from its parent. If not specified, the default [FlowDirection](flowdirection.md) is **LeftToRight**.
     * 
     * If the FlowDirection value on an object is **RightToLeft**, certain values and behavior of the [FrameworkElement](frameworkelement.md) will change: 
     * + Within the element, the coordinate frame of reference is flipped horizontally such that "(0, 0)" will be the top right corner. This affects the values returned by hit test API such as [FindElementsInHostCoordinates](../windows.ui.xaml.media/visualtreehelper_findelementsinhostcoordinates_1478853318.md).
     * + If the [FrameworkElement](frameworkelement.md) is a [Path](../windows.ui.xaml.shapes/path.md) or other [Shape](../windows.ui.xaml.shapes/shape.md), its visual content is flipped horizontally.
     * + For layout containers, the coordinate frame of reference changes. "(0, 0)" in a [Canvas](../windows.ui.xaml.controls/canvas.md) is the top right corner. The "0" column in a Grid for purposes of [Grid.Column](/uwp/api/windows.ui.xaml.controls.grid.column) is the rightmost column.
     * + Within a control's template composition, the same layout changes apply. For example, if you set FlowDirection as **RightToLeft** for a [RadioButton](../windows.ui.xaml.controls/radiobutton.md), the clickable button graphic will appear to the right of the text label content, because the [Grid](../windows.ui.xaml.controls/grid.md) within the [RadioButton](../windows.ui.xaml.controls/radiobutton.md) template now treats "0" as the rightmost column, and the text label is right-aligned.
     * + [Image](../windows.ui.xaml.controls/image.md) has a special behavior, see "FlowDirection for Image" section below.
     * 
     * 
     * Text in text containers such as [TextBlock](../windows.ui.xaml.controls/textblock.md) or [TextBox](../windows.ui.xaml.controls/textbox.md) does not flip horizontally if FlowDirection is **RightToLeft**, neither the whole string nor individual characters or glyphs are flipped. The order of [Inline](../windows.ui.xaml.documents/inline.md) elements in an [InlineCollection](../windows.ui.xaml.documents/inlinecollection.md) does not change either. This enables mixing content in an otherwise right-to-left app, such as including deliberate English language strings in an Arabic language UI. Any string that is intended to be a text source for a text container where the intended language is a right-to-left language should specify that string in the appropriate Unicode representation, which will be correctly presented in a text container. However, a value of FlowDirection as **RightToLeft** in a text container does change the default [TextAlignment](textalignment.md) value such that the right edge of the text is right-aligned with the text container bounds.
     * 
     * FlowDirection has no visible effect on text in a [Glyphs](../windows.ui.xaml.documents/glyphs.md) element but does change the element's hit testing and coordinate frame of reference.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.flowdirection
     * @type {Integer} 
     */
    FlowDirection {
        get => this.get_FlowDirection()
        set => this.put_FlowDirection(value)
    }

    /**
     * Gets or sets the UI theme that is used by the [UIElement](uielement.md) (and its child elements) for resource determination. The UI theme you specify with RequestedTheme can override the app-level [RequestedTheme](application_requestedtheme.md).
     * @remarks
     * Changing the RequestedTheme value is effectively changing the resource lookup behavior for the element's default template. If you change the value to **Light** then the template uses the values from the [ResourceDictionary](resourcedictionary.md) that is keyed as "Light" in the [ThemeDictionaries](resourcedictionary_themedictionaries.md) collection. Setting the UI theme differently from the app's theme is often appropriate for floating controls such as menus and flyouts.
     * 
     * You can change the value of the RequestedTheme property for any given element at run-time. That's in contrast to the [Application.RequestedTheme](application_requestedtheme.md) property, which throws an exception if you try to set it while the app's running.
     * 
     * The RequestedTheme value you set on a [FrameworkElement](frameworkelement.md) will inherit to any elements that are nested within the element where RequestedTheme is set, but that inheritance can be overridden by explicitly setting RequestedTheme again. For example, in this XAML example, the parent [StackPanel](../windows.ui.xaml.controls/stackpanel.md) sets the theme to **Light**, and that value inherits to the first [TextBlock](../windows.ui.xaml.controls/textblock.md) child element, but not to the second [TextBlock](../windows.ui.xaml.controls/textblock.md) because it's setting the value to **Dark** instead.
     * ```xaml
     * <StackPanel RequestedTheme="Light">
     *   <TextBlock>Text using light theme.</TextBlock>
     *   <TextBlock RequestedTheme="Dark">Text using dark theme.</TextBlock>
     * </StackPanel>
     * ```
     * 
     * 
     * 
     * The RequestedTheme property is ignored if the user is running in high contrast mode. See [High-contrast themes](/windows/uwp/accessibility/high-contrast-themes) and [XAML high contrast style sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/XAML%20high%20contrast%20style%20sample).
     * 
     * 
     * 
     * > [!NOTE]
     * > On Windows, setting RequestedTheme to [ElementTheme.Default](elementtheme.md) will always result in "Dark" being the theme. On Windows Phone, using the [ElementTheme.Default](elementtheme.md) value will result in a query for the system theme, as set by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.requestedtheme
     * @type {Integer} 
     */
    RequestedTheme {
        get => this.get_RequestedTheme()
        set => this.put_RequestedTheme(value)
    }

    /**
     * Gets or sets a value that indicates whether the element automatically gets focus when the user interacts with it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.allowfocusoninteraction
     * @type {Boolean} 
     */
    AllowFocusOnInteraction {
        get => this.get_AllowFocusOnInteraction()
        set => this.put_AllowFocusOnInteraction(value)
    }

    /**
     * Gets or sets the outer margin of the focus visual for a [FrameworkElement](frameworkelement.md).
     * @remarks
     * A negative margin will push the border away from the center of the control, and a positive margin will move the border closer to the center of the control.
     * 
     * Non-integral values for margin values are technically permitted, but should typically be avoided.
     * 
     * [HighVisibility](focusvisualkind.md) and [Reveal](focusvisualkind.md) focus visuals are rendered with an outer (primary) and inner (secondary) border.
     * 
     * For more info, see [High Visibility Focus Visuals](/windows/uwp/design/input/guidelines-for-visualfeedback#high-visibility-focus-visuals) and [Reveal focus](/windows/uwp/design/style/reveal-focus).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualmargin
     * @type {Thickness} 
     */
    FocusVisualMargin {
        get => this.get_FocusVisualMargin()
        set => this.put_FocusVisualMargin(value)
    }

    /**
     * Gets or sets the thickness of the inner border of a `HighVisibility` or `Reveal` focus visual for a [FrameworkElement](frameworkelement.md).
     * @remarks
     * [HighVisibility](focusvisualkind.md) and [Reveal](focusvisualkind.md) focus visuals are rendered with an outer (primary) and inner (secondary) border.
     * 
     * For more info, see [High Visibility Focus Visuals](/windows/uwp/design/input/guidelines-for-visualfeedback#high-visibility-focus-visuals) and [Reveal focus](/windows/uwp/design/style/reveal-focus).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualsecondarythickness
     * @type {Thickness} 
     */
    FocusVisualSecondaryThickness {
        get => this.get_FocusVisualSecondaryThickness()
        set => this.put_FocusVisualSecondaryThickness(value)
    }

    /**
     * Gets or sets the thickness of the outer border of a `HighVisibility` or `Reveal` focus visual for a [FrameworkElement](frameworkelement.md).
     * @remarks
     * [HighVisibility](focusvisualkind.md) and [Reveal](focusvisualkind.md) focus visuals are rendered with an outer (primary) and inner (secondary) border.
     * 
     * For more info, see [High Visibility Focus Visuals](/windows/uwp/design/input/guidelines-for-visualfeedback#high-visibility-focus-visuals) and [Reveal focus](/windows/uwp/design/style/reveal-focus).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualprimarythickness
     * @type {Thickness} 
     */
    FocusVisualPrimaryThickness {
        get => this.get_FocusVisualPrimaryThickness()
        set => this.put_FocusVisualPrimaryThickness(value)
    }

    /**
     * Gets or sets the brush used to draw the inner border of a `HighVisibility` or `Reveal` focus visual for a [FrameworkElement](frameworkelement.md).
     * @remarks
     * The default colors are dependent on the [RequestedTheme](application_requestedtheme.md). Typically, the outer (primary) color is solid black, or equivalent, and the inner (secondary) color is solid white, or equivalent.
     * 
     * [HighVisibility](focusvisualkind.md) and [Reveal](focusvisualkind.md) focus visuals are rendered with an outer (primary) and inner (secondary) border.
     * 
     * For more info, see [High Visibility Focus Visuals](/windows/uwp/design/input/guidelines-for-visualfeedback#high-visibility-focus-visuals) and [Reveal focus](/windows/uwp/design/style/reveal-focus).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualsecondarybrush
     * @type {Brush} 
     */
    FocusVisualSecondaryBrush {
        get => this.get_FocusVisualSecondaryBrush()
        set => this.put_FocusVisualSecondaryBrush(value)
    }

    /**
     * Gets or sets the brush used to draw the outer border of a `HighVisibility` or `Reveal` focus visual for a [FrameworkElement](frameworkelement.md).
     * @remarks
     * The default colors are dependent on the [RequestedTheme](application_requestedtheme.md). Typically, the outer (primary) color is solid black, or equivalent, and the inner (secondary) color is solid white, or equivalent.
     * 
     * [HighVisibility](focusvisualkind.md) and [Reveal](focusvisualkind.md) focus visuals are rendered with an outer (primary) and inner (secondary) border.
     * 
     * For more info, see [High Visibility Focus Visuals](/windows/uwp/design/input/guidelines-for-visualfeedback#high-visibility-focus-visuals) and [Reveal focus](/windows/uwp/design/style/reveal-focus).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.focusvisualprimarybrush
     * @type {Brush} 
     */
    FocusVisualPrimaryBrush {
        get => this.get_FocusVisualPrimaryBrush()
        set => this.put_FocusVisualPrimaryBrush(value)
    }

    /**
     * Gets or sets whether a disabled control can receive focus.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.allowfocuswhendisabled
     * @type {Boolean} 
     */
    AllowFocusWhenDisabled {
        get => this.get_AllowFocusWhenDisabled()
        set => this.put_AllowFocusWhenDisabled(value)
    }

    /**
     * Gets the UI theme that is currently used by the element, which might be different than the [RequestedTheme](frameworkelement_requestedtheme.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.actualtheme
     * @type {Integer} 
     */
    ActualTheme {
        get => this.get_ActualTheme()
    }

    /**
     * Gets a value that indicates whether the element has been added to the element tree and is ready for interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.isloaded
     * @type {Boolean} 
     */
    IsLoaded {
        get => this.get_IsLoaded()
    }

    /**
     * Occurs when a [FrameworkElement](frameworkelement.md) has been constructed and added to the object tree, and is ready for interaction.
     * @remarks
     * Although this event uses the [RoutedEventHandler](routedeventhandler.md) delegate and [RoutedEventArgs](routedeventargs.md) as event data, the event is not a routed event. It can be handled only on the element that originates the event (in other words, the *sender*). [OriginalSource](routedeventargs_originalsource.md) in event data for this event is always **null**.
     * @type {RoutedEventHandler}
    */
    OnLoaded {
        get {
            if(!this.HasProp("__OnLoaded")){
                this.__OnLoaded := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnLoadedToken := this.add_Loaded(this.__OnLoaded.iface)
            }
            return this.__OnLoaded
        }
    }

    /**
     * Occurs when this object is no longer connected to the main object tree.
     * @remarks
     * Although this event uses the [RoutedEventHandler](routedeventhandler.md) delegate and [RoutedEventArgs](routedeventargs.md) as event data, the event is not truly a routed event. It can only be handled on the element that originates the event (in other words, the sender). [OriginalSource](routedeventargs_originalsource.md) in event data for this event is always null.
     * @type {RoutedEventHandler}
    */
    OnUnloaded {
        get {
            if(!this.HasProp("__OnUnloaded")){
                this.__OnUnloaded := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnUnloadedToken := this.add_Unloaded(this.__OnUnloaded.iface)
            }
            return this.__OnUnloaded
        }
    }

    /**
     * Occurs when either the [ActualHeight](frameworkelement_actualheight.md) or the [ActualWidth](frameworkelement_actualwidth.md) property changes value on a [FrameworkElement](frameworkelement.md).
     * @remarks
     * SizeChanged fires whenever the size (either [ActualHeight](frameworkelement_actualheight.md) or [ActualWidth](frameworkelement_actualwidth.md)) has changed on the object, which is after the **Measure** and **Arrange** passes are complete.
     * 
     * The [SizeChangedEventArgs](sizechangedeventargs.md) event data for the SizeChanged event provides two properties: the [PreviousSize](sizechangedeventargs_previoussize.md) value, representing the size of the element before the layout change happened, and the [NewSize](sizechangedeventargs_newsize.md) value, representing the current size. To get the height and width info use the [Height](/uwp/api/windows.foundation.size.height) and [Width](/uwp/api/windows.foundation.size.width) values of the [Size](../windows.foundation/size.md) structure value for these [SizeChangedEventArgs](sizechangedeventargs.md) properties within your event handler.
     * 
     * One reason to handle the SizeChanged event is to see whether the ratio of an element's [ActualHeight](frameworkelement_actualheight.md) versus [ActualWidth](frameworkelement_actualwidth.md) have changed, because of a new layout. For example, this might happen if the user has resized the app window and the overall app view is now a narrow view.
     * 
     * SizeChanged occurs during initial layout of elements on a page, when the app first is activated, because the [ActualHeight](frameworkelement_actualheight.md) and [ActualWidth](frameworkelement_actualwidth.md) values for UI elements are undefined before layout happens. They only get values during the initial layout pass and thus the SizeChanged event occurs. Thereafter, during an app's lifetime, the SizeChanged event can fire from an element again if the [ActualHeight](frameworkelement_actualheight.md) and [ActualWidth](frameworkelement_actualwidth.md) values change for other reasons. These include:
     * + Code that adjusts the [Height](frameworkelement_height.md) and [Width](frameworkelement_width.md) of that element specifically.
     * + Code that changes the constraint properties (like [MinHeight](frameworkelement_minheight.md) or [MaxHeight](frameworkelement_maxheight.md) affecting the [ActualHeight](frameworkelement_actualheight.md)).
     * + Databinding values refreshed or new styles applied that affect any of the layout-related properties of [FrameworkElement](frameworkelement.md).
     * + Code that adjusts the dimensions of a container like a [Panel](../windows.ui.xaml.controls/panel.md) or [ListBox](../windows.ui.xaml.controls/listbox.md) that is the parent of an element. This often triggers a layout pass. Due to the new layout conditions, a contained child element might now have more or less space available, and that could result in a new [ActualHeight](frameworkelement_actualheight.md) and [ActualWidth](frameworkelement_actualwidth.md) for an element within.
     * + Other changes that happen at run-time that change layout space even if they're not directly changing [FrameworkElement](frameworkelement.md) layout properties. For example, a list that's based on databinding to items might refresh or update, and that could cause size changes in items, items controls, list views, and so on. Or a list view that supports incremental loading might fetch more items and expand the list view.
     * + The user changes the app [Window](window.md) size ([Window.SizeChanged](window_sizechanged.md) occurs), which in turn affects the size of the top-level [Page](../windows.ui.xaml.controls/page.md) and perhaps the adaptive layout-derived sizes of elements within that page that use "Auto" layout or **Stretch** alignment and didn't specify dimensions.
     * + [ApplicationView](../windows.ui.viewmanagement/applicationview.md) changes or [DisplayInformation](../windows.graphics.display/displayinformation.md) changes that ultimately affect the window and page dimensions, and potentially all the UI elements within.
     * 
     * 
     * It is not strictly necessary to avoid calling other API that influence layout of the current object from within a SizeChanged handler. For example: setting [Height](frameworkelement_height.md) or [Width](frameworkelement_width.md); calling [InvalidateMeasure](uielement_invalidatemeasure_969784920.md) or [UpdateLayout](uielement_updatelayout_1243658106.md); calling [ApplyTemplate](../windows.ui.xaml.controls/control_applytemplate_1368990630.md); any operation that might resize child elements and thus invalidate the parent layout. The layout engine has internal logic that stabilizes the values before an object fires the event again, so the logic is usually robust enough to avoid looping conditions. However, it is still possible to inadvertently define sizing or rendering loops that can hang your app, which generally throws exceptions like [LayoutCycleException](/dotnet/api/windows.ui.xaml.layoutcycleexception?view=dotnet-plat-ext-3.1?&preserve-view=true) rather than actually hanging. This happens if your handler logic combined with surrounding layout is not capable of reaching an end result for the size of the relevant object.
     * 
     * If the position of the object within a parent container changes, but not the size, SizeChanged won't occur.
     * 
     * [LayoutUpdated](frameworkelement_layoutupdated.md) is a similar event, but [LayoutUpdated](frameworkelement_layoutupdated.md) is also fired for position changes. Also, [LayoutUpdated](frameworkelement_layoutupdated.md) occurrence is not scoped to a specific object's layout properties, it's reporting on the entire visual tree that an object is contained in. [LayoutUpdated](frameworkelement_layoutupdated.md) informs you that something within the overall visual tree that contains the object has changed, but the layout specifics (size, position) of the object where the handler is attached might not have changed.
     * 
     * Although this event uses a [RoutedEventHandler](routedeventhandler.md)-related delegate and a [RoutedEventArgs](routedeventargs.md)-derived class as event data, the event is not truly a routed event. It doesn't bubble through an object tree. It can be handled only on the element that originates the event (in other words, the sender). [OriginalSource](routedeventargs_originalsource.md) in event data for this event is always **null**, so don't try to use the [OriginalSource](routedeventargs_originalsource.md).
     * @type {SizeChangedEventHandler}
    */
    OnSizeChanged {
        get {
            if(!this.HasProp("__OnSizeChanged")){
                this.__OnSizeChanged := WinRTEventHandler(
                    SizeChangedEventHandler,
                    SizeChangedEventHandler.IID,
                    IInspectable,
                    SizeChangedEventArgs
                )
                this.__OnSizeChangedToken := this.add_SizeChanged(this.__OnSizeChanged.iface)
            }
            return this.__OnSizeChanged
        }
    }

    /**
     * Occurs when the layout of the visual tree changes, due to layout-relevant properties changing value or some other action that refreshes the layout.
     * @remarks
     * LayoutUpdated is the last object lifetime event to occur in the XAML load sequence before a control is ready for interaction. However, LayoutUpdated can also occur at run time during the object lifetime, for a variety of reasons: a property change, a window resizing, or a runtime layout request ([UpdateLayout](uielement_updatelayout_1243658106.md) or a changed control template). The LayoutUpdated event is fired after all [SizeChanged](frameworkelement_sizechanged.md) events in a layout sequence occur.
     * 
     * LayoutUpdated can occur when the object where the handler is attached does not necessarily change anything in the visual tree under it. For instance, imagine a layout container where there are two child elements sharing space. If the first object changes a property that forces a new layout, both objects fire LayoutUpdated because the second object might be repositioned even if its own subsidiary layout does not change.
     * 
     * When you handle LayoutUpdated, do not rely on the *sender* value. For LayoutUpdated, *sender* is always **null**, regardless of where the handler is attached. This is to prevent handlers from assigning any meaning to *sender*, such as implying that it was that specific element that fired the event out of the visual tree. LayoutUpdated implies that something in the overall visual tree has changed, and each specific object anywhere in the tree has the option of handling this occurrence. If you're familiar with lower-level render API design, you can equate LayoutUpdated being fired as similar to a "redraw needed" flag being set as part of an object-driven, retained-mode rendering logic.
     * 
     * Because LayoutUpdated fires in many circumstances and isn't always specific to an object that actually changes, consider whether handling the [SizeChanged](frameworkelement_sizechanged.md) event instead is more appropriate for your scenario.
     * 
     * 
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 454659-->
     * @type {EventHandler<IInspectable>}
    */
    OnLayoutUpdated {
        get {
            if(!this.HasProp("__OnLayoutUpdated")){
                this.__OnLayoutUpdated := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnLayoutUpdatedToken := this.add_LayoutUpdated(this.__OnLayoutUpdated.iface)
            }
            return this.__OnLayoutUpdated
        }
    }

    /**
     * Occurs when the value of the [FrameworkElement.DataContext](frameworkelement_datacontext.md) property changes.
     * @remarks
     * The [FrameworkElement.DataContext](frameworkelement_datacontext.md) property has a built-in behavior whereby its value inherits to all [FrameworkElement](frameworkelement.md) child elements of a [FrameworkElement](frameworkelement.md) where a [DataContext](frameworkelement_datacontext.md) value is set. This behavior enables a set of related elements to use the same context to bind to different source properties, which is particularly useful for item templates, data templates, and other data binding scenarios. Because [DataContext](frameworkelement_datacontext.md) inherits, there's potential for each [FrameworkElement](frameworkelement.md) that uses the inherited value to fire another DataContextChanged event that's sourced from the inheriting element, not the parent element, once the element detects that its inherited [DataContext](frameworkelement_datacontext.md) value has changed. If you don't want this behavior, you should handle the DataContextChanged event on the parent source, where the event will fire first. As part of your handler logic, set the value of the [Handled](datacontextchangedeventargs_handled.md) property in the [DataContextChangedEventArgs](datacontextchangedeventargs.md) event data to **true**. That action will prevent the event from routing to child elements.
     * 
     * > [!NOTE]
     * > DataContextChanged has routing behavior but isn't a true routed event (it does not have a [RoutedEvent](routedevent.md) identifier). Also, it routes from parent to child whereas the true routed events route from child to parent. If you're familiar with Windows Presentation Foundation (WPF), DataContextChanged might be considered a tunneling routed event by the Windows Presentation Foundation (WPF) event routing definitions.
     * 
     * DataContextChanged is useful for scenarios where control logic or other code-based logic wants notification that the data context for bindings has changed, which often means that data bound values will change. This can be useful as a trigger to run code that makes context-driven changes, and then the new context can be used by existing bindings to recalculate values. It's also useful for cases where you don't want a pre-existing declared binding in data templates, but need a notification for changes. In this scenario you can handle DataContextChanged to detect changes to the data context and make direct changes to other properties in your code in response, just like a XAML-declared binding does dynamically through the data binding engine. For example, you might have a custom control that's mainly for use inside data templates, and you want the control to be able to perform binding operations without any explicit **Binding** declarations either in the app UI XAML or in the data template.
     * @type {TypedEventHandler<FrameworkElement, DataContextChangedEventArgs>}
    */
    OnDataContextChanged {
        get {
            if(!this.HasProp("__OnDataContextChanged")){
                this.__OnDataContextChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b01c8a21-de6f-5edd-8796-300e3fe66382}"),
                    FrameworkElement,
                    DataContextChangedEventArgs
                )
                this.__OnDataContextChangedToken := this.add_DataContextChanged(this.__OnDataContextChanged.iface)
            }
            return this.__OnDataContextChanged
        }
    }

    /**
     * Occurs when a [FrameworkElement](frameworkelement.md) begins to load.
     * @type {TypedEventHandler<FrameworkElement, IInspectable>}
    */
    OnLoading {
        get {
            if(!this.HasProp("__OnLoading")){
                this.__OnLoading := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c229f252-dede-5d42-a01a-8479d56a7d2f}"),
                    FrameworkElement,
                    IInspectable
                )
                this.__OnLoadingToken := this.add_Loading(this.__OnLoading.iface)
            }
            return this.__OnLoading
        }
    }

    /**
     * Occurs when the ActualTheme property value has changed.
     * @type {TypedEventHandler<FrameworkElement, IInspectable>}
    */
    OnActualThemeChanged {
        get {
            if(!this.HasProp("__OnActualThemeChanged")){
                this.__OnActualThemeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c229f252-dede-5d42-a01a-8479d56a7d2f}"),
                    FrameworkElement,
                    IInspectable
                )
                this.__OnActualThemeChangedToken := this.add_ActualThemeChanged(this.__OnActualThemeChanged.iface)
            }
            return this.__OnActualThemeChanged
        }
    }

    /**
     * Occurs when the [FrameworkElement](frameworkelement.md)'s *effective viewport* changes.
     * @remarks
     * A scrolling control allows the user to pan/scroll through content that takes up more space than is available in the UI. The portion of the content that the user sees is called the *viewport*.
     * 
     * The EffectiveViewportChanged event provides multiple pieces of information:
     * 
     * 1. The actual [EffectiveViewport](effectiveviewportchangedeventargs_effectiveviewport.md)
     * 1. A calculation for the [MaxViewport](effectiveviewportchangedeventargs_maxviewport.md)
     * 1. Scalar values for the [BringIntoViewDistanceX](effectiveviewportchangedeventargs_bringintoviewdistancex.md) and [BringIntoViewDistanceY](effectiveviewportchangedeventargs_bringintoviewdistancey.md)
     * @type {TypedEventHandler<FrameworkElement, EffectiveViewportChangedEventArgs>}
    */
    OnEffectiveViewportChanged {
        get {
            if(!this.HasProp("__OnEffectiveViewportChanged")){
                this.__OnEffectiveViewportChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{515219d1-a1d0-5737-9019-9a755e93f6b2}"),
                    FrameworkElement,
                    EffectiveViewportChangedEventArgs
                )
                this.__OnEffectiveViewportChangedToken := this.add_EffectiveViewportChanged(this.__OnEffectiveViewportChanged.iface)
            }
            return this.__OnEffectiveViewportChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLoadedToken")) {
            this.remove_Loaded(this.__OnLoadedToken)
            this.__OnLoaded.iface.Dispose()
        }

        if(this.HasProp("__OnUnloadedToken")) {
            this.remove_Unloaded(this.__OnUnloadedToken)
            this.__OnUnloaded.iface.Dispose()
        }

        if(this.HasProp("__OnSizeChangedToken")) {
            this.remove_SizeChanged(this.__OnSizeChangedToken)
            this.__OnSizeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnLayoutUpdatedToken")) {
            this.remove_LayoutUpdated(this.__OnLayoutUpdatedToken)
            this.__OnLayoutUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnDataContextChangedToken")) {
            this.remove_DataContextChanged(this.__OnDataContextChangedToken)
            this.__OnDataContextChanged.iface.Dispose()
        }

        if(this.HasProp("__OnLoadingToken")) {
            this.remove_Loading(this.__OnLoadingToken)
            this.__OnLoading.iface.Dispose()
        }

        if(this.HasProp("__OnActualThemeChangedToken")) {
            this.remove_ActualThemeChanged(this.__OnActualThemeChangedToken)
            this.__OnActualThemeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnEffectiveViewportChangedToken")) {
            this.remove_EffectiveViewportChanged(this.__OnEffectiveViewportChangedToken)
            this.__OnEffectiveViewportChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {TriggerCollection} 
     */
    get_Triggers() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Triggers()
    }

    /**
     * 
     * @returns {ResourceDictionary} 
     */
    get_Resources() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Resources()
    }

    /**
     * 
     * @param {ResourceDictionary} value 
     * @returns {HRESULT} 
     */
    put_Resources(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_Resources(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Tag() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Tag()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_Tag(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_Language(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualWidth() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_ActualWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualHeight() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_ActualHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Width() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Width()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Width(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_Width(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Height() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Height()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Height(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_Height(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinWidth() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_MinWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinWidth(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_MinWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxWidth() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_MaxWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxWidth(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_MaxWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinHeight() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_MinHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinHeight(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_MinHeight(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxHeight() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_MaxHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxHeight(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_MaxHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalAlignment() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_HorizontalAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalAlignment(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_HorizontalAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalAlignment() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_VerticalAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalAlignment(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_VerticalAlignment(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Margin() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Margin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Margin(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_Margin(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_Name(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_BaseUri() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_BaseUri()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DataContext() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_DataContext()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_DataContext(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_DataContext(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_Style() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Style()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_Style(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_Style(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_Parent() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_Parent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlowDirection() {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.get_FlowDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FlowDirection(value) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.put_FlowDirection(value)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Loaded(handler) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.add_Loaded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Loaded(token) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.remove_Loaded(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Unloaded(handler) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.add_Unloaded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Unloaded(token) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.remove_Unloaded(token)
    }

    /**
     * 
     * @param {SizeChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SizeChanged(handler) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.add_SizeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SizeChanged(token) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.remove_SizeChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LayoutUpdated(handler) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.add_LayoutUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LayoutUpdated(token) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.remove_LayoutUpdated(token)
    }

    /**
     * Retrieves an object that has the specified identifier name.
     * @remarks
     * > [!IMPORTANT]
     * > In order to use the FindName method effectively, you should understand the concept of a XAML namescope, and how a XAML namescope is created at XAML load time and then referenced and possibly modified at run time. For more info see [XAML namescopes](/windows/uwp/xaml-platform/xaml-namescopes).
     * 
     * The most common usage of FindName in your Windows Runtime code will be from within the generated **InitializeComponent** call for a XAML page. In this situation, FindName is invoked only after the XAML page is loaded. **InitializeComponent** provides the infrastructure such that any object that was instantiated by XAML loading can conveniently be accessed by your code-behind code. You can then reference the objects as a variable that shares the same name as the markup-declared [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute).
     * 
     * A run-time API such as FindName is working against a run-time object tree of the app as it exists in memory. When part of this object tree is created from templates or run-time loaded XAML, a XAML namescope is typically not contiguous within that object tree. The result is that there might be a named object in the object tree that a given FindName scope cannot find. The discontinuities between XAML namescopes that you might encounter in typical application scenarios are when objects are created by applying a template, or when objects are created by a call to [XamlReader.Load](../windows.ui.xaml.markup/xamlreader_load_1077941801.md) and subsequently added to the object tree.
     * 
     * If you return an unexpected null result for FindName, try these techniques:
     * + For named objects that come from a template, if you are defining or deriving from a control, you can call [GetTemplateChild](../windows.ui.xaml.controls/control_gettemplatechild_501346084.md) from the scope of the object where the template is applied. You must be in a derived-class definition scope in order to use [GetTemplateChild](../windows.ui.xaml.controls/control_gettemplatechild_501346084.md), because it is a protected method of [Control](../windows.ui.xaml.controls/control.md).
     * + If you are not in a derived-class definition scope, you may be able to enter the visual tree of a template, by using [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md) at a point in object lifetime after the template is applied (handle the [Loaded](frameworkelement_loaded.md) event). [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md) uses a parent-child metaphor for walking the tree, rather than using the XAML namescope concept. Walking the tree generally requires a specific knowledge of the control's composition as it comes from a given template. You can use [VisualTreeHelper.GetChild](../windows.ui.xaml.media/visualtreehelper.md) on the control to get the control's applied template root, and call FindName specifically on the template root to access elements that are named within the template XAML.
     * + For the [XamlReader.Load](../windows.ui.xaml.markup/xamlreader_load_1077941801.md) case, you should preserve a reference to the return value of the [XamlReader.Load](../windows.ui.xaml.markup/xamlreader_load_1077941801.md) call, which is an object that will become the owner or basis of the created XAML namescope that is relevant. Then call FindName from that scope instead.
     * 
     * 
     * The object returned by FindName is not necessarily a [FrameworkElement](frameworkelement.md). For example, you might apply a name to an animation storyboard, and the various animation storyboard types do not derive from [FrameworkElement](frameworkelement.md).
     * 
     * The [Name](frameworkelement_name.md) property for an object (or the similar [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute)) is assigned by specifying an attribute on an object element in XAML markup. You can set a [Name](frameworkelement_name.md) value after the initial source XAML is loaded, but this technique has some limitations (see Remarks in [Name](frameworkelement_name.md)).
     * 
     * [TextElement](../windows.ui.xaml.documents/textelement.md) defines a similar [FindName](../windows.ui.xaml.documents/textelement_findname_634111277.md). This enables a **FindName** behavior in the object model, which is not limited to [FrameworkElement](frameworkelement.md). Calls by either implementation of **FindName** can traverse into a mixed [FrameworkElement](frameworkelement.md) / text element object tree, and use a common XAML namescope so that a FrameworkElement.FindName call can find a named text element, and vice versa.
     * 
     * [Name](frameworkelement_name.md) values that are added or changed at run time in the object tree will update into the acting XAML namescope at that level in the object tree. In other words, if you create a new [FrameworkElement](frameworkelement.md), give it a [Name](frameworkelement_name.md), then add it to the object tree, calling FindName from within that XAML namescope can find and return the code-created object.
     * @param {HSTRING} name The name of the requested object.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.findname
     */
    FindName(name) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.FindName(name)
    }

    /**
     * Attaches a binding to a [FrameworkElement](frameworkelement.md), using the provided binding object.
     * @remarks
     * This method is a convenience method that calls [BindingOperations.SetBinding](../windows.ui.xaml.data/bindingoperations_setbinding_746099660.md), passing the current instance as the *target* parameter.
     * 
     * The type of the *binding* parameter is [BindingBase](../windows.ui.xaml.data/bindingbase.md) for compatibility reasons, but in the Windows Runtime you always pass a [Binding](../windows.ui.xaml.data/binding.md) instance. [Binding](../windows.ui.xaml.data/binding.md) is derived from [BindingBase](../windows.ui.xaml.data/bindingbase.md).
     * 
     * The *dp* parameter takes a dependency property identifier. For more info on dependency properties and how a [DependencyProperty](dependencyproperty.md) value serves as the identifier, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * 
     * You can bind to custom dependency properties or custom attached properties, the identifier you pass as the *dp* parameter doesn't have to be a Windows Runtime defined property.
     * 
     * Whether a binding created from code will be able to use an acting data context depends on object lifetime considerations. For example, a [DataContext](frameworkelement_datacontext.md) value that is set from XAML won't be available until the XAML is parsed. In that case you may want to use a [Loaded](frameworkelement_loaded.md) handler to add bindings from code.
     * 
     * 
     * 
     * > [!NOTE]
     * > Calling the SetBinding method and passing in a new [Binding](../windows.ui.xaml.data/binding.md) object won't necessarily remove an existing binding. Instead, you should first call the [DependencyObject.ClearValue](dependencyobject_clearvalue_1095854009.md) method, then call SetBinding.
     * @param {DependencyProperty} dp The dependency property identifier of the property that is data bound.
     * @param {BindingBase} binding_ The binding to use for the property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.setbinding
     */
    SetBinding(dp, binding_) {
        if (!this.HasProp("__IFrameworkElement")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement := IFrameworkElement(outPtr)
        }

        return this.__IFrameworkElement.SetBinding(dp, binding_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedTheme() {
        if (!this.HasProp("__IFrameworkElement2")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement2 := IFrameworkElement2(outPtr)
        }

        return this.__IFrameworkElement2.get_RequestedTheme()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestedTheme(value) {
        if (!this.HasProp("__IFrameworkElement2")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement2 := IFrameworkElement2(outPtr)
        }

        return this.__IFrameworkElement2.put_RequestedTheme(value)
    }

    /**
     * 
     * @param {TypedEventHandler<FrameworkElement, DataContextChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataContextChanged(handler) {
        if (!this.HasProp("__IFrameworkElement2")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement2 := IFrameworkElement2(outPtr)
        }

        return this.__IFrameworkElement2.add_DataContextChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DataContextChanged(token) {
        if (!this.HasProp("__IFrameworkElement2")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement2 := IFrameworkElement2(outPtr)
        }

        return this.__IFrameworkElement2.remove_DataContextChanged(token)
    }

    /**
     * Returns the [BindingExpression](../windows.ui.xaml.data/bindingexpression.md) that represents the binding on the specified property.
     * @param {DependencyProperty} dp The identifier for the target dependency property to get the binding from.
     * @returns {BindingExpression} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.getbindingexpression
     */
    GetBindingExpression(dp) {
        if (!this.HasProp("__IFrameworkElement2")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement2 := IFrameworkElement2(outPtr)
        }

        return this.__IFrameworkElement2.GetBindingExpression(dp)
    }

    /**
     * 
     * @param {TypedEventHandler<FrameworkElement, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Loading(handler) {
        if (!this.HasProp("__IFrameworkElement3")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement3 := IFrameworkElement3(outPtr)
        }

        return this.__IFrameworkElement3.add_Loading(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Loading(token) {
        if (!this.HasProp("__IFrameworkElement3")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement3 := IFrameworkElement3(outPtr)
        }

        return this.__IFrameworkElement3.remove_Loading(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowFocusOnInteraction() {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.get_AllowFocusOnInteraction()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowFocusOnInteraction(value) {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.put_AllowFocusOnInteraction(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FocusVisualMargin() {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.get_FocusVisualMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualMargin(value) {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.put_FocusVisualMargin(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FocusVisualSecondaryThickness() {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.get_FocusVisualSecondaryThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualSecondaryThickness(value) {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.put_FocusVisualSecondaryThickness(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FocusVisualPrimaryThickness() {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.get_FocusVisualPrimaryThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualPrimaryThickness(value) {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.put_FocusVisualPrimaryThickness(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusVisualSecondaryBrush() {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.get_FocusVisualSecondaryBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualSecondaryBrush(value) {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.put_FocusVisualSecondaryBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusVisualPrimaryBrush() {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.get_FocusVisualPrimaryBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualPrimaryBrush(value) {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.put_FocusVisualPrimaryBrush(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowFocusWhenDisabled() {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.get_AllowFocusWhenDisabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowFocusWhenDisabled(value) {
        if (!this.HasProp("__IFrameworkElement4")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement4 := IFrameworkElement4(outPtr)
        }

        return this.__IFrameworkElement4.put_AllowFocusWhenDisabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActualTheme() {
        if (!this.HasProp("__IFrameworkElement6")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement6 := IFrameworkElement6(outPtr)
        }

        return this.__IFrameworkElement6.get_ActualTheme()
    }

    /**
     * 
     * @param {TypedEventHandler<FrameworkElement, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActualThemeChanged(handler) {
        if (!this.HasProp("__IFrameworkElement6")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement6 := IFrameworkElement6(outPtr)
        }

        return this.__IFrameworkElement6.add_ActualThemeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActualThemeChanged(token) {
        if (!this.HasProp("__IFrameworkElement6")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement6 := IFrameworkElement6(outPtr)
        }

        return this.__IFrameworkElement6.remove_ActualThemeChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLoaded() {
        if (!this.HasProp("__IFrameworkElement7")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement7 := IFrameworkElement7(outPtr)
        }

        return this.__IFrameworkElement7.get_IsLoaded()
    }

    /**
     * 
     * @param {TypedEventHandler<FrameworkElement, EffectiveViewportChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EffectiveViewportChanged(handler) {
        if (!this.HasProp("__IFrameworkElement7")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement7 := IFrameworkElement7(outPtr)
        }

        return this.__IFrameworkElement7.add_EffectiveViewportChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EffectiveViewportChanged(token) {
        if (!this.HasProp("__IFrameworkElement7")) {
            if ((queryResult := this.QueryInterface(IFrameworkElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElement7 := IFrameworkElement7(outPtr)
        }

        return this.__IFrameworkElement7.remove_EffectiveViewportChanged(token)
    }

    /**
     * Invalidates the viewport state for a [UIElement](uielement.md) that is used to calculate the *effective viewport*.
     * @remarks
     * The [UIElement](uielement.md) must have previously been registered with the framework using the [RegisterAsScrollPort](uielement_registerasscrollport_591917999.md) method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.invalidateviewport
     */
    InvalidateViewport() {
        if (!this.HasProp("__IFrameworkElementProtected7")) {
            if ((queryResult := this.QueryInterface(IFrameworkElementProtected7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElementProtected7 := IFrameworkElementProtected7(outPtr)
        }

        return this.__IFrameworkElementProtected7.InvalidateViewport()
    }

    /**
     * Provides the behavior for the "Measure" pass of the layout cycle. Classes can override this method to define their own "Measure" pass behavior.
     * @remarks
     * This method has a default implementation that performs built-in layout for most [FrameworkElement](frameworkelement.md) derived classes. MeasureOverride provides the behavior for [Measure](uielement_measure_1722732750.md), whenever [Measure](uielement_measure_1722732750.md) is called either by internal layout logic or your own app's code, including any MeasureOverride methods of your own for other classes. If you are producing a templated control, the MeasureOverride logic defines your control's specific "Measure" pass layout logic.
     * 
     * The general design of how elements go through a layout process when your app runs is divided into two steps: a "Measure" pass, and then an "Arrange" pass. Control authors (or panel authors) who want to customize the "Measure" pass of layout processing should override MeasureOverride. Your implementation should do the following: 
     * + Iterate your class's particular collection of child objects that are part of layout, and call [Measure](uielement_measure_1722732750.md) on each child object.
     * + Immediately get [DesiredSize](uielement_desiredsize.md) on each child (this is set as a property after [Measure](uielement_measure_1722732750.md) is called).
     * + Compute the net desired size of the parent, based on the running measurement of the size that is needed for child objects.
     *  The return value of MeasureOverride should be the object's own desired size, which then becomes the [Measure](uielement_measure_1722732750.md) input for the parent of the current object. This same process continues through the layout system until the root of the page/object tree is reached. During this process, child objects might return a larger [DesiredSize](uielement_desiredsize.md) size than the initial *availableSize* to indicate that the child object wants more space. This might be handled in your own implementation by introducing a scrollable region, resizing the parent control, establishing some manner of stacked order, or any number of solutions for measuring or arranging content that can vary depending on your layout container's intended functionality.
     * @param {SIZE} availableSize The available size that this object can give to child objects. Infinity can be specified as a value to indicate that the object will size to whatever content is available.
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.measureoverride
     */
    MeasureOverride(availableSize) {
        if (!this.HasProp("__IFrameworkElementOverrides")) {
            if ((queryResult := this.QueryInterface(IFrameworkElementOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElementOverrides := IFrameworkElementOverrides(outPtr)
        }

        return this.__IFrameworkElementOverrides.MeasureOverride(availableSize)
    }

    /**
     * Provides the behavior for the "Arrange" pass of layout. Classes can override this method to define their own "Arrange" pass behavior.
     * @remarks
     * This method has a default implementation that performs built-in layout for most [FrameworkElement](frameworkelement.md) derived classes. ArrangeOverride provides the behavior for [Arrange](uielement_arrange_958316931.md), whenever [Arrange](uielement_arrange_958316931.md) is called either by internal layout logic or your own app's code, including any ArrangeOverride methods of your own for other classes. If you are producing a templated control, the ArrangeOverride logic defines your control's specific "Arrange" pass layout logic.
     * 
     * The general design of how elements go through a layout process when your app runs is divided into two steps: a "Measure" pass, and then an "Arrange" pass. Control authors (or panel authors) who want to customize the "Arrange" pass of layout processing should override ArrangeOverride. The implementation pattern should call [Arrange](uielement_arrange_958316931.md) on each visible child object, and pass the final desired size for each child object as the *finalRect* parameter. If [Arrange](uielement_arrange_958316931.md) isn't called, the child object is not rendered.
     * 
     * Several existing non-sealed classes provide override implementations of this method. Prominent ones include [StackPanel](../windows.ui.xaml.controls/stackpanel.md) and [Grid](../windows.ui.xaml.controls/grid.md). Typically, the behavior of ArrangeOverride produces a *finalSize* that does not violate any user-defined values that are placed on the layout container itself. For example, the *finalSize* is not typically larger than the container's [Height](frameworkelement_height.md) and [Width](frameworkelement_width.md), accounting for **Margin** or **Padding** values that affect the content area. Controls that specifically have a scenario for exceeding the container size could return a larger value, but anyone using that control must account for the clipping and positioning issues that result from it. The value that an ArrangeOverride implementation passes to [Arrange](uielement_arrange_958316931.md) for each child object is generally the value that is set in [DesiredSize](uielement_desiredsize.md) by the previous [Measure](uielement_measure_1722732750.md) call.
     * @param {SIZE} finalSize The final area within the parent that this object should use to arrange itself and its children.
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.arrangeoverride
     */
    ArrangeOverride(finalSize) {
        if (!this.HasProp("__IFrameworkElementOverrides")) {
            if ((queryResult := this.QueryInterface(IFrameworkElementOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElementOverrides := IFrameworkElementOverrides(outPtr)
        }

        return this.__IFrameworkElementOverrides.ArrangeOverride(finalSize)
    }

    /**
     * Invoked whenever application code or internal processes (such as a rebuilding layout pass) call [ApplyTemplate](../windows.ui.xaml.controls/control_applytemplate_1368990630.md). In simplest terms, this means the method is called just before a UI element displays in your app. Override this method to influence the default post-template logic of a class.
     * @remarks
     * Although OnApplyTemplate is a method defined by the [FrameworkElement](frameworkelement.md) class, the OnApplyTemplate behavior and the scenarios for overriding OnApplyTemplate are mainly relevant to a [Control](../windows.ui.xaml.controls/control.md) subclass. This is because the [Template](../windows.ui.xaml.controls/control_template.md) property that you typically define in a XAML file and the internal Windows Runtime logic that applies the templates are specifically for controls. Specialized template behavior also exists for [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) and [ContentControl](../windows.ui.xaml.controls/contentcontrol.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.onapplytemplate
     */
    OnApplyTemplate() {
        if (!this.HasProp("__IFrameworkElementOverrides")) {
            if ((queryResult := this.QueryInterface(IFrameworkElementOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElementOverrides := IFrameworkElementOverrides(outPtr)
        }

        return this.__IFrameworkElementOverrides.OnApplyTemplate()
    }

    /**
     * When implemented in a derived class, enables per-state construction of a visual tree for a control template in code, rather than by loading XAML for all states at control startup.
     * @remarks
     * The default implementation of FrameworkElement.GoToElementStateCore provides the normal state change behavior that's accessed by calling [VisualStateManager.GoToState](visualstatemanager_gotostate_443481648.md), and also the default control template / visual state loading behavior for any XAML control. You should only override FrameworkElement.GoToElementStateCore if you are prepared to take full responsibility for constructing the visual tree for a control in your code at run time. This includes presentation of any content that comes from content properties, child element collections, and so on.
     * 
     * For general state change logic in a custom control, you should use [VisualStateManager.GoToState](visualstatemanager_gotostate_443481648.md). The intended scenario for FrameworkElement.GoToElementStateCore is more limited, it's specifically intended for apps or controls that want to optimize the template or logic that creates the visual tree of a [ListViewItem](../windows.ui.xaml.controls/listviewitem.md) or a [GridViewItem](../windows.ui.xaml.controls/gridviewitem.md) and presents the contents.
     * 
     * [VisualStateManager.GoToState](visualstatemanager_gotostate_443481648.md) has a slightly different signature because it's a static utility API and uses a *control* parameter to specify what control to apply state changes to. FrameworkElement.GoToElementStateCore uses the calling object to get this information.
     * @param {HSTRING} stateName The state to transition to.
     * @param {Boolean} useTransitions **true** to use a [VisualTransition](visualtransition.md) to transition between states. **false** to skip using transitions and go directly to the requested state. The default is **false**.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkelement.gotoelementstatecore
     */
    GoToElementStateCore(stateName, useTransitions) {
        if (!this.HasProp("__IFrameworkElementOverrides2")) {
            if ((queryResult := this.QueryInterface(IFrameworkElementOverrides2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElementOverrides2 := IFrameworkElementOverrides2(outPtr)
        }

        return this.__IFrameworkElementOverrides2.GoToElementStateCore(stateName, useTransitions)
    }

;@endregion Instance Methods
}
