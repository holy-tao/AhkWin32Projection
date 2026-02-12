#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContentPresenter.ahk
#Include .\IListViewItemPresenter.ahk
#Include .\IListViewItemPresenter2.ahk
#Include .\IListViewItemPresenter3.ahk
#Include .\IListViewItemPresenter4.ahk
#Include .\IListViewItemPresenterStatics.ahk
#Include .\IListViewItemPresenterFactory.ahk
#Include .\IListViewItemPresenterStatics2.ahk
#Include .\IListViewItemPresenterStatics3.ahk
#Include .\IListViewItemPresenterStatics4.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the visual elements of a [ListViewItem](../windows.ui.xaml.controls/listviewitem.md). When developing for Windows 10, use ListViewItemPresenter instead of [GridViewItemPresenter](gridviewitempresenter.md) in your item container style, both for [ListView](../windows.ui.xaml.controls/listview.md) and for [GridView](../windows.ui.xaml.controls/gridview.md). If you edit a copy of the default item container styles then you will get the correct type.
 * @remarks
 * The XAML usage shown is intended to be part of a XAML template or style for a [ListView](../windows.ui.xaml.controls/listview.md) control (or derived type) and its items. For more info, see [ListView](../windows.ui.xaml.controls/listview.md).
 * 
 * For a custom ListViewItemPresenter, use the name of your class as the string within the object element syntax for XAML. You'll probably have to map an **xmlns** definition with a prefix to refer to your class definition. For more info, see [XAML namespaces and namespace mapping](/windows/uwp/xaml-platform/xaml-namespaces-and-namespace-mapping).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ListViewItemPresenter extends ContentPresenter {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewItemPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewItemPresenter.IID

    /**
     * Identifies the [SelectionCheckMarkVisualEnabled](listviewitempresenter_selectioncheckmarkvisualenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectioncheckmarkvisualenabledproperty
     * @type {DependencyProperty} 
     */
    static SelectionCheckMarkVisualEnabledProperty {
        get => ListViewItemPresenter.get_SelectionCheckMarkVisualEnabledProperty()
    }

    /**
     * Identifies the [CheckHintBrush](listviewitempresenter_checkhintbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkhintbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckHintBrushProperty {
        get => ListViewItemPresenter.get_CheckHintBrushProperty()
    }

    /**
     * Identifies the [CheckSelectingBrush](listviewitempresenter_checkselectingbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkselectingbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckSelectingBrushProperty {
        get => ListViewItemPresenter.get_CheckSelectingBrushProperty()
    }

    /**
     * Identifies the [CheckBrush](listviewitempresenter_checkbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBrushProperty {
        get => ListViewItemPresenter.get_CheckBrushProperty()
    }

    /**
     * Identifies the [DragBackground](listviewitempresenter_dragbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.dragbackgroundproperty
     * @type {DependencyProperty} 
     */
    static DragBackgroundProperty {
        get => ListViewItemPresenter.get_DragBackgroundProperty()
    }

    /**
     * Identifies the [DragForeground](listviewitempresenter_dragforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.dragforegroundproperty
     * @type {DependencyProperty} 
     */
    static DragForegroundProperty {
        get => ListViewItemPresenter.get_DragForegroundProperty()
    }

    /**
     * Identifies the [FocusBorderBrush](listviewitempresenter_focusborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.focusborderbrushproperty
     * @type {DependencyProperty} 
     */
    static FocusBorderBrushProperty {
        get => ListViewItemPresenter.get_FocusBorderBrushProperty()
    }

    /**
     * Identifies the [PlaceholderBackground](listviewitempresenter_placeholderbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.placeholderbackgroundproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderBackgroundProperty {
        get => ListViewItemPresenter.get_PlaceholderBackgroundProperty()
    }

    /**
     * Identifies the [PointerOverBackground](listviewitempresenter_pointeroverbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pointeroverbackgroundproperty
     * @type {DependencyProperty} 
     */
    static PointerOverBackgroundProperty {
        get => ListViewItemPresenter.get_PointerOverBackgroundProperty()
    }

    /**
     * Identifies the [SelectedBackground](listviewitempresenter_selectedbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedbackgroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedBackgroundProperty {
        get => ListViewItemPresenter.get_SelectedBackgroundProperty()
    }

    /**
     * Identifies the [SelectedForeground](listviewitempresenter_selectedforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedforegroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedForegroundProperty {
        get => ListViewItemPresenter.get_SelectedForegroundProperty()
    }

    /**
     * Identifies the [SelectedPointerOverBackground](listviewitempresenter_selectedpointeroverbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedpointeroverbackgroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedPointerOverBackgroundProperty {
        get => ListViewItemPresenter.get_SelectedPointerOverBackgroundProperty()
    }

    /**
     * Identifies the [SelectedPointerOverBorderBrush](listviewitempresenter_selectedpointeroverborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedpointeroverborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedPointerOverBorderBrushProperty {
        get => ListViewItemPresenter.get_SelectedPointerOverBorderBrushProperty()
    }

    /**
     * Identifies the [SelectedBorderThickness](listviewitempresenter_selectedborderthickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedborderthicknessproperty
     * @type {DependencyProperty} 
     */
    static SelectedBorderThicknessProperty {
        get => ListViewItemPresenter.get_SelectedBorderThicknessProperty()
    }

    /**
     * Identifies the [DisabledOpacity](listviewitempresenter_disabledopacity.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.disabledopacityproperty
     * @type {DependencyProperty} 
     */
    static DisabledOpacityProperty {
        get => ListViewItemPresenter.get_DisabledOpacityProperty()
    }

    /**
     * Identifies the [DragOpacity](listviewitempresenter_dragopacity.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.dragopacityproperty
     * @type {DependencyProperty} 
     */
    static DragOpacityProperty {
        get => ListViewItemPresenter.get_DragOpacityProperty()
    }

    /**
     * Identifies the [ReorderHintOffset](listviewitempresenter_reorderhintoffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.reorderhintoffsetproperty
     * @type {DependencyProperty} 
     */
    static ReorderHintOffsetProperty {
        get => ListViewItemPresenter.get_ReorderHintOffsetProperty()
    }

    /**
     * > [!NOTE]
     * > [ListViewItemPresenterVerticalContentAlignmentProperty](listviewitempresenter_listviewitempresenterverticalcontentalignmentproperty.md) may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignmentProperty](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignmentproperty.md).
     * 
     * Identifies the [ListViewItemPresenterHorizontalContentAlignment](listviewitempresenter_listviewitempresenterhorizontalcontentalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.listviewitempresenterhorizontalcontentalignmentproperty
     * @type {DependencyProperty} 
     */
    static ListViewItemPresenterHorizontalContentAlignmentProperty {
        get => ListViewItemPresenter.get_ListViewItemPresenterHorizontalContentAlignmentProperty()
    }

    /**
     * > [!NOTE]
     * > ListViewItemPresenterVerticalContentAlignmentProperty may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignmentProperty](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignmentproperty.md).
     * 
     * Identifies the [ListViewItemPresenterVerticalContentAlignment](listviewitempresenter_listviewitempresenterverticalcontentalignment.md) dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > ListViewItemPresenterVerticalContentAlignmentProperty may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignmentProperty](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignmentproperty.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.listviewitempresenterverticalcontentalignmentproperty
     * @type {DependencyProperty} 
     */
    static ListViewItemPresenterVerticalContentAlignmentProperty {
        get => ListViewItemPresenter.get_ListViewItemPresenterVerticalContentAlignmentProperty()
    }

    /**
     * > [!NOTE]
     * > ListViewItemPresenterPaddingProperty may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.PaddingProperty](../windows.ui.xaml.controls/contentpresenter_paddingproperty.md).
     * 
     * Identifies the [ListViewItemPresenterPadding](listviewitempresenter_listviewitempresenterpadding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.listviewitempresenterpaddingproperty
     * @type {DependencyProperty} 
     */
    static ListViewItemPresenterPaddingProperty {
        get => ListViewItemPresenter.get_ListViewItemPresenterPaddingProperty()
    }

    /**
     * Identifies the [PointerOverBackgroundMargin](listviewitempresenter_pointeroverbackgroundmargin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pointeroverbackgroundmarginproperty
     * @type {DependencyProperty} 
     */
    static PointerOverBackgroundMarginProperty {
        get => ListViewItemPresenter.get_PointerOverBackgroundMarginProperty()
    }

    /**
     * Identifies the [ContentMargin](listviewitempresenter_contentmargin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.contentmarginproperty
     * @type {DependencyProperty} 
     */
    static ContentMarginProperty {
        get => ListViewItemPresenter.get_ContentMarginProperty()
    }

    /**
     * Identifies the [SelectedPressedBackground](listviewitempresenter_selectedpressedbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedpressedbackgroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedPressedBackgroundProperty {
        get => ListViewItemPresenter.get_SelectedPressedBackgroundProperty()
    }

    /**
     * Identifies the [PressedBackground](listviewitempresenter_pressedbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pressedbackgroundproperty
     * @type {DependencyProperty} 
     */
    static PressedBackgroundProperty {
        get => ListViewItemPresenter.get_PressedBackgroundProperty()
    }

    /**
     * Identifies the [CheckBoxBrush](listviewitempresenter_checkboxbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxBrushProperty()
    }

    /**
     * Identifies the [FocusSecondaryBorderBrush](listviewitempresenter_focussecondaryborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.focussecondaryborderbrushproperty
     * @type {DependencyProperty} 
     */
    static FocusSecondaryBorderBrushProperty {
        get => ListViewItemPresenter.get_FocusSecondaryBorderBrushProperty()
    }

    /**
     * Identifies the [CheckMode](listviewitempresenter_checkmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkmodeproperty
     * @type {DependencyProperty} 
     */
    static CheckModeProperty {
        get => ListViewItemPresenter.get_CheckModeProperty()
    }

    /**
     * Identifies the [PointerOverForeground](listviewitempresenter_pointeroverforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pointeroverforegroundproperty
     * @type {DependencyProperty} 
     */
    static PointerOverForegroundProperty {
        get => ListViewItemPresenter.get_PointerOverForegroundProperty()
    }

    /**
     * Identifies the RevealBackground dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.revealbackgroundproperty
     * @type {DependencyProperty} 
     */
    static RevealBackgroundProperty {
        get => ListViewItemPresenter.get_RevealBackgroundProperty()
    }

    /**
     * Identifies the RevealBorderBrush dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.revealborderbrushproperty
     * @type {DependencyProperty} 
     */
    static RevealBorderBrushProperty {
        get => ListViewItemPresenter.get_RevealBorderBrushProperty()
    }

    /**
     * Identifies the RevealBorderThickness dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.revealborderthicknessproperty
     * @type {DependencyProperty} 
     */
    static RevealBorderThicknessProperty {
        get => ListViewItemPresenter.get_RevealBorderThicknessProperty()
    }

    /**
     * Identifies the RevealBackgroundShowsAboveContent dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.revealbackgroundshowsabovecontentproperty
     * @type {DependencyProperty} 
     */
    static RevealBackgroundShowsAboveContentProperty {
        get => ListViewItemPresenter.get_RevealBackgroundShowsAboveContentProperty()
    }

    /**
     * Identifies the [SelectedDisabledBackground](listviewitempresenter_selecteddisabledbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selecteddisabledbackgroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedDisabledBackgroundProperty {
        get => ListViewItemPresenter.get_SelectedDisabledBackgroundProperty()
    }

    /**
     * Identifies the [CheckPressedBrush](listviewitempresenter_checkpressedbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkpressedbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckPressedBrushProperty {
        get => ListViewItemPresenter.get_CheckPressedBrushProperty()
    }

    /**
     * Identifies the [CheckDisabledBrush](listviewitempresenter_checkdisabledbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkdisabledbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckDisabledBrushProperty {
        get => ListViewItemPresenter.get_CheckDisabledBrushProperty()
    }

    /**
     * Identifies the [CheckBoxPointerOverBrush](listviewitempresenter_checkboxpointeroverbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxpointeroverbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxPointerOverBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxPointerOverBrushProperty()
    }

    /**
     * Identifies the [CheckBoxPressedBrush](listviewitempresenter_checkboxpressedbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxpressedbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxPressedBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxPressedBrushProperty()
    }

    /**
     * Identifies the [CheckBoxDisabledBrush](listviewitempresenter_checkboxdisabledbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxdisabledbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxDisabledBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxDisabledBrushProperty()
    }

    /**
     * Identifies the [CheckBoxSelectedBrush](listviewitempresenter_checkboxselectedbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxselectedbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxSelectedBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxSelectedBrushProperty()
    }

    /**
     * Identifies the [CheckBoxSelectedPointerOverBrush](listviewitempresenter_checkboxselectedpointeroverbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxselectedpointeroverbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxSelectedPointerOverBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxSelectedPointerOverBrushProperty()
    }

    /**
     * Identifies the [CheckBoxSelectedPressedBrush](listviewitempresenter_checkboxselectedpressedbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxselectedpressedbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxSelectedPressedBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxSelectedPressedBrushProperty()
    }

    /**
     * Identifies the [CheckBoxSelectedDisabledBrush](listviewitempresenter_checkboxselecteddisabledbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxselecteddisabledbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxSelectedDisabledBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxSelectedDisabledBrushProperty()
    }

    /**
     * Identifies the [CheckBoxBorderBrush](listviewitempresenter_checkboxborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxborderbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxBorderBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxBorderBrushProperty()
    }

    /**
     * Identifies the [CheckBoxPointerOverBorderBrush](listviewitempresenter_checkboxpointeroverborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxpointeroverborderbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxPointerOverBorderBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxPointerOverBorderBrushProperty()
    }

    /**
     * Identifies the [CheckBoxPressedBorderBrush](listviewitempresenter_checkboxpressedborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxpressedborderbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxPressedBorderBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxPressedBorderBrushProperty()
    }

    /**
     * Identifies the [CheckBoxDisabledBorderBrush](listviewitempresenter_checkboxdisabledborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxdisabledborderbrushproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxDisabledBorderBrushProperty {
        get => ListViewItemPresenter.get_CheckBoxDisabledBorderBrushProperty()
    }

    /**
     * Identifies the [CheckBoxCornerRadius](listviewitempresenter_checkboxcornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxcornerradiusproperty
     * @type {DependencyProperty} 
     */
    static CheckBoxCornerRadiusProperty {
        get => ListViewItemPresenter.get_CheckBoxCornerRadiusProperty()
    }

    /**
     * Identifies the [SelectionIndicatorCornerRadius](listviewitempresenter_selectionindicatorcornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorcornerradiusproperty
     * @type {DependencyProperty} 
     */
    static SelectionIndicatorCornerRadiusProperty {
        get => ListViewItemPresenter.get_SelectionIndicatorCornerRadiusProperty()
    }

    /**
     * Identifies the [SelectionIndicatorVisualEnabled](listviewitempresenter_selectionindicatorvisualenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorvisualenabledproperty
     * @type {DependencyProperty} 
     */
    static SelectionIndicatorVisualEnabledProperty {
        get => ListViewItemPresenter.get_SelectionIndicatorVisualEnabledProperty()
    }

    /**
     * Identifies the [SelectionIndicatorMode](listviewitempresenter_selectionindicatormode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatormodeproperty
     * @type {DependencyProperty} 
     */
    static SelectionIndicatorModeProperty {
        get => ListViewItemPresenter.get_SelectionIndicatorModeProperty()
    }

    /**
     * Identifies the [SelectionIndicatorBrush](listviewitempresenter_selectionindicatorbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectionIndicatorBrushProperty {
        get => ListViewItemPresenter.get_SelectionIndicatorBrushProperty()
    }

    /**
     * Identifies the [SelectionIndicatorPointerOverBrush](listviewitempresenter_selectionindicatorpointeroverbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorpointeroverbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectionIndicatorPointerOverBrushProperty {
        get => ListViewItemPresenter.get_SelectionIndicatorPointerOverBrushProperty()
    }

    /**
     * Identifies the [SelectionIndicatorPressedBrush](listviewitempresenter_selectionindicatorpressedbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorpressedbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectionIndicatorPressedBrushProperty {
        get => ListViewItemPresenter.get_SelectionIndicatorPressedBrushProperty()
    }

    /**
     * Identifies the [SelectionIndicatorDisabledBrush](listviewitempresenter_selectionindicatordisabledbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatordisabledbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectionIndicatorDisabledBrushProperty {
        get => ListViewItemPresenter.get_SelectionIndicatorDisabledBrushProperty()
    }

    /**
     * Identifies the [SelectedBorderBrush](listviewitempresenter_selectedborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedBorderBrushProperty {
        get => ListViewItemPresenter.get_SelectedBorderBrushProperty()
    }

    /**
     * Identifies the [SelectedPressedBorderBrush](listviewitempresenter_selectedpressedborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedpressedborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedPressedBorderBrushProperty {
        get => ListViewItemPresenter.get_SelectedPressedBorderBrushProperty()
    }

    /**
     * Identifies the [SelectedDisabledBorderBrush](listviewitempresenter_selecteddisabledborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selecteddisabledborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedDisabledBorderBrushProperty {
        get => ListViewItemPresenter.get_SelectedDisabledBorderBrushProperty()
    }

    /**
     * Identifies the [SelectedInnerBorderBrush](listviewitempresenter_selectedinnerborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedinnerborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedInnerBorderBrushProperty {
        get => ListViewItemPresenter.get_SelectedInnerBorderBrushProperty()
    }

    /**
     * Identifies the [PointerOverBorderBrush](listviewitempresenter_pointeroverborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pointeroverborderbrushproperty
     * @type {DependencyProperty} 
     */
    static PointerOverBorderBrushProperty {
        get => ListViewItemPresenter.get_PointerOverBorderBrushProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionCheckMarkVisualEnabledProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_SelectionCheckMarkVisualEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckHintBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_CheckHintBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckSelectingBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_CheckSelectingBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_CheckBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DragBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_DragBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DragForegroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_DragForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_FocusBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_PlaceholderBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_PointerOverBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_SelectedBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedForegroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_SelectedForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedPointerOverBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_SelectedPointerOverBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedPointerOverBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_SelectedPointerOverBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedBorderThicknessProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_SelectedBorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisabledOpacityProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_DisabledOpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DragOpacityProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_DragOpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ReorderHintOffsetProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_ReorderHintOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ListViewItemPresenterHorizontalContentAlignmentProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_ListViewItemPresenterHorizontalContentAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ListViewItemPresenterVerticalContentAlignmentProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_ListViewItemPresenterVerticalContentAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ListViewItemPresenterPaddingProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_ListViewItemPresenterPaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverBackgroundMarginProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_PointerOverBackgroundMarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentMarginProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics := IListViewItemPresenterStatics(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics.get_ContentMarginProperty()
    }

    /**
     * 
     * @returns {ListViewItemPresenter} 
     */
    static CreateInstance() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterFactory.IID)
            ListViewItemPresenter.__IListViewItemPresenterFactory := IListViewItemPresenterFactory(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedPressedBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics2.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics2 := IListViewItemPresenterStatics2(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics2.get_SelectedPressedBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PressedBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics2.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics2 := IListViewItemPresenterStatics2(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics2.get_PressedBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics2.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics2 := IListViewItemPresenterStatics2(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics2.get_CheckBoxBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusSecondaryBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics2.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics2 := IListViewItemPresenterStatics2(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics2.get_FocusSecondaryBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckModeProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics2.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics2 := IListViewItemPresenterStatics2(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics2.get_CheckModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverForegroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics2.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics2 := IListViewItemPresenterStatics2(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics2.get_PointerOverForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RevealBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics3.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics3 := IListViewItemPresenterStatics3(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics3.get_RevealBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RevealBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics3.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics3 := IListViewItemPresenterStatics3(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics3.get_RevealBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RevealBorderThicknessProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics3.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics3 := IListViewItemPresenterStatics3(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics3.get_RevealBorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RevealBackgroundShowsAboveContentProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics3.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics3 := IListViewItemPresenterStatics3(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics3.get_RevealBackgroundShowsAboveContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedDisabledBackgroundProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectedDisabledBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckPressedBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckPressedBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckDisabledBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckDisabledBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxPointerOverBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxPointerOverBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxPressedBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxPressedBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxDisabledBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxDisabledBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxSelectedBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxSelectedBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxSelectedPointerOverBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxSelectedPointerOverBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxSelectedPressedBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxSelectedPressedBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxSelectedDisabledBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxSelectedDisabledBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxPointerOverBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxPointerOverBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxPressedBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxPressedBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxDisabledBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxDisabledBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CheckBoxCornerRadiusProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_CheckBoxCornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionIndicatorCornerRadiusProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectionIndicatorCornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionIndicatorVisualEnabledProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectionIndicatorVisualEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionIndicatorModeProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectionIndicatorModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionIndicatorBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectionIndicatorBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionIndicatorPointerOverBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectionIndicatorPointerOverBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionIndicatorPressedBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectionIndicatorPressedBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionIndicatorDisabledBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectionIndicatorDisabledBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectedBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedPressedBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectedPressedBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedDisabledBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectedDisabledBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedInnerBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_SelectedInnerBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverBorderBrushProperty() {
        if (!ListViewItemPresenter.HasProp("__IListViewItemPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewItemPresenterStatics4.IID)
            ListViewItemPresenter.__IListViewItemPresenterStatics4 := IListViewItemPresenterStatics4(factoryPtr)
        }

        return ListViewItemPresenter.__IListViewItemPresenterStatics4.get_PointerOverBorderBrushProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the check mark is shown when the item is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectioncheckmarkvisualenabled
     * @type {Boolean} 
     */
    SelectionCheckMarkVisualEnabled {
        get => this.get_SelectionCheckMarkVisualEnabled()
        set => this.put_SelectionCheckMarkVisualEnabled(value)
    }

    /**
     * Gets or sets the brush used to render the check mark hint. This property is ignored for a Windows 10 app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkhintbrush
     * @type {Brush} 
     */
    CheckHintBrush {
        get => this.get_CheckHintBrush()
        set => this.put_CheckHintBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check mark on an item while it's being selected using a swipe interaction. This property is ignored for a Windows 10 app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkselectingbrush
     * @type {Brush} 
     */
    CheckSelectingBrush {
        get => this.get_CheckSelectingBrush()
        set => this.put_CheckSelectingBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check mark on a selected item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkbrush
     * @type {Brush} 
     */
    CheckBrush {
        get => this.get_CheckBrush()
        set => this.put_CheckBrush(value)
    }

    /**
     * Gets or sets the brush used to render the background of an item that's being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.dragbackground
     * @type {Brush} 
     */
    DragBackground {
        get => this.get_DragBackground()
        set => this.put_DragBackground(value)
    }

    /**
     * Gets or sets the brush used to render the foreground of an item that's being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.dragforeground
     * @type {Brush} 
     */
    DragForeground {
        get => this.get_DragForeground()
        set => this.put_DragForeground(value)
    }

    /**
     * Gets or sets the brush used to render the border of an item that has focus. Also see [FocusSecondaryBorderBrush](listviewitempresenter_focussecondaryborderbrush.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.focusborderbrush
     * @type {Brush} 
     */
    FocusBorderBrush {
        get => this.get_FocusBorderBrush()
        set => this.put_FocusBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the placeholder background for an item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.placeholderbackground
     * @type {Brush} 
     */
    PlaceholderBackground {
        get => this.get_PlaceholderBackground()
        set => this.put_PlaceholderBackground(value)
    }

    /**
     * Gets or sets the brush used to render the background of an item that has the pointer over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pointeroverbackground
     * @type {Brush} 
     */
    PointerOverBackground {
        get => this.get_PointerOverBackground()
        set => this.put_PointerOverBackground(value)
    }

    /**
     * Gets or sets the brush used to render the background of an item that's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedbackground
     * @type {Brush} 
     */
    SelectedBackground {
        get => this.get_SelectedBackground()
        set => this.put_SelectedBackground(value)
    }

    /**
     * Gets or sets the brush used to render the foreground of an item that's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedforeground
     * @type {Brush} 
     */
    SelectedForeground {
        get => this.get_SelectedForeground()
        set => this.put_SelectedForeground(value)
    }

    /**
     * Gets or sets the brush used to render the background of an item that's selected and has the pointer over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedpointeroverbackground
     * @type {Brush} 
     */
    SelectedPointerOverBackground {
        get => this.get_SelectedPointerOverBackground()
        set => this.put_SelectedPointerOverBackground(value)
    }

    /**
     * Gets or sets the brush used to render the border of an item that's selected and has the pointer over it. This property is ignored for a Windows 10 app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedpointeroverborderbrush
     * @type {Brush} 
     */
    SelectedPointerOverBorderBrush {
        get => this.get_SelectedPointerOverBorderBrush()
        set => this.put_SelectedPointerOverBorderBrush(value)
    }

    /**
     * Gets or sets the thickness of the border around an item that's selected. This property is ignored for a Windows 10 app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedborderthickness
     * @type {Thickness} 
     */
    SelectedBorderThickness {
        get => this.get_SelectedBorderThickness()
        set => this.put_SelectedBorderThickness(value)
    }

    /**
     * Gets or sets the opacity of an item that is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.disabledopacity
     * @type {Float} 
     */
    DisabledOpacity {
        get => this.get_DisabledOpacity()
        set => this.put_DisabledOpacity(value)
    }

    /**
     * Gets or sets the opacity of an item that's being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.dragopacity
     * @type {Float} 
     */
    DragOpacity {
        get => this.get_DragOpacity()
        set => this.put_DragOpacity(value)
    }

    /**
     * Gets or sets the amount that the reorder hint is offset. This property is ignored for a Windows 10 app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.reorderhintoffset
     * @type {Float} 
     */
    ReorderHintOffset {
        get => this.get_ReorderHintOffset()
        set => this.put_ReorderHintOffset(value)
    }

    /**
     * > [!NOTE]
     * > ListViewItemPresenterHorizontalContentAlignment may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.HorizontalContentAlignment](../windows.ui.xaml.controls/contentpresenter_horizontalcontentalignment.md).
     * 
     * Gets or sets the horizontal alignment of the content being presented.
     * @remarks
     * > [!IMPORTANT]
     * > ListViewItemPresenterHorizontalContentAlignment may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.HorizontalContentAlignment](../windows.ui.xaml.controls/contentpresenter_horizontalcontentalignment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.listviewitempresenterhorizontalcontentalignment
     * @type {Integer} 
     */
    ListViewItemPresenterHorizontalContentAlignment {
        get => this.get_ListViewItemPresenterHorizontalContentAlignment()
        set => this.put_ListViewItemPresenterHorizontalContentAlignment(value)
    }

    /**
     * > [!NOTE]
     * > ListViewItemPresenterVerticalContentAlignment may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignment](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignment.md).
     * 
     * Gets or sets the vertical alignment of the content being presented.
     * @remarks
     * > [!IMPORTANT]
     * > ListViewItemPresenterVerticalContentAlignment may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.VerticalContentAlignment](../windows.ui.xaml.controls/contentpresenter_verticalcontentalignment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.listviewitempresenterverticalcontentalignment
     * @type {Integer} 
     */
    ListViewItemPresenterVerticalContentAlignment {
        get => this.get_ListViewItemPresenterVerticalContentAlignment()
        set => this.put_ListViewItemPresenterVerticalContentAlignment(value)
    }

    /**
     * > [!NOTE]
     * > ListViewItemPresenterPadding may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.Padding](../windows.ui.xaml.controls/contentpresenter_padding.md).
     * 
     * Gets or sets the padding around the presenter.
     * @remarks
     * > [!IMPORTANT]
     * > ListViewItemPresenterPadding may be altered or unavailable for releases after Windows 10. Instead, use [ContentPresenter.Padding](../windows.ui.xaml.controls/contentpresenter_padding.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.listviewitempresenterpadding
     * @type {Thickness} 
     */
    ListViewItemPresenterPadding {
        get => this.get_ListViewItemPresenterPadding()
        set => this.put_ListViewItemPresenterPadding(value)
    }

    /**
     * Gets or sets the margin of the background displayed for pointer-over input actions in the [ListView](../windows.ui.xaml.controls/listview.md) item cell, versus the cell. This property is ignored for a Windows 10 app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pointeroverbackgroundmargin
     * @type {Thickness} 
     */
    PointerOverBackgroundMargin {
        get => this.get_PointerOverBackgroundMargin()
        set => this.put_PointerOverBackgroundMargin(value)
    }

    /**
     * Gets or sets an internal margin between presented content and its presenter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.contentmargin
     * @type {Thickness} 
     */
    ContentMargin {
        get => this.get_ContentMargin()
        set => this.put_ContentMargin(value)
    }

    /**
     * In a [ListView](../windows.ui.xaml.controls/listview.md), gets or sets the brush used to render the background of a selected item while the user is pressing it. In a [GridView](../windows.ui.xaml.controls/gridview.md), the item's border is set rather than the background.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedpressedbackground
     * @type {Brush} 
     */
    SelectedPressedBackground {
        get => this.get_SelectedPressedBackground()
        set => this.put_SelectedPressedBackground(value)
    }

    /**
     * In a [ListView](../windows.ui.xaml.controls/listview.md), gets or sets the brush used to render the background of an unselected item while the user is pressing it. In a [GridView](../windows.ui.xaml.controls/gridview.md), the item's border is set rather than the background.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pressedbackground
     * @type {Brush} 
     */
    PressedBackground {
        get => this.get_PressedBackground()
        set => this.put_PressedBackground(value)
    }

    /**
     * In a [ListView](../windows.ui.xaml.controls/listview.md) in multiple selection mode, gets or sets the brush used to render an item's check box border. In a [GridView](../windows.ui.xaml.controls/gridview.md), the check box background is set rather than the border, and only for unselected items.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxbrush
     * @type {Brush} 
     */
    CheckBoxBrush {
        get => this.get_CheckBoxBrush()
        set => this.put_CheckBoxBrush(value)
    }

    /**
     * Gets or sets the brush used to render the second color of the border around an item that has focus. Focus is rendered as a composition of two brushes. This property is used together the [FocusBorderBrush](listviewitempresenter_focusborderbrush.md) to specify these two brushes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.focussecondaryborderbrush
     * @type {Brush} 
     */
    FocusSecondaryBorderBrush {
        get => this.get_FocusSecondaryBorderBrush()
        set => this.put_FocusSecondaryBorderBrush(value)
    }

    /**
     * Gets or sets the style of checkbox shown for selecting an item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkmode
     * @type {Integer} 
     */
    CheckMode {
        get => this.get_CheckMode()
        set => this.put_CheckMode(value)
    }

    /**
     * Gets or sets the brush used to render the foreground when the pointer is over the item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pointeroverforeground
     * @type {Brush} 
     */
    PointerOverForeground {
        get => this.get_PointerOverForeground()
        set => this.put_PointerOverForeground(value)
    }

    /**
     * Gets or sets the brush used to render the background of the reveal effect.
     * @remarks
     * For more info, see [Reveal](/windows/uwp/style/reveal).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.revealbackground
     * @type {Brush} 
     */
    RevealBackground {
        get => this.get_RevealBackground()
        set => this.put_RevealBackground(value)
    }

    /**
     * Gets or sets the brush used to render the border of the reveal effect.
     * @remarks
     * For more info, see [Reveal](/windows/uwp/style/reveal).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.revealborderbrush
     * @type {Brush} 
     */
    RevealBorderBrush {
        get => this.get_RevealBorderBrush()
        set => this.put_RevealBorderBrush(value)
    }

    /**
     * Gets or sets the thickness of the border of the reveal effect.
     * @remarks
     * For more info, see [Reveal](/windows/uwp/style/reveal).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.revealborderthickness
     * @type {Thickness} 
     */
    RevealBorderThickness {
        get => this.get_RevealBorderThickness()
        set => this.put_RevealBorderThickness(value)
    }

    /**
     * Gets or sets a value that indicates whether the reveal backgound is shown on top of the content.
     * @remarks
     * For more info, see [Reveal](/windows/uwp/style/reveal).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.revealbackgroundshowsabovecontent
     * @type {Boolean} 
     */
    RevealBackgroundShowsAboveContent {
        get => this.get_RevealBackgroundShowsAboveContent()
        set => this.put_RevealBackgroundShowsAboveContent(value)
    }

    /**
     * Gets or sets the brush used to render the background of a disabled list view item when it's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selecteddisabledbackground
     * @type {Brush} 
     */
    SelectedDisabledBackground {
        get => this.get_SelectedDisabledBackground()
        set => this.put_SelectedDisabledBackground(value)
    }

    /**
     * Gets or sets the brush used to render the check mark when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkpressedbrush
     * @type {Brush} 
     */
    CheckPressedBrush {
        get => this.get_CheckPressedBrush()
        set => this.put_CheckPressedBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check mark on disabled check box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkdisabledbrush
     * @type {Brush} 
     */
    CheckDisabledBrush {
        get => this.get_CheckDisabledBrush()
        set => this.put_CheckDisabledBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check box when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxpointeroverbrush
     * @type {Brush} 
     */
    CheckBoxPointerOverBrush {
        get => this.get_CheckBoxPointerOverBrush()
        set => this.put_CheckBoxPointerOverBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check box when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxpressedbrush
     * @type {Brush} 
     */
    CheckBoxPressedBrush {
        get => this.get_CheckBoxPressedBrush()
        set => this.put_CheckBoxPressedBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check box when it's disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxdisabledbrush
     * @type {Brush} 
     */
    CheckBoxDisabledBrush {
        get => this.get_CheckBoxDisabledBrush()
        set => this.put_CheckBoxDisabledBrush(value)
    }

    /**
     * Gets or sets the brush used to render the check box when it's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxselectedbrush
     * @type {Brush} 
     */
    CheckBoxSelectedBrush {
        get => this.get_CheckBoxSelectedBrush()
        set => this.put_CheckBoxSelectedBrush(value)
    }

    /**
     * Gets or sets the brush used to render a selected check box when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxselectedpointeroverbrush
     * @type {Brush} 
     */
    CheckBoxSelectedPointerOverBrush {
        get => this.get_CheckBoxSelectedPointerOverBrush()
        set => this.put_CheckBoxSelectedPointerOverBrush(value)
    }

    /**
     * Gets or sets the brush used to render a selected check box when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxselectedpressedbrush
     * @type {Brush} 
     */
    CheckBoxSelectedPressedBrush {
        get => this.get_CheckBoxSelectedPressedBrush()
        set => this.put_CheckBoxSelectedPressedBrush(value)
    }

    /**
     * Gets or sets the brush used to render a disabled check box when it's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxselecteddisabledbrush
     * @type {Brush} 
     */
    CheckBoxSelectedDisabledBrush {
        get => this.get_CheckBoxSelectedDisabledBrush()
        set => this.put_CheckBoxSelectedDisabledBrush(value)
    }

    /**
     * Gets or sets the brush used to render the border of the check box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxborderbrush
     * @type {Brush} 
     */
    CheckBoxBorderBrush {
        get => this.get_CheckBoxBorderBrush()
        set => this.put_CheckBoxBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the border of the check box when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxpointeroverborderbrush
     * @type {Brush} 
     */
    CheckBoxPointerOverBorderBrush {
        get => this.get_CheckBoxPointerOverBorderBrush()
        set => this.put_CheckBoxPointerOverBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the border of the check box when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxpressedborderbrush
     * @type {Brush} 
     */
    CheckBoxPressedBorderBrush {
        get => this.get_CheckBoxPressedBorderBrush()
        set => this.put_CheckBoxPressedBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the border of the check box when it's disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxdisabledborderbrush
     * @type {Brush} 
     */
    CheckBoxDisabledBorderBrush {
        get => this.get_CheckBoxDisabledBorderBrush()
        set => this.put_CheckBoxDisabledBorderBrush(value)
    }

    /**
     * Gets or sets the radius for the corners of check box.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.checkboxcornerradius
     * @type {CornerRadius} 
     */
    CheckBoxCornerRadius {
        get => this.get_CheckBoxCornerRadius()
        set => this.put_CheckBoxCornerRadius(value)
    }

    /**
     * Gets or sets the radius for the corners of the list view item selection indicator.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorcornerradius
     * @type {CornerRadius} 
     */
    SelectionIndicatorCornerRadius {
        get => this.get_SelectionIndicatorCornerRadius()
        set => this.put_SelectionIndicatorCornerRadius(value)
    }

    /**
     * Gets or sets a value that indicates whether the selection indicator of a list view item is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorvisualenabled
     * @type {Boolean} 
     */
    SelectionIndicatorVisualEnabled {
        get => this.get_SelectionIndicatorVisualEnabled()
        set => this.put_SelectionIndicatorVisualEnabled(value)
    }

    /**
     * Gets or sets a value that indicates how the selection indicator is shown on a list view item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatormode
     * @type {Integer} 
     */
    SelectionIndicatorMode {
        get => this.get_SelectionIndicatorMode()
        set => this.put_SelectionIndicatorMode(value)
    }

    /**
     * Gets or sets the brush used to render the selection indicator of a list view item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorbrush
     * @type {Brush} 
     */
    SelectionIndicatorBrush {
        get => this.get_SelectionIndicatorBrush()
        set => this.put_SelectionIndicatorBrush(value)
    }

    /**
     * Gets or sets the brush used to render the selection indicator of a list view item when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorpointeroverbrush
     * @type {Brush} 
     */
    SelectionIndicatorPointerOverBrush {
        get => this.get_SelectionIndicatorPointerOverBrush()
        set => this.put_SelectionIndicatorPointerOverBrush(value)
    }

    /**
     * Gets or sets the brush used to render the selection indicator of a list view item when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatorpressedbrush
     * @type {Brush} 
     */
    SelectionIndicatorPressedBrush {
        get => this.get_SelectionIndicatorPressedBrush()
        set => this.put_SelectionIndicatorPressedBrush(value)
    }

    /**
     * Gets or sets the brush used to render the selection indicator of a disabled list view item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectionindicatordisabledbrush
     * @type {Brush} 
     */
    SelectionIndicatorDisabledBrush {
        get => this.get_SelectionIndicatorDisabledBrush()
        set => this.put_SelectionIndicatorDisabledBrush(value)
    }

    /**
     * Gets or sets the brush used to render the border of the list view item when it's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedborderbrush
     * @type {Brush} 
     */
    SelectedBorderBrush {
        get => this.get_SelectedBorderBrush()
        set => this.put_SelectedBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the border of a selected list view item when it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedpressedborderbrush
     * @type {Brush} 
     */
    SelectedPressedBorderBrush {
        get => this.get_SelectedPressedBorderBrush()
        set => this.put_SelectedPressedBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the border of a disabled list view item when it's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selecteddisabledborderbrush
     * @type {Brush} 
     */
    SelectedDisabledBorderBrush {
        get => this.get_SelectedDisabledBorderBrush()
        set => this.put_SelectedDisabledBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the inner border of a list view item when it's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.selectedinnerborderbrush
     * @type {Brush} 
     */
    SelectedInnerBorderBrush {
        get => this.get_SelectedInnerBorderBrush()
        set => this.put_SelectedInnerBorderBrush(value)
    }

    /**
     * Gets or sets the brush used to render the border of the list view item when the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenter.pointeroverborderbrush
     * @type {Brush} 
     */
    PointerOverBorderBrush {
        get => this.get_PointerOverBorderBrush()
        set => this.put_PointerOverBorderBrush(value)
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
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_SelectionCheckMarkVisualEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SelectionCheckMarkVisualEnabled(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_SelectionCheckMarkVisualEnabled(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckHintBrush() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_CheckHintBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckHintBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_CheckHintBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckSelectingBrush() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_CheckSelectingBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckSelectingBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_CheckSelectingBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBrush() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_CheckBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_CheckBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_DragBackground() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_DragBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_DragBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_DragBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_DragForeground() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_DragForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_DragForeground(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_DragForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_FocusBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_FocusBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PlaceholderBackground() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_PlaceholderBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_PlaceholderBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PointerOverBackground() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_PointerOverBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PointerOverBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_PointerOverBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedBackground() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_SelectedBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_SelectedBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedForeground() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_SelectedForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedForeground(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_SelectedForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPointerOverBackground() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_SelectedPointerOverBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPointerOverBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_SelectedPointerOverBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPointerOverBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_SelectedPointerOverBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPointerOverBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_SelectedPointerOverBorderBrush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_SelectedBorderThickness() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_SelectedBorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_SelectedBorderThickness(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_SelectedBorderThickness(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DisabledOpacity() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_DisabledOpacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DisabledOpacity(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_DisabledOpacity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DragOpacity() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_DragOpacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DragOpacity(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_DragOpacity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReorderHintOffset() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_ReorderHintOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ReorderHintOffset(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_ReorderHintOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListViewItemPresenterHorizontalContentAlignment() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_ListViewItemPresenterHorizontalContentAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ListViewItemPresenterHorizontalContentAlignment(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_ListViewItemPresenterHorizontalContentAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListViewItemPresenterVerticalContentAlignment() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_ListViewItemPresenterVerticalContentAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ListViewItemPresenterVerticalContentAlignment(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_ListViewItemPresenterVerticalContentAlignment(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_ListViewItemPresenterPadding() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_ListViewItemPresenterPadding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_ListViewItemPresenterPadding(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_ListViewItemPresenterPadding(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_PointerOverBackgroundMargin() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_PointerOverBackgroundMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_PointerOverBackgroundMargin(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_PointerOverBackgroundMargin(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_ContentMargin() {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.get_ContentMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_ContentMargin(value) {
        if (!this.HasProp("__IListViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter := IListViewItemPresenter(outPtr)
        }

        return this.__IListViewItemPresenter.put_ContentMargin(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPressedBackground() {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.get_SelectedPressedBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPressedBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.put_SelectedPressedBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PressedBackground() {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.get_PressedBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PressedBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.put_PressedBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxBrush() {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.get_CheckBoxBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.put_CheckBoxBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusSecondaryBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.get_FocusSecondaryBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusSecondaryBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.put_FocusSecondaryBorderBrush(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CheckMode() {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.get_CheckMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CheckMode(value) {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.put_CheckMode(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PointerOverForeground() {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.get_PointerOverForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PointerOverForeground(value) {
        if (!this.HasProp("__IListViewItemPresenter2")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter2 := IListViewItemPresenter2(outPtr)
        }

        return this.__IListViewItemPresenter2.put_PointerOverForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_RevealBackground() {
        if (!this.HasProp("__IListViewItemPresenter3")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter3 := IListViewItemPresenter3(outPtr)
        }

        return this.__IListViewItemPresenter3.get_RevealBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_RevealBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter3")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter3 := IListViewItemPresenter3(outPtr)
        }

        return this.__IListViewItemPresenter3.put_RevealBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_RevealBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter3")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter3 := IListViewItemPresenter3(outPtr)
        }

        return this.__IListViewItemPresenter3.get_RevealBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_RevealBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter3")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter3 := IListViewItemPresenter3(outPtr)
        }

        return this.__IListViewItemPresenter3.put_RevealBorderBrush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_RevealBorderThickness() {
        if (!this.HasProp("__IListViewItemPresenter3")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter3 := IListViewItemPresenter3(outPtr)
        }

        return this.__IListViewItemPresenter3.get_RevealBorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_RevealBorderThickness(value) {
        if (!this.HasProp("__IListViewItemPresenter3")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter3 := IListViewItemPresenter3(outPtr)
        }

        return this.__IListViewItemPresenter3.put_RevealBorderThickness(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RevealBackgroundShowsAboveContent() {
        if (!this.HasProp("__IListViewItemPresenter3")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter3 := IListViewItemPresenter3(outPtr)
        }

        return this.__IListViewItemPresenter3.get_RevealBackgroundShowsAboveContent()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RevealBackgroundShowsAboveContent(value) {
        if (!this.HasProp("__IListViewItemPresenter3")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter3 := IListViewItemPresenter3(outPtr)
        }

        return this.__IListViewItemPresenter3.put_RevealBackgroundShowsAboveContent(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedDisabledBackground() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectedDisabledBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedDisabledBackground(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectedDisabledBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckPressedBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckPressedBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckPressedBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckPressedBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckDisabledBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckDisabledBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckDisabledBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckDisabledBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxPointerOverBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxPointerOverBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxPointerOverBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxPointerOverBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxPressedBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxPressedBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxPressedBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxPressedBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxDisabledBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxDisabledBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxDisabledBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxDisabledBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxSelectedBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxSelectedBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxSelectedBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxSelectedBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxSelectedPointerOverBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxSelectedPointerOverBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxSelectedPointerOverBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxSelectedPointerOverBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxSelectedPressedBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxSelectedPressedBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxSelectedPressedBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxSelectedPressedBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxSelectedDisabledBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxSelectedDisabledBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxSelectedDisabledBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxSelectedDisabledBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxPointerOverBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxPointerOverBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxPointerOverBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxPointerOverBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxPressedBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxPressedBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxPressedBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxPressedBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxDisabledBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxDisabledBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxDisabledBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxDisabledBorderBrush(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CheckBoxCornerRadius() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_CheckBoxCornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxCornerRadius(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_CheckBoxCornerRadius(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_SelectionIndicatorCornerRadius() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectionIndicatorCornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_SelectionIndicatorCornerRadius(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectionIndicatorCornerRadius(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SelectionIndicatorVisualEnabled() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectionIndicatorVisualEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SelectionIndicatorVisualEnabled(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectionIndicatorVisualEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionIndicatorMode() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectionIndicatorMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionIndicatorMode(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectionIndicatorMode(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectionIndicatorBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectionIndicatorBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectionIndicatorBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectionIndicatorBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectionIndicatorPointerOverBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectionIndicatorPointerOverBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectionIndicatorPointerOverBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectionIndicatorPointerOverBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectionIndicatorPressedBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectionIndicatorPressedBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectionIndicatorPressedBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectionIndicatorPressedBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectionIndicatorDisabledBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectionIndicatorDisabledBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectionIndicatorDisabledBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectionIndicatorDisabledBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectedBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectedBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPressedBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectedPressedBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPressedBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectedPressedBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedDisabledBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectedDisabledBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedDisabledBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectedDisabledBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedInnerBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_SelectedInnerBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedInnerBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_SelectedInnerBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PointerOverBorderBrush() {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.get_PointerOverBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PointerOverBorderBrush(value) {
        if (!this.HasProp("__IListViewItemPresenter4")) {
            if ((queryResult := this.QueryInterface(IListViewItemPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListViewItemPresenter4 := IListViewItemPresenter4(outPtr)
        }

        return this.__IListViewItemPresenter4.put_PointerOverBorderBrush(value)
    }

;@endregion Instance Methods
}
