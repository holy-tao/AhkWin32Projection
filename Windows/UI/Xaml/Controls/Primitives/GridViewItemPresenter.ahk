#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContentPresenter.ahk
#Include .\IGridViewItemPresenter.ahk
#Include .\IGridViewItemPresenterStatics.ahk
#Include .\IGridViewItemPresenterFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the visual elements of a [GridViewItem](../windows.ui.xaml.controls/gridviewitem.md). When developing for Windows 10, use [ListViewItemPresenter](listviewitempresenter.md) instead of GridViewItemPresenter in your item container style, both for [ListView](../windows.ui.xaml.controls/listview.md) and for [GridView](../windows.ui.xaml.controls/gridview.md). If you edit a copy of the default item container styles then you will get the correct type.
 * @remarks
 * The XAML usage shown is intended to be part of a XAML template or style for a [GridView](../windows.ui.xaml.controls/gridview.md) control (or derived type) and its items. For more info, see [GridView](../windows.ui.xaml.controls/gridview.md).
 * 
 * For a custom GridViewItemPresenter, use the name of your class as the string within the object element syntax for XAML. You'll probably have to map an **xmlns** definition with a prefix to refer to your class definition. For more info, see [XAML namespaces and namespace mapping](/windows/uwp/xaml-platform/xaml-namespaces-and-namespace-mapping).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class GridViewItemPresenter extends ContentPresenter {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridViewItemPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridViewItemPresenter.IID

    /**
     * Identifies the [SelectionCheckMarkVisualEnabled](gridviewitempresenter_selectioncheckmarkvisualenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectioncheckmarkvisualenabledproperty
     * @type {DependencyProperty} 
     */
    static SelectionCheckMarkVisualEnabledProperty {
        get => GridViewItemPresenter.get_SelectionCheckMarkVisualEnabledProperty()
    }

    /**
     * Identifies the [CheckHintBrush](gridviewitempresenter_checkhintbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.checkhintbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckHintBrushProperty {
        get => GridViewItemPresenter.get_CheckHintBrushProperty()
    }

    /**
     * Identifies the [CheckSelectingBrush](gridviewitempresenter_checkselectingbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.checkselectingbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckSelectingBrushProperty {
        get => GridViewItemPresenter.get_CheckSelectingBrushProperty()
    }

    /**
     * Identifies the [CheckBrush](gridviewitempresenter_checkbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.checkbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBrushProperty {
        get => GridViewItemPresenter.get_CheckBrushProperty()
    }

    /**
     * Identifies the [DragBackground](gridviewitempresenter_dragbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.dragbackgroundproperty
     * @type {DependencyProperty} 
     */
    static DragBackgroundProperty {
        get => GridViewItemPresenter.get_DragBackgroundProperty()
    }

    /**
     * Identifies the [DragForeground](gridviewitempresenter_dragforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.dragforegroundproperty
     * @type {DependencyProperty} 
     */
    static DragForegroundProperty {
        get => GridViewItemPresenter.get_DragForegroundProperty()
    }

    /**
     * Identifies the [FocusBorderBrush](gridviewitempresenter_focusborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.focusborderbrushproperty
     * @type {DependencyProperty} 
     */
    static FocusBorderBrushProperty {
        get => GridViewItemPresenter.get_FocusBorderBrushProperty()
    }

    /**
     * Identifies the [PlaceholderBackground](gridviewitempresenter_placeholderbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.placeholderbackgroundproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderBackgroundProperty {
        get => GridViewItemPresenter.get_PlaceholderBackgroundProperty()
    }

    /**
     * Identifies the [PointerOverBackground](gridviewitempresenter_pointeroverbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.pointeroverbackgroundproperty
     * @type {DependencyProperty} 
     */
    static PointerOverBackgroundProperty {
        get => GridViewItemPresenter.get_PointerOverBackgroundProperty()
    }

    /**
     * Identifies the [SelectedBackground](gridviewitempresenter_selectedbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedbackgroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedBackgroundProperty {
        get => GridViewItemPresenter.get_SelectedBackgroundProperty()
    }

    /**
     * Identifies the [SelectedForeground](gridviewitempresenter_selectedforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedforegroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedForegroundProperty {
        get => GridViewItemPresenter.get_SelectedForegroundProperty()
    }

    /**
     * Identifies the [SelectedPointerOverBackground](gridviewitempresenter_selectedpointeroverbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedpointeroverbackgroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedPointerOverBackgroundProperty {
        get => GridViewItemPresenter.get_SelectedPointerOverBackgroundProperty()
    }

    /**
     * Identifies the [SelectedPointerOverBorderBrush](gridviewitempresenter_selectedpointeroverborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedpointeroverborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedPointerOverBorderBrushProperty {
        get => GridViewItemPresenter.get_SelectedPointerOverBorderBrushProperty()
    }

    /**
     * Identifies the [SelectedBorderThickness](gridviewitempresenter_selectedborderthickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedborderthicknessproperty
     * @type {DependencyProperty} 
     */
    static SelectedBorderThicknessProperty {
        get => GridViewItemPresenter.get_SelectedBorderThicknessProperty()
    }

    /**
     * Identifies the [DisabledOpacity](gridviewitempresenter_disabledopacity.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.disabledopacityproperty
     * @type {DependencyProperty} 
     */
    static DisabledOpacityProperty {
        get => GridViewItemPresenter.get_DisabledOpacityProperty()
    }

    /**
     * Identifies the [DragOpacity](gridviewitempresenter_dragopacity.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.dragopacityproperty
     * @type {DependencyProperty} 
     */
    static DragOpacityProperty {
        get => GridViewItemPresenter.get_DragOpacityProperty()
    }

    /**
     * Identifies the [ReorderHintOffset](gridviewitempresenter_reorderhintoffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.reorderhintoffsetproperty
     * @type {DependencyProperty} 
     */
    static ReorderHintOffsetProperty {
        get => GridViewItemPresenter.get_ReorderHintOffsetProperty()
    }

    /**
     * > [!NOTE]
     * > GridViewItemPresenterHorizontalContentAlignmentProperty may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.HorizontalContentAlignmentProperty](../windows.ui.xaml.controls/contentpresenter_horizontalcontentalignmentproperty.md).
     * 
     * Identifies the [GridViewItemPresenterHorizontalContentAlignment](gridviewitempresenter_gridviewitempresenterhorizontalcontentalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.gridviewitempresenterhorizontalcontentalignmentproperty
     * @type {DependencyProperty} 
     */
    static GridViewItemPresenterHorizontalContentAlignmentProperty {
        get => GridViewItemPresenter.get_GridViewItemPresenterHorizontalContentAlignmentProperty()
    }

    /**
     * > [!NOTE]
     * > GridViewItemPresenterVerticalContentAlignmentProperty may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignmentProperty](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignmentproperty.md).
     * 
     * Identifies the [GridViewItemPresenterVerticalContentAlignment](gridviewitempresenter_gridviewitempresenterverticalcontentalignment.md) dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > GridViewItemPresenterVerticalContentAlignmentProperty may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignmentProperty](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignmentproperty.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.gridviewitempresenterverticalcontentalignmentproperty
     * @type {DependencyProperty} 
     */
    static GridViewItemPresenterVerticalContentAlignmentProperty {
        get => GridViewItemPresenter.get_GridViewItemPresenterVerticalContentAlignmentProperty()
    }

    /**
     * > [!NOTE]
     * > GridViewItemPresenterPaddingProperty may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.PaddingProperty](../windows.ui.xaml.controls/contentpresenter_paddingproperty.md).
     * 
     * Identifies the [GridViewItemPresenterPadding](gridviewitempresenter_gridviewitempresenterpadding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.gridviewitempresenterpaddingproperty
     * @type {DependencyProperty} 
     */
    static GridViewItemPresenterPaddingProperty {
        get => GridViewItemPresenter.get_GridViewItemPresenterPaddingProperty()
    }

    /**
     * Identifies the [PointerOverBackgroundMargin](gridviewitempresenter_pointeroverbackgroundmargin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.pointeroverbackgroundmarginproperty
     * @type {DependencyProperty} 
     */
    static PointerOverBackgroundMarginProperty {
        get => GridViewItemPresenter.get_PointerOverBackgroundMarginProperty()
    }

    /**
     * Identifies the [ContentMargin](gridviewitempresenter_contentmargin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.contentmarginproperty
     * @type {DependencyProperty} 
     */
    static ContentMarginProperty {
        get => GridViewItemPresenter.get_ContentMarginProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionCheckMarkVisualEnabledProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_SelectionCheckMarkVisualEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckHintBrushProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_CheckHintBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckSelectingBrushProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_CheckSelectingBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBrushProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_CheckBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DragBackgroundProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_DragBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DragForegroundProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_DragForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusBorderBrushProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_FocusBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderBackgroundProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_PlaceholderBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverBackgroundProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_PointerOverBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedBackgroundProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_SelectedBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedForegroundProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_SelectedForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedPointerOverBackgroundProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_SelectedPointerOverBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedPointerOverBorderBrushProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_SelectedPointerOverBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedBorderThicknessProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_SelectedBorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisabledOpacityProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_DisabledOpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DragOpacityProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_DragOpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ReorderHintOffsetProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_ReorderHintOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GridViewItemPresenterHorizontalContentAlignmentProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_GridViewItemPresenterHorizontalContentAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GridViewItemPresenterVerticalContentAlignmentProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_GridViewItemPresenterVerticalContentAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GridViewItemPresenterPaddingProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_GridViewItemPresenterPaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverBackgroundMarginProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_PointerOverBackgroundMarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentMarginProperty() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterStatics.IID)
            GridViewItemPresenter.__IGridViewItemPresenterStatics := IGridViewItemPresenterStatics(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterStatics.get_ContentMarginProperty()
    }

    /**
     * 
     * @returns {GridViewItemPresenter} 
     */
    static CreateInstance() {
        if (!GridViewItemPresenter.HasProp("__IGridViewItemPresenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.GridViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemPresenterFactory.IID)
            GridViewItemPresenter.__IGridViewItemPresenterFactory := IGridViewItemPresenterFactory(factoryPtr)
        }

        return GridViewItemPresenter.__IGridViewItemPresenterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the check mark is shown when the item is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectioncheckmarkvisualenabled
     * @type {Boolean} 
     */
    SelectionCheckMarkVisualEnabled {
        get => this.get_SelectionCheckMarkVisualEnabled()
        set => this.put_SelectionCheckMarkVisualEnabled(value)
    }

    /**
     * Gets or sets the brush used to render the check mark hint.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.checkhintbrush
     * @type {Brush} 
     */
    CheckHintBrush {
        get => this.get_CheckHintBrush()
        set => this.put_CheckHintBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check mark on an item while it's being selected using a swipe interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.checkselectingbrush
     * @type {Brush} 
     */
    CheckSelectingBrush {
        get => this.get_CheckSelectingBrush()
        set => this.put_CheckSelectingBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check mark on a selected item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.checkbrush
     * @type {Brush} 
     */
    CheckBrush {
        get => this.get_CheckBrush()
        set => this.put_CheckBrush(value)
    }

    /**
     * Gets or sets the brush used to render the background of an item that's being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.dragbackground
     * @type {Brush} 
     */
    DragBackground {
        get => this.get_DragBackground()
        set => this.put_DragBackground(value)
    }

    /**
     * Gets or sets the brush used to render the foreground of an item that's being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.dragforeground
     * @type {Brush} 
     */
    DragForeground {
        get => this.get_DragForeground()
        set => this.put_DragForeground(value)
    }

    /**
     * Gets or sets the brush used to render the border of an item that has focus.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.focusborderbrush
     * @type {Brush} 
     */
    FocusBorderBrush {
        get => this.get_FocusBorderBrush()
        set => this.put_FocusBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the placeholder background for an item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.placeholderbackground
     * @type {Brush} 
     */
    PlaceholderBackground {
        get => this.get_PlaceholderBackground()
        set => this.put_PlaceholderBackground(value)
    }

    /**
     * Gets or sets the brush used to render the background of an item that has the pointer over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.pointeroverbackground
     * @type {Brush} 
     */
    PointerOverBackground {
        get => this.get_PointerOverBackground()
        set => this.put_PointerOverBackground(value)
    }

    /**
     * Gets or sets the brush used to render the background of an item that's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedbackground
     * @type {Brush} 
     */
    SelectedBackground {
        get => this.get_SelectedBackground()
        set => this.put_SelectedBackground(value)
    }

    /**
     * Gets or sets the brush used to render the foreground of an item that's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedforeground
     * @type {Brush} 
     */
    SelectedForeground {
        get => this.get_SelectedForeground()
        set => this.put_SelectedForeground(value)
    }

    /**
     * Gets or sets the brush used to render the background of an item that's selected and has the pointer over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedpointeroverbackground
     * @type {Brush} 
     */
    SelectedPointerOverBackground {
        get => this.get_SelectedPointerOverBackground()
        set => this.put_SelectedPointerOverBackground(value)
    }

    /**
     * Gets or sets the brush used to render the border of an item that's selected and has the pointer over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedpointeroverborderbrush
     * @type {Brush} 
     */
    SelectedPointerOverBorderBrush {
        get => this.get_SelectedPointerOverBorderBrush()
        set => this.put_SelectedPointerOverBorderBrush(value)
    }

    /**
     * Gets or sets the thickness of the border around an item that's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.selectedborderthickness
     * @type {Thickness} 
     */
    SelectedBorderThickness {
        get => this.get_SelectedBorderThickness()
        set => this.put_SelectedBorderThickness(value)
    }

    /**
     * Gets or sets the opacity of an item that is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.disabledopacity
     * @type {Float} 
     */
    DisabledOpacity {
        get => this.get_DisabledOpacity()
        set => this.put_DisabledOpacity(value)
    }

    /**
     * Gets or sets the opacity of an item that's being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.dragopacity
     * @type {Float} 
     */
    DragOpacity {
        get => this.get_DragOpacity()
        set => this.put_DragOpacity(value)
    }

    /**
     * Gets or sets the amount that the reorder hint is offset.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.reorderhintoffset
     * @type {Float} 
     */
    ReorderHintOffset {
        get => this.get_ReorderHintOffset()
        set => this.put_ReorderHintOffset(value)
    }

    /**
     * > [!NOTE]
     * > GridViewItemPresenterHorizontalContentAlignment may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.HorizontalContentAlignment](../windows.ui.xaml.controls/contentpresenter_horizontalcontentalignment.md).
     * 
     * Gets or sets the horizontal alignment of the content being presented.
     * @remarks
     * > [!IMPORTANT]
     * > GridViewItemPresenterHorizontalContentAlignment may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.HorizontalContentAlignment](../windows.ui.xaml.controls/contentpresenter_horizontalcontentalignment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.gridviewitempresenterhorizontalcontentalignment
     * @type {Integer} 
     */
    GridViewItemPresenterHorizontalContentAlignment {
        get => this.get_GridViewItemPresenterHorizontalContentAlignment()
        set => this.put_GridViewItemPresenterHorizontalContentAlignment(value)
    }

    /**
     * > [!NOTE]
     * > GridViewItemPresenterVerticalContentAlignment may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignment](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignment.md).
     * 
     * Gets or sets the vertical alignment of the content being presented.
     * @remarks
     * > [!IMPORTANT]
     * > GridViewItemPresenterVerticalContentAlignment may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignment](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.gridviewitempresenterverticalcontentalignment
     * @type {Integer} 
     */
    GridViewItemPresenterVerticalContentAlignment {
        get => this.get_GridViewItemPresenterVerticalContentAlignment()
        set => this.put_GridViewItemPresenterVerticalContentAlignment(value)
    }

    /**
     * > [!NOTE]
     * > GridViewItemPresenterPadding may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.Padding](../windows.ui.xaml.controls/contentpresenter_padding.md).
     * 
     * Gets or sets the padding between the presenter and the [GridView](../windows.ui.xaml.controls/gridview.md).
     * @remarks
     * > [!IMPORTANT]
     * > GridViewItemPresenterPadding may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.Padding](../windows.ui.xaml.controls/contentpresenter_padding.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.gridviewitempresenterpadding
     * @type {Thickness} 
     */
    GridViewItemPresenterPadding {
        get => this.get_GridViewItemPresenterPadding()
        set => this.put_GridViewItemPresenterPadding(value)
    }

    /**
     * Gets or sets the margin of the background displayed for pointer-over input actions in the [GridView](../windows.ui.xaml.controls/gridview.md) item cell, versus the cell.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.pointeroverbackgroundmargin
     * @type {Thickness} 
     */
    PointerOverBackgroundMargin {
        get => this.get_PointerOverBackgroundMargin()
        set => this.put_PointerOverBackgroundMargin(value)
    }

    /**
     * Gets or sets an internal margin between presented content and its presenter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitempresenter.contentmargin
     * @type {Thickness} 
     */
    ContentMargin {
        get => this.get_ContentMargin()
        set => this.put_ContentMargin(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SelectionCheckMarkVisualEnabled() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_SelectionCheckMarkVisualEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SelectionCheckMarkVisualEnabled(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_SelectionCheckMarkVisualEnabled(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckHintBrush() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_CheckHintBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckHintBrush(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_CheckHintBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckSelectingBrush() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_CheckSelectingBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckSelectingBrush(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_CheckSelectingBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBrush() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_CheckBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBrush(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_CheckBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_DragBackground() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_DragBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_DragBackground(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_DragBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_DragForeground() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_DragForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_DragForeground(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_DragForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusBorderBrush() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_FocusBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusBorderBrush(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_FocusBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PlaceholderBackground() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_PlaceholderBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderBackground(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_PlaceholderBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PointerOverBackground() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_PointerOverBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PointerOverBackground(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_PointerOverBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedBackground() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_SelectedBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedBackground(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_SelectedBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedForeground() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_SelectedForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedForeground(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_SelectedForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPointerOverBackground() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_SelectedPointerOverBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPointerOverBackground(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_SelectedPointerOverBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPointerOverBorderBrush() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_SelectedPointerOverBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPointerOverBorderBrush(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_SelectedPointerOverBorderBrush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_SelectedBorderThickness() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_SelectedBorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_SelectedBorderThickness(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_SelectedBorderThickness(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DisabledOpacity() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_DisabledOpacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DisabledOpacity(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_DisabledOpacity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DragOpacity() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_DragOpacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DragOpacity(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_DragOpacity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReorderHintOffset() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_ReorderHintOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ReorderHintOffset(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_ReorderHintOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GridViewItemPresenterHorizontalContentAlignment() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_GridViewItemPresenterHorizontalContentAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GridViewItemPresenterHorizontalContentAlignment(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_GridViewItemPresenterHorizontalContentAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GridViewItemPresenterVerticalContentAlignment() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_GridViewItemPresenterVerticalContentAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GridViewItemPresenterVerticalContentAlignment(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_GridViewItemPresenterVerticalContentAlignment(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_GridViewItemPresenterPadding() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_GridViewItemPresenterPadding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_GridViewItemPresenterPadding(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_GridViewItemPresenterPadding(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_PointerOverBackgroundMargin() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_PointerOverBackgroundMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_PointerOverBackgroundMargin(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_PointerOverBackgroundMargin(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_ContentMargin() {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.get_ContentMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_ContentMargin(value) {
        if (!this.HasProp("__IGridViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IGridViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemPresenter := IGridViewItemPresenter(outPtr)
        }

        return this.__IGridViewItemPresenter.put_ContentMargin(value)
    }

;@endregion Instance Methods
}
