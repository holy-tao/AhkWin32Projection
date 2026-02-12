#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Panel.ahk
#Include .\IItemsWrapGrid.ahk
#Include .\IItemsWrapGrid2.ahk
#Include .\IItemsWrapGridStatics.ahk
#Include .\IItemsWrapGridStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Positions child elements sequentially from left to right or top to bottom in an [ItemsControl](itemscontrol.md) that shows multiple items. When elements extend beyond the container edge, elements are positioned in the next row or column. Supports pixel-based UI virtualization and grouped layouts.
 * @remarks
 * ItemsWrapGrid can be used only as the [ItemsPanel](itemscontrol_itemspanel.md) of an [ItemsControl](itemscontrol.md) that displays more than one item at a time. It can't be used with an [ItemsControl](itemscontrol.md) that displays only one item at a time, such as a [ComboBox](combobox.md) or [FlipView](flipview.md). ItemsWrapGrid is the default [ItemsPanel](itemscontrol_itemspanel.md) for [GridView](gridview.md).
 * 
 * In an ItemsWrapGrid, elements are arranged in rows or columns that automatically wrap to a new row or column when the elements reach the container edge. If the [MaximumRowsOrColumns](itemswrapgrid_maximumrowsorcolumns.md) property is set, items wrap when the specified number of rows or columns is reached instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemsWrapGrid extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemsWrapGrid

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemsWrapGrid.IID

    /**
     * Identifies the [GroupPadding](itemswrapgrid_grouppadding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.grouppaddingproperty
     * @type {DependencyProperty} 
     */
    static GroupPaddingProperty {
        get => ItemsWrapGrid.get_GroupPaddingProperty()
    }

    /**
     * Identifies the [Orientation](itemswrapgrid_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => ItemsWrapGrid.get_OrientationProperty()
    }

    /**
     * Identifies the [MaximumRowsOrColumns](itemswrapgrid_maximumrowsorcolumns.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.maximumrowsorcolumnsproperty
     * @type {DependencyProperty} 
     */
    static MaximumRowsOrColumnsProperty {
        get => ItemsWrapGrid.get_MaximumRowsOrColumnsProperty()
    }

    /**
     * Identifies the [ItemWidth](itemswrapgrid_itemwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.itemwidthproperty
     * @type {DependencyProperty} 
     */
    static ItemWidthProperty {
        get => ItemsWrapGrid.get_ItemWidthProperty()
    }

    /**
     * Identifies the [ItemHeight](itemswrapgrid_itemheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.itemheightproperty
     * @type {DependencyProperty} 
     */
    static ItemHeightProperty {
        get => ItemsWrapGrid.get_ItemHeightProperty()
    }

    /**
     * Identifies the [GroupHeaderPlacement](itemswrapgrid_groupheaderplacement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.groupheaderplacementproperty
     * @type {DependencyProperty} 
     */
    static GroupHeaderPlacementProperty {
        get => ItemsWrapGrid.get_GroupHeaderPlacementProperty()
    }

    /**
     * Identifies the [CacheLength](itemswrapgrid_cachelength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.cachelengthproperty
     * @type {DependencyProperty} 
     */
    static CacheLengthProperty {
        get => ItemsWrapGrid.get_CacheLengthProperty()
    }

    /**
     * Identifies the [AreStickyGroupHeadersEnabled](itemswrapgrid_arestickygroupheadersenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.arestickygroupheadersenabledproperty
     * @type {DependencyProperty} 
     */
    static AreStickyGroupHeadersEnabledProperty {
        get => ItemsWrapGrid.get_AreStickyGroupHeadersEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GroupPaddingProperty() {
        if (!ItemsWrapGrid.HasProp("__IItemsWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsWrapGridStatics.IID)
            ItemsWrapGrid.__IItemsWrapGridStatics := IItemsWrapGridStatics(factoryPtr)
        }

        return ItemsWrapGrid.__IItemsWrapGridStatics.get_GroupPaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!ItemsWrapGrid.HasProp("__IItemsWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsWrapGridStatics.IID)
            ItemsWrapGrid.__IItemsWrapGridStatics := IItemsWrapGridStatics(factoryPtr)
        }

        return ItemsWrapGrid.__IItemsWrapGridStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaximumRowsOrColumnsProperty() {
        if (!ItemsWrapGrid.HasProp("__IItemsWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsWrapGridStatics.IID)
            ItemsWrapGrid.__IItemsWrapGridStatics := IItemsWrapGridStatics(factoryPtr)
        }

        return ItemsWrapGrid.__IItemsWrapGridStatics.get_MaximumRowsOrColumnsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemWidthProperty() {
        if (!ItemsWrapGrid.HasProp("__IItemsWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsWrapGridStatics.IID)
            ItemsWrapGrid.__IItemsWrapGridStatics := IItemsWrapGridStatics(factoryPtr)
        }

        return ItemsWrapGrid.__IItemsWrapGridStatics.get_ItemWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemHeightProperty() {
        if (!ItemsWrapGrid.HasProp("__IItemsWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsWrapGridStatics.IID)
            ItemsWrapGrid.__IItemsWrapGridStatics := IItemsWrapGridStatics(factoryPtr)
        }

        return ItemsWrapGrid.__IItemsWrapGridStatics.get_ItemHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GroupHeaderPlacementProperty() {
        if (!ItemsWrapGrid.HasProp("__IItemsWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsWrapGridStatics.IID)
            ItemsWrapGrid.__IItemsWrapGridStatics := IItemsWrapGridStatics(factoryPtr)
        }

        return ItemsWrapGrid.__IItemsWrapGridStatics.get_GroupHeaderPlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CacheLengthProperty() {
        if (!ItemsWrapGrid.HasProp("__IItemsWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsWrapGridStatics.IID)
            ItemsWrapGrid.__IItemsWrapGridStatics := IItemsWrapGridStatics(factoryPtr)
        }

        return ItemsWrapGrid.__IItemsWrapGridStatics.get_CacheLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AreStickyGroupHeadersEnabledProperty() {
        if (!ItemsWrapGrid.HasProp("__IItemsWrapGridStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsWrapGridStatics2.IID)
            ItemsWrapGrid.__IItemsWrapGridStatics2 := IItemsWrapGridStatics2(factoryPtr)
        }

        return ItemsWrapGrid.__IItemsWrapGridStatics2.get_AreStickyGroupHeadersEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the amount of space around a group.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.grouppadding
     * @type {Thickness} 
     */
    GroupPadding {
        get => this.get_GroupPadding()
        set => this.put_GroupPadding(value)
    }

    /**
     * Gets or sets the dimension by which child elements are stacked.
     * @remarks
     * > [!NOTE]
     * > [ItemsWrapGrid](itemswrapgrid.md) is the default [ItemsPanel](itemscontrol_itemspanel.md) for [GridView](gridview.md). For Universal Windows Platform (UWP) app on Windows 10, the default [GridView](gridview.md) template sets the Orientation to **Horizontal**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets a value that influences the wrap point, also accounting for [Orientation](itemswrapgrid_orientation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.maximumrowsorcolumns
     * @type {Integer} 
     */
    MaximumRowsOrColumns {
        get => this.get_MaximumRowsOrColumns()
        set => this.put_MaximumRowsOrColumns(value)
    }

    /**
     * Gets or sets the width of the layout area for each item that is contained in an [ItemsWrapGrid](itemswrapgrid.md).
     * @remarks
     * <!-- "Auto" is not supported in XAML markup for this property -->
     * If ItemWidth is NaN, then the ItemsWrapGrid uses the width of the first cell.
     * 
     * > [!NOTE]
     * > In C#, you can obtain NaN from [Double.NaN](/dotnet/api/system.double.nan?view=dotnet-uwp-10.0&preserve-view=true).
     * >
     * > In C++, you can obtain NaN by using the [`NAN` macro](/cpp/standard-library/cmath) or [`std::numeric_limits<double>::quiet_NaN()`](/cpp/standard-library/numeric-limits-class#quiet_nan).
     * >
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.itemwidth
     * @type {Float} 
     */
    ItemWidth {
        get => this.get_ItemWidth()
        set => this.put_ItemWidth(value)
    }

    /**
     * Gets or sets the height of the layout area for each item that is contained in an [ItemsWrapGrid](itemswrapgrid.md).
     * @remarks
     * <!-- "Auto" is not supported in XAML markup for this property -->
     * If ItemHeight is NaN, then the ItemsWrapGrid uses the height of the first cell.
     * 
     * > [!NOTE]
     * > In C#, you can obtain NaN from [Double.NaN](/dotnet/api/system.double.nan?view=dotnet-uwp-10.0&preserve-view=true).
     * >
     * > In C++, you can obtain NaN by using the [`NAN` macro](/cpp/standard-library/cmath) or [`std::numeric_limits<double>::quiet_NaN()`](/cpp/standard-library/numeric-limits-class#quiet_nan).
     * >
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.itemheight
     * @type {Float} 
     */
    ItemHeight {
        get => this.get_ItemHeight()
        set => this.put_ItemHeight(value)
    }

    /**
     * Gets the index in the data collection of the first item in the cache.
     * @remarks
     * The index of the container for the very first item and the focused items are not reported if they are not in the cache.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.firstcacheindex
     * @type {Integer} 
     */
    FirstCacheIndex {
        get => this.get_FirstCacheIndex()
    }

    /**
     * Gets the index in the data collection of the first item on the screen. Partially visible items are considered to be on screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.firstvisibleindex
     * @type {Integer} 
     */
    FirstVisibleIndex {
        get => this.get_FirstVisibleIndex()
    }

    /**
     * Gets the index in the data collection of the last item on the screen. Partially visible items are considered to be on screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.lastvisibleindex
     * @type {Integer} 
     */
    LastVisibleIndex {
        get => this.get_LastVisibleIndex()
    }

    /**
     * Gets the index in the data collection of the last item in the cache.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.lastcacheindex
     * @type {Integer} 
     */
    LastCacheIndex {
        get => this.get_LastCacheIndex()
    }

    /**
     * Gets a value that indicates whether items are panning forward or backward, or aren't panning.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.scrollingdirection
     * @type {Integer} 
     */
    ScrollingDirection {
        get => this.get_ScrollingDirection()
    }

    /**
     * Gets or sets a value that specifies where group headers are positioned in relation to the group.
     * @remarks
     * Valid values are **Top** and **Left**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.groupheaderplacement
     * @type {Integer} 
     */
    GroupHeaderPlacement {
        get => this.get_GroupHeaderPlacement()
        set => this.put_GroupHeaderPlacement(value)
    }

    /**
     * Gets or sets the size of the buffers for items outside the viewport, in multiples of the viewport size.
     * @remarks
     * To improve scrolling performance, [ItemsWrapGrid](itemswrapgrid.md) creates and caches item containers for items that are off-screen on both sides of the viewport. The CacheLength property specifies the size of the buffers for the off-screen items. You specify CacheLength in multiples of the current viewport size. For example, if the CacheLength is 4.0, 2 viewports worth of items are buffered on each side of the viewport.
     * 
     * You can set a smaller cache length to optimize startup time, or set a larger cache size to optimize scrolling performance. Item containers that are off-screen are created at a lower priority than those in the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.cachelength
     * @type {Float} 
     */
    CacheLength {
        get => this.get_CacheLength()
        set => this.put_CacheLength(value)
    }

    /**
     * Gets or sets a value that specifies whether a group header moves with the group when the group is panned vertically.
     * @remarks
     * Group headers can be sticky only when the group is panned vertically and the [GroupHeaderPlacement](itemswrapgrid_groupheaderplacement.md) is **Top**. If the panel's [Orientation](itemswrapgrid_orientation.md) is **Horizontal** or [GroupHeaderPlacement](itemswrapgrid_groupheaderplacement.md) is not **Top**, this property is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemswrapgrid.arestickygroupheadersenabled
     * @type {Boolean} 
     */
    AreStickyGroupHeadersEnabled {
        get => this.get_AreStickyGroupHeadersEnabled()
        set => this.put_AreStickyGroupHeadersEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ItemsWrapGrid](itemswrapgrid.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsWrapGrid")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_GroupPadding() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_GroupPadding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_GroupPadding(value) {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.put_GroupPadding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.put_Orientation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumRowsOrColumns() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_MaximumRowsOrColumns()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaximumRowsOrColumns(value) {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.put_MaximumRowsOrColumns(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ItemWidth() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_ItemWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ItemWidth(value) {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.put_ItemWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ItemHeight() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_ItemHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ItemHeight(value) {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.put_ItemHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstCacheIndex() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_FirstCacheIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstVisibleIndex() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_FirstVisibleIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastVisibleIndex() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_LastVisibleIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastCacheIndex() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_LastCacheIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScrollingDirection() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_ScrollingDirection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GroupHeaderPlacement() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_GroupHeaderPlacement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GroupHeaderPlacement(value) {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.put_GroupHeaderPlacement(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CacheLength() {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.get_CacheLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CacheLength(value) {
        if (!this.HasProp("__IItemsWrapGrid")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid := IItemsWrapGrid(outPtr)
        }

        return this.__IItemsWrapGrid.put_CacheLength(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreStickyGroupHeadersEnabled() {
        if (!this.HasProp("__IItemsWrapGrid2")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid2 := IItemsWrapGrid2(outPtr)
        }

        return this.__IItemsWrapGrid2.get_AreStickyGroupHeadersEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreStickyGroupHeadersEnabled(value) {
        if (!this.HasProp("__IItemsWrapGrid2")) {
            if ((queryResult := this.QueryInterface(IItemsWrapGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsWrapGrid2 := IItemsWrapGrid2(outPtr)
        }

        return this.__IItemsWrapGrid2.put_AreStickyGroupHeadersEnabled(value)
    }

;@endregion Instance Methods
}
