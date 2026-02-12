#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INavigationViewSelectionChangedEventArgs.ahk
#Include .\INavigationViewSelectionChangedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [NavigationView.SelectionChanged](navigationview_selectionchanged.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewSelectionChangedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewselectionchangedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewselectionchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewSelectionChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewSelectionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewSelectionChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the newly selected menu item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewSelectionChangedEventArgs.SelectedItem](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewselectionchangedeventargs.selecteditem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * This property gets the data item that was selected. To get the NavigationViewItem that is the container for the selected item, use the [SelectedItemContainer](navigationviewselectionchangedeventargs_selecteditemcontainer.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewselectionchangedeventargs.selecteditem
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
    }

    /**
     * Gets a value that indicates whether the **SelectedItem** is the menu item for Settings.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewSelectionChangedEventArgs.IsSettingsSelected](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewselectionchangedeventargs.issettingsselected) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewselectionchangedeventargs.issettingsselected
     * @type {Boolean} 
     */
    IsSettingsSelected {
        get => this.get_IsSettingsSelected()
    }

    /**
     * Gets the container for the selected item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewSelectionChangedEventArgs.SelectedItemContainer](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewselectionchangedeventargs.selecteditemcontainer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * This property gets the NavigationViewItem that is the container for the selected item. To get the data item that was selected, use the [SelectedItem](navigationviewselectionchangedeventargs_selecteditem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewselectionchangedeventargs.selecteditemcontainer
     * @type {NavigationViewItemBase} 
     */
    SelectedItemContainer {
        get => this.get_SelectedItemContainer()
    }

    /**
     * Gets the navigation transition recommended for the direction of the navigation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewSelectionChangedEventArgs.RecommendedNavigationTransitionInfo](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewselectionchangedeventargs.recommendednavigationtransitioninfo) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewselectionchangedeventargs.recommendednavigationtransitioninfo
     * @type {NavigationTransitionInfo} 
     */
    RecommendedNavigationTransitionInfo {
        get => this.get_RecommendedNavigationTransitionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        if (!this.HasProp("__INavigationViewSelectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationViewSelectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewSelectionChangedEventArgs := INavigationViewSelectionChangedEventArgs(outPtr)
        }

        return this.__INavigationViewSelectionChangedEventArgs.get_SelectedItem()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSettingsSelected() {
        if (!this.HasProp("__INavigationViewSelectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationViewSelectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewSelectionChangedEventArgs := INavigationViewSelectionChangedEventArgs(outPtr)
        }

        return this.__INavigationViewSelectionChangedEventArgs.get_IsSettingsSelected()
    }

    /**
     * 
     * @returns {NavigationViewItemBase} 
     */
    get_SelectedItemContainer() {
        if (!this.HasProp("__INavigationViewSelectionChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(INavigationViewSelectionChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewSelectionChangedEventArgs2 := INavigationViewSelectionChangedEventArgs2(outPtr)
        }

        return this.__INavigationViewSelectionChangedEventArgs2.get_SelectedItemContainer()
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_RecommendedNavigationTransitionInfo() {
        if (!this.HasProp("__INavigationViewSelectionChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(INavigationViewSelectionChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewSelectionChangedEventArgs2 := INavigationViewSelectionChangedEventArgs2(outPtr)
        }

        return this.__INavigationViewSelectionChangedEventArgs2.get_RecommendedNavigationTransitionInfo()
    }

;@endregion Instance Methods
}
