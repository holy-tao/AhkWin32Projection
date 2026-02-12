#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\INavigationViewTemplateSettings.ahk
#Include .\INavigationViewTemplateSettingsFactory.ahk
#Include .\INavigationViewTemplateSettingsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [NavigationView](navigationview.md). Not intended for general use.
  * 
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewTemplateSettings.IID

    /**
     * Identifies the TopPadding dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.TopPaddingProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.toppaddingproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.toppaddingproperty
     * @type {DependencyProperty} 
     */
    static TopPaddingProperty {
        get => NavigationViewTemplateSettings.get_TopPaddingProperty()
    }

    /**
     * Identifies the OverflowButtonVisibility dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.OverflowButtonVisibilityProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.overflowbuttonvisibilityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.overflowbuttonvisibilityproperty
     * @type {DependencyProperty} 
     */
    static OverflowButtonVisibilityProperty {
        get => NavigationViewTemplateSettings.get_OverflowButtonVisibilityProperty()
    }

    /**
     * Identifies the PaneToggleButtonVisibility dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.PaneToggleButtonVisibilityProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.panetogglebuttonvisibilityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.panetogglebuttonvisibilityproperty
     * @type {DependencyProperty} 
     */
    static PaneToggleButtonVisibilityProperty {
        get => NavigationViewTemplateSettings.get_PaneToggleButtonVisibilityProperty()
    }

    /**
     * Identifies the BackButtonVisibility dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.BackButtonVisibilityProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.backbuttonvisibilityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.backbuttonvisibilityproperty
     * @type {DependencyProperty} 
     */
    static BackButtonVisibilityProperty {
        get => NavigationViewTemplateSettings.get_BackButtonVisibilityProperty()
    }

    /**
     * Identifies the TopPaneVisibility dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.TopPaneVisibilityProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.toppanevisibilityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.toppanevisibilityproperty
     * @type {DependencyProperty} 
     */
    static TopPaneVisibilityProperty {
        get => NavigationViewTemplateSettings.get_TopPaneVisibilityProperty()
    }

    /**
     * Identifies the LeftPaneVisibility dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.LeftPaneVisibilityProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.leftpanevisibilityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.leftpanevisibilityproperty
     * @type {DependencyProperty} 
     */
    static LeftPaneVisibilityProperty {
        get => NavigationViewTemplateSettings.get_LeftPaneVisibilityProperty()
    }

    /**
     * Identifies the SingleSelectionFollowsFocus dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.SingleSelectionFollowsFocusProperty](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.singleselectionfollowsfocusproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.singleselectionfollowsfocusproperty
     * @type {DependencyProperty} 
     */
    static SingleSelectionFollowsFocusProperty {
        get => NavigationViewTemplateSettings.get_SingleSelectionFollowsFocusProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {NavigationViewTemplateSettings} 
     */
    static CreateInstance() {
        if (!NavigationViewTemplateSettings.HasProp("__INavigationViewTemplateSettingsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewTemplateSettingsFactory.IID)
            NavigationViewTemplateSettings.__INavigationViewTemplateSettingsFactory := INavigationViewTemplateSettingsFactory(factoryPtr)
        }

        return NavigationViewTemplateSettings.__INavigationViewTemplateSettingsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TopPaddingProperty() {
        if (!NavigationViewTemplateSettings.HasProp("__INavigationViewTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewTemplateSettingsStatics.IID)
            NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics := INavigationViewTemplateSettingsStatics(factoryPtr)
        }

        return NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics.get_TopPaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OverflowButtonVisibilityProperty() {
        if (!NavigationViewTemplateSettings.HasProp("__INavigationViewTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewTemplateSettingsStatics.IID)
            NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics := INavigationViewTemplateSettingsStatics(factoryPtr)
        }

        return NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics.get_OverflowButtonVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaneToggleButtonVisibilityProperty() {
        if (!NavigationViewTemplateSettings.HasProp("__INavigationViewTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewTemplateSettingsStatics.IID)
            NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics := INavigationViewTemplateSettingsStatics(factoryPtr)
        }

        return NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics.get_PaneToggleButtonVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackButtonVisibilityProperty() {
        if (!NavigationViewTemplateSettings.HasProp("__INavigationViewTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewTemplateSettingsStatics.IID)
            NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics := INavigationViewTemplateSettingsStatics(factoryPtr)
        }

        return NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics.get_BackButtonVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TopPaneVisibilityProperty() {
        if (!NavigationViewTemplateSettings.HasProp("__INavigationViewTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewTemplateSettingsStatics.IID)
            NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics := INavigationViewTemplateSettingsStatics(factoryPtr)
        }

        return NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics.get_TopPaneVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LeftPaneVisibilityProperty() {
        if (!NavigationViewTemplateSettings.HasProp("__INavigationViewTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewTemplateSettingsStatics.IID)
            NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics := INavigationViewTemplateSettingsStatics(factoryPtr)
        }

        return NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics.get_LeftPaneVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SingleSelectionFollowsFocusProperty() {
        if (!NavigationViewTemplateSettings.HasProp("__INavigationViewTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewTemplateSettingsStatics.IID)
            NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics := INavigationViewTemplateSettingsStatics(factoryPtr)
        }

        return NavigationViewTemplateSettings.__INavigationViewTemplateSettingsStatics.get_SingleSelectionFollowsFocusProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the padding value of the top pane.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.TopPadding](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.toppadding) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.toppadding
     * @type {Float} 
     */
    TopPadding {
        get => this.get_TopPadding()
    }

    /**
     * Gets the visibility of the overflow button.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.OverflowButtonVisibility](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.overflowbuttonvisibility) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.overflowbuttonvisibility
     * @type {Integer} 
     */
    OverflowButtonVisibility {
        get => this.get_OverflowButtonVisibility()
    }

    /**
     * Gets the visibility of the pane toggle button.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.PaneToggleButtonVisibility](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.panetogglebuttonvisibility) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.panetogglebuttonvisibility
     * @type {Integer} 
     */
    PaneToggleButtonVisibility {
        get => this.get_PaneToggleButtonVisibility()
    }

    /**
     * Gets the visibility of the back button.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.BackButtonVisibility](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.backbuttonvisibility) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.backbuttonvisibility
     * @type {Integer} 
     */
    BackButtonVisibility {
        get => this.get_BackButtonVisibility()
    }

    /**
     * Gets the visibility of the top pane.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.TopPaneVisibility](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.toppanevisibility) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.toppanevisibility
     * @type {Integer} 
     */
    TopPaneVisibility {
        get => this.get_TopPaneVisibility()
    }

    /**
     * Gets the visibility of the left pane.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.LeftPaneVisibility](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.leftpanevisibility) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.leftpanevisibility
     * @type {Integer} 
     */
    LeftPaneVisibility {
        get => this.get_LeftPaneVisibility()
    }

    /**
     * Gets the [SelectionFollowsFocus](navigationview_selectionfollowsfocus.md) value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewTemplateSettings.SingleSelectionFollowsFocus](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewtemplatesettings.singleselectionfollowsfocus) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewtemplatesettings.singleselectionfollowsfocus
     * @type {Boolean} 
     */
    SingleSelectionFollowsFocus {
        get => this.get_SingleSelectionFollowsFocus()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopPadding() {
        if (!this.HasProp("__INavigationViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(INavigationViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewTemplateSettings := INavigationViewTemplateSettings(outPtr)
        }

        return this.__INavigationViewTemplateSettings.get_TopPadding()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OverflowButtonVisibility() {
        if (!this.HasProp("__INavigationViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(INavigationViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewTemplateSettings := INavigationViewTemplateSettings(outPtr)
        }

        return this.__INavigationViewTemplateSettings.get_OverflowButtonVisibility()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PaneToggleButtonVisibility() {
        if (!this.HasProp("__INavigationViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(INavigationViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewTemplateSettings := INavigationViewTemplateSettings(outPtr)
        }

        return this.__INavigationViewTemplateSettings.get_PaneToggleButtonVisibility()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackButtonVisibility() {
        if (!this.HasProp("__INavigationViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(INavigationViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewTemplateSettings := INavigationViewTemplateSettings(outPtr)
        }

        return this.__INavigationViewTemplateSettings.get_BackButtonVisibility()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TopPaneVisibility() {
        if (!this.HasProp("__INavigationViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(INavigationViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewTemplateSettings := INavigationViewTemplateSettings(outPtr)
        }

        return this.__INavigationViewTemplateSettings.get_TopPaneVisibility()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LeftPaneVisibility() {
        if (!this.HasProp("__INavigationViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(INavigationViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewTemplateSettings := INavigationViewTemplateSettings(outPtr)
        }

        return this.__INavigationViewTemplateSettings.get_LeftPaneVisibility()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SingleSelectionFollowsFocus() {
        if (!this.HasProp("__INavigationViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(INavigationViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewTemplateSettings := INavigationViewTemplateSettings(outPtr)
        }

        return this.__INavigationViewTemplateSettings.get_SingleSelectionFollowsFocus()
    }

;@endregion Instance Methods
}
