#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Panel.ahk
#Include .\IVariableSizedWrapGrid.ahk
#Include .\IVariableSizedWrapGridStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a grid-style layout panel where each tile/cell can be variable size based on content.
 * @remarks
 * VariableSizedWrapGrid is layout panel that supports arranging child elements in rows and columns. Each child element can span multiple rows and columns.
 * 
 * <img alt="Variable sized wrap grid layout panel" src="images/controls/VariableSizedWrapGrid.png" />
 * 
 * In a VariableSizedWrapGrid, elements are arranged in rows or columns that automatically wrap to a new row or column when the [MaximumRowsOrColumns](variablesizedwrapgrid_maximumrowsorcolumns.md) value is reached. The [Orientation](wrapgrid_orientation.md) property specifies whether the grid adds its items in rows or columns before wrapping.
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
 * 
 * You can make items different sizes in the grid by making them span multiple rows and columns using the VariableSizedWrapGrid.RowSpan and VariableSizedWrapGrid.ColumnSpan attached properties.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class VariableSizedWrapGrid extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVariableSizedWrapGrid

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVariableSizedWrapGrid.IID

    /**
     * Identifies the [ItemHeight](variablesizedwrapgrid_itemheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.itemheightproperty
     * @type {DependencyProperty} 
     */
    static ItemHeightProperty {
        get => VariableSizedWrapGrid.get_ItemHeightProperty()
    }

    /**
     * Identifies the [ItemWidth](variablesizedwrapgrid_itemwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.itemwidthproperty
     * @type {DependencyProperty} 
     */
    static ItemWidthProperty {
        get => VariableSizedWrapGrid.get_ItemWidthProperty()
    }

    /**
     * Identifies the [Orientation](variablesizedwrapgrid_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => VariableSizedWrapGrid.get_OrientationProperty()
    }

    /**
     * Identifies the [HorizontalChildrenAlignment](variablesizedwrapgrid_horizontalchildrenalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.horizontalchildrenalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalChildrenAlignmentProperty {
        get => VariableSizedWrapGrid.get_HorizontalChildrenAlignmentProperty()
    }

    /**
     * Identifies the [VerticalChildrenAlignment](variablesizedwrapgrid_verticalchildrenalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.verticalchildrenalignmentproperty
     * @type {DependencyProperty} 
     */
    static VerticalChildrenAlignmentProperty {
        get => VariableSizedWrapGrid.get_VerticalChildrenAlignmentProperty()
    }

    /**
     * Identifies the [MaximumRowsOrColumns](variablesizedwrapgrid_maximumrowsorcolumns.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.maximumrowsorcolumnsproperty
     * @type {DependencyProperty} 
     */
    static MaximumRowsOrColumnsProperty {
        get => VariableSizedWrapGrid.get_MaximumRowsOrColumnsProperty()
    }

    /**
     * Identifies the [VariableSizedWrapGrid.RowSpan](variablesizedwrapgrid_rowspan.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.rowspanproperty
     * @type {DependencyProperty} 
     */
    static RowSpanProperty {
        get => VariableSizedWrapGrid.get_RowSpanProperty()
    }

    /**
     * Identifies the [VariableSizedWrapGrid.ColumnSpan](variablesizedwrapgrid_columnspanproperty.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.columnspanproperty
     * @type {DependencyProperty} 
     */
    static ColumnSpanProperty {
        get => VariableSizedWrapGrid.get_ColumnSpanProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemHeightProperty() {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.get_ItemHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemWidthProperty() {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.get_ItemWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalChildrenAlignmentProperty() {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.get_HorizontalChildrenAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalChildrenAlignmentProperty() {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.get_VerticalChildrenAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaximumRowsOrColumnsProperty() {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.get_MaximumRowsOrColumnsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RowSpanProperty() {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.get_RowSpanProperty()
    }

    /**
     * Gets the value of the [VariableSizedWrapGrid.RowSpan](variablesizedwrapgrid_rowspan.md) XAML attached property from a target element.
     * @remarks
     * For more info, see the [VariableSizedWrapGrid.RowSpan](variablesizedwrapgrid_rowspan.md) attached property.
     * @param {UIElement} element The target element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.getrowspan
     */
    static GetRowSpan(element) {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.GetRowSpan(element)
    }

    /**
     * Sets the value of the [VariableSizedWrapGrid.RowSpan](variablesizedwrapgrid_rowspan.md) XAML attached property on a target element.
     * @remarks
     * For more info, see the [VariableSizedWrapGrid.RowSpan](variablesizedwrapgrid_rowspan.md) attached property.
     * @param {UIElement} element The target element.
     * @param {Integer} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.setrowspan
     */
    static SetRowSpan(element, value) {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.SetRowSpan(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColumnSpanProperty() {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.get_ColumnSpanProperty()
    }

    /**
     * Gets the value of the [VariableSizedWrapGrid.ColumnSpan](variablesizedwrapgrid_columnspanproperty.md) XAML attached property from a target element.
     * @remarks
     * For more info, see the [VariableSizedWrapGrid.ColumnSpan](variablesizedwrapgrid_columnspanproperty.md) attached property.
     * @param {UIElement} element The target element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.getcolumnspan
     */
    static GetColumnSpan(element) {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.GetColumnSpan(element)
    }

    /**
     * Sets the value of the [VariableSizedWrapGrid.ColumnSpan](variablesizedwrapgrid_columnspanproperty.md) XAML attached property on a target element.
     * @remarks
     * For more info, see the [VariableSizedWrapGrid.ColumnSpan](variablesizedwrapgrid_columnspanproperty.md) attached property.
     * @param {UIElement} element The target element.
     * @param {Integer} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.setcolumnspan
     */
    static SetColumnSpan(element, value) {
        if (!VariableSizedWrapGrid.HasProp("__IVariableSizedWrapGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVariableSizedWrapGridStatics.IID)
            VariableSizedWrapGrid.__IVariableSizedWrapGridStatics := IVariableSizedWrapGridStatics(factoryPtr)
        }

        return VariableSizedWrapGrid.__IVariableSizedWrapGridStatics.SetColumnSpan(element, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the height of the layout area for each item that is contained in a [VariableSizedWrapGrid](variablesizedwrapgrid.md).
     * @remarks
     * <!-- "Auto" is not supported in XAML markup for this property -->
     * If ItemHeight is NaN, then the VariableSizedWrapGrid uses the height of the first cell.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.itemheight
     * @type {Float} 
     */
    ItemHeight {
        get => this.get_ItemHeight()
        set => this.put_ItemHeight(value)
    }

    /**
     * Gets or sets the width of the layout area for each item that is contained in a [VariableSizedWrapGrid](variablesizedwrapgrid.md).
     * @remarks
     * <!-- "Auto" is not supported in XAML markup for this property -->
     * If ItemWidth is NaN, then the VariableSizedWrapGrid uses the width of the first cell.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.itemwidth
     * @type {Float} 
     */
    ItemWidth {
        get => this.get_ItemWidth()
        set => this.put_ItemWidth(value)
    }

    /**
     * Gets or sets the direction in which child elements are arranged.
     * @remarks
     * The [Orientation](wrapgrid_orientation.md) property specifies whether the grid adds its items in rows or columns before wrapping.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the alignment rules by which child elements are arranged for the horizontal dimension.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.horizontalchildrenalignment
     * @type {Integer} 
     */
    HorizontalChildrenAlignment {
        get => this.get_HorizontalChildrenAlignment()
        set => this.put_HorizontalChildrenAlignment(value)
    }

    /**
     * Gets or sets the alignment rules by which child elements are arranged for the vertical dimension.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.verticalchildrenalignment
     * @type {Integer} 
     */
    VerticalChildrenAlignment {
        get => this.get_VerticalChildrenAlignment()
        set => this.put_VerticalChildrenAlignment(value)
    }

    /**
     * Gets or sets a value that influences the wrap point, also accounting for [Orientation](variablesizedwrapgrid_orientation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.variablesizedwrapgrid.maximumrowsorcolumns
     * @type {Integer} 
     */
    MaximumRowsOrColumns {
        get => this.get_MaximumRowsOrColumns()
        set => this.put_MaximumRowsOrColumns(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [VariableSizedWrapGrid](variablesizedwrapgrid.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.VariableSizedWrapGrid")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ItemHeight() {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.get_ItemHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ItemHeight(value) {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.put_ItemHeight(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ItemWidth() {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.get_ItemWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ItemWidth(value) {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.put_ItemWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.put_Orientation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalChildrenAlignment() {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.get_HorizontalChildrenAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalChildrenAlignment(value) {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.put_HorizontalChildrenAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalChildrenAlignment() {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.get_VerticalChildrenAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalChildrenAlignment(value) {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.put_VerticalChildrenAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumRowsOrColumns() {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.get_MaximumRowsOrColumns()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaximumRowsOrColumns(value) {
        if (!this.HasProp("__IVariableSizedWrapGrid")) {
            if ((queryResult := this.QueryInterface(IVariableSizedWrapGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariableSizedWrapGrid := IVariableSizedWrapGrid(outPtr)
        }

        return this.__IVariableSizedWrapGrid.put_MaximumRowsOrColumns(value)
    }

;@endregion Instance Methods
}
