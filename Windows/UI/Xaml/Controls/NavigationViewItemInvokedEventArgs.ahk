#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INavigationViewItemInvokedEventArgs.ahk
#Include .\INavigationViewItemInvokedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [NavigationView.ItemInvoked](navigationview_iteminvoked.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItemInvokedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewiteminvokedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewiteminvokedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewItemInvokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewItemInvokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewItemInvokedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a reference to the invoked item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItemInvokedEventArgs.InvokedItem](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewiteminvokedeventargs.invokeditem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * This property gets the data item that was invoked. To get the NavigationViewItem that is the container for the invoked item, use the [InvokedItemContainer](navigationviewiteminvokedeventargs_invokeditemcontainer.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewiteminvokedeventargs.invokeditem
     * @type {IInspectable} 
     */
    InvokedItem {
        get => this.get_InvokedItem()
    }

    /**
     * Gets a value that indicates whether the **InvokedItem** is the menu item for Settings.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItemInvokedEventArgs.IsSettingsInvoked](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewiteminvokedeventargs.issettingsinvoked) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewiteminvokedeventargs.issettingsinvoked
     * @type {Boolean} 
     */
    IsSettingsInvoked {
        get => this.get_IsSettingsInvoked()
    }

    /**
     * Gets the container for the invoked item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItemInvokedEventArgs.InvokedItemContainer](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewiteminvokedeventargs.invokeditemcontainer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * This property gets the NavigationViewItem that is the container for the invoked item. To get the data item that was invoked, use the [InvokedItem](navigationviewiteminvokedeventargs_invokeditem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewiteminvokedeventargs.invokeditemcontainer
     * @type {NavigationViewItemBase} 
     */
    InvokedItemContainer {
        get => this.get_InvokedItemContainer()
    }

    /**
     * Gets the navigation transition recommended for the direction of the navigation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItemInvokedEventArgs.RecommendedNavigationTransitionInfo](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewiteminvokedeventargs.recommendednavigationtransitioninfo) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewiteminvokedeventargs.recommendednavigationtransitioninfo
     * @type {NavigationTransitionInfo} 
     */
    RecommendedNavigationTransitionInfo {
        get => this.get_RecommendedNavigationTransitionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the NavigationViewItemInvokedEventArgs class.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItemInvokedEventArgs.-ctor](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewiteminvokedeventargs.-ctor) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewItemInvokedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_InvokedItem() {
        if (!this.HasProp("__INavigationViewItemInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationViewItemInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItemInvokedEventArgs := INavigationViewItemInvokedEventArgs(outPtr)
        }

        return this.__INavigationViewItemInvokedEventArgs.get_InvokedItem()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSettingsInvoked() {
        if (!this.HasProp("__INavigationViewItemInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationViewItemInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItemInvokedEventArgs := INavigationViewItemInvokedEventArgs(outPtr)
        }

        return this.__INavigationViewItemInvokedEventArgs.get_IsSettingsInvoked()
    }

    /**
     * 
     * @returns {NavigationViewItemBase} 
     */
    get_InvokedItemContainer() {
        if (!this.HasProp("__INavigationViewItemInvokedEventArgs2")) {
            if ((queryResult := this.QueryInterface(INavigationViewItemInvokedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItemInvokedEventArgs2 := INavigationViewItemInvokedEventArgs2(outPtr)
        }

        return this.__INavigationViewItemInvokedEventArgs2.get_InvokedItemContainer()
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_RecommendedNavigationTransitionInfo() {
        if (!this.HasProp("__INavigationViewItemInvokedEventArgs2")) {
            if ((queryResult := this.QueryInterface(INavigationViewItemInvokedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItemInvokedEventArgs2 := INavigationViewItemInvokedEventArgs2(outPtr)
        }

        return this.__INavigationViewItemInvokedEventArgs2.get_RecommendedNavigationTransitionInfo()
    }

;@endregion Instance Methods
}
