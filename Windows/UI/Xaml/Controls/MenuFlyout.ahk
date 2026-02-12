#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\FlyoutBase.ahk
#Include .\IMenuFlyout.ahk
#Include .\IMenuFlyout2.ahk
#Include .\IMenuFlyoutFactory.ahk
#Include .\IMenuFlyoutStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a flyout that displays a menu of commands.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Menus and context menus](/windows/uwp/design/controls-and-patterns/menus).
 * 
 * MenuFlyout temporarily displays a list of commands or options related to what the user is currently doing.
 * 
 * <img src="images/controls/MenuFlyout.png" alt="Menu flyout control" />
 * 
 * Use a [Flyout](flyout.md) control to display single items and a MenuFlyout control to show a menu of items. For more info, see [Menus and context menus](/windows/uwp/controls-and-patterns/menus).
 * 
 * A MenuFlyout control can be used as the value of the [Button.Flyout](button_flyout.md) property. This is usually set in XAML as part of a UI definition of the page. [Button](button.md) is the only control that has a dedicated **Flyout** property. When set as [Button.Flyout](button_flyout.md), the MenuFlyout displays when the button is tapped or otherwise invoked.
 * 
 * To associate a MenuFlyout with other controls, use the [ContextFlyout](../windows.ui.xaml/uielement_contextflyout.md) property that's available on any UIElement.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MenuFlyout extends FlyoutBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyout.IID

    /**
     * Identifies the [MenuFlyoutPresenterStyle](menuflyout_menuflyoutpresenterstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyout.menuflyoutpresenterstyleproperty
     * @type {DependencyProperty} 
     */
    static MenuFlyoutPresenterStyleProperty {
        get => MenuFlyout.get_MenuFlyoutPresenterStyleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MenuFlyout} 
     */
    static CreateInstance() {
        if (!MenuFlyout.HasProp("__IMenuFlyoutFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutFactory.IID)
            MenuFlyout.__IMenuFlyoutFactory := IMenuFlyoutFactory(factoryPtr)
        }

        return MenuFlyout.__IMenuFlyoutFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MenuFlyoutPresenterStyleProperty() {
        if (!MenuFlyout.HasProp("__IMenuFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutStatics.IID)
            MenuFlyout.__IMenuFlyoutStatics := IMenuFlyoutStatics(factoryPtr)
        }

        return MenuFlyout.__IMenuFlyoutStatics.get_MenuFlyoutPresenterStyleProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection used to generate the content of the menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyout.items
     * @type {IVector<MenuFlyoutItemBase>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets the style that is used when rendering the [MenuFlyout](menuflyout.md).
     * @remarks
     * The [TargetType](../windows.ui.xaml/style_targettype.md) value to use for the [Style](../windows.ui.xaml/style.md) must be [MenuFlyoutPresenter](menuflyoutpresenter.md) (not **MenuFlyout**).
     * 
     * You can't style a [MenuFlyout](menuflyout.md) directly. Instead, you apply a style to the [MenuFlyoutPresenter](menuflyoutpresenter.md) that provides the visuals for the flyout. You can also style [MenuFlyoutItem](menuflyoutitem.md) and [ToggleMenuFlyoutItem](togglemenuflyoutitem.md) (they are controls) and you can use implicit styles to do so. Or, you can set UI-related properties on the [MenuFlyoutItem](menuflyoutitem.md) and [ToggleMenuFlyoutItem](togglemenuflyoutitem.md) items directly.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyout.menuflyoutpresenterstyle
     * @type {Style} 
     */
    MenuFlyoutPresenterStyle {
        get => this.get_MenuFlyoutPresenterStyle()
        set => this.put_MenuFlyoutPresenterStyle(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<MenuFlyoutItemBase>} 
     */
    get_Items() {
        if (!this.HasProp("__IMenuFlyout")) {
            if ((queryResult := this.QueryInterface(IMenuFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyout := IMenuFlyout(outPtr)
        }

        return this.__IMenuFlyout.get_Items()
    }

    /**
     * 
     * @returns {Style} 
     */
    get_MenuFlyoutPresenterStyle() {
        if (!this.HasProp("__IMenuFlyout")) {
            if ((queryResult := this.QueryInterface(IMenuFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyout := IMenuFlyout(outPtr)
        }

        return this.__IMenuFlyout.get_MenuFlyoutPresenterStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_MenuFlyoutPresenterStyle(value) {
        if (!this.HasProp("__IMenuFlyout")) {
            if ((queryResult := this.QueryInterface(IMenuFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyout := IMenuFlyout(outPtr)
        }

        return this.__IMenuFlyout.put_MenuFlyoutPresenterStyle(value)
    }

    /**
     * Shows the flyout placed at the specified offset in relation to the specified target element.
     * @remarks
     * When you call this method to show a MenuFlyout, it automatically renders outside the application window if possible and required.
     * 
     * Some properties might not flow as expected, such as [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md). To ensure correct flow, you can set the flow direction in the [MenuFlyoutPresenter](menuflyoutpresenter.md) The MenuFlyoutPresenter must be set before the MenuFlyout is first shown.
     * @param {UIElement} targetElement The element to use as the flyout's placement target.
     * @param {POINT} point_ The point at which to offset the flyout from the specified target element.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyout.showat
     */
    ShowAt(targetElement, point_) {
        if (!this.HasProp("__IMenuFlyout2")) {
            if ((queryResult := this.QueryInterface(IMenuFlyout2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyout2 := IMenuFlyout2(outPtr)
        }

        return this.__IMenuFlyout2.ShowAt(targetElement, point_)
    }

;@endregion Instance Methods
}
