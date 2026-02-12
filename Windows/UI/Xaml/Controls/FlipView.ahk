#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\Selector.ahk
#Include .\IFlipView.ahk
#Include .\IFlipView2.ahk
#Include .\IFlipViewFactory.ahk
#Include .\IFlipViewStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an items control that displays one item at a time, and enables "flip" behavior for traversing its collection of items.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Flip view](/windows/uwp/design/controls-and-patterns/flipview).
 * 
 * Use a FlipView to present a collection of items that the user views sequentially, one at a time. It's useful for displaying a gallery of images or the pages of a magazine.
 * 
 * FlipView is an [ItemsControl](itemscontrol.md), so it can contain a collection of items of any type. To populate the view, add items to the [Items](itemscontrol_items.md) collection, or set the [ItemsSource](itemscontrol_itemssource.md) property to a data source.
 * 
 * By default, a data item is displayed in the FlipView as the string representation of the data object it's bound to. To specify exactly how items in the FlipView are displayed, you create a [DataTemplate](../windows.ui.xaml/datatemplate.md) to define the layout of controls used to display an individual item. The controls in the layout can be bound to properties of a data object, or have content defined inline. You assign the [DataTemplate](../windows.ui.xaml/datatemplate.md) to the [ItemTemplate](itemscontrol_itemtemplate.md) property of the FlipView.
 * 
 * For more info, see these topics:
 * + [Quickstart: Adding FlipView controls](/previous-versions/windows/apps/hh781233(v=win.10))
 * + [How to add a flip  view](/previous-versions/windows/apps/jj150601(v=win.10))
 * 
 * 
 * > [!NOTE]
 * > When a user flips through FlipView content using touch interaction, a [SelectionChanged](../windows.ui.xaml.controls.primitives/selector_selectionchanged.md) event occurs only when touch manipulations are complete. This means that when a user flips through content quickly, individual [SelectionChanged](../windows.ui.xaml.controls.primitives/selector_selectionchanged.md) events are not always generated for every item because the manipulation is still occurring.
 * 
 * If you need to handle pointer events for a [UIElement](../windows.ui.xaml/uielement.md) in a scrollable view (such as a ScrollViewer), you must explicitly disable support for manipulation events on the element in the view by calling [UIElement.CancelDirectManipulation()](../windows.ui.xaml/uielement_canceldirectmanipulations_1164631120.md). To re-enable manipulation events in the view, call [UIElement.TryStartDirectManipulation()](../windows.ui.xaml/uielement_trystartdirectmanipulation_1983346775.md).
 * 
 * For more examples, see [XAML FlipView sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20FlipView%20control%20sample).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flipview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class FlipView extends Selector {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlipView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlipView.IID

    /**
     * Identifies the [UseTouchAnimationsForAllNavigation](flipview_usetouchanimationsforallnavigation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flipview.usetouchanimationsforallnavigationproperty
     * @type {DependencyProperty} 
     */
    static UseTouchAnimationsForAllNavigationProperty {
        get => FlipView.get_UseTouchAnimationsForAllNavigationProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {FlipView} 
     */
    static CreateInstance() {
        if (!FlipView.HasProp("__IFlipViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FlipView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlipViewFactory.IID)
            FlipView.__IFlipViewFactory := IFlipViewFactory(factoryPtr)
        }

        return FlipView.__IFlipViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UseTouchAnimationsForAllNavigationProperty() {
        if (!FlipView.HasProp("__IFlipViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.FlipView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlipViewStatics2.IID)
            FlipView.__IFlipViewStatics2 := IFlipViewStatics2(factoryPtr)
        }

        return FlipView.__IFlipViewStatics2.get_UseTouchAnimationsForAllNavigationProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether transition animations are always used whether the navigation is touch-based, button-based or programmatic.
     * @remarks
     * The XAML [FlipView](flipview.md) control supports three modes of navigation; touch-based, button-based and programmatic. When a user navigates by touch, the [FlipView](flipview.md) items scroll smoothly into view. When you set this property to **true**, the same navigation animation occurs whether the navigation is touch-based, button-based and programmatic. If UseTouchAnimationsForAllNavigation is **false** and the user navigates by mouse, keyboard, or programmatically, the animation doesn't occur and items just pop into view.
     * 
     * <!--Windows Blue bug 467555-->
     * > **Windows 8**
     * > In Windows 8, the [FlipView](flipview.md) navigation animation occurs only when the user navigates by touch. If you recompile an app built for Windows 8 for Windows 8.1 and need to keep the Windows 8 behavior, set this property to **false**. For example, if you check the [HorizontalOffset](scrollviewer_horizontaloffset.md) property value of [FlipView](flipview.md)'s internal [ScrollViewer](scrollviewer.md) while the selection is changing, the value is not fixed until the animation is complete. If your app has a dependency on this value, you can set this property to **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.flipview.usetouchanimationsforallnavigation
     * @type {Boolean} 
     */
    UseTouchAnimationsForAllNavigation {
        get => this.get_UseTouchAnimationsForAllNavigation()
        set => this.put_UseTouchAnimationsForAllNavigation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseTouchAnimationsForAllNavigation() {
        if (!this.HasProp("__IFlipView2")) {
            if ((queryResult := this.QueryInterface(IFlipView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlipView2 := IFlipView2(outPtr)
        }

        return this.__IFlipView2.get_UseTouchAnimationsForAllNavigation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseTouchAnimationsForAllNavigation(value) {
        if (!this.HasProp("__IFlipView2")) {
            if ((queryResult := this.QueryInterface(IFlipView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlipView2 := IFlipView2(outPtr)
        }

        return this.__IFlipView2.put_UseTouchAnimationsForAllNavigation(value)
    }

;@endregion Instance Methods
}
