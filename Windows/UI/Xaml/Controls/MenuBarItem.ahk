#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IMenuBarItem.ahk
#Include .\IMenuBarItemFactory.ahk
#Include .\IMenuBarItemStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a top-level menu in a MenuBar control.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.MenuBarItem](/windows/winui/api/microsoft.ui.xaml.controls.menubaritem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menubaritem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MenuBarItem extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuBarItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuBarItem.IID

    /**
     * Identifies the Title dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.MenuBarItem.TitleProperty](/windows/winui/api/microsoft.ui.xaml.controls.menubaritem.titleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menubaritem.titleproperty
     * @type {DependencyProperty} 
     */
    static TitleProperty {
        get => MenuBarItem.get_TitleProperty()
    }

    /**
     * Identifies the Items dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.MenuBarItem.ItemsProperty](/windows/winui/api/microsoft.ui.xaml.controls.menubaritem.itemsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menubaritem.itemsproperty
     * @type {DependencyProperty} 
     */
    static ItemsProperty {
        get => MenuBarItem.get_ItemsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MenuBarItem} 
     */
    static CreateInstance() {
        if (!MenuBarItem.HasProp("__IMenuBarItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuBarItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuBarItemFactory.IID)
            MenuBarItem.__IMenuBarItemFactory := IMenuBarItemFactory(factoryPtr)
        }

        return MenuBarItem.__IMenuBarItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TitleProperty() {
        if (!MenuBarItem.HasProp("__IMenuBarItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuBarItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuBarItemStatics.IID)
            MenuBarItem.__IMenuBarItemStatics := IMenuBarItemStatics(factoryPtr)
        }

        return MenuBarItem.__IMenuBarItemStatics.get_TitleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsProperty() {
        if (!MenuBarItem.HasProp("__IMenuBarItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuBarItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuBarItemStatics.IID)
            MenuBarItem.__IMenuBarItemStatics := IMenuBarItemStatics(factoryPtr)
        }

        return MenuBarItem.__IMenuBarItemStatics.get_ItemsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the text label for a MenuBar menu.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.MenuBarItem.Title](/windows/winui/api/microsoft.ui.xaml.controls.menubaritem.title) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menubaritem.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets the collection of commands in a MenuBar menu.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.MenuBarItem.Items](/windows/winui/api/microsoft.ui.xaml.controls.menubaritem.items) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menubaritem.items
     * @type {IVector<MenuFlyoutItemBase>} 
     */
    Items {
        get => this.get_Items()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IMenuBarItem")) {
            if ((queryResult := this.QueryInterface(IMenuBarItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuBarItem := IMenuBarItem(outPtr)
        }

        return this.__IMenuBarItem.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IMenuBarItem")) {
            if ((queryResult := this.QueryInterface(IMenuBarItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuBarItem := IMenuBarItem(outPtr)
        }

        return this.__IMenuBarItem.put_Title(value)
    }

    /**
     * 
     * @returns {IVector<MenuFlyoutItemBase>} 
     */
    get_Items() {
        if (!this.HasProp("__IMenuBarItem")) {
            if ((queryResult := this.QueryInterface(IMenuBarItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuBarItem := IMenuBarItem(outPtr)
        }

        return this.__IMenuBarItem.get_Items()
    }

;@endregion Instance Methods
}
