#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NavigationViewItemBase.ahk
#Include .\INavigationViewItem.ahk
#Include .\INavigationViewItem2.ahk
#Include .\INavigationViewItemFactory.ahk
#Include .\INavigationViewItemStatics2.ahk
#Include .\INavigationViewItemStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in a [NavigationView](navigationview.md) control.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItem](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * Note that prior to Windows 10, version 1809 (10.0; Build 17763) you could only place **NavigationViewItems** in **NavigationView.MenuItems**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewItem extends NavigationViewItemBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewItem.IID

    /**
     * Identifies the SelectsOnInvoked dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItem.SelectsOnInvokedProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitem.selectsoninvokedproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitem.selectsoninvokedproperty
     * @type {DependencyProperty} 
     */
    static SelectsOnInvokedProperty {
        get => NavigationViewItem.get_SelectsOnInvokedProperty()
    }

    /**
     * Identifies the Icon dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItem.IconProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitem.iconproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitem.iconproperty
     * @type {DependencyProperty} 
     */
    static IconProperty {
        get => NavigationViewItem.get_IconProperty()
    }

    /**
     * Identifies the CompactPaneLength dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItem.CompactPaneLengthProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitem.compactpanelengthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitem.compactpanelengthproperty
     * @type {DependencyProperty} 
     */
    static CompactPaneLengthProperty {
        get => NavigationViewItem.get_CompactPaneLengthProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {NavigationViewItem} 
     */
    static CreateInstance() {
        if (!NavigationViewItem.HasProp("__INavigationViewItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemFactory.IID)
            NavigationViewItem.__INavigationViewItemFactory := INavigationViewItemFactory(factoryPtr)
        }

        return NavigationViewItem.__INavigationViewItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectsOnInvokedProperty() {
        if (!NavigationViewItem.HasProp("__INavigationViewItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemStatics2.IID)
            NavigationViewItem.__INavigationViewItemStatics2 := INavigationViewItemStatics2(factoryPtr)
        }

        return NavigationViewItem.__INavigationViewItemStatics2.get_SelectsOnInvokedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconProperty() {
        if (!NavigationViewItem.HasProp("__INavigationViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemStatics.IID)
            NavigationViewItem.__INavigationViewItemStatics := INavigationViewItemStatics(factoryPtr)
        }

        return NavigationViewItem.__INavigationViewItemStatics.get_IconProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CompactPaneLengthProperty() {
        if (!NavigationViewItem.HasProp("__INavigationViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemStatics.IID)
            NavigationViewItem.__INavigationViewItemStatics := INavigationViewItemStatics(factoryPtr)
        }

        return NavigationViewItem.__INavigationViewItemStatics.get_CompactPaneLengthProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the icon to show next to the menu item text.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItem.Icon](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitem.icon) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * You can assign a value from the [Symbol](symbol.md) enumeration, or a Unicode string that references a glyph in the Segoe MDL2 Assets font.
     * 
     * You can use the Character Map application that comes with Windows to browse the font's glyphs and find their Unicode values. Then, use the format `"&#x(UNICODE);"` in XAML, or the format `"\u(UNICODE)"` in code, where `(UNICODE)` is the value of the glyph that indicates the location in the font file. See [FontIcon](fonticon.md) for more examples.
     * 
     * The Segoe MDL2 Assets font ships with Windows 10, and new glyphs might be added in every release. You should verify that the Unicode value you choose is available in the minimum SDK build version your project targets.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitem.icon
     * @type {IconElement} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

    /**
     * Gets the [CompactPaneLength](navigationview_compactpanelength.md) of the NavigationView that hosts this item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItem.CompactPaneLength](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitem.compactpanelength) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitem.compactpanelength
     * @type {Float} 
     */
    CompactPaneLength {
        get => this.get_CompactPaneLength()
    }

    /**
     * Gets or sets a value that indicates whether invoking a navigation menu item also selects it.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItem.SelectsOnInvoked](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitem.selectsoninvoked) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitem.selectsoninvoked
     * @type {Boolean} 
     */
    SelectsOnInvoked {
        get => this.get_SelectsOnInvoked()
        set => this.put_SelectsOnInvoked(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IconElement} 
     */
    get_Icon() {
        if (!this.HasProp("__INavigationViewItem")) {
            if ((queryResult := this.QueryInterface(INavigationViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItem := INavigationViewItem(outPtr)
        }

        return this.__INavigationViewItem.get_Icon()
    }

    /**
     * 
     * @param {IconElement} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__INavigationViewItem")) {
            if ((queryResult := this.QueryInterface(INavigationViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItem := INavigationViewItem(outPtr)
        }

        return this.__INavigationViewItem.put_Icon(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompactPaneLength() {
        if (!this.HasProp("__INavigationViewItem")) {
            if ((queryResult := this.QueryInterface(INavigationViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItem := INavigationViewItem(outPtr)
        }

        return this.__INavigationViewItem.get_CompactPaneLength()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SelectsOnInvoked() {
        if (!this.HasProp("__INavigationViewItem2")) {
            if ((queryResult := this.QueryInterface(INavigationViewItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItem2 := INavigationViewItem2(outPtr)
        }

        return this.__INavigationViewItem2.get_SelectsOnInvoked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SelectsOnInvoked(value) {
        if (!this.HasProp("__INavigationViewItem2")) {
            if ((queryResult := this.QueryInterface(INavigationViewItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItem2 := INavigationViewItem2(outPtr)
        }

        return this.__INavigationViewItem2.put_SelectsOnInvoked(value)
    }

;@endregion Instance Methods
}
