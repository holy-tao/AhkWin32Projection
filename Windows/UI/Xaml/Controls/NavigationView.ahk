#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\INavigationView.ahk
#Include .\INavigationView2.ahk
#Include .\INavigationView3.ahk
#Include .\INavigationViewStatics2.ahk
#Include .\INavigationViewStatics3.ahk
#Include .\INavigationViewFactory.ahk
#Include .\INavigationViewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\NavigationView.ahk
#Include .\NavigationViewSelectionChangedEventArgs.ahk
#Include .\NavigationViewItemInvokedEventArgs.ahk
#Include .\NavigationViewDisplayModeChangedEventArgs.ahk
#Include .\NavigationViewBackRequestedEventArgs.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\NavigationViewPaneClosingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a container that enables navigation of app content. It has a header, a view for the main content, and a menu pane for navigation commands.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView](/windows/winui/api/microsoft.ui.xaml.controls.navigationview) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationView extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationView.IID

    /**
     * Identifies the IsBackButtonVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsBackButtonVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.isbackbuttonvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.isbackbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsBackButtonVisibleProperty {
        get => NavigationView.get_IsBackButtonVisibleProperty()
    }

    /**
     * Identifies the IsBackEnabled dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsBackEnabledProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.isbackenabledproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.isbackenabledproperty
     * @type {DependencyProperty} 
     */
    static IsBackEnabledProperty {
        get => NavigationView.get_IsBackEnabledProperty()
    }

    /**
     * Identifies the PaneTitle dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneTitleProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panetitleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panetitleproperty
     * @type {DependencyProperty} 
     */
    static PaneTitleProperty {
        get => NavigationView.get_PaneTitleProperty()
    }

    /**
     * Identifies the PaneDisplayMode dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneDisplayModeProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panedisplaymodeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panedisplaymodeproperty
     * @type {DependencyProperty} 
     */
    static PaneDisplayModeProperty {
        get => NavigationView.get_PaneDisplayModeProperty()
    }

    /**
     * Identifies the PaneHeader dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneHeaderProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.paneheaderproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.paneheaderproperty
     * @type {DependencyProperty} 
     */
    static PaneHeaderProperty {
        get => NavigationView.get_PaneHeaderProperty()
    }

    /**
     * Identifies the PaneCustomContent dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneCustomContentProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panecustomcontentproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panecustomcontentproperty
     * @type {DependencyProperty} 
     */
    static PaneCustomContentProperty {
        get => NavigationView.get_PaneCustomContentProperty()
    }

    /**
     * Identifies the ContentOverlay dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.ContentOverlayProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.contentoverlayproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.contentoverlayproperty
     * @type {DependencyProperty} 
     */
    static ContentOverlayProperty {
        get => NavigationView.get_ContentOverlayProperty()
    }

    /**
     * Identifies the IsPaneVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsPaneVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.ispanevisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.ispanevisibleproperty
     * @type {DependencyProperty} 
     */
    static IsPaneVisibleProperty {
        get => NavigationView.get_IsPaneVisibleProperty()
    }

    /**
     * Identifies the SelectionFollowsFocus dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.SelectionFollowsFocusProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.selectionfollowsfocusproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.selectionfollowsfocusproperty
     * @type {DependencyProperty} 
     */
    static SelectionFollowsFocusProperty {
        get => NavigationView.get_SelectionFollowsFocusProperty()
    }

    /**
     * Identifies the TemplateSettings dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.TemplateSettingsProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.templatesettingsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.templatesettingsproperty
     * @type {DependencyProperty} 
     */
    static TemplateSettingsProperty {
        get => NavigationView.get_TemplateSettingsProperty()
    }

    /**
     * Identifies the ShoulderNavigationEnabled dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.ShoulderNavigationEnabledProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.shouldernavigationenabledproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.shouldernavigationenabledproperty
     * @type {DependencyProperty} 
     */
    static ShoulderNavigationEnabledProperty {
        get => NavigationView.get_ShoulderNavigationEnabledProperty()
    }

    /**
     * Identifies the OverflowLabelMode dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.OverflowLabelModeProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.overflowlabelmodeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.overflowlabelmodeproperty
     * @type {DependencyProperty} 
     */
    static OverflowLabelModeProperty {
        get => NavigationView.get_OverflowLabelModeProperty()
    }

    /**
     * Identifies the IsPaneOpen dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsPaneOpenProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.ispaneopenproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.ispaneopenproperty
     * @type {DependencyProperty} 
     */
    static IsPaneOpenProperty {
        get => NavigationView.get_IsPaneOpenProperty()
    }

    /**
     * Identifies the CompactModeThresholdWidth dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.CompactModeThresholdWidthProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.compactmodethresholdwidthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.compactmodethresholdwidthproperty
     * @type {DependencyProperty} 
     */
    static CompactModeThresholdWidthProperty {
        get => NavigationView.get_CompactModeThresholdWidthProperty()
    }

    /**
     * Identifies the ExpandedModeThresholdWidth dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.ExpandedModeThresholdWidthProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.expandedmodethresholdwidthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.expandedmodethresholdwidthproperty
     * @type {DependencyProperty} 
     */
    static ExpandedModeThresholdWidthProperty {
        get => NavigationView.get_ExpandedModeThresholdWidthProperty()
    }

    /**
     * Identifies the PaneFooter dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneFooterProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panefooterproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panefooterproperty
     * @type {DependencyProperty} 
     */
    static PaneFooterProperty {
        get => NavigationView.get_PaneFooterProperty()
    }

    /**
     * Identifies the Header dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.HeaderProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.headerproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => NavigationView.get_HeaderProperty()
    }

    /**
     * Identifies the HeaderTemplate dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.HeaderTemplateProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.headertemplateproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => NavigationView.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the DisplayMode dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.DisplayModeProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.displaymodeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.displaymodeproperty
     * @type {DependencyProperty} 
     */
    static DisplayModeProperty {
        get => NavigationView.get_DisplayModeProperty()
    }

    /**
     * Identifies the IsSettingsVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsSettingsVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.issettingsvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.issettingsvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsSettingsVisibleProperty {
        get => NavigationView.get_IsSettingsVisibleProperty()
    }

    /**
     * Identifies the IsPaneToggleButtonVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsPaneToggleButtonVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.ispanetogglebuttonvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.ispanetogglebuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsPaneToggleButtonVisibleProperty {
        get => NavigationView.get_IsPaneToggleButtonVisibleProperty()
    }

    /**
     * Identifies the AlwaysShowHeader dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.AlwaysShowHeaderProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.alwaysshowheaderproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.alwaysshowheaderproperty
     * @type {DependencyProperty} 
     */
    static AlwaysShowHeaderProperty {
        get => NavigationView.get_AlwaysShowHeaderProperty()
    }

    /**
     * Identifies the CompactPaneLength dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.CompactPaneLengthProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.compactpanelengthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.compactpanelengthproperty
     * @type {DependencyProperty} 
     */
    static CompactPaneLengthProperty {
        get => NavigationView.get_CompactPaneLengthProperty()
    }

    /**
     * Identifies the OpenPaneLength dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.OpenPaneLengthProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.openpanelengthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.openpanelengthproperty
     * @type {DependencyProperty} 
     */
    static OpenPaneLengthProperty {
        get => NavigationView.get_OpenPaneLengthProperty()
    }

    /**
     * Identifies the PaneToggleButtonStyle dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneToggleButtonStyleProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panetogglebuttonstyleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panetogglebuttonstyleproperty
     * @type {DependencyProperty} 
     */
    static PaneToggleButtonStyleProperty {
        get => NavigationView.get_PaneToggleButtonStyleProperty()
    }

    /**
     * Identifies the MenuItems dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemsProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemsproperty
     * @type {DependencyProperty} 
     */
    static MenuItemsProperty {
        get => NavigationView.get_MenuItemsProperty()
    }

    /**
     * Identifies the MenuItemsSource dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemsSourceProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemssourceproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemssourceproperty
     * @type {DependencyProperty} 
     */
    static MenuItemsSourceProperty {
        get => NavigationView.get_MenuItemsSourceProperty()
    }

    /**
     * Identifies the SelectedItem dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.SelectedItemProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.selecteditemproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.selecteditemproperty
     * @type {DependencyProperty} 
     */
    static SelectedItemProperty {
        get => NavigationView.get_SelectedItemProperty()
    }

    /**
     * Identifies the SettingsItem dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.SettingsItemProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.settingsitemproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.settingsitemproperty
     * @type {DependencyProperty} 
     */
    static SettingsItemProperty {
        get => NavigationView.get_SettingsItemProperty()
    }

    /**
     * Identifies the AutoSuggestBox dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.AutoSuggestBoxProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.autosuggestboxproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.autosuggestboxproperty
     * @type {DependencyProperty} 
     */
    static AutoSuggestBoxProperty {
        get => NavigationView.get_AutoSuggestBoxProperty()
    }

    /**
     * Identifies the MenuItemTemplate dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemTemplateProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemtemplateproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemtemplateproperty
     * @type {DependencyProperty} 
     */
    static MenuItemTemplateProperty {
        get => NavigationView.get_MenuItemTemplateProperty()
    }

    /**
     * Identifies the MenuItemTemplateSelector dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemTemplateSelectorProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemtemplateselectorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemtemplateselectorproperty
     * @type {DependencyProperty} 
     */
    static MenuItemTemplateSelectorProperty {
        get => NavigationView.get_MenuItemTemplateSelectorProperty()
    }

    /**
     * Identifies the MenuItemContainerStyle dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemContainerStyleProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemcontainerstyleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemcontainerstyleproperty
     * @type {DependencyProperty} 
     */
    static MenuItemContainerStyleProperty {
        get => NavigationView.get_MenuItemContainerStyleProperty()
    }

    /**
     * Identifies the MenuItemContainerStyleSelector dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemContainerStyleSelectorProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemcontainerstyleselectorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemcontainerstyleselectorproperty
     * @type {DependencyProperty} 
     */
    static MenuItemContainerStyleSelectorProperty {
        get => NavigationView.get_MenuItemContainerStyleSelectorProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsBackButtonVisibleProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics2.IID)
            NavigationView.__INavigationViewStatics2 := INavigationViewStatics2(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics2.get_IsBackButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsBackEnabledProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics2.IID)
            NavigationView.__INavigationViewStatics2 := INavigationViewStatics2(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics2.get_IsBackEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneTitleProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics2.IID)
            NavigationView.__INavigationViewStatics2 := INavigationViewStatics2(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics2.get_PaneTitleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneDisplayModeProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_PaneDisplayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneHeaderProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_PaneHeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneCustomContentProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_PaneCustomContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentOverlayProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_ContentOverlayProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPaneVisibleProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_IsPaneVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionFollowsFocusProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_SelectionFollowsFocusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TemplateSettingsProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_TemplateSettingsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShoulderNavigationEnabledProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_ShoulderNavigationEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OverflowLabelModeProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics3.IID)
            NavigationView.__INavigationViewStatics3 := INavigationViewStatics3(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics3.get_OverflowLabelModeProperty()
    }

    /**
     * 
     * @returns {NavigationView} 
     */
    static CreateInstance() {
        if (!NavigationView.HasProp("__INavigationViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewFactory.IID)
            NavigationView.__INavigationViewFactory := INavigationViewFactory(factoryPtr)
        }

        return NavigationView.__INavigationViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPaneOpenProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_IsPaneOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CompactModeThresholdWidthProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_CompactModeThresholdWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExpandedModeThresholdWidthProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_ExpandedModeThresholdWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneFooterProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_PaneFooterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisplayModeProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_DisplayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSettingsVisibleProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_IsSettingsVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPaneToggleButtonVisibleProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_IsPaneToggleButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlwaysShowHeaderProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_AlwaysShowHeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CompactPaneLengthProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_CompactPaneLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpenPaneLengthProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_OpenPaneLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneToggleButtonStyleProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_PaneToggleButtonStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MenuItemsProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_MenuItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MenuItemsSourceProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_MenuItemsSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedItemProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_SelectedItemProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SettingsItemProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_SettingsItemProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutoSuggestBoxProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_AutoSuggestBoxProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MenuItemTemplateProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_MenuItemTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MenuItemTemplateSelectorProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_MenuItemTemplateSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MenuItemContainerStyleProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_MenuItemContainerStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MenuItemContainerStyleSelectorProperty() {
        if (!NavigationView.HasProp("__INavigationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewStatics.IID)
            NavigationView.__INavigationViewStatics := INavigationViewStatics(factoryPtr)
        }

        return NavigationView.__INavigationViewStatics.get_MenuItemContainerStyleSelectorProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that specifies whether the NavigationView pane is expanded to its full width.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsPaneOpen](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.ispaneopen) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.ispaneopen
     * @type {Boolean} 
     */
    IsPaneOpen {
        get => this.get_IsPaneOpen()
        set => this.put_IsPaneOpen(value)
    }

    /**
     * Gets or sets the minimum window width at which the NavigationView enters Compact display mode.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.CompactModeThresholdWidth](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.compactmodethresholdwidth) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.compactmodethresholdwidth
     * @type {Float} 
     */
    CompactModeThresholdWidth {
        get => this.get_CompactModeThresholdWidth()
        set => this.put_CompactModeThresholdWidth(value)
    }

    /**
     * Gets or sets the minimum window width at which the NavigationView enters **Expanded** display mode.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.ExpandedModeThresholdWidth](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.expandedmodethresholdwidth) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.expandedmodethresholdwidth
     * @type {Float} 
     */
    ExpandedModeThresholdWidth {
        get => this.get_ExpandedModeThresholdWidth()
        set => this.put_ExpandedModeThresholdWidth(value)
    }

    /**
     * Gets or sets the content for the pane footer.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneFooter](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panefooter) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The PaneFooter property takes a single UIElement, which can be a layout panel that contains additional elements.
     * 
     * If you place a [NavigationViewItem](navigationviewitem.md) in the PaneFooter, it will not raise the [NavigationView.ItemInvoked](navigationview_iteminvoked.md) event. The ItemInvoked event is raised only when the NavigationViewItem is in the [NavigationView.MenuItems](navigationview_menuitems.md) collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panefooter
     * @type {UIElement} 
     */
    PaneFooter {
        get => this.get_PaneFooter()
        set => this.put_PaneFooter(value)
    }

    /**
     * Gets or sets the header content.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.Header](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.header) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the DataTemplate used to display the control's header.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.HeaderTemplate](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.headertemplate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets a value that specifies how the pane and content areas of a NavigationView are being shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.DisplayMode](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.displaymode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * To set the state of the pane and content areas, use the [PaneDisplayMode](navigationview_panedisplaymode.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.displaymode
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
    }

    /**
     * Gets or sets a value that indicates whether the settings button is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsSettingsVisible](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.issettingsvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.issettingsvisible
     * @type {Boolean} 
     */
    IsSettingsVisible {
        get => this.get_IsSettingsVisible()
        set => this.put_IsSettingsVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the menu toggle button is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsPaneToggleButtonVisible](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.ispanetogglebuttonvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.ispanetogglebuttonvisible
     * @type {Boolean} 
     */
    IsPaneToggleButtonVisible {
        get => this.get_IsPaneToggleButtonVisible()
        set => this.put_IsPaneToggleButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the header is always visible.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.AlwaysShowHeader](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.alwaysshowheader) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.alwaysshowheader
     * @type {Boolean} 
     */
    AlwaysShowHeader {
        get => this.get_AlwaysShowHeader()
        set => this.put_AlwaysShowHeader(value)
    }

    /**
     * Gets or sets the width of the NavigationView pane in its compact display mode.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.CompactPaneLength](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.compactpanelength) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * This property specifies the width of the pane when DisplayMode is Compact and IsPaneOpen is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.compactpanelength
     * @type {Float} 
     */
    CompactPaneLength {
        get => this.get_CompactPaneLength()
        set => this.put_CompactPaneLength(value)
    }

    /**
     * Gets or sets the width of the NavigationView pane when it's fully expanded.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.OpenPaneLength](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.openpanelength) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.openpanelength
     * @type {Float} 
     */
    OpenPaneLength {
        get => this.get_OpenPaneLength()
        set => this.put_OpenPaneLength(value)
    }

    /**
     * Gets or sets the Style that defines the look of the menu toggle button.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneToggleButtonStyle](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panetogglebuttonstyle) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panetogglebuttonstyle
     * @type {Style} 
     */
    PaneToggleButtonStyle {
        get => this.get_PaneToggleButtonStyle()
        set => this.put_PaneToggleButtonStyle(value)
    }

    /**
     * Gets or sets the selected item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.SelectedItem](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.selecteditem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.selecteditem
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
        set => this.put_SelectedItem(value)
    }

    /**
     * Gets the collection of menu items displayed in the NavigationMenu.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItems](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitems) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitems
     * @type {IVector<IInspectable>} 
     */
    MenuItems {
        get => this.get_MenuItems()
    }

    /**
     * Gets or sets an object source used to generate the content of the NavigationView menu.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemsSource](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemssource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemssource
     * @type {IInspectable} 
     */
    MenuItemsSource {
        get => this.get_MenuItemsSource()
        set => this.put_MenuItemsSource(value)
    }

    /**
     * Gets the navigation item that represents the entry point to app settings.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.SettingsItem](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.settingsitem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.settingsitem
     * @type {IInspectable} 
     */
    SettingsItem {
        get => this.get_SettingsItem()
    }

    /**
     * Gets or sets an [AutoSuggestBox](autosuggestbox.md) to be displayed in the NavigationView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.AutoSuggestBox](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.autosuggestbox) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.autosuggestbox
     * @type {AutoSuggestBox} 
     */
    AutoSuggestBox {
        get => this.get_AutoSuggestBox()
        set => this.put_AutoSuggestBox(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display each menu item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemTemplate](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemtemplate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemtemplate
     * @type {DataTemplate} 
     */
    MenuItemTemplate {
        get => this.get_MenuItemTemplate()
        set => this.put_MenuItemTemplate(value)
    }

    /**
     * Gets or sets a reference to a custom [DataTemplateSelector](datatemplateselector.md) logic class. The [DataTemplateSelector](datatemplateselector.md) referenced by this property returns a template to apply to items.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemTemplateSelector](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemtemplateselector) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemtemplateselector
     * @type {DataTemplateSelector} 
     */
    MenuItemTemplateSelector {
        get => this.get_MenuItemTemplateSelector()
        set => this.put_MenuItemTemplateSelector(value)
    }

    /**
     * Gets or sets the style that is used when rendering the menu item containers.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemContainerStyle](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemcontainerstyle) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemcontainerstyle
     * @type {Style} 
     */
    MenuItemContainerStyle {
        get => this.get_MenuItemContainerStyle()
        set => this.put_MenuItemContainerStyle(value)
    }

    /**
     * Gets or sets a reference to a custom [StyleSelector](styleselector.md) logic class. The [StyleSelector](styleselector.md) returns different [Style](../windows.ui.xaml/style.md) values to use for the item container based on characteristics of the object being displayed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemContainerStyleSelector](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemcontainerstyleselector) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemcontainerstyleselector
     * @type {StyleSelector} 
     */
    MenuItemContainerStyleSelector {
        get => this.get_MenuItemContainerStyleSelector()
        set => this.put_MenuItemContainerStyleSelector(value)
    }

    /**
     * Gets or sets a value that indicates whether the back button is enabled or disabled.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsBackButtonVisible](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.isbackbuttonvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.isbackbuttonvisible
     * @type {Integer} 
     */
    IsBackButtonVisible {
        get => this.get_IsBackButtonVisible()
        set => this.put_IsBackButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the back button is enabled or disabled.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsBackEnabled](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.isbackenabled) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.isbackenabled
     * @type {Boolean} 
     */
    IsBackEnabled {
        get => this.get_IsBackEnabled()
        set => this.put_IsBackEnabled(value)
    }

    /**
     * Gets or sets the label adjacent to the menu icon when the NavigationView pane is open.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneTitle](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panetitle) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panetitle
     * @type {HSTRING} 
     */
    PaneTitle {
        get => this.get_PaneTitle()
        set => this.put_PaneTitle(value)
    }

    /**
     * Gets or sets a value that indicates how and where the NavigationView pane is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneDisplayMode](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panedisplaymode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panedisplaymode
     * @type {Integer} 
     */
    PaneDisplayMode {
        get => this.get_PaneDisplayMode()
        set => this.put_PaneDisplayMode(value)
    }

    /**
     * Gets or sets the content for the pane header.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneHeader](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.paneheader) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The PaneHeader property takes a single UIElement, which can be a layout panel that contains additional elements.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.paneheader
     * @type {UIElement} 
     */
    PaneHeader {
        get => this.get_PaneHeader()
        set => this.put_PaneHeader(value)
    }

    /**
     * Gets or sets a UI element that is shown in the NavigationView pane.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneCustomContent](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.panecustomcontent) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The PaneCustomContent property takes a single UIElement. This is typically a layout panel, such as Grid or StackPanel, that contains additional elements.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.panecustomcontent
     * @type {UIElement} 
     */
    PaneCustomContent {
        get => this.get_PaneCustomContent()
        set => this.put_PaneCustomContent(value)
    }

    /**
     * Gets or sets a UI element that is shown at the top of the control, below the pane if PaneDisplayMode is Top.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.ContentOverlay](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.contentoverlay) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The ContentOverlay property takes a single UIElement. This is typically a layout panel, such as Grid or StackPanel, that contains additional elements.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.contentoverlay
     * @type {UIElement} 
     */
    ContentOverlay {
        get => this.get_ContentOverlay()
        set => this.put_ContentOverlay(value)
    }

    /**
     * Gets or sets a value that determines whether the pane is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.IsPaneVisible](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.ispanevisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.ispanevisible
     * @type {Boolean} 
     */
    IsPaneVisible {
        get => this.get_IsPaneVisible()
        set => this.put_IsPaneVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether item selection changes when keyboard focus changes.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.SelectionFollowsFocus](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.selectionfollowsfocus) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.selectionfollowsfocus
     * @type {Integer} 
     */
    SelectionFollowsFocus {
        get => this.get_SelectionFollowsFocus()
        set => this.put_SelectionFollowsFocus(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a NavigationView control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.TemplateSettings](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.templatesettings) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.templatesettings
     * @type {NavigationViewTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets a value that indicates when gamepad bumpers can be used to navigate the top-level navigation items in a NavigationView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.ShoulderNavigationEnabled](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.shouldernavigationenabled) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.shouldernavigationenabled
     * @type {Integer} 
     */
    ShoulderNavigationEnabled {
        get => this.get_ShoulderNavigationEnabled()
        set => this.put_ShoulderNavigationEnabled(value)
    }

    /**
     * Gets or sets a value that indicates what text label is shown for the overflow menu.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.OverflowLabelMode](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.overflowlabelmode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The overflow menu is shown only when [NavigationView.PaneDisplayMode](navigationview_panedisplaymode.md) is **Top** and the window is not wide enough to show all navigation menu items.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.overflowlabelmode
     * @type {Integer} 
     */
    OverflowLabelMode {
        get => this.get_OverflowLabelMode()
        set => this.put_OverflowLabelMode(value)
    }

    /**
     * Occurs when the currently selected item changes.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.SelectionChanged](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.selectionchanged) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<NavigationView, NavigationViewSelectionChangedEventArgs>}
    */
    OnSelectionChanged {
        get {
            if(!this.HasProp("__OnSelectionChanged")){
                this.__OnSelectionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{17c78c17-2850-5dd4-83d6-d470323c21c7}"),
                    NavigationView,
                    NavigationViewSelectionChangedEventArgs
                )
                this.__OnSelectionChangedToken := this.add_SelectionChanged(this.__OnSelectionChanged.iface)
            }
            return this.__OnSelectionChanged
        }
    }

    /**
     * Occurs when an item in the menu receives an interaction such as a click or tap.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.ItemInvoked](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.iteminvoked) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<NavigationView, NavigationViewItemInvokedEventArgs>}
    */
    OnItemInvoked {
        get {
            if(!this.HasProp("__OnItemInvoked")){
                this.__OnItemInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{15ec8ec2-c8b3-53e7-893c-0cfb68549b77}"),
                    NavigationView,
                    NavigationViewItemInvokedEventArgs
                )
                this.__OnItemInvokedToken := this.add_ItemInvoked(this.__OnItemInvoked.iface)
            }
            return this.__OnItemInvoked
        }
    }

    /**
     * Occurs when the DisplayMode property changes.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.DisplayModeChanged](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.displaymodechanged) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<NavigationView, NavigationViewDisplayModeChangedEventArgs>}
    */
    OnDisplayModeChanged {
        get {
            if(!this.HasProp("__OnDisplayModeChanged")){
                this.__OnDisplayModeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{10a54ac4-84cf-580b-a63d-51aa3a6a3c0a}"),
                    NavigationView,
                    NavigationViewDisplayModeChangedEventArgs
                )
                this.__OnDisplayModeChangedToken := this.add_DisplayModeChanged(this.__OnDisplayModeChanged.iface)
            }
            return this.__OnDisplayModeChanged
        }
    }

    /**
     * Occurs when the back button receives an interaction such as a click or tap.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.BackRequested](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.backrequested) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<NavigationView, NavigationViewBackRequestedEventArgs>}
    */
    OnBackRequested {
        get {
            if(!this.HasProp("__OnBackRequested")){
                this.__OnBackRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1663a256-1d73-5318-91f1-b0724bfab832}"),
                    NavigationView,
                    NavigationViewBackRequestedEventArgs
                )
                this.__OnBackRequestedToken := this.add_BackRequested(this.__OnBackRequested.iface)
            }
            return this.__OnBackRequested
        }
    }

    /**
     * Occurs when the NavigationView pane is closed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneClosed](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.paneclosed) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<NavigationView, IInspectable>}
    */
    OnPaneClosed {
        get {
            if(!this.HasProp("__OnPaneClosed")){
                this.__OnPaneClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{aa2752a1-70be-5e14-93c8-10f31166437b}"),
                    NavigationView,
                    IInspectable
                )
                this.__OnPaneClosedToken := this.add_PaneClosed(this.__OnPaneClosed.iface)
            }
            return this.__OnPaneClosed
        }
    }

    /**
     * Occurs when the NavigationView pane is closing.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneClosing](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.paneclosing) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<NavigationView, NavigationViewPaneClosingEventArgs>}
    */
    OnPaneClosing {
        get {
            if(!this.HasProp("__OnPaneClosing")){
                this.__OnPaneClosing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0422033a-2892-5091-a7cb-6a204bf662fd}"),
                    NavigationView,
                    NavigationViewPaneClosingEventArgs
                )
                this.__OnPaneClosingToken := this.add_PaneClosing(this.__OnPaneClosing.iface)
            }
            return this.__OnPaneClosing
        }
    }

    /**
     * Occurs when the NavigationView pane is opened.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneOpened](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.paneopened) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<NavigationView, IInspectable>}
    */
    OnPaneOpened {
        get {
            if(!this.HasProp("__OnPaneOpened")){
                this.__OnPaneOpened := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{aa2752a1-70be-5e14-93c8-10f31166437b}"),
                    NavigationView,
                    IInspectable
                )
                this.__OnPaneOpenedToken := this.add_PaneOpened(this.__OnPaneOpened.iface)
            }
            return this.__OnPaneOpened
        }
    }

    /**
     * Occurs when the NavigationView pane is opening.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.PaneOpening](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.paneopening) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<NavigationView, IInspectable>}
    */
    OnPaneOpening {
        get {
            if(!this.HasProp("__OnPaneOpening")){
                this.__OnPaneOpening := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{aa2752a1-70be-5e14-93c8-10f31166437b}"),
                    NavigationView,
                    IInspectable
                )
                this.__OnPaneOpeningToken := this.add_PaneOpening(this.__OnPaneOpening.iface)
            }
            return this.__OnPaneOpening
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSelectionChangedToken")) {
            this.remove_SelectionChanged(this.__OnSelectionChangedToken)
            this.__OnSelectionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnItemInvokedToken")) {
            this.remove_ItemInvoked(this.__OnItemInvokedToken)
            this.__OnItemInvoked.iface.Dispose()
        }

        if(this.HasProp("__OnDisplayModeChangedToken")) {
            this.remove_DisplayModeChanged(this.__OnDisplayModeChangedToken)
            this.__OnDisplayModeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnBackRequestedToken")) {
            this.remove_BackRequested(this.__OnBackRequestedToken)
            this.__OnBackRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPaneClosedToken")) {
            this.remove_PaneClosed(this.__OnPaneClosedToken)
            this.__OnPaneClosed.iface.Dispose()
        }

        if(this.HasProp("__OnPaneClosingToken")) {
            this.remove_PaneClosing(this.__OnPaneClosingToken)
            this.__OnPaneClosing.iface.Dispose()
        }

        if(this.HasProp("__OnPaneOpenedToken")) {
            this.remove_PaneOpened(this.__OnPaneOpenedToken)
            this.__OnPaneOpened.iface.Dispose()
        }

        if(this.HasProp("__OnPaneOpeningToken")) {
            this.remove_PaneOpening(this.__OnPaneOpeningToken)
            this.__OnPaneOpening.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaneOpen() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_IsPaneOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaneOpen(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_IsPaneOpen(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompactModeThresholdWidth() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_CompactModeThresholdWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CompactModeThresholdWidth(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_CompactModeThresholdWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandedModeThresholdWidth() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_ExpandedModeThresholdWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ExpandedModeThresholdWidth(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_ExpandedModeThresholdWidth(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_PaneFooter() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_PaneFooter()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_PaneFooter(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_PaneFooter(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_DisplayMode()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSettingsVisible() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_IsSettingsVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSettingsVisible(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_IsSettingsVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaneToggleButtonVisible() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_IsPaneToggleButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaneToggleButtonVisible(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_IsPaneToggleButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysShowHeader() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_AlwaysShowHeader()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysShowHeader(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_AlwaysShowHeader(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompactPaneLength() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_CompactPaneLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CompactPaneLength(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_CompactPaneLength(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenPaneLength() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_OpenPaneLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OpenPaneLength(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_OpenPaneLength(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_PaneToggleButtonStyle() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_PaneToggleButtonStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_PaneToggleButtonStyle(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_PaneToggleButtonStyle(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_SelectedItem()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedItem(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_SelectedItem(value)
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_MenuItems() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_MenuItems()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_MenuItemsSource() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_MenuItemsSource()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_MenuItemsSource(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_MenuItemsSource(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SettingsItem() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_SettingsItem()
    }

    /**
     * 
     * @returns {AutoSuggestBox} 
     */
    get_AutoSuggestBox() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_AutoSuggestBox()
    }

    /**
     * 
     * @param {AutoSuggestBox} value 
     * @returns {HRESULT} 
     */
    put_AutoSuggestBox(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_AutoSuggestBox(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_MenuItemTemplate() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_MenuItemTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_MenuItemTemplate(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_MenuItemTemplate(value)
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_MenuItemTemplateSelector() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_MenuItemTemplateSelector()
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_MenuItemTemplateSelector(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_MenuItemTemplateSelector(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_MenuItemContainerStyle() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_MenuItemContainerStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_MenuItemContainerStyle(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_MenuItemContainerStyle(value)
    }

    /**
     * 
     * @returns {StyleSelector} 
     */
    get_MenuItemContainerStyleSelector() {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.get_MenuItemContainerStyleSelector()
    }

    /**
     * 
     * @param {StyleSelector} value 
     * @returns {HRESULT} 
     */
    put_MenuItemContainerStyleSelector(value) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.put_MenuItemContainerStyleSelector(value)
    }

    /**
     * Returns the item that corresponds to the specified, generated container.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.MenuItemFromContainer](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.menuitemfromcontainer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {DependencyObject} container The [DependencyObject](../windows.ui.xaml/dependencyobject.md) that corresponds to the item to be returned.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.menuitemfromcontainer
     */
    MenuItemFromContainer(container) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.MenuItemFromContainer(container)
    }

    /**
     * Returns the container corresponding to the specified menu item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationView.ContainerFromMenuItem(Object)](/windows/winui/api/microsoft.ui.xaml.controls.navigationview.containerfrommenuitem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {IInspectable} item The menu item to retrieve the container for.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationview.containerfrommenuitem
     */
    ContainerFromMenuItem(item) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.ContainerFromMenuItem(item)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, NavigationViewSelectionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.add_SelectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.remove_SelectionChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, NavigationViewItemInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemInvoked(handler) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.add_ItemInvoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemInvoked(token) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.remove_ItemInvoked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, NavigationViewDisplayModeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisplayModeChanged(handler) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.add_DisplayModeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DisplayModeChanged(token) {
        if (!this.HasProp("__INavigationView")) {
            if ((queryResult := this.QueryInterface(INavigationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView := INavigationView(outPtr)
        }

        return this.__INavigationView.remove_DisplayModeChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsBackButtonVisible() {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.get_IsBackButtonVisible()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IsBackButtonVisible(value) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.put_IsBackButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBackEnabled() {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.get_IsBackEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsBackEnabled(value) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.put_IsBackEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PaneTitle() {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.get_PaneTitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PaneTitle(value) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.put_PaneTitle(value)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, NavigationViewBackRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BackRequested(handler) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.add_BackRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BackRequested(token) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.remove_BackRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PaneClosed(handler) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.add_PaneClosed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PaneClosed(token) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.remove_PaneClosed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, NavigationViewPaneClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PaneClosing(handler) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.add_PaneClosing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PaneClosing(token) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.remove_PaneClosing(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PaneOpened(handler) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.add_PaneOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PaneOpened(token) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.remove_PaneOpened(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PaneOpening(handler) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.add_PaneOpening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PaneOpening(token) {
        if (!this.HasProp("__INavigationView2")) {
            if ((queryResult := this.QueryInterface(INavigationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView2 := INavigationView2(outPtr)
        }

        return this.__INavigationView2.remove_PaneOpening(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PaneDisplayMode() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_PaneDisplayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PaneDisplayMode(value) {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.put_PaneDisplayMode(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_PaneHeader() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_PaneHeader()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_PaneHeader(value) {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.put_PaneHeader(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_PaneCustomContent() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_PaneCustomContent()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_PaneCustomContent(value) {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.put_PaneCustomContent(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_ContentOverlay() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_ContentOverlay()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_ContentOverlay(value) {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.put_ContentOverlay(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaneVisible() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_IsPaneVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaneVisible(value) {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.put_IsPaneVisible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionFollowsFocus() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_SelectionFollowsFocus()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionFollowsFocus(value) {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.put_SelectionFollowsFocus(value)
    }

    /**
     * 
     * @returns {NavigationViewTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_TemplateSettings()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShoulderNavigationEnabled() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_ShoulderNavigationEnabled()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ShoulderNavigationEnabled(value) {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.put_ShoulderNavigationEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OverflowLabelMode() {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.get_OverflowLabelMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OverflowLabelMode(value) {
        if (!this.HasProp("__INavigationView3")) {
            if ((queryResult := this.QueryInterface(INavigationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationView3 := INavigationView3(outPtr)
        }

        return this.__INavigationView3.put_OverflowLabelMode(value)
    }

;@endregion Instance Methods
}
