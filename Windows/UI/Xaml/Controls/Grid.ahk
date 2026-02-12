#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Panel.ahk
#Include .\IGrid.ahk
#Include .\IGrid2.ahk
#Include .\IGrid3.ahk
#Include .\IGrid4.ahk
#Include .\IGridStatics2.ahk
#Include .\IGridStatics4.ahk
#Include .\IGridStatics.ahk
#Include .\IGridFactory.ahk
#Include .\IGridStatics3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines a flexible grid area that consists of columns and rows. Child elements of the Grid are measured and arranged according to their row/column assignments (set by using [Grid.Row](/uwp/api/windows.ui.xaml.controls.grid.row) and [Grid.Column](/uwp/api/windows.ui.xaml.controls.grid.column) attached properties) and other logic.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Layout panels](/windows/uwp/design/layout/layout-panels#grid).
 * 
 * Grid is a layout panel that supports arranging child elements in rows and columns.
 * 
 * <img alt="Grid layout panel" src="images/controls/Grid.png" />
 * 
 * You typically define layout behavior for a Grid in XAML by providing one or more [RowDefinition](rowdefinition.md) elements as the value of [Grid.RowDefinitions](grid_rowdefinitions.md), and one or more [ColumnDefinition](columndefinition.md) elements as the value of [Grid.ColumnDefinitions](grid_columndefinitions.md). Then, you apply the [Grid.Row](/uwp/api/windows.ui.xaml.controls.grid.row) and [Grid.Column](/uwp/api/windows.ui.xaml.controls.grid.column) attached properties to each of the element children of the Grid, to indicate which row/column combination is used to position that element within the parent Grid.
 * 
 * To set the height of rows and the width of columns, you set [RowDefinition.Height](rowdefinition_height.md) for each [RowDefinition](rowdefinition.md) and [ColumnDefinition.Width](columndefinition_width.md) for each [ColumnDefinition](columndefinition.md). By default, each row or column divides layout space equally. You can change this behavior either by providing absolute pixel values, or a **Star** sizing that divides available space using a weighted factor. For more info on how to use **Star** sizing in a Grid, see [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml) or [GridLength](../windows.ui.xaml/gridlength.md). You also can use an **Auto** sizing that sizes to content.
 * 
 * To indicate that an element child should span multiple rows or multiple columns in the Grid, you can apply the [Grid.RowSpan](/uwp/api/windows.ui.xaml.controls.grid.rowspan) or [Grid.ColumnSpan](/uwp/api/windows.ui.xaml.controls.grid.columnspan) attached properties to child elements of a Grid.
 * 
 * By default, a Grid contains one row and one column.
 * 
 * Setting the [Margin](../windows.ui.xaml/frameworkelement_margin.md) property on the child elements in a Grid sets the distance between the element and its grid cell boundaries. The [HorizontalAlignment](../windows.ui.xaml/frameworkelement_horizontalalignment.md) and [VerticalAlignment](../windows.ui.xaml/frameworkelement_verticalalignment.md) properties describe how the child element should be positioned within the grid cell. You can precisely position child elements of a Grid by using a combination of the [Margin](../windows.ui.xaml/frameworkelement_margin.md) property and alignment properties. If you need even more control over the layout of individual child elements, consider using [VariableSizedWrapGrid](variablesizedwrapgrid.md).
 * 
 * [WrapGrid](wrapgrid.md) is another similar layout panel that has the benefit of better handling for content that's too wide, which might be clipped by a regular Grid depending on values of other layout properties.
 * 
 * An element in the first column that spans multiple rows can affect the height of each spanned row even if the first row has enough height to accommodate the element, and subsequent spanned rows would otherwise have a height of 0. For example, the second row in this Grid has its height set to 0, so the blue rectangle would not typically be visible. In this case, you might expect that the red ellipse would not affect the second row because the first row is tall enough to contain the ellipse. However, the Grid calculates the MinHeight of each row to be enough to accommodate the red ellipse, and then spans the element across the rows. As a result, the second row is given a MinHeight of 50, the red ellipse is centered in the 150px span, and half of the blue rectangle is visible in the second row.
 * 
 * > [!NOTE]
 * > (This example uses an element that spans columns, but also applies to an element in the first column that spans multiple rows.)
 * 
 * ```xaml
 * <Grid Background="Yellow" Width="300">
 *     <Grid.ColumnDefinitions>
 *         <ColumnDefinition Width="50"/>
 *         <ColumnDefinition Width="*"/>
 *     </Grid.ColumnDefinitions>
 *     <Grid.RowDefinitions>
 *         <RowDefinition Height="Auto"/>
 *         <RowDefinition Height="0"/>
 *     </Grid.RowDefinitions>
 *     <Ellipse   Grid.Row="0" Grid.Column="0"  Height="50" Fill="Red" Grid.RowSpan="2"/>
 *     <Rectangle Grid.Row="0" Grid.Column="1" Fill="Green" Height="100"/>
 *     <Rectangle Grid.Row="1" Grid.Column="1" Fill="Blue" Height="100"/>
 * </Grid>
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Grid extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGrid

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGrid.IID

    /**
     * Identifies the [BorderBrush](grid_borderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.borderbrushproperty
     * @type {DependencyProperty} 
     */
    static BorderBrushProperty {
        get => Grid.get_BorderBrushProperty()
    }

    /**
     * Identifies the [BorderThickness](grid_borderthickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.borderthicknessproperty
     * @type {DependencyProperty} 
     */
    static BorderThicknessProperty {
        get => Grid.get_BorderThicknessProperty()
    }

    /**
     * Identifies the [CornerRadius](grid_cornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.cornerradiusproperty
     * @type {DependencyProperty} 
     */
    static CornerRadiusProperty {
        get => Grid.get_CornerRadiusProperty()
    }

    /**
     * Identifies the [Padding](grid_padding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => Grid.get_PaddingProperty()
    }

    /**
     * Identifies the BackgroundSizing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.backgroundsizingproperty
     * @type {DependencyProperty} 
     */
    static BackgroundSizingProperty {
        get => Grid.get_BackgroundSizingProperty()
    }

    /**
     * Identifies the [Grid.Row](grid_row.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.Row](grid_row.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.rowproperty
     * @type {DependencyProperty} 
     */
    static RowProperty {
        get => Grid.get_RowProperty()
    }

    /**
     * Identifies the [Grid.Column](grid_column.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.Column](grid_column.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.columnproperty
     * @type {DependencyProperty} 
     */
    static ColumnProperty {
        get => Grid.get_ColumnProperty()
    }

    /**
     * Identifies the [Grid.RowSpan](grid_rowspan.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.RowSpan](grid_rowspan.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.rowspanproperty
     * @type {DependencyProperty} 
     */
    static RowSpanProperty {
        get => Grid.get_RowSpanProperty()
    }

    /**
     * Identifies the [Grid.ColumnSpan](grid_columnspan.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.ColumnSpan](grid_columnspan.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.columnspanproperty
     * @type {DependencyProperty} 
     */
    static ColumnSpanProperty {
        get => Grid.get_ColumnSpanProperty()
    }

    /**
     * Identifies the RowSpacing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.rowspacingproperty
     * @type {DependencyProperty} 
     */
    static RowSpacingProperty {
        get => Grid.get_RowSpacingProperty()
    }

    /**
     * Identifies the ColumnSpacing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.columnspacingproperty
     * @type {DependencyProperty} 
     */
    static ColumnSpacingProperty {
        get => Grid.get_ColumnSpacingProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderBrushProperty() {
        if (!Grid.HasProp("__IGridStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics2.IID)
            Grid.__IGridStatics2 := IGridStatics2(factoryPtr)
        }

        return Grid.__IGridStatics2.get_BorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderThicknessProperty() {
        if (!Grid.HasProp("__IGridStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics2.IID)
            Grid.__IGridStatics2 := IGridStatics2(factoryPtr)
        }

        return Grid.__IGridStatics2.get_BorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CornerRadiusProperty() {
        if (!Grid.HasProp("__IGridStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics2.IID)
            Grid.__IGridStatics2 := IGridStatics2(factoryPtr)
        }

        return Grid.__IGridStatics2.get_CornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!Grid.HasProp("__IGridStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics2.IID)
            Grid.__IGridStatics2 := IGridStatics2(factoryPtr)
        }

        return Grid.__IGridStatics2.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundSizingProperty() {
        if (!Grid.HasProp("__IGridStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics4.IID)
            Grid.__IGridStatics4 := IGridStatics4(factoryPtr)
        }

        return Grid.__IGridStatics4.get_BackgroundSizingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RowProperty() {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.get_RowProperty()
    }

    /**
     * Gets the value of the [Grid.Row](grid_row.md) XAML attached property from the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.Row](grid_row.md) XAML attached property in XAML and won't need this method. For more info, see the [Grid.Row](grid_row.md) attached property.
     * @param {FrameworkElement} element The element from which to read the property value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.getrow
     */
    static GetRow(element) {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.GetRow(element)
    }

    /**
     * Sets the value of the [Grid.Row](grid_row.md) XAML attached property on the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.Row](grid_row.md) XAML attached property in XAML and won't need this method. For more info, see the [Grid.Row](grid_row.md) attached property.
     * @param {FrameworkElement} element The target element on which to set the [Grid.Row](grid_row.md) XAML attached property.
     * @param {Integer} value The property value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.setrow
     */
    static SetRow(element, value) {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.SetRow(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColumnProperty() {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.get_ColumnProperty()
    }

    /**
     * Gets the value of the [Grid.Column](grid_column.md) XAML attached property from the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.Column](grid_column.md) XAML attached property in XAML and won't need this method. For more info, see the [Grid.Column](grid_column.md) XAML attached property.
     * @param {FrameworkElement} element The element from which to read the property value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.getcolumn
     */
    static GetColumn(element) {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.GetColumn(element)
    }

    /**
     * Sets the value of the [Grid.Column](grid_column.md) XAML attached property on the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.Column](grid_column.md) XAML attached property in XAML and won't need this method. For more info, see the [Grid.Column](grid_column.md) XAML attached property.
     * @param {FrameworkElement} element The target element on which to set the [Grid.Column](grid_column.md) XAML attached property.
     * @param {Integer} value The property value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.setcolumn
     */
    static SetColumn(element, value) {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.SetColumn(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RowSpanProperty() {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.get_RowSpanProperty()
    }

    /**
     * Gets the value of the [Grid.RowSpan](grid_rowspan.md) XAML attached property from the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.RowSpan](grid_rowspan.md) XAML attached property in XAML and won't need this method. For more info, see the [Grid.RowSpan](grid_rowspan.md) attached property.
     * @param {FrameworkElement} element The element from which to read the property value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.getrowspan
     */
    static GetRowSpan(element) {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.GetRowSpan(element)
    }

    /**
     * Sets the value of the [Grid.RowSpan](grid_rowspan.md) XAML attached property on the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.RowSpan](grid_rowspan.md) XAML attached property in XAML and won't need this method. For more info, see the [Grid.RowSpan](grid_rowspan.md) attached property.
     * @param {FrameworkElement} element The target element on which to set the [Grid.RowSpan](grid_rowspan.md) XAML attached property.
     * @param {Integer} value The property value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.setrowspan
     */
    static SetRowSpan(element, value) {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.SetRowSpan(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColumnSpanProperty() {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.get_ColumnSpanProperty()
    }

    /**
     * Gets the value of the [Grid.ColumnSpan](grid_columnspan.md) XAML attached property from the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.ColumnSpan](grid_columnspan.md) XAML attached property in XAML and won't need this method. For more info, see the [Grid.ColumnSpan](grid_columnspan.md) attached property.
     * @param {FrameworkElement} element The element from which to read the property value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.getcolumnspan
     */
    static GetColumnSpan(element) {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.GetColumnSpan(element)
    }

    /**
     * Sets the value of the [Grid.ColumnSpan](grid_columnspan.md) XAML attached property on the specified [FrameworkElement](../windows.ui.xaml/frameworkelement.md).
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Grid.ColumnSpan](grid_columnspan.md) XAML attached property in XAML and won't need this method. For more info, see the [Grid.ColumnSpan](grid_columnspan.md) attached property.
     * @param {FrameworkElement} element The element on which to set the [Grid.ColumnSpan](grid_columnspan.md) XAML attached property.
     * @param {Integer} value The property value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.setcolumnspan
     */
    static SetColumnSpan(element, value) {
        if (!Grid.HasProp("__IGridStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics.IID)
            Grid.__IGridStatics := IGridStatics(factoryPtr)
        }

        return Grid.__IGridStatics.SetColumnSpan(element, value)
    }

    /**
     * 
     * @returns {Grid} 
     */
    static CreateInstance() {
        if (!Grid.HasProp("__IGridFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridFactory.IID)
            Grid.__IGridFactory := IGridFactory(factoryPtr)
        }

        return Grid.__IGridFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RowSpacingProperty() {
        if (!Grid.HasProp("__IGridStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics3.IID)
            Grid.__IGridStatics3 := IGridStatics3(factoryPtr)
        }

        return Grid.__IGridStatics3.get_RowSpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColumnSpacingProperty() {
        if (!Grid.HasProp("__IGridStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Grid")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridStatics3.IID)
            Grid.__IGridStatics3 := IGridStatics3(factoryPtr)
        }

        return Grid.__IGridStatics3.get_ColumnSpacingProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a list of [RowDefinition](rowdefinition.md) objects defined on this instance of [Grid](grid.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.rowdefinitions
     * @type {RowDefinitionCollection} 
     */
    RowDefinitions {
        get => this.get_RowDefinitions()
    }

    /**
     * Gets a list of [ColumnDefinition](columndefinition.md) objects defined on this instance of [Grid](grid.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.columndefinitions
     * @type {ColumnDefinitionCollection} 
     */
    ColumnDefinitions {
        get => this.get_ColumnDefinitions()
    }

    /**
     * Gets or sets a brush that describes the border fill of the panel.
     * @remarks
     * The [BorderThickness](grid_borderthickness.md) value must be greater than 0 in order to see the BorderBrush value take effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.borderbrush
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
        set => this.put_BorderBrush(value)
    }

    /**
     * Gets or sets the border thickness of the panel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.borderthickness
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
        set => this.put_BorderThickness(value)
    }

    /**
     * Gets or sets the radius for the corners of the panel's border.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.cornerradius
     * @type {CornerRadius} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * Gets or sets the distance between the border and its child object.
     * @remarks
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets the uniform distance (in pixels) between grid rows.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.rowspacing
     * @type {Float} 
     */
    RowSpacing {
        get => this.get_RowSpacing()
        set => this.put_RowSpacing(value)
    }

    /**
     * Gets or sets the uniform distance (in pixels) between grid columns.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.columnspacing
     * @type {Float} 
     */
    ColumnSpacing {
        get => this.get_ColumnSpacing()
        set => this.put_ColumnSpacing(value)
    }

    /**
     * Gets or sets a value that indicates how far the background extends in relation to this element's border.
     * @remarks
     * You can set this property to **OuterBorderEdge** to make the element's background extend under the border. If the border is transparent, the background will show through it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.grid.backgroundsizing
     * @type {Integer} 
     */
    BackgroundSizing {
        get => this.get_BackgroundSizing()
        set => this.put_BackgroundSizing(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RowDefinitionCollection} 
     */
    get_RowDefinitions() {
        if (!this.HasProp("__IGrid")) {
            if ((queryResult := this.QueryInterface(IGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid := IGrid(outPtr)
        }

        return this.__IGrid.get_RowDefinitions()
    }

    /**
     * 
     * @returns {ColumnDefinitionCollection} 
     */
    get_ColumnDefinitions() {
        if (!this.HasProp("__IGrid")) {
            if ((queryResult := this.QueryInterface(IGrid.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid := IGrid(outPtr)
        }

        return this.__IGrid.get_ColumnDefinitions()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
        if (!this.HasProp("__IGrid2")) {
            if ((queryResult := this.QueryInterface(IGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid2 := IGrid2(outPtr)
        }

        return this.__IGrid2.get_BorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BorderBrush(value) {
        if (!this.HasProp("__IGrid2")) {
            if ((queryResult := this.QueryInterface(IGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid2 := IGrid2(outPtr)
        }

        return this.__IGrid2.put_BorderBrush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        if (!this.HasProp("__IGrid2")) {
            if ((queryResult := this.QueryInterface(IGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid2 := IGrid2(outPtr)
        }

        return this.__IGrid2.get_BorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_BorderThickness(value) {
        if (!this.HasProp("__IGrid2")) {
            if ((queryResult := this.QueryInterface(IGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid2 := IGrid2(outPtr)
        }

        return this.__IGrid2.put_BorderThickness(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CornerRadius() {
        if (!this.HasProp("__IGrid2")) {
            if ((queryResult := this.QueryInterface(IGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid2 := IGrid2(outPtr)
        }

        return this.__IGrid2.get_CornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CornerRadius(value) {
        if (!this.HasProp("__IGrid2")) {
            if ((queryResult := this.QueryInterface(IGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid2 := IGrid2(outPtr)
        }

        return this.__IGrid2.put_CornerRadius(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IGrid2")) {
            if ((queryResult := this.QueryInterface(IGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid2 := IGrid2(outPtr)
        }

        return this.__IGrid2.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IGrid2")) {
            if ((queryResult := this.QueryInterface(IGrid2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid2 := IGrid2(outPtr)
        }

        return this.__IGrid2.put_Padding(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RowSpacing() {
        if (!this.HasProp("__IGrid3")) {
            if ((queryResult := this.QueryInterface(IGrid3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid3 := IGrid3(outPtr)
        }

        return this.__IGrid3.get_RowSpacing()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RowSpacing(value) {
        if (!this.HasProp("__IGrid3")) {
            if ((queryResult := this.QueryInterface(IGrid3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid3 := IGrid3(outPtr)
        }

        return this.__IGrid3.put_RowSpacing(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ColumnSpacing() {
        if (!this.HasProp("__IGrid3")) {
            if ((queryResult := this.QueryInterface(IGrid3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid3 := IGrid3(outPtr)
        }

        return this.__IGrid3.get_ColumnSpacing()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ColumnSpacing(value) {
        if (!this.HasProp("__IGrid3")) {
            if ((queryResult := this.QueryInterface(IGrid3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid3 := IGrid3(outPtr)
        }

        return this.__IGrid3.put_ColumnSpacing(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSizing() {
        if (!this.HasProp("__IGrid4")) {
            if ((queryResult := this.QueryInterface(IGrid4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid4 := IGrid4(outPtr)
        }

        return this.__IGrid4.get_BackgroundSizing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackgroundSizing(value) {
        if (!this.HasProp("__IGrid4")) {
            if ((queryResult := this.QueryInterface(IGrid4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGrid4 := IGrid4(outPtr)
        }

        return this.__IGrid4.put_BackgroundSizing(value)
    }

;@endregion Instance Methods
}
