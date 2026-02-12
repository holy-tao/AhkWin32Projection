#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataTemplateSelector.ahk
#Include .\IDataTemplateSelector2.ahk
#Include .\IDataTemplateSelectorOverrides.ahk
#Include .\IDataTemplateSelectorOverrides2.ahk
#Include ..\IElementFactory.ahk
#Include .\IDataTemplateSelectorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables custom template selection logic at the application level.
 * @remarks
 * For more info about data templates, see the [DataTemplate](../windows.ui.xaml/datatemplate.md) class and [Item containers and templates](/windows/uwp/design/controls-and-patterns/item-containers-templates).
 * 
 * The base DataTemplateSelector class is not used as an object element in XAML. However, it is a common scenario to derive a custom DataTemplateSelector, map an `xmlns` prefix for the custom class and its namespace/assembly, and then refer to an instance of the custom class as defined in a [Resources](../windows.ui.xaml/frameworkelement_resources.md) block in XAML. This makes it possible to refer to the custom template selector class by `x:Key`, and use that reference to set the value of properties such as [ItemTemplateSelector](itemscontrol_itemtemplateselector.md) in XAML templates and visual states.
 * 
 * The callable methods of DataTemplateSelector are the two [SelectTemplate](datatemplateselector_selecttemplate_375443783.md) overloads. The overridable methods of DataTemplateSelector are the two [SelectTemplateCore](datatemplateselector_selecttemplatecore_402628248.md) overloads. To define an effective DataTemplateSelector subclass, provide implementations for [SelectTemplateCore(Object)](datatemplateselector_selecttemplatecore_402628248.md) and [SelectTemplateCore(Object, DependencyObject)](datatemplateselector_selecttemplatecore_711611086.md). All these methods return a [DataTemplate](../windows.ui.xaml/datatemplate.md) instance that's typically a specific choice that's appropriate for the inputs of the method that was called to obtain it.
 * 
 * App code typically doesn't call [SelectTemplate](datatemplateselector_selecttemplate_375443783.md) methods; the methods exists so that the infrastructure can call it while choosing the correct templates based on using a DataTemplateSelector instance from a property value such as [ItemsControl.ItemsTemplateSelector](itemscontrol_itemtemplateselector.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datatemplateselector
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DataTemplateSelector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataTemplateSelector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataTemplateSelector.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    static CreateInstance() {
        if (!DataTemplateSelector.HasProp("__IDataTemplateSelectorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DataTemplateSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTemplateSelectorFactory.IID)
            DataTemplateSelector.__IDataTemplateSelectorFactory := IDataTemplateSelectorFactory(factoryPtr)
        }

        return DataTemplateSelector.__IDataTemplateSelectorFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a specific [DataTemplate](../windows.ui.xaml/datatemplate.md) for a given item.
     * @param {IInspectable} item The item to return a template for.
     * @param {DependencyObject} container 
     * @returns {DataTemplate} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datatemplateselector.selecttemplate
     */
    SelectTemplate(item, container) {
        if (!this.HasProp("__IDataTemplateSelector")) {
            if ((queryResult := this.QueryInterface(IDataTemplateSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTemplateSelector := IDataTemplateSelector(outPtr)
        }

        return this.__IDataTemplateSelector.SelectTemplate(item, container)
    }

    /**
     * Returns a specific [DataTemplate](../windows.ui.xaml/datatemplate.md) for a given item and container.
     * @param {IInspectable} item The item to return a template for.
     * @returns {DataTemplate} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datatemplateselector.selecttemplate
     */
    SelectTemplateForItem(item) {
        if (!this.HasProp("__IDataTemplateSelector2")) {
            if ((queryResult := this.QueryInterface(IDataTemplateSelector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTemplateSelector2 := IDataTemplateSelector2(outPtr)
        }

        return this.__IDataTemplateSelector2.SelectTemplateForItem(item)
    }

    /**
     * When implemented by a derived class, returns a specific [DataTemplate](../windows.ui.xaml/datatemplate.md) for a given item or container.
     * @remarks
     * If your [ItemsControl.ItemsPanel](itemscontrol_itemspanel.md) is an [ItemsStackPanel](itemsstackpanel.md) or [ItemsWrapGrid](itemswrapgrid.md), provide an override for the SelectTemplateCore(Object) method. If the [ItemsPanel](itemscontrol_itemspanel.md) is a different panel, such as [VirtualizingStackPanel](virtualizingstackpanel.md) or [WrapGrid](wrapgrid.md), provide an override for the [SelectTemplateCore(Object, DependencyObject)](datatemplateselector_selecttemplatecore_711611086.md) method.
     * 
     * > [!NOTE]
     * > In Windows 8.1, [ItemsStackPanel](itemsstackpanel.md) is the default [ItemsPanel](itemscontrol_itemspanel.md) for [ListView](listview.md), and [ItemsWrapGrid](itemswrapgrid.md) is the default [ItemsPanel](itemscontrol_itemspanel.md) for [GridView](gridview.md).
     * @param {IInspectable} item The item to return a template for.
     * @param {DependencyObject} container 
     * @returns {DataTemplate} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datatemplateselector.selecttemplatecore
     */
    SelectTemplateCore(item, container) {
        if (!this.HasProp("__IDataTemplateSelectorOverrides")) {
            if ((queryResult := this.QueryInterface(IDataTemplateSelectorOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTemplateSelectorOverrides := IDataTemplateSelectorOverrides(outPtr)
        }

        return this.__IDataTemplateSelectorOverrides.SelectTemplateCore(item, container)
    }

    /**
     * When implemented by a derived class, returns a specific [DataTemplate](../windows.ui.xaml/datatemplate.md) for a given item or container.
     * @remarks
     * > [!IMPORTANT]
     * > This overload of SelectTemplateCore should not be used. It will not be called by certain controls like TreeView and ItemsRepeater where the template creates the container as well as the item. Please use the overload without the container instead.
     * 
     * Most implementations will choose to implement the selection logic based on the value of either *item* or *container*, not both. Implementations should still pass the unused parameter as-is to base.
     * @param {IInspectable} item The item to return a template for.
     * @returns {DataTemplate} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datatemplateselector.selecttemplatecore
     */
    SelectTemplateForItemCore(item) {
        if (!this.HasProp("__IDataTemplateSelectorOverrides2")) {
            if ((queryResult := this.QueryInterface(IDataTemplateSelectorOverrides2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTemplateSelectorOverrides2 := IDataTemplateSelectorOverrides2(outPtr)
        }

        return this.__IDataTemplateSelectorOverrides2.SelectTemplateForItemCore(item)
    }

    /**
     * Creates or retrieves an existing instance of the [UIElement](../windows.ui.xaml/uielement.md) object declared in the [DataTemplate](../windows.ui.xaml/datatemplate.md) returned by [SelectTemplate](datatemplateselector_selecttemplate_737484049.md).
     * @remarks
     * For more info, see the remarks for the [DataTemplate.GetElement](../windows.ui.xaml/datatemplate_getelement_92222689.md) method.
     * @param {ElementFactoryGetArgs} args An instance of [ElementFactoryGetArgs](../windows.ui.xaml/elementfactorygetargs.md).
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datatemplateselector.getelement
     */
    GetElement(args) {
        if (!this.HasProp("__IElementFactory")) {
            if ((queryResult := this.QueryInterface(IElementFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactory := IElementFactory(outPtr)
        }

        return this.__IElementFactory.GetElement(args)
    }

    /**
     * Recycles a [UIElement](../windows.ui.xaml/uielement.md) object that was created using [GetElement](datatemplateselector_getelement_92222689.md).
     * @remarks
     * For more info, see the remarks for the [DataTemplate.RecycleElement](../windows.ui.xaml/datatemplate_recycleelement_1023702976.md) method.
     * @param {ElementFactoryRecycleArgs} args An instance of [ElementFactoryRecycleArgs](../windows.ui.xaml/elementfactoryrecycleargs.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datatemplateselector.recycleelement
     */
    RecycleElement(args) {
        if (!this.HasProp("__IElementFactory")) {
            if ((queryResult := this.QueryInterface(IElementFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactory := IElementFactory(outPtr)
        }

        return this.__IElementFactory.RecycleElement(args)
    }

;@endregion Instance Methods
}
