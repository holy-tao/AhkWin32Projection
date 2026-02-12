#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGroupStyle.ahk
#Include .\IGroupStyle2.ahk
#Include ..\Data\INotifyPropertyChanged.ahk
#Include .\IGroupStyleFactory.ahk
#Include ..\Data\PropertyChangedEventHandler.ahk
#Include ..\Data\PropertyChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Describes how to display the grouped items in a collection, such as the collection from [GroupItems](../windows.ui.xaml.data/icollectionviewgroup_groupitems.md).
 * @remarks
 * A GroupStyle is typically defined in Extensible Application Markup Language (XAML) and then set as the value of the [ItemsControl.GroupStyle](itemscontrol_groupstyle.md) property to define the visual look of the groups.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyle
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class GroupStyle extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGroupStyle

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGroupStyle.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {GroupStyle} 
     */
    static CreateInstance() {
        if (!GroupStyle.HasProp("__IGroupStyleFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.GroupStyle")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGroupStyleFactory.IID)
            GroupStyle.__IGroupStyleFactory := IGroupStyleFactory(factoryPtr)
        }

        return GroupStyle.__IGroupStyleFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a template that creates the panel used to lay out the items.
     * @remarks
     * An [ItemsPanelTemplate](itemspaneltemplate.md) object element should contain exactly one [FrameworkElement](../windows.ui.xaml/frameworkelement.md)-derived class that serves as the root element for items. In most cases this is a [Panel](panel.md)-derived class. The expanded template serves as the parent for the realized items and there generally is more than one item. Therefore the XAML content property of the intended root element of an [ItemsPanelTemplate](itemspaneltemplate.md) should support a collection, as [Panel.Children](panel_children.md) does.
     * 
     * > [!IMPORTANT]
     * > The root element of the template declared for the [ItemsPanelTemplate](itemspaneltemplate.md) in the GroupStyle.Panel property cannot be a virtualizing panel. Virtualizing panels are defined as any type that derives from [VirtualizingPanel](virtualizingpanel.md), for example the [VirtualizingStackPanel](virtualizingstackpanel.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyle.panel
     * @type {ItemsPanelTemplate} 
     */
    Panel {
        get => this.get_Panel()
        set => this.put_Panel(value)
    }

    /**
     * > [!NOTE]
     * > ContainerStyle may be altered or unavailable for releases after Windows 8.1 and is not supported for [ItemsControl.GroupStyle](itemscontrol_groupstyle.md).
     * 
     * Gets or sets the style that is applied to the [GroupItem](groupitem.md) generated for each item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyle.containerstyle
     * @type {Style} 
     */
    ContainerStyle {
        get => this.get_ContainerStyle()
        set => this.put_ContainerStyle(value)
    }

    /**
     * > [!NOTE]
     * > ContainerStyleSelector may be altered or unavailable for releases after Windows 8.1 and is not supported for [ItemsControl.GroupStyle](itemscontrol_groupstyle.md).
     * 
     * Gets or sets a reference to a custom [StyleSelector](styleselector.md) logic class. The [StyleSelector](styleselector.md) referenced by this property returns a style to apply to each generated [GroupItem](groupitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyle.containerstyleselector
     * @type {StyleSelector} 
     */
    ContainerStyleSelector {
        get => this.get_ContainerStyleSelector()
        set => this.put_ContainerStyleSelector(value)
    }

    /**
     * Gets or sets the template that is used to display the group header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyle.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets a reference to a custom [DataTemplateSelector](datatemplateselector.md) logic class. The [DataTemplateSelector](datatemplateselector.md) returns different [DataTemplate](../windows.ui.xaml/datatemplate.md) values to use for the header area of group item content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyle.headertemplateselector
     * @type {DataTemplateSelector} 
     */
    HeaderTemplateSelector {
        get => this.get_HeaderTemplateSelector()
        set => this.put_HeaderTemplateSelector(value)
    }

    /**
     * Gets or sets a value that indicates whether items corresponding to empty groups should be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyle.hidesifempty
     * @type {Boolean} 
     */
    HidesIfEmpty {
        get => this.get_HidesIfEmpty()
        set => this.put_HidesIfEmpty(value)
    }

    /**
     * Gets or sets the style that is applied to the header for each item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyle.headercontainerstyle
     * @type {Style} 
     */
    HeaderContainerStyle {
        get => this.get_HeaderContainerStyle()
        set => this.put_HeaderContainerStyle(value)
    }

    /**
     * Occurs when a property value changes.
     * @type {PropertyChangedEventHandler}
    */
    OnPropertyChanged {
        get {
            if(!this.HasProp("__OnPropertyChanged")){
                this.__OnPropertyChanged := WinRTEventHandler(
                    PropertyChangedEventHandler,
                    PropertyChangedEventHandler.IID,
                    IInspectable,
                    PropertyChangedEventArgs
                )
                this.__OnPropertyChangedToken := this.add_PropertyChanged(this.__OnPropertyChanged.iface)
            }
            return this.__OnPropertyChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPropertyChangedToken")) {
            this.remove_PropertyChanged(this.__OnPropertyChangedToken)
            this.__OnPropertyChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {ItemsPanelTemplate} 
     */
    get_Panel() {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.get_Panel()
    }

    /**
     * 
     * @param {ItemsPanelTemplate} value 
     * @returns {HRESULT} 
     */
    put_Panel(value) {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.put_Panel(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_ContainerStyle() {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.get_ContainerStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_ContainerStyle(value) {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.put_ContainerStyle(value)
    }

    /**
     * 
     * @returns {StyleSelector} 
     */
    get_ContainerStyleSelector() {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.get_ContainerStyleSelector()
    }

    /**
     * 
     * @param {StyleSelector} value 
     * @returns {HRESULT} 
     */
    put_ContainerStyleSelector(value) {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.put_ContainerStyleSelector(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_HeaderTemplateSelector() {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.get_HeaderTemplateSelector()
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplateSelector(value) {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.put_HeaderTemplateSelector(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HidesIfEmpty() {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.get_HidesIfEmpty()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_HidesIfEmpty(value) {
        if (!this.HasProp("__IGroupStyle")) {
            if ((queryResult := this.QueryInterface(IGroupStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle := IGroupStyle(outPtr)
        }

        return this.__IGroupStyle.put_HidesIfEmpty(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_HeaderContainerStyle() {
        if (!this.HasProp("__IGroupStyle2")) {
            if ((queryResult := this.QueryInterface(IGroupStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle2 := IGroupStyle2(outPtr)
        }

        return this.__IGroupStyle2.get_HeaderContainerStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_HeaderContainerStyle(value) {
        if (!this.HasProp("__IGroupStyle2")) {
            if ((queryResult := this.QueryInterface(IGroupStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyle2 := IGroupStyle2(outPtr)
        }

        return this.__IGroupStyle2.put_HeaderContainerStyle(value)
    }

    /**
     * 
     * @param {PropertyChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertyChanged(handler) {
        if (!this.HasProp("__INotifyPropertyChanged")) {
            if ((queryResult := this.QueryInterface(INotifyPropertyChanged.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyPropertyChanged := INotifyPropertyChanged(outPtr)
        }

        return this.__INotifyPropertyChanged.add_PropertyChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PropertyChanged(token) {
        if (!this.HasProp("__INotifyPropertyChanged")) {
            if ((queryResult := this.QueryInterface(INotifyPropertyChanged.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyPropertyChanged := INotifyPropertyChanged(outPtr)
        }

        return this.__INotifyPropertyChanged.remove_PropertyChanged(token)
    }

;@endregion Instance Methods
}
