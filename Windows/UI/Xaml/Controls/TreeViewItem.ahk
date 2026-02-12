#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewItem.ahk
#Include .\ITreeViewItem.ahk
#Include .\ITreeViewItem2.ahk
#Include .\ITreeViewItemStatics2.ahk
#Include .\ITreeViewItemStatics.ahk
#Include .\ITreeViewItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in a [TreeView](treeview.md) control.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewItem extends ListViewItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewItem.IID

    /**
     * Identifies the HasUnrealizedChildren dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.HasUnrealizedChildrenProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.hasunrealizedchildrenproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.hasunrealizedchildrenproperty
     * @type {DependencyProperty} 
     */
    static HasUnrealizedChildrenProperty {
        get => TreeViewItem.get_HasUnrealizedChildrenProperty()
    }

    /**
     * Identifies the ItemsSource dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.ItemsSourceProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.itemssourceproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.itemssourceproperty
     * @type {DependencyProperty} 
     */
    static ItemsSourceProperty {
        get => TreeViewItem.get_ItemsSourceProperty()
    }

    /**
     * Identifies the GlyphOpacity dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.GlyphOpacityProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.glyphopacityproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.glyphopacityproperty
     * @type {DependencyProperty} 
     */
    static GlyphOpacityProperty {
        get => TreeViewItem.get_GlyphOpacityProperty()
    }

    /**
     * Identifies the GlyphBrush dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.GlyphBrushProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.glyphbrushproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.glyphbrushproperty
     * @type {DependencyProperty} 
     */
    static GlyphBrushProperty {
        get => TreeViewItem.get_GlyphBrushProperty()
    }

    /**
     * Identifies the ExpandedGlyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.ExpandedGlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.expandedglyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.expandedglyphproperty
     * @type {DependencyProperty} 
     */
    static ExpandedGlyphProperty {
        get => TreeViewItem.get_ExpandedGlyphProperty()
    }

    /**
     * Identifies the CollapsedGlyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.CollapsedGlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.collapsedglyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.collapsedglyphproperty
     * @type {DependencyProperty} 
     */
    static CollapsedGlyphProperty {
        get => TreeViewItem.get_CollapsedGlyphProperty()
    }

    /**
     * Identifies the GlyphSize dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.GlyphSizeProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.glyphsizeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.glyphsizeproperty
     * @type {DependencyProperty} 
     */
    static GlyphSizeProperty {
        get => TreeViewItem.get_GlyphSizeProperty()
    }

    /**
     * Identifies the IsExpanded dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.IsExpandedProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.isexpandedproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.isexpandedproperty
     * @type {DependencyProperty} 
     */
    static IsExpandedProperty {
        get => TreeViewItem.get_IsExpandedProperty()
    }

    /**
     * Identifies the TreeViewItemTemplateSettings dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.TreeViewItemTemplateSettingsProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.treeviewitemtemplatesettingsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.treeviewitemtemplatesettingsproperty
     * @type {DependencyProperty} 
     */
    static TreeViewItemTemplateSettingsProperty {
        get => TreeViewItem.get_TreeViewItemTemplateSettingsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HasUnrealizedChildrenProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics2.IID)
            TreeViewItem.__ITreeViewItemStatics2 := ITreeViewItemStatics2(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics2.get_HasUnrealizedChildrenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsSourceProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics2.IID)
            TreeViewItem.__ITreeViewItemStatics2 := ITreeViewItemStatics2(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics2.get_ItemsSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlyphOpacityProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics.IID)
            TreeViewItem.__ITreeViewItemStatics := ITreeViewItemStatics(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics.get_GlyphOpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlyphBrushProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics.IID)
            TreeViewItem.__ITreeViewItemStatics := ITreeViewItemStatics(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics.get_GlyphBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExpandedGlyphProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics.IID)
            TreeViewItem.__ITreeViewItemStatics := ITreeViewItemStatics(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics.get_ExpandedGlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CollapsedGlyphProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics.IID)
            TreeViewItem.__ITreeViewItemStatics := ITreeViewItemStatics(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics.get_CollapsedGlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlyphSizeProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics.IID)
            TreeViewItem.__ITreeViewItemStatics := ITreeViewItemStatics(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics.get_GlyphSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsExpandedProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics.IID)
            TreeViewItem.__ITreeViewItemStatics := ITreeViewItemStatics(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics.get_IsExpandedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TreeViewItemTemplateSettingsProperty() {
        if (!TreeViewItem.HasProp("__ITreeViewItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemStatics.IID)
            TreeViewItem.__ITreeViewItemStatics := ITreeViewItemStatics(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemStatics.get_TreeViewItemTemplateSettingsProperty()
    }

    /**
     * 
     * @returns {TreeViewItem} 
     */
    static CreateInstance() {
        if (!TreeViewItem.HasProp("__ITreeViewItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewItemFactory.IID)
            TreeViewItem.__ITreeViewItemFactory := ITreeViewItemFactory(factoryPtr)
        }

        return TreeViewItem.__ITreeViewItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the opacity of node glyphs on a TreeView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.GlyphOpacity](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.glyphopacity) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.glyphopacity
     * @type {Float} 
     */
    GlyphOpacity {
        get => this.get_GlyphOpacity()
        set => this.put_GlyphOpacity(value)
    }

    /**
     * Gets or sets the Brush used to paint node glyphs on a TreeView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.GlyphBrush](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.glyphbrush) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.glyphbrush
     * @type {Brush} 
     */
    GlyphBrush {
        get => this.get_GlyphBrush()
        set => this.put_GlyphBrush(value)
    }

    /**
     * Gets or sets the glyph to show for an expanded tree node.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.ExpandedGlyph](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.expandedglyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.expandedglyph
     * @type {HSTRING} 
     */
    ExpandedGlyph {
        get => this.get_ExpandedGlyph()
        set => this.put_ExpandedGlyph(value)
    }

    /**
     * Gets or sets the glyph to show for a collapsed tree node.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.CollapsedGlyph](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.collapsedglyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.collapsedglyph
     * @type {HSTRING} 
     */
    CollapsedGlyph {
        get => this.get_CollapsedGlyph()
        set => this.put_CollapsedGlyph(value)
    }

    /**
     * Gets or sets the size of node glyphs on a TreeView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.GlyphSize](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.glyphsize) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.glyphsize
     * @type {Float} 
     */
    GlyphSize {
        get => this.get_GlyphSize()
        set => this.put_GlyphSize(value)
    }

    /**
     * Gets or sets a value that indicates whether a tree node is expanded.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.IsExpanded](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.isexpanded) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.isexpanded
     * @type {Boolean} 
     */
    IsExpanded {
        get => this.get_IsExpanded()
        set => this.put_IsExpanded(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) sources when defining templates for a TreeViewItem control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.TreeViewItemTemplateSettings](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.treeviewitemtemplatesettings) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.treeviewitemtemplatesettings
     * @type {TreeViewItemTemplateSettings} 
     */
    TreeViewItemTemplateSettings {
        get => this.get_TreeViewItemTemplateSettings()
    }

    /**
     * Gets or sets a value that indicates whether the current item has child items that haven't been shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.HasUnrealizedChildren](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.hasunrealizedchildren) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.hasunrealizedchildren
     * @type {Boolean} 
     */
    HasUnrealizedChildren {
        get => this.get_HasUnrealizedChildren()
        set => this.put_HasUnrealizedChildren(value)
    }

    /**
     * Gets or sets an object source used to generate the content of the TreeView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewItem.ItemsSource](/windows/winui/api/microsoft.ui.xaml.controls.treeviewitem.itemssource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * TThe type of the object that you set the **ItemsSource** property to must implement particular interface(s). For more details, see the [Remarks](/uwp/api/windows.ui.xaml.controls.itemscontrol.itemssource#remarks) section of **ItemsControl.ItemsSource**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewitem.itemssource
     * @type {IInspectable} 
     */
    ItemsSource {
        get => this.get_ItemsSource()
        set => this.put_ItemsSource(value)
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
    get_GlyphOpacity() {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.get_GlyphOpacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_GlyphOpacity(value) {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.put_GlyphOpacity(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_GlyphBrush() {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.get_GlyphBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_GlyphBrush(value) {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.put_GlyphBrush(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExpandedGlyph() {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.get_ExpandedGlyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ExpandedGlyph(value) {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.put_ExpandedGlyph(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CollapsedGlyph() {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.get_CollapsedGlyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CollapsedGlyph(value) {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.put_CollapsedGlyph(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlyphSize() {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.get_GlyphSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_GlyphSize(value) {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.put_GlyphSize(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExpanded() {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.get_IsExpanded()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsExpanded(value) {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.put_IsExpanded(value)
    }

    /**
     * 
     * @returns {TreeViewItemTemplateSettings} 
     */
    get_TreeViewItemTemplateSettings() {
        if (!this.HasProp("__ITreeViewItem")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem := ITreeViewItem(outPtr)
        }

        return this.__ITreeViewItem.get_TreeViewItemTemplateSettings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasUnrealizedChildren() {
        if (!this.HasProp("__ITreeViewItem2")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem2 := ITreeViewItem2(outPtr)
        }

        return this.__ITreeViewItem2.get_HasUnrealizedChildren()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_HasUnrealizedChildren(value) {
        if (!this.HasProp("__ITreeViewItem2")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem2 := ITreeViewItem2(outPtr)
        }

        return this.__ITreeViewItem2.put_HasUnrealizedChildren(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ItemsSource() {
        if (!this.HasProp("__ITreeViewItem2")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem2 := ITreeViewItem2(outPtr)
        }

        return this.__ITreeViewItem2.get_ItemsSource()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ItemsSource(value) {
        if (!this.HasProp("__ITreeViewItem2")) {
            if ((queryResult := this.QueryInterface(ITreeViewItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewItem2 := ITreeViewItem2(outPtr)
        }

        return this.__ITreeViewItem2.put_ItemsSource(value)
    }

;@endregion Instance Methods
}
