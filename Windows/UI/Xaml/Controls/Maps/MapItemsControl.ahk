#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapItemsControl.ahk
#Include .\IMapItemsControlStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains a collection of XAML controls to be displayed on a [MapControl](mapcontrol.md).
 * @remarks
 * Display XAML user interface elements such as a [Button](../windows.ui.xaml.controls/button.md), a [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md), or a [TextBlock](../windows.ui.xaml.controls/textblock.md) by adding them as [Children](mapcontrol_children.md) of the [MapControl](mapcontrol.md). You can also add them to the MapItemsControl, or bind the MapItemsControl to an item or a collection of items.
 * 
 * Alternately, to display pushpins, images, and shapes on the [MapControl](mapcontrol.md), add them to its [MapElements](mapcontrol_mapelements.md) collection.
 * 
 * For more info, see [Display maps with 2D, 3D, and Streetside views](/windows/uwp/maps-and-location/display-maps).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapitemscontrol
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapItemsControl extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapItemsControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapItemsControl.IID

    /**
     * Identifies the [ItemsSource](mapitemscontrol_itemssource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapitemscontrol.itemssourceproperty
     * @type {DependencyProperty} 
     */
    static ItemsSourceProperty {
        get => MapItemsControl.get_ItemsSourceProperty()
    }

    /**
     * Identifies the [Items](mapitemscontrol_items.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapitemscontrol.itemsproperty
     * @type {DependencyProperty} 
     */
    static ItemsProperty {
        get => MapItemsControl.get_ItemsProperty()
    }

    /**
     * Identifies the [ItemTemplate](mapitemscontrol_itemtemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapitemscontrol.itemtemplateproperty
     * @type {DependencyProperty} 
     */
    static ItemTemplateProperty {
        get => MapItemsControl.get_ItemTemplateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsSourceProperty() {
        if (!MapItemsControl.HasProp("__IMapItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapItemsControlStatics.IID)
            MapItemsControl.__IMapItemsControlStatics := IMapItemsControlStatics(factoryPtr)
        }

        return MapItemsControl.__IMapItemsControlStatics.get_ItemsSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsProperty() {
        if (!MapItemsControl.HasProp("__IMapItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapItemsControlStatics.IID)
            MapItemsControl.__IMapItemsControlStatics := IMapItemsControlStatics(factoryPtr)
        }

        return MapItemsControl.__IMapItemsControlStatics.get_ItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemTemplateProperty() {
        if (!MapItemsControl.HasProp("__IMapItemsControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapItemsControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapItemsControlStatics.IID)
            MapItemsControl.__IMapItemsControlStatics := IMapItemsControlStatics(factoryPtr)
        }

        return MapItemsControl.__IMapItemsControlStatics.get_ItemTemplateProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a source that provides the content of the [MapItemsControl](mapitemscontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapitemscontrol.itemssource
     * @type {IInspectable} 
     */
    ItemsSource {
        get => this.get_ItemsSource()
        set => this.put_ItemsSource(value)
    }

    /**
     * Gets a collection of XAML controls to be displayed on a [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapitemscontrol.items
     * @type {IVector<DependencyObject>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display each item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapitemscontrol.itemtemplate
     * @type {DataTemplate} 
     */
    ItemTemplate {
        get => this.get_ItemTemplate()
        set => this.put_ItemTemplate(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapItemsControl](mapitemscontrol.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapItemsControl")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ItemsSource() {
        if (!this.HasProp("__IMapItemsControl")) {
            if ((queryResult := this.QueryInterface(IMapItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapItemsControl := IMapItemsControl(outPtr)
        }

        return this.__IMapItemsControl.get_ItemsSource()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ItemsSource(value) {
        if (!this.HasProp("__IMapItemsControl")) {
            if ((queryResult := this.QueryInterface(IMapItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapItemsControl := IMapItemsControl(outPtr)
        }

        return this.__IMapItemsControl.put_ItemsSource(value)
    }

    /**
     * 
     * @returns {IVector<DependencyObject>} 
     */
    get_Items() {
        if (!this.HasProp("__IMapItemsControl")) {
            if ((queryResult := this.QueryInterface(IMapItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapItemsControl := IMapItemsControl(outPtr)
        }

        return this.__IMapItemsControl.get_Items()
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ItemTemplate() {
        if (!this.HasProp("__IMapItemsControl")) {
            if ((queryResult := this.QueryInterface(IMapItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapItemsControl := IMapItemsControl(outPtr)
        }

        return this.__IMapItemsControl.get_ItemTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplate(value) {
        if (!this.HasProp("__IMapItemsControl")) {
            if ((queryResult := this.QueryInterface(IMapItemsControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapItemsControl := IMapItemsControl(outPtr)
        }

        return this.__IMapItemsControl.put_ItemTemplate(value)
    }

;@endregion Instance Methods
}
