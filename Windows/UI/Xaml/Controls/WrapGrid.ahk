#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\OrientedVirtualizingPanel.ahk
#Include .\IWrapGrid.ahk
#Include .\IWrapGridStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Positions child elements sequentially from left to right or top to bottom. When elements extend beyond the container edge, elements are positioned in the next row or column. Can only be used to display items in an [ItemsControl](itemscontrol.md). See Remarks.
 * @remarks
 * > [!IMPORTANT]
 * > Starting in Windows 8.1, [ItemsWrapGrid](itemswrapgrid.md) is used as the default [ItemsPanel](itemscontrol_itemspanel.md) for [GridView](gridview.md). If you modify the [ItemsPanel](itemscontrol_itemspanel.md), we recommend you use [ItemsStackPanel](itemsstackpanel.md) or [ItemsWrapGrid](itemswrapgrid.md) instead of [VirtualizingStackPanel](virtualizingstackpanel.md) or WrapGrid.
 * 
 * WrapGrid can only be used to display items in an [ItemsControl](itemscontrol.md).
 * 
 * The content of a WrapGrid is virtualized. This can improve performance when you work with large data sets. For more info, see [Optimize ListView and GridView](/windows/uwp/debug-test-perf/optimize-gridview-and-listview).
 * 
 * In a WrapGrid, elements are arranged in rows or columns that automatically wrap to a new row or column when the [MaximumRowsOrColumns](wrapgrid_maximumrowsorcolumns.md) value is reached. The [Orientation](wrapgrid_orientation.md) property specifies whether the grid adds its items in rows or columns before wrapping.
 * 
 * When the value is **Vertical**, the grid adds items in columns from top to bottom, then wraps from left to right, like this:
 * 
 * <table>
 *    <tr><td>Item 1</td><td>Item 4</td><td>Item 7</td></tr>
 *    <tr><td>Item 2</td><td>Item 5</td><td>Item 8</td></tr>
 *    <tr><td>Item 3</td><td>Item 6</td><td>Item 9</td></tr>
 * </table>
 * 
 * When the value is **Horizontal**, the grid adds items in rows from left to right, then wraps from top to bottom, like this:
 * 
 * <table>
 *    <tr><td>Item 1</td><td>Item 2</td><td>Item 3</td></tr>
 *    <tr><td>Item 4</td><td>Item 5</td><td>Item 6</td></tr>
 *    <tr><td>Item 7</td><td>Item 8</td><td>Item 9</td></tr>
 * </table>
 * 
 * 
 * <!--The following remark is relevant for Windows 8 > 8.1 migration. See WBB 465778-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WrapGrid extends OrientedVirtualizingPanel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWrapGrid

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWrapGrid.IID

    /**
     * Identifies the [ItemWidth](wrapgrid_itemwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.itemwidthproperty
     * @type {DependencyProperty} 
     */
    static ItemWidthProperty {
        get => WrapGrid.get_ItemWidthProperty()
    }

    /**
     * Identifies the [ItemHeight](wrapgrid_itemheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.itemheightproperty
     * @type {DependencyProperty} 
     */
    static ItemHeightProperty {
        get => WrapGrid.get_ItemHeightProperty()
    }

    /**
     * Identifies the [Orientation](wrapgrid_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => WrapGrid.get_OrientationProperty()
    }

    /**
     * Identifies the [HorizontalChildrenAlignment](wrapgrid_horizontalchildrenalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.horizontalchildrenalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalChildrenAlignmentProperty {
        get => WrapGrid.get_HorizontalChildrenAlignmentProperty()
    }

    /**
     * Identifies the [VerticalChildrenAlignment](wrapgrid_verticalchildrenalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.verticalchildrenalignmentproperty
     * @type {DependencyProperty} 
     */
    static VerticalChildrenAlignmentProperty {
        get => WrapGrid.get_VerticalChildrenAlignmentProperty()
    }

    /**
     * Identifies the [MaximumRowsOrColumns](wrapgrid_maximumrowsorcolumns.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.maximumrowsorcolumnsproperty
     * @type {DependencyProperty} 
     */
    static MaximumRowsOrColumnsProperty {
        get => WrapGrid.get_MaximumRowsOrColumnsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemWidthProperty() {
        if (!WrapGrid.HasProp("__IWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWrapGridStatics.IID)
            WrapGrid.__IWrapGridStatics := IWrapGridStatics(factoryPtr)
        }

        return WrapGrid.__IWrapGridStatics.get_ItemWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemHeightProperty() {
        if (!WrapGrid.HasProp("__IWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWrapGridStatics.IID)
            WrapGrid.__IWrapGridStatics := IWrapGridStatics(factoryPtr)
        }

        return WrapGrid.__IWrapGridStatics.get_ItemHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!WrapGrid.HasProp("__IWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWrapGridStatics.IID)
            WrapGrid.__IWrapGridStatics := IWrapGridStatics(factoryPtr)
        }

        return WrapGrid.__IWrapGridStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalChildrenAlignmentProperty() {
        if (!WrapGrid.HasProp("__IWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWrapGridStatics.IID)
            WrapGrid.__IWrapGridStatics := IWrapGridStatics(factoryPtr)
        }

        return WrapGrid.__IWrapGridStatics.get_HorizontalChildrenAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalChildrenAlignmentProperty() {
        if (!WrapGrid.HasProp("__IWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWrapGridStatics.IID)
            WrapGrid.__IWrapGridStatics := IWrapGridStatics(factoryPtr)
        }

        return WrapGrid.__IWrapGridStatics.get_VerticalChildrenAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaximumRowsOrColumnsProperty() {
        if (!WrapGrid.HasProp("__IWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWrapGridStatics.IID)
            WrapGrid.__IWrapGridStatics := IWrapGridStatics(factoryPtr)
        }

        return WrapGrid.__IWrapGridStatics.get_MaximumRowsOrColumnsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the width of the layout area for each item that is contained in a [WrapGrid](wrapgrid.md).
     * @remarks
     * <!-- "Auto" is not supported in XAML markup for this property -->
     * If ItemWidth is the special value NaN, then the WrapGrid uses the width of the first cell.
     * 
     * > [!NOTE]
     * > In C#, you can obtain the NaN value from [Double.NaN](/dotnet/api/system.double.nan?view=dotnet-uwp-10.0&preserve-view=true).
     * >
     * > In C++, you can obtain the NaN value by using the [`NAN` macro](/cpp/standard-library/cmath) or [`std::numeric_limits<double>::quiet_NaN`](/cpp/standard-library/numeric-limits-class#quiet_nan).
     * >
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.itemwidth
     * @type {Float} 
     */
    ItemWidth {
        get => this.get_ItemWidth()
        set => this.put_ItemWidth(value)
    }

    /**
     * Gets or sets the height of the layout area for each item that is contained in a [WrapGrid](wrapgrid.md).
     * @remarks
     * <!-- "Auto" is not supported in XAML markup for this property -->
     * If ItemHeight is NaN, then the WrapGrid uses the height of the first cell.
     * 
     * > [!NOTE]
     * > In C#, you can obtain NaN from [Double.NaN](/dotnet/api/system.double.nan?view=dotnet-uwp-10.0&preserve-view=true).
     * >
     * > In C++, you can obtain NaN by using the [`NAN` macro](/cpp/standard-library/cmath) or [`std::numeric_limits<double>::quiet_NaN`](/cpp/standard-library/numeric-limits-class#quiet_nan).
     * >
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.itemheight
     * @type {Float} 
     */
    ItemHeight {
        get => this.get_ItemHeight()
        set => this.put_ItemHeight(value)
    }

    /**
     * Gets or sets the direction in which child elements are arranged.
     * @remarks
     * The Orientation property specifies whether the grid adds its items in rows or columns before wrapping.
     * 
     * When the value is **Vertical**, the grid adds items in columns from top to bottom, then wraps from left to right, like this:<table>
     *    <tr><td>Item 1</td><td>Item 4</td><td>Item 7</td></tr>
     *    <tr><td>Item 2</td><td>Item 5</td><td>Item 8</td></tr>
     *    <tr><td>Item 3</td><td>Item 6</td><td>Item 9</td></tr>
     * </table>
     * 
     * When the value is **Horizontal**, the grid adds items in rows from left to right, then wraps from top to bottom, like this:<table>
     *    <tr><td>Item 1</td><td>Item 2</td><td>Item 3</td></tr>
     *    <tr><td>Item 4</td><td>Item 5</td><td>Item 6</td></tr>
     *    <tr><td>Item 7</td><td>Item 8</td><td>Item 9</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the alignment rules by which child elements are arranged for the horizontal dimension.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.horizontalchildrenalignment
     * @type {Integer} 
     */
    HorizontalChildrenAlignment {
        get => this.get_HorizontalChildrenAlignment()
        set => this.put_HorizontalChildrenAlignment(value)
    }

    /**
     * Gets or sets the alignment rules by which child elements are arranged for the vertical dimension.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.verticalchildrenalignment
     * @type {Integer} 
     */
    VerticalChildrenAlignment {
        get => this.get_VerticalChildrenAlignment()
        set => this.put_VerticalChildrenAlignment(value)
    }

    /**
     * Gets or sets a value that influences the wrap point, also accounting for [Orientation](wrapgrid_orientation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.wrapgrid.maximumrowsorcolumns
     * @type {Integer} 
     */
    MaximumRowsOrColumns {
        get => this.get_MaximumRowsOrColumns()
        set => this.put_MaximumRowsOrColumns(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [WrapGrid](wrapgrid.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WrapGrid")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ItemWidth() {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.get_ItemWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ItemWidth(value) {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.put_ItemWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ItemHeight() {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.get_ItemHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ItemHeight(value) {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.put_ItemHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.put_Orientation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalChildrenAlignment() {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.get_HorizontalChildrenAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalChildrenAlignment(value) {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.put_HorizontalChildrenAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalChildrenAlignment() {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.get_VerticalChildrenAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalChildrenAlignment(value) {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.put_VerticalChildrenAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumRowsOrColumns() {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.get_MaximumRowsOrColumns()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaximumRowsOrColumns(value) {
        if (!this.HasProp("__IWrapGrid")) {
            if ((queryResult := this.QueryInterface(IWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWrapGrid := IWrapGrid(outPtr)
        }

        return this.__IWrapGrid.put_MaximumRowsOrColumns(value)
    }

;@endregion Instance Methods
}
