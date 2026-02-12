#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\ITreeViewItemTemplateSettings.ahk
#Include .\ITreeViewItemTemplateSettingsFactory.ahk
#Include .\ITreeViewItemTemplateSettingsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [TreeViewItem](treeviewitem.md) control. Not intended for general use.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewItemTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewItemTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewItemTemplateSettings.IID

    /**
     * Identifies the ExpandedGlyphVisibility dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings.ExpandedGlyphVisibilityProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings.expandedglyphvisibilityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings.expandedglyphvisibilityproperty
     * @type {DependencyProperty} 
     */
    static ExpandedGlyphVisibilityProperty {
        get => TreeViewItemTemplateSettings.get_ExpandedGlyphVisibilityProperty()
    }

    /**
     * Identifies the CollapsedGlyphVisibility dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings.CollapsedGlyphVisibilityProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings.collapsedglyphvisibilityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings.collapsedglyphvisibilityproperty
     * @type {DependencyProperty} 
     */
    static CollapsedGlyphVisibilityProperty {
        get => TreeViewItemTemplateSettings.get_CollapsedGlyphVisibilityProperty()
    }

    /**
     * Identifies the Indentation dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings.IndentationProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings.indentationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings.indentationproperty
     * @type {DependencyProperty} 
     */
    static IndentationProperty {
        get => TreeViewItemTemplateSettings.get_IndentationProperty()
    }

    /**
     * Identifies the DragItemsCount dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings.DragItemsCountProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings.dragitemscountproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings.dragitemscountproperty
     * @type {DependencyProperty} 
     */
    static DragItemsCountProperty {
        get => TreeViewItemTemplateSettings.get_DragItemsCountProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {TreeViewItemTemplateSettings} 
     */
    static CreateInstance() {
        if (!TreeViewItemTemplateSettings.HasProp("__ITreeViewItemTemplateSettingsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItemTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemTemplateSettingsFactory.IID)
            TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsFactory := ITreeViewItemTemplateSettingsFactory(factoryPtr)
        }

        return TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExpandedGlyphVisibilityProperty() {
        if (!TreeViewItemTemplateSettings.HasProp("__ITreeViewItemTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItemTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemTemplateSettingsStatics.IID)
            TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsStatics := ITreeViewItemTemplateSettingsStatics(factoryPtr)
        }

        return TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsStatics.get_ExpandedGlyphVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CollapsedGlyphVisibilityProperty() {
        if (!TreeViewItemTemplateSettings.HasProp("__ITreeViewItemTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItemTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemTemplateSettingsStatics.IID)
            TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsStatics := ITreeViewItemTemplateSettingsStatics(factoryPtr)
        }

        return TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsStatics.get_CollapsedGlyphVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IndentationProperty() {
        if (!TreeViewItemTemplateSettings.HasProp("__ITreeViewItemTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItemTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemTemplateSettingsStatics.IID)
            TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsStatics := ITreeViewItemTemplateSettingsStatics(factoryPtr)
        }

        return TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsStatics.get_IndentationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DragItemsCountProperty() {
        if (!TreeViewItemTemplateSettings.HasProp("__ITreeViewItemTemplateSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItemTemplateSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemTemplateSettingsStatics.IID)
            TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsStatics := ITreeViewItemTemplateSettingsStatics(factoryPtr)
        }

        return TreeViewItemTemplateSettings.__ITreeViewItemTemplateSettingsStatics.get_DragItemsCountProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the visibilty of an expanded glyph.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings.ExpandedGlyphVisibility](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings.expandedglyphvisibility) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings.expandedglyphvisibility
     * @type {Integer} 
     */
    ExpandedGlyphVisibility {
        get => this.get_ExpandedGlyphVisibility()
    }

    /**
     * Gets the visibilty of a collapsed glyph.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings.CollapsedGlyphVisibility](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings.collapsedglyphvisibility) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings.collapsedglyphvisibility
     * @type {Integer} 
     */
    CollapsedGlyphVisibility {
        get => this.get_CollapsedGlyphVisibility()
    }

    /**
     * Gets the amount that the item is indented.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings.Indentation](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings.indentation) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings.indentation
     * @type {Thickness} 
     */
    Indentation {
        get => this.get_Indentation()
    }

    /**
     * Gets the number of items being dragged.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItemTemplateSettings.DragItemsCount](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitemtemplatesettings.dragitemscount) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitemtemplatesettings.dragitemscount
     * @type {Integer} 
     */
    DragItemsCount {
        get => this.get_DragItemsCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpandedGlyphVisibility() {
        if (!this.HasProp("__ITreeViewItemTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ITreeViewItemTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItemTemplateSettings := ITreeViewItemTemplateSettings(outPtr)
        }

        return this.__ITreeViewItemTemplateSettings.get_ExpandedGlyphVisibility()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CollapsedGlyphVisibility() {
        if (!this.HasProp("__ITreeViewItemTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ITreeViewItemTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItemTemplateSettings := ITreeViewItemTemplateSettings(outPtr)
        }

        return this.__ITreeViewItemTemplateSettings.get_CollapsedGlyphVisibility()
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Indentation() {
        if (!this.HasProp("__ITreeViewItemTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ITreeViewItemTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItemTemplateSettings := ITreeViewItemTemplateSettings(outPtr)
        }

        return this.__ITreeViewItemTemplateSettings.get_Indentation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DragItemsCount() {
        if (!this.HasProp("__ITreeViewItemTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ITreeViewItemTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItemTemplateSettings := ITreeViewItemTemplateSettings(outPtr)
        }

        return this.__ITreeViewItemTemplateSettings.get_DragItemsCount()
    }

;@endregion Instance Methods
}
