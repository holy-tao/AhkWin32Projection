#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Panel.ahk
#Include .\IItemsStackPanel.ahk
#Include .\IItemsStackPanel2.ahk
#Include .\IItemsStackPanelStatics.ahk
#Include .\IItemsStackPanelStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Arranges child elements of an [ItemsControl](itemscontrol.md) into a single line that can be oriented horizontally or vertically. Supports pixel-based UI virtualization and grouped layouts.
 * @remarks
 * ItemsStackPanel can be used only as the [ItemsPanel](itemscontrol_itemspanel.md) of an [ItemsControl](itemscontrol.md) that displays more than one item at a time. It can't be used with an [ItemsControl](itemscontrol.md) that displays only one item at a time, such as a [ComboBox](combobox.md) or [FlipView](flipview.md). ItemsStackPanel is the default [ItemsPanel](itemscontrol_itemspanel.md) for [ListView](listview.md).
 * 
 * By default, the ItemsStackPanel stacks items vertically from top to bottom. You can set the [Orientation](itemsstackpanel_orientation.md) property to **Horizontal** to stack items from left to right.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemsStackPanel extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemsStackPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemsStackPanel.IID

    /**
     * Identifies the [GroupPadding](itemsstackpanel_grouppadding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.grouppaddingproperty
     * @type {DependencyProperty} 
     */
    static GroupPaddingProperty {
        get => ItemsStackPanel.get_GroupPaddingProperty()
    }

    /**
     * Identifies the [Orientation](itemsstackpanel_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => ItemsStackPanel.get_OrientationProperty()
    }

    /**
     * Identifies the [GroupHeaderPlacement](itemsstackpanel_groupheaderplacement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.groupheaderplacementproperty
     * @type {DependencyProperty} 
     */
    static GroupHeaderPlacementProperty {
        get => ItemsStackPanel.get_GroupHeaderPlacementProperty()
    }

    /**
     * Identifies the [CacheLength](itemsstackpanel_cachelength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.cachelengthproperty
     * @type {DependencyProperty} 
     */
    static CacheLengthProperty {
        get => ItemsStackPanel.get_CacheLengthProperty()
    }

    /**
     * Identifies the [AreStickyGroupHeadersEnabled](itemsstackpanel_arestickygroupheadersenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.arestickygroupheadersenabledproperty
     * @type {DependencyProperty} 
     */
    static AreStickyGroupHeadersEnabledProperty {
        get => ItemsStackPanel.get_AreStickyGroupHeadersEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GroupPaddingProperty() {
        if (!ItemsStackPanel.HasProp("__IItemsStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsStackPanelStatics.IID)
            ItemsStackPanel.__IItemsStackPanelStatics := IItemsStackPanelStatics(factoryPtr)
        }

        return ItemsStackPanel.__IItemsStackPanelStatics.get_GroupPaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!ItemsStackPanel.HasProp("__IItemsStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsStackPanelStatics.IID)
            ItemsStackPanel.__IItemsStackPanelStatics := IItemsStackPanelStatics(factoryPtr)
        }

        return ItemsStackPanel.__IItemsStackPanelStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GroupHeaderPlacementProperty() {
        if (!ItemsStackPanel.HasProp("__IItemsStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsStackPanelStatics.IID)
            ItemsStackPanel.__IItemsStackPanelStatics := IItemsStackPanelStatics(factoryPtr)
        }

        return ItemsStackPanel.__IItemsStackPanelStatics.get_GroupHeaderPlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CacheLengthProperty() {
        if (!ItemsStackPanel.HasProp("__IItemsStackPanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsStackPanelStatics.IID)
            ItemsStackPanel.__IItemsStackPanelStatics := IItemsStackPanelStatics(factoryPtr)
        }

        return ItemsStackPanel.__IItemsStackPanelStatics.get_CacheLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AreStickyGroupHeadersEnabledProperty() {
        if (!ItemsStackPanel.HasProp("__IItemsStackPanelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsStackPanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsStackPanelStatics2.IID)
            ItemsStackPanel.__IItemsStackPanelStatics2 := IItemsStackPanelStatics2(factoryPtr)
        }

        return ItemsStackPanel.__IItemsStackPanelStatics2.get_AreStickyGroupHeadersEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the amount of space around a group.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.grouppadding
     * @type {Thickness} 
     */
    GroupPadding {
        get => this.get_GroupPadding()
        set => this.put_GroupPadding(value)
    }

    /**
     * Gets or sets the dimension by which child elements are stacked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets the index in the data collection of the first item in the cache.
     * @remarks
     * The index of the container for the very first item and the focused items are not reported if they are not in the cache.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.firstcacheindex
     * @type {Integer} 
     */
    FirstCacheIndex {
        get => this.get_FirstCacheIndex()
    }

    /**
     * Gets the index in the data collection of the first item on the screen. Partially visible items are considered to be on screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.firstvisibleindex
     * @type {Integer} 
     */
    FirstVisibleIndex {
        get => this.get_FirstVisibleIndex()
    }

    /**
     * Gets the index in the data collection of the last item on the screen. Partially visible items are considered to be on screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.lastvisibleindex
     * @type {Integer} 
     */
    LastVisibleIndex {
        get => this.get_LastVisibleIndex()
    }

    /**
     * Gets the index in the data collection of the last item in the cache.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.lastcacheindex
     * @type {Integer} 
     */
    LastCacheIndex {
        get => this.get_LastCacheIndex()
    }

    /**
     * Gets a value that indicates whether items are panning forward or backward, or aren't panning.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.scrollingdirection
     * @type {Integer} 
     */
    ScrollingDirection {
        get => this.get_ScrollingDirection()
    }

    /**
     * Gets or sets a value that specifies where group headers are positioned in relation to the group.
     * @remarks
     * Valid values are **Top** and **Left**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.groupheaderplacement
     * @type {Integer} 
     */
    GroupHeaderPlacement {
        get => this.get_GroupHeaderPlacement()
        set => this.put_GroupHeaderPlacement(value)
    }

    /**
     * Gets or sets a value that specifies scrolling behavior when the [ItemsSource](itemscontrol_itemssource.md) is updated.
     * @remarks
     * This property controls how the [ItemsStackPanel](itemsstackpanel.md) responds when the user has scrolled the items, and new items are added to the [ItemsSource](itemscontrol_itemssource.md).
     * 
     * For example, if a user scrolls down a list of emails, and the [ItemsSource](itemscontrol_itemssource.md) updates, adding a new email to the top of the list: 
     * + If ItemsUpdatingScrollMode is **KeepItemsInView**, then the scroll offset is adjusted to keep the first visible item showing at the top of the view.
     * + If ItemsUpdatingScrollMode is **KeepScrollOffset**, then the scroll offset relative to the top of the list is maintained. As a result, the items on the screen are pushed down to account for the new item added at the top.
     * 
     * 
     * In other cases, like in a chat app, items are added to the bottom of the list. In this case, you can set ItemsUpdatingScrollMode to **KeepLastItemInView**. This adjusts the scroll offset to keep the last visible item showing at the bottom of the view. (**KeepLastItemInView** is available starting with Windows 10, version 1607.)
     * 
     * > [!TIP]
     * > In Windows 8, the [ListView](listview.md) control uses [VirtualizingStackPanel](virtualizingstackpanel.md) as its default [ItemsPanel](itemscontrol_itemspanel.md); in Windows 8.1, the [ListView](listview.md) control uses [ItemsStackPanel](itemsstackpanel.md) as its default [ItemsPanel](itemscontrol_itemspanel.md). When upgrading a [ListView](listview.md) in a Windows 8 app to use [ItemsStackPanel](itemsstackpanel.md), set the ItemsUpdatingScrollMode property to [KeepScrollOffset](itemsupdatingscrollmode.md) if you need to keep the behavior of the Windows 8  [ListView](listview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.itemsupdatingscrollmode
     * @type {Integer} 
     */
    ItemsUpdatingScrollMode {
        get => this.get_ItemsUpdatingScrollMode()
        set => this.put_ItemsUpdatingScrollMode(value)
    }

    /**
     * Gets or sets the size of the buffers for items outside the viewport, in multiples of the viewport size.
     * @remarks
     * To improve scrolling performance, [ItemsStackPanel](itemsstackpanel.md) creates and caches item containers for items that are off-screen on both sides of the viewport. The CacheLength property specifies the size of the buffers for the off-screen items. You specify CacheLength in multiples of the current viewport size. For example, if the CacheLength is 4.0, 2 viewports worth of items are buffered on each side of the viewport.
     * 
     * You can set a smaller cache length to optimize startup time, or set a larger cache size to optimize scrolling performance. Item containers that are off-screen are created at a lower priority than those in the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.cachelength
     * @type {Float} 
     */
    CacheLength {
        get => this.get_CacheLength()
        set => this.put_CacheLength(value)
    }

    /**
     * Gets or sets a value that specifies whether a group header moves with the group when the group is panned vertically.
     * @remarks
     * Group headers can be sticky only when the group is panned vertically and the [GroupHeaderPlacement](itemsstackpanel_groupheaderplacement.md) is **Top**. If the panel's [Orientation](itemsstackpanel_orientation.md) is **Horizontal** or [GroupHeaderPlacement](itemsstackpanel_groupheaderplacement.md) is not **Top**, this property is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemsstackpanel.arestickygroupheadersenabled
     * @type {Boolean} 
     */
    AreStickyGroupHeadersEnabled {
        get => this.get_AreStickyGroupHeadersEnabled()
        set => this.put_AreStickyGroupHeadersEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ItemsStackPanel](itemsstackpanel.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsStackPanel")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_GroupPadding() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_GroupPadding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_GroupPadding(value) {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.put_GroupPadding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.put_Orientation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstCacheIndex() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_FirstCacheIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstVisibleIndex() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_FirstVisibleIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastVisibleIndex() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_LastVisibleIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastCacheIndex() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_LastCacheIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScrollingDirection() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_ScrollingDirection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GroupHeaderPlacement() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_GroupHeaderPlacement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GroupHeaderPlacement(value) {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.put_GroupHeaderPlacement(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemsUpdatingScrollMode() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_ItemsUpdatingScrollMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ItemsUpdatingScrollMode(value) {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.put_ItemsUpdatingScrollMode(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CacheLength() {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.get_CacheLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CacheLength(value) {
        if (!this.HasProp("__IItemsStackPanel")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel := IItemsStackPanel(outPtr)
        }

        return this.__IItemsStackPanel.put_CacheLength(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreStickyGroupHeadersEnabled() {
        if (!this.HasProp("__IItemsStackPanel2")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel2 := IItemsStackPanel2(outPtr)
        }

        return this.__IItemsStackPanel2.get_AreStickyGroupHeadersEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreStickyGroupHeadersEnabled(value) {
        if (!this.HasProp("__IItemsStackPanel2")) {
            if ((queryResult := this.QueryInterface(IItemsStackPanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsStackPanel2 := IItemsStackPanel2(outPtr)
        }

        return this.__IItemsStackPanel2.put_AreStickyGroupHeadersEnabled(value)
    }

;@endregion Instance Methods
}
