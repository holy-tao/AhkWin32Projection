#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\OrientedVirtualizingPanel.ahk
#Include .\IVirtualizingStackPanel.ahk
#Include .\IVirtualizingStackPanelOverrides.ahk
#Include .\IVirtualizingStackPanelStatics.ahk
#Include .\CleanUpVirtualizedItemEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\CleanUpVirtualizedItemEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Arranges and virtualizes content on a single line that is oriented either horizontally or vertically. Can only be used to display items in an [ItemsControl](itemscontrol.md).
 * @remarks
 * VirtualizingStackPanel can only be used to display items in an [ItemsControl](itemscontrol.md). A primary scenario for VirtualizingStackPanel is that it provides the items panel template behavior for [FlipView](flipview.md) and [ListBox](listbox.md) in default templates.
 * 
 * > [!NOTE]
 * > Starting in Windows 8.1, [ItemsStackPanel](itemsstackpanel.md) is used as the default [ItemsPanel](itemscontrol_itemspanel.md) for [ListView](listview.md). If you modify the [ItemsPanel](itemscontrol_itemspanel.md), we recommend you use [ItemsStackPanel](itemsstackpanel.md) or [ItemsWrapGrid](itemswrapgrid.md) instead of VirtualizingStackPanel or [WrapGrid](wrapgrid.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class VirtualizingStackPanel extends OrientedVirtualizingPanel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVirtualizingStackPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVirtualizingStackPanel.IID

    /**
     * Identifies the [AreScrollSnapPointsRegular](stackpanel_arescrollsnappointsregular.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.arescrollsnappointsregularproperty
     * @type {DependencyProperty} 
     */
    static AreScrollSnapPointsRegularProperty {
        get => VirtualizingStackPanel.get_AreScrollSnapPointsRegularProperty()
    }

    /**
     * Identifies the [Orientation](virtualizingstackpanel_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => VirtualizingStackPanel.get_OrientationProperty()
    }

    /**
     * Identifies the [VirtualizingStackPanel.VirtualizationMode](virtualizingstackpanel_virtualizationmode.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.virtualizationmodeproperty
     * @type {DependencyProperty} 
     */
    static VirtualizationModeProperty {
        get => VirtualizingStackPanel.get_VirtualizationModeProperty()
    }

    /**
     * Identifies the **VirtualizingStackPanel.IsVirtualizing** attached property.
     * @remarks
     * **VirtualizingStackPanel.IsVirtualizing** is an atypical attached property because it does not have a **Set** accessor, and thus is not really a XAML attached property with a markup usage. Instead, **VirtualizingStackPanel.IsVirtualizing** functions as a sentinel whereby child elements can query the [VirtualizingStackPanel](virtualizingstackpanel.md) parent, and determine whether virtualization is being used. This might be important information for layout logic or further virtualization logic that is used by the child element itself.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.isvirtualizingproperty
     * @type {DependencyProperty} 
     */
    static IsVirtualizingProperty {
        get => VirtualizingStackPanel.get_IsVirtualizingProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AreScrollSnapPointsRegularProperty() {
        if (!VirtualizingStackPanel.HasProp("__IVirtualizingStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VirtualizingStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualizingStackPanelStatics.IID)
            VirtualizingStackPanel.__IVirtualizingStackPanelStatics := IVirtualizingStackPanelStatics(factoryPtr)
        }

        return VirtualizingStackPanel.__IVirtualizingStackPanelStatics.get_AreScrollSnapPointsRegularProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!VirtualizingStackPanel.HasProp("__IVirtualizingStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VirtualizingStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualizingStackPanelStatics.IID)
            VirtualizingStackPanel.__IVirtualizingStackPanelStatics := IVirtualizingStackPanelStatics(factoryPtr)
        }

        return VirtualizingStackPanel.__IVirtualizingStackPanelStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VirtualizationModeProperty() {
        if (!VirtualizingStackPanel.HasProp("__IVirtualizingStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VirtualizingStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualizingStackPanelStatics.IID)
            VirtualizingStackPanel.__IVirtualizingStackPanelStatics := IVirtualizingStackPanelStatics(factoryPtr)
        }

        return VirtualizingStackPanel.__IVirtualizingStackPanelStatics.get_VirtualizationModeProperty()
    }

    /**
     * Gets the [VirtualizingStackPanel.VirtualizationMode](virtualizingstackpanel_virtualizationmode.md) XAML attached property value for the specified target element.
     * @remarks
     * For more info, see the [VirtualizingStackPanel.VirtualizationMode](virtualizingstackpanel_virtualizationmode.md) attached property.
     * @param {DependencyObject} element The object from which the [VirtualizationMode](virtualizationmode.md) is read.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.getvirtualizationmode
     */
    static GetVirtualizationMode(element) {
        if (!VirtualizingStackPanel.HasProp("__IVirtualizingStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VirtualizingStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualizingStackPanelStatics.IID)
            VirtualizingStackPanel.__IVirtualizingStackPanelStatics := IVirtualizingStackPanelStatics(factoryPtr)
        }

        return VirtualizingStackPanel.__IVirtualizingStackPanelStatics.GetVirtualizationMode(element)
    }

    /**
     * Sets the [VirtualizingStackPanel.VirtualizationMode](virtualizingstackpanel_virtualizationmode.md) XAML attached property on the specified target element.
     * @remarks
     * For more info, see the [VirtualizingStackPanel.VirtualizationMode](virtualizingstackpanel_virtualizationmode.md) attached property.
     * @param {DependencyObject} element The target element.
     * @param {Integer} value One of the enumeration values that specifies whether *element* uses container recycling.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.setvirtualizationmode
     */
    static SetVirtualizationMode(element, value) {
        if (!VirtualizingStackPanel.HasProp("__IVirtualizingStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VirtualizingStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualizingStackPanelStatics.IID)
            VirtualizingStackPanel.__IVirtualizingStackPanelStatics := IVirtualizingStackPanelStatics(factoryPtr)
        }

        return VirtualizingStackPanel.__IVirtualizingStackPanelStatics.SetVirtualizationMode(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsVirtualizingProperty() {
        if (!VirtualizingStackPanel.HasProp("__IVirtualizingStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VirtualizingStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualizingStackPanelStatics.IID)
            VirtualizingStackPanel.__IVirtualizingStackPanelStatics := IVirtualizingStackPanelStatics(factoryPtr)
        }

        return VirtualizingStackPanel.__IVirtualizingStackPanelStatics.get_IsVirtualizingProperty()
    }

    /**
     * Gets a value that determines whether an item is currently being virtualized as part of an items set where the [ItemsPanel](itemscontrol_itemspanel.md) is templated with a [VirtualizingStackPanel](virtualizingstackpanel.md).
     * @remarks
     * **VirtualizingStackPanel.IsVirtualizing** uses the attached property model as a property store, but does not support a XAML usage. Instead, the property serves as a sentinel that any [VirtualizingStackPanel](virtualizingstackpanel.md) child element can check to determine whether that child is currently being represented as virtualized. To find out if an item is being virtualized, call GetIsVirtualizing, passing the item as the input parameter.
     * @param {DependencyObject} o The object item where you want to determine the current virtualization state.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.getisvirtualizing
     */
    static GetIsVirtualizing(o) {
        if (!VirtualizingStackPanel.HasProp("__IVirtualizingStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VirtualizingStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVirtualizingStackPanelStatics.IID)
            VirtualizingStackPanel.__IVirtualizingStackPanelStatics := IVirtualizingStackPanelStatics(factoryPtr)
        }

        return VirtualizingStackPanel.__IVirtualizingStackPanelStatics.GetIsVirtualizing(o)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the generated snap points used for panning in the [VirtualizingStackPanel](virtualizingstackpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.arescrollsnappointsregular
     * @type {Boolean} 
     */
    AreScrollSnapPointsRegular {
        get => this.get_AreScrollSnapPointsRegular()
        set => this.put_AreScrollSnapPointsRegular(value)
    }

    /**
     * Gets or sets a value that describes the horizontal or vertical orientation of stacked content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Occurs when an item that is hosted by the [VirtualizingStackPanel](virtualizingstackpanel.md) is re-virtualized.
     * @type {CleanUpVirtualizedItemEventHandler}
    */
    OnCleanUpVirtualizedItemEvent {
        get {
            if(!this.HasProp("__OnCleanUpVirtualizedItemEvent")){
                this.__OnCleanUpVirtualizedItemEvent := WinRTEventHandler(
                    CleanUpVirtualizedItemEventHandler,
                    CleanUpVirtualizedItemEventHandler.IID,
                    IInspectable,
                    CleanUpVirtualizedItemEventArgs
                )
                this.__OnCleanUpVirtualizedItemEventToken := this.add_CleanUpVirtualizedItemEvent(this.__OnCleanUpVirtualizedItemEvent.iface)
            }
            return this.__OnCleanUpVirtualizedItemEvent
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [VirtualizingStackPanel](virtualizingstackpanel.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VirtualizingStackPanel")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCleanUpVirtualizedItemEventToken")) {
            this.remove_CleanUpVirtualizedItemEvent(this.__OnCleanUpVirtualizedItemEventToken)
            this.__OnCleanUpVirtualizedItemEvent.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreScrollSnapPointsRegular() {
        if (!this.HasProp("__IVirtualizingStackPanel")) {
            if ((queryResult := this.QueryInterface(IVirtualizingStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingStackPanel := IVirtualizingStackPanel(outPtr)
        }

        return this.__IVirtualizingStackPanel.get_AreScrollSnapPointsRegular()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreScrollSnapPointsRegular(value) {
        if (!this.HasProp("__IVirtualizingStackPanel")) {
            if ((queryResult := this.QueryInterface(IVirtualizingStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingStackPanel := IVirtualizingStackPanel(outPtr)
        }

        return this.__IVirtualizingStackPanel.put_AreScrollSnapPointsRegular(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IVirtualizingStackPanel")) {
            if ((queryResult := this.QueryInterface(IVirtualizingStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingStackPanel := IVirtualizingStackPanel(outPtr)
        }

        return this.__IVirtualizingStackPanel.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IVirtualizingStackPanel")) {
            if ((queryResult := this.QueryInterface(IVirtualizingStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingStackPanel := IVirtualizingStackPanel(outPtr)
        }

        return this.__IVirtualizingStackPanel.put_Orientation(value)
    }

    /**
     * 
     * @param {CleanUpVirtualizedItemEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CleanUpVirtualizedItemEvent(handler) {
        if (!this.HasProp("__IVirtualizingStackPanel")) {
            if ((queryResult := this.QueryInterface(IVirtualizingStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingStackPanel := IVirtualizingStackPanel(outPtr)
        }

        return this.__IVirtualizingStackPanel.add_CleanUpVirtualizedItemEvent(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CleanUpVirtualizedItemEvent(token) {
        if (!this.HasProp("__IVirtualizingStackPanel")) {
            if ((queryResult := this.QueryInterface(IVirtualizingStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingStackPanel := IVirtualizingStackPanel(outPtr)
        }

        return this.__IVirtualizingStackPanel.remove_CleanUpVirtualizedItemEvent(token)
    }

    /**
     * Called when an item that is hosted by the [VirtualizingStackPanel](virtualizingstackpanel.md) is re-virtualized.
     * @param {CleanUpVirtualizedItemEventArgs} e Data about the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizingstackpanel.oncleanupvirtualizeditem
     */
    OnCleanUpVirtualizedItem(e) {
        if (!this.HasProp("__IVirtualizingStackPanelOverrides")) {
            if ((queryResult := this.QueryInterface(IVirtualizingStackPanelOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizingStackPanelOverrides := IVirtualizingStackPanelOverrides(outPtr)
        }

        return this.__IVirtualizingStackPanelOverrides.OnCleanUpVirtualizedItem(e)
    }

;@endregion Instance Methods
}
