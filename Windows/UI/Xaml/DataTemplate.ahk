#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkTemplate.ahk
#Include .\IDataTemplate.ahk
#Include .\IElementFactory.ahk
#Include .\IDataTemplateFactory.ahk
#Include .\IDataTemplateStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the visual structure of a data object. Use data binding for specific elements in the template that display the data values.
 * @remarks
 * A DataTemplate object is used as the value for these properties:
 * + [ItemsControl.ItemTemplate](../windows.ui.xaml.controls/itemscontrol_itemtemplate.md) (which is inherited by various items controls such as [ListView](../windows.ui.xaml.controls/listview.md), [GridView](../windows.ui.xaml.controls/gridview.md), [ListBox](../windows.ui.xaml.controls/listbox.md))
 * + [ContentControl.ContentTemplate](../windows.ui.xaml.controls/contentcontrol_contenttemplate.md) (which is inherited by various content controls such as [Button](../windows.ui.xaml.controls/button.md), [Frame](../windows.ui.xaml.controls/frame.md), [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md))
 * + **HeaderTemplate** and **FooterTemplate** properties of various items control classes
 * + [ItemsPresenter.HeaderTemplate](../windows.ui.xaml.controls/itemspresenter_headertemplate.md) and [ItemsPresenter.FooterTemplate](../windows.ui.xaml.controls/itemspresenter_footertemplate.md)
 * + **HeaderTemplate** and **FooterTemplate** properties of text controls such as [RichEditBox](../windows.ui.xaml.controls/richeditbox.md), [TextBox](../windows.ui.xaml.controls/textbox.md)
 * + **HeaderTemplate** property of controls such as [ComboBox](../windows.ui.xaml.controls/combobox.md), [DatePicker](../windows.ui.xaml.controls/datepicker.md), [Hub](../windows.ui.xaml.controls/hub.md), [HubSection](../windows.ui.xaml.controls/hubsection.md), [Pivot](../windows.ui.xaml.controls/pivot.md), [Slider](../windows.ui.xaml.controls/slider.md), [TimePicker](../windows.ui.xaml.controls/timepicker.md), [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md); some of these also have **FooterTemplate**
 * 
 * You typically use a DataTemplate to specify the visual representation of your data. DataTemplate objects are particularly useful when you are binding an [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) such as a [ListBox](../windows.ui.xaml.controls/listbox.md) to an entire collection. Without specific instructions, a [ListBox](../windows.ui.xaml.controls/listbox.md) displays the string representation of the objects in a collection. Use a DataTemplate to define the appearance of each of your data objects. The content of your DataTemplate becomes the visual structure of your data objects.
 * 
 * You typically use data binding in a DataTemplate. For example, suppose that a [ListBox](../windows.ui.xaml.controls/listbox.md) is bound to a collection of `Customer` objects and has the [ItemTemplate](../windows.ui.xaml.controls/itemscontrol_itemtemplate.md) property set to a DataTemplate. When the [ListBox](../windows.ui.xaml.controls/listbox.md) is created, a [ListBoxItem](../windows.ui.xaml.controls/listboxitem.md) is created for each `Customer` in the collection, and the [DataContext](frameworkelement_datacontext.md) of the [ListBoxItem](../windows.ui.xaml.controls/listboxitem.md) is set to the appropriate customer. In other words, the [DataContext](frameworkelement_datacontext.md) of the first [ListBoxItem](../windows.ui.xaml.controls/listboxitem.md) is set to the first customer, the [DataContext](frameworkelement_datacontext.md) of the second [ListBoxItem](../windows.ui.xaml.controls/listboxitem.md) is set to the second customer, and so on. You can bind elements in the DataTemplate to show property values that come from each of the `Customer` objects.
 * 
 * You can also use a DataTemplate to share [UIElement](uielement.md) objects across multiple [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) objects. For example, suppose you need multiple buttons on your application to have the same graphic. You can create a DataTemplate that contains the graphic and use it as the [ContentTemplate](../windows.ui.xaml.controls/contentcontrol_contenttemplate.md) for the buttons. A data template for [ContentTemplate](../windows.ui.xaml.controls/contentcontrol_contenttemplate.md) can also use data binding. But in this case the data context is the same as the element where the template's applied. Usually this is one data object, and there's no concept of items.
 * 
 * You can place a DataTemplate as the direct child of an [ItemTemplate](../windows.ui.xaml.controls/itemscontrol_itemtemplate.md) property element in XAML. This is know as an *inline template* and you'd do this if you had no need to use that same data template for other areas of your UI. You can also define a DataTemplate as a resource and then reference the resource as the value of the [ItemTemplate](../windows.ui.xaml.controls/itemscontrol_itemtemplate.md) property. Once it's a resource, you can use the same template for multiple UI elements that need a data template. If you factor the data template into [Application.Resources](application_resources.md), you can even share the same template for different pages of your UI.
 * 
 * The XAML usage for contents of a data template is not exposed as a settable code property. It is special behavior built into the XAML processing for a DataTemplate.
 * 
 * For advanced data binding scenarios, you might want to have properties of the data determine which template should produce their UI representations. For this scenario, you can use a [DataTemplateSelector](../windows.ui.xaml.controls/datatemplateselector.md) and set properties such as [ItemTemplateSelector](../windows.ui.xaml.controls/itemscontrol_itemtemplateselector.md) to assign it to a data view. A [DataTemplateSelector](../windows.ui.xaml.controls/datatemplateselector.md) is a logic class you write yourself, which has a method that returns exactly one DataTemplate to the binding engine based on your own logic interacting with your data. For more info, see [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplate
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DataTemplate extends FrameworkTemplate {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataTemplate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataTemplate.IID

    /**
     * Identifies the [ExtensionInstance](datatemplate_extensioninstance.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplate.extensioninstanceproperty
     * @type {DependencyProperty} 
     */
    static ExtensionInstanceProperty {
        get => DataTemplate.get_ExtensionInstanceProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DataTemplate} 
     */
    static CreateInstance() {
        if (!DataTemplate.HasProp("__IDataTemplateFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DataTemplate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTemplateFactory.IID)
            DataTemplate.__IDataTemplateFactory := IDataTemplateFactory(factoryPtr)
        }

        return DataTemplate.__IDataTemplateFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExtensionInstanceProperty() {
        if (!DataTemplate.HasProp("__IDataTemplateStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DataTemplate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTemplateStatics2.IID)
            DataTemplate.__IDataTemplateStatics2 := IDataTemplateStatics2(factoryPtr)
        }

        return DataTemplate.__IDataTemplateStatics2.get_ExtensionInstanceProperty()
    }

    /**
     * Gets the value of the [DataTemplate.ExtensionInstance](datatemplate_extensioninstance.md) XAML attached property for the target element.
     * @param {FrameworkElement} element The object from which the property value is read.
     * @returns {IDataTemplateExtension} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplate.getextensioninstance
     */
    static GetExtensionInstance(element) {
        if (!DataTemplate.HasProp("__IDataTemplateStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DataTemplate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTemplateStatics2.IID)
            DataTemplate.__IDataTemplateStatics2 := IDataTemplateStatics2(factoryPtr)
        }

        return DataTemplate.__IDataTemplateStatics2.GetExtensionInstance(element)
    }

    /**
     * Sets the value of the [DataTemplate.ExtensionInstance](datatemplate_extensioninstance.md) XAML attached property for a target element.
     * @param {FrameworkElement} element The object to which the property value is written.
     * @param {IDataTemplateExtension} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplate.setextensioninstance
     */
    static SetExtensionInstance(element, value) {
        if (!DataTemplate.HasProp("__IDataTemplateStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DataTemplate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTemplateStatics2.IID)
            DataTemplate.__IDataTemplateStatics2 := IDataTemplateStatics2(factoryPtr)
        }

        return DataTemplate.__IDataTemplateStatics2.SetExtensionInstance(element, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates the [UIElement](uielement.md) objects in the [DataTemplate](datatemplate.md).
     * @remarks
     * When you call LoadContent, the [UIElement](uielement.md) objects in the [DataTemplate](datatemplate.md) are created, and you can add them to the visual tree of another [UIElement](uielement.md).
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplate.loadcontent
     */
    LoadContent() {
        if (!this.HasProp("__IDataTemplate")) {
            if ((queryResult := this.QueryInterface(IDataTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTemplate := IDataTemplate(outPtr)
        }

        return this.__IDataTemplate.LoadContent()
    }

    /**
     * Creates or retrieves an existing instance of the [UIElement](uielement.md) object declared in the [DataTemplate](datatemplate.md).
     * @remarks
     * The [DataTemplate](datatemplate.md) acts as a factory that generates the element object declared in its template. Unlike the [LoadContent](datatemplate_loadcontent_471913183.md) method that creates a new instance every time it is invoked, the GetElement method may either create a new instance or return an existing instance that was recycled via [RecycleElement](datatemplate_recycleelement_1023702976.md).
     * 
     * The **DataTemplate**'s implementation of GetElement does not use the [Data](elementfactorygetargs_data.md) value from the [ElementFactoryGetArgs](elementfactorygetargs.md). The [Data](elementfactorygetargs_data.md) property exists for implementations such as [DataTemplateSelector](../windows.ui.xaml.controls/datatemplateselector.md) where it is used to decide from which [DataTemplate](datatemplate.md) to load content.
     * @param {ElementFactoryGetArgs} args An instance of [ElementFactoryGetArgs](elementfactorygetargs.md).
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplate.getelement
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
     * Recycles a [UIElement](../windows.ui.xaml/uielement.md) that was previously retrieved using [GetElement](datatemplate_getelement_92222689.md).
     * @remarks
     * The RecycleElement method is used to set aside an element for later re-use, but does not automatically reset the current state of the element. For example, if a [Control](../windows.ui.xaml.controls/control.md)'s [Background](../windows.ui.xaml.controls/control_background.md) is programmatically set the value persists when added to the live tree again.
     * 
     * Recycled elements returned from [GetElement](datatemplate_getelement_92222689.md) can be added to the live tree in the same way as newly created elements.
     * 
     * [GetElement](datatemplate_getelement_92222689.md) tries to retrieve an existing instance from those that were recycled. If none are found then it will create a new instance using [LoadContent](datatemplate_loadcontent_471913183.md).  
     * 
     * Recycling an element may not immediately cause it to be removed from the live element tree. In that situation the [Unloaded](frameworkelement_unloaded.md)/[Loaded](frameworkelement_loaded.md) events are not raised unless it is added to a different parent element in the live tree.
     * 
     * Specifying the [Parent](elementfactoryrecycleargs_parent.md) is not required when calling RecycleElement. However, its use is recommended to enable a performance optimization. When [GetElement](datatemplate_getelement_92222689.md) is called with a [Parent](elementfactorygetargs_parent.md) value it will look for elements that where recycled for that same [Parent](elementfactorygetargs_parent.md). If they're still attached to the parent element then they can be re-used without incurring the additional overhead of re-parenting the element.
     * 
     * > [!NOTE]
     * > RecycleElement does not automatically exclude the recycled element from participating in the tab order. Nor does it hide the element's automation peer from appearing in the automation tree. The platform's built-in virtualizing controls manage this for the elements under their control.  
     * >
     * > If you're creating a custom virtualizing control from scratch or calling RecycleElement in one-off scenarios then be aware it is your responsibility to exclude recycled elements from the tab order and the tree of automation peers.
     * >
     * > You can override [GetChildrenInTabFocusOrder](uielement_getchildrenintabfocusorder_1610735643.md) and provide the subset of realized elements the framework should use for Tab focus. Similarly, the automation peer for the control should override its [GetChildrenCore](/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getchildrencore) and exclude recycled elements.
     * @param {ElementFactoryRecycleArgs} args An instance of [ElementFactoryRecycleArgs](elementfactoryrecycleargs.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplate.recycleelement
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
