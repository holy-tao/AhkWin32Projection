#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
class UIA_PROPERTY_ID extends Win32Enum {

    /**
     * Native name: UIA_RuntimeIdPropertyId
     * @type {Integer (Int32)}
     */
    static RuntimeIdPropertyId => 30000

    /**
     * Native name: UIA_BoundingRectanglePropertyId
     * @type {Integer (Int32)}
     */
    static BoundingRectanglePropertyId => 30001

    /**
     * Native name: UIA_ProcessIdPropertyId
     * @type {Integer (Int32)}
     */
    static ProcessIdPropertyId => 30002

    /**
     * Native name: UIA_ControlTypePropertyId
     * @type {Integer (Int32)}
     */
    static ControlTypePropertyId => 30003

    /**
     * Native name: UIA_LocalizedControlTypePropertyId
     * @type {Integer (Int32)}
     */
    static LocalizedControlTypePropertyId => 30004

    /**
     * Native name: UIA_NamePropertyId
     * @type {Integer (Int32)}
     */
    static NamePropertyId => 30005

    /**
     * Native name: UIA_AcceleratorKeyPropertyId
     * @type {Integer (Int32)}
     */
    static AcceleratorKeyPropertyId => 30006

    /**
     * Native name: UIA_AccessKeyPropertyId
     * @type {Integer (Int32)}
     */
    static AccessKeyPropertyId => 30007

    /**
     * Native name: UIA_HasKeyboardFocusPropertyId
     * @type {Integer (Int32)}
     */
    static HasKeyboardFocusPropertyId => 30008

    /**
     * Native name: UIA_IsKeyboardFocusablePropertyId
     * @type {Integer (Int32)}
     */
    static IsKeyboardFocusablePropertyId => 30009

    /**
     * Native name: UIA_IsEnabledPropertyId
     * @type {Integer (Int32)}
     */
    static IsEnabledPropertyId => 30010

    /**
     * Native name: UIA_AutomationIdPropertyId
     * @type {Integer (Int32)}
     */
    static AutomationIdPropertyId => 30011

    /**
     * Native name: UIA_ClassNamePropertyId
     * @type {Integer (Int32)}
     */
    static ClassNamePropertyId => 30012

    /**
     * Native name: UIA_HelpTextPropertyId
     * @type {Integer (Int32)}
     */
    static HelpTextPropertyId => 30013

    /**
     * Native name: UIA_ClickablePointPropertyId
     * @type {Integer (Int32)}
     */
    static ClickablePointPropertyId => 30014

    /**
     * Native name: UIA_CulturePropertyId
     * @type {Integer (Int32)}
     */
    static CulturePropertyId => 30015

    /**
     * Native name: UIA_IsControlElementPropertyId
     * @type {Integer (Int32)}
     */
    static IsControlElementPropertyId => 30016

    /**
     * Native name: UIA_IsContentElementPropertyId
     * @type {Integer (Int32)}
     */
    static IsContentElementPropertyId => 30017

    /**
     * Native name: UIA_LabeledByPropertyId
     * @type {Integer (Int32)}
     */
    static LabeledByPropertyId => 30018

    /**
     * Native name: UIA_IsPasswordPropertyId
     * @type {Integer (Int32)}
     */
    static IsPasswordPropertyId => 30019

    /**
     * Native name: UIA_NativeWindowHandlePropertyId
     * @type {Integer (Int32)}
     */
    static NativeWindowHandlePropertyId => 30020

    /**
     * Native name: UIA_ItemTypePropertyId
     * @type {Integer (Int32)}
     */
    static ItemTypePropertyId => 30021

    /**
     * Native name: UIA_IsOffscreenPropertyId
     * @type {Integer (Int32)}
     */
    static IsOffscreenPropertyId => 30022

    /**
     * Native name: UIA_OrientationPropertyId
     * @type {Integer (Int32)}
     */
    static OrientationPropertyId => 30023

    /**
     * Native name: UIA_FrameworkIdPropertyId
     * @type {Integer (Int32)}
     */
    static FrameworkIdPropertyId => 30024

    /**
     * Native name: UIA_IsRequiredForFormPropertyId
     * @type {Integer (Int32)}
     */
    static IsRequiredForFormPropertyId => 30025

    /**
     * Native name: UIA_ItemStatusPropertyId
     * @type {Integer (Int32)}
     */
    static ItemStatusPropertyId => 30026

    /**
     * Native name: UIA_IsDockPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsDockPatternAvailablePropertyId => 30027

    /**
     * Native name: UIA_IsExpandCollapsePatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsExpandCollapsePatternAvailablePropertyId => 30028

    /**
     * Native name: UIA_IsGridItemPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsGridItemPatternAvailablePropertyId => 30029

    /**
     * Native name: UIA_IsGridPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsGridPatternAvailablePropertyId => 30030

    /**
     * Native name: UIA_IsInvokePatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsInvokePatternAvailablePropertyId => 30031

    /**
     * Native name: UIA_IsMultipleViewPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsMultipleViewPatternAvailablePropertyId => 30032

    /**
     * Native name: UIA_IsRangeValuePatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsRangeValuePatternAvailablePropertyId => 30033

    /**
     * Native name: UIA_IsScrollPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsScrollPatternAvailablePropertyId => 30034

    /**
     * Native name: UIA_IsScrollItemPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsScrollItemPatternAvailablePropertyId => 30035

    /**
     * Native name: UIA_IsSelectionItemPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsSelectionItemPatternAvailablePropertyId => 30036

    /**
     * Native name: UIA_IsSelectionPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsSelectionPatternAvailablePropertyId => 30037

    /**
     * Native name: UIA_IsTablePatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTablePatternAvailablePropertyId => 30038

    /**
     * Native name: UIA_IsTableItemPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTableItemPatternAvailablePropertyId => 30039

    /**
     * Native name: UIA_IsTextPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTextPatternAvailablePropertyId => 30040

    /**
     * Native name: UIA_IsTogglePatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTogglePatternAvailablePropertyId => 30041

    /**
     * Native name: UIA_IsTransformPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTransformPatternAvailablePropertyId => 30042

    /**
     * Native name: UIA_IsValuePatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsValuePatternAvailablePropertyId => 30043

    /**
     * Native name: UIA_IsWindowPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsWindowPatternAvailablePropertyId => 30044

    /**
     * Native name: UIA_ValueValuePropertyId
     * @type {Integer (Int32)}
     */
    static ValueValuePropertyId => 30045

    /**
     * Native name: UIA_ValueIsReadOnlyPropertyId
     * @type {Integer (Int32)}
     */
    static ValueIsReadOnlyPropertyId => 30046

    /**
     * Native name: UIA_RangeValueValuePropertyId
     * @type {Integer (Int32)}
     */
    static RangeValueValuePropertyId => 30047

    /**
     * Native name: UIA_RangeValueIsReadOnlyPropertyId
     * @type {Integer (Int32)}
     */
    static RangeValueIsReadOnlyPropertyId => 30048

    /**
     * Native name: UIA_RangeValueMinimumPropertyId
     * @type {Integer (Int32)}
     */
    static RangeValueMinimumPropertyId => 30049

    /**
     * Native name: UIA_RangeValueMaximumPropertyId
     * @type {Integer (Int32)}
     */
    static RangeValueMaximumPropertyId => 30050

    /**
     * Native name: UIA_RangeValueLargeChangePropertyId
     * @type {Integer (Int32)}
     */
    static RangeValueLargeChangePropertyId => 30051

    /**
     * Native name: UIA_RangeValueSmallChangePropertyId
     * @type {Integer (Int32)}
     */
    static RangeValueSmallChangePropertyId => 30052

    /**
     * Native name: UIA_ScrollHorizontalScrollPercentPropertyId
     * @type {Integer (Int32)}
     */
    static ScrollHorizontalScrollPercentPropertyId => 30053

    /**
     * Native name: UIA_ScrollHorizontalViewSizePropertyId
     * @type {Integer (Int32)}
     */
    static ScrollHorizontalViewSizePropertyId => 30054

    /**
     * Native name: UIA_ScrollVerticalScrollPercentPropertyId
     * @type {Integer (Int32)}
     */
    static ScrollVerticalScrollPercentPropertyId => 30055

    /**
     * Native name: UIA_ScrollVerticalViewSizePropertyId
     * @type {Integer (Int32)}
     */
    static ScrollVerticalViewSizePropertyId => 30056

    /**
     * Native name: UIA_ScrollHorizontallyScrollablePropertyId
     * @type {Integer (Int32)}
     */
    static ScrollHorizontallyScrollablePropertyId => 30057

    /**
     * Native name: UIA_ScrollVerticallyScrollablePropertyId
     * @type {Integer (Int32)}
     */
    static ScrollVerticallyScrollablePropertyId => 30058

    /**
     * Native name: UIA_SelectionSelectionPropertyId
     * @type {Integer (Int32)}
     */
    static SelectionSelectionPropertyId => 30059

    /**
     * Native name: UIA_SelectionCanSelectMultiplePropertyId
     * @type {Integer (Int32)}
     */
    static SelectionCanSelectMultiplePropertyId => 30060

    /**
     * Native name: UIA_SelectionIsSelectionRequiredPropertyId
     * @type {Integer (Int32)}
     */
    static SelectionIsSelectionRequiredPropertyId => 30061

    /**
     * Native name: UIA_GridRowCountPropertyId
     * @type {Integer (Int32)}
     */
    static GridRowCountPropertyId => 30062

    /**
     * Native name: UIA_GridColumnCountPropertyId
     * @type {Integer (Int32)}
     */
    static GridColumnCountPropertyId => 30063

    /**
     * Native name: UIA_GridItemRowPropertyId
     * @type {Integer (Int32)}
     */
    static GridItemRowPropertyId => 30064

    /**
     * Native name: UIA_GridItemColumnPropertyId
     * @type {Integer (Int32)}
     */
    static GridItemColumnPropertyId => 30065

    /**
     * Native name: UIA_GridItemRowSpanPropertyId
     * @type {Integer (Int32)}
     */
    static GridItemRowSpanPropertyId => 30066

    /**
     * Native name: UIA_GridItemColumnSpanPropertyId
     * @type {Integer (Int32)}
     */
    static GridItemColumnSpanPropertyId => 30067

    /**
     * Native name: UIA_GridItemContainingGridPropertyId
     * @type {Integer (Int32)}
     */
    static GridItemContainingGridPropertyId => 30068

    /**
     * Native name: UIA_DockDockPositionPropertyId
     * @type {Integer (Int32)}
     */
    static DockDockPositionPropertyId => 30069

    /**
     * Native name: UIA_ExpandCollapseExpandCollapseStatePropertyId
     * @type {Integer (Int32)}
     */
    static ExpandCollapseExpandCollapseStatePropertyId => 30070

    /**
     * Native name: UIA_MultipleViewCurrentViewPropertyId
     * @type {Integer (Int32)}
     */
    static MultipleViewCurrentViewPropertyId => 30071

    /**
     * Native name: UIA_MultipleViewSupportedViewsPropertyId
     * @type {Integer (Int32)}
     */
    static MultipleViewSupportedViewsPropertyId => 30072

    /**
     * Native name: UIA_WindowCanMaximizePropertyId
     * @type {Integer (Int32)}
     */
    static WindowCanMaximizePropertyId => 30073

    /**
     * Native name: UIA_WindowCanMinimizePropertyId
     * @type {Integer (Int32)}
     */
    static WindowCanMinimizePropertyId => 30074

    /**
     * Native name: UIA_WindowWindowVisualStatePropertyId
     * @type {Integer (Int32)}
     */
    static WindowWindowVisualStatePropertyId => 30075

    /**
     * Native name: UIA_WindowWindowInteractionStatePropertyId
     * @type {Integer (Int32)}
     */
    static WindowWindowInteractionStatePropertyId => 30076

    /**
     * Native name: UIA_WindowIsModalPropertyId
     * @type {Integer (Int32)}
     */
    static WindowIsModalPropertyId => 30077

    /**
     * Native name: UIA_WindowIsTopmostPropertyId
     * @type {Integer (Int32)}
     */
    static WindowIsTopmostPropertyId => 30078

    /**
     * Native name: UIA_SelectionItemIsSelectedPropertyId
     * @type {Integer (Int32)}
     */
    static SelectionItemIsSelectedPropertyId => 30079

    /**
     * Native name: UIA_SelectionItemSelectionContainerPropertyId
     * @type {Integer (Int32)}
     */
    static SelectionItemSelectionContainerPropertyId => 30080

    /**
     * Native name: UIA_TableRowHeadersPropertyId
     * @type {Integer (Int32)}
     */
    static TableRowHeadersPropertyId => 30081

    /**
     * Native name: UIA_TableColumnHeadersPropertyId
     * @type {Integer (Int32)}
     */
    static TableColumnHeadersPropertyId => 30082

    /**
     * Native name: UIA_TableRowOrColumnMajorPropertyId
     * @type {Integer (Int32)}
     */
    static TableRowOrColumnMajorPropertyId => 30083

    /**
     * Native name: UIA_TableItemRowHeaderItemsPropertyId
     * @type {Integer (Int32)}
     */
    static TableItemRowHeaderItemsPropertyId => 30084

    /**
     * Native name: UIA_TableItemColumnHeaderItemsPropertyId
     * @type {Integer (Int32)}
     */
    static TableItemColumnHeaderItemsPropertyId => 30085

    /**
     * Native name: UIA_ToggleToggleStatePropertyId
     * @type {Integer (Int32)}
     */
    static ToggleToggleStatePropertyId => 30086

    /**
     * Native name: UIA_TransformCanMovePropertyId
     * @type {Integer (Int32)}
     */
    static TransformCanMovePropertyId => 30087

    /**
     * Native name: UIA_TransformCanResizePropertyId
     * @type {Integer (Int32)}
     */
    static TransformCanResizePropertyId => 30088

    /**
     * Native name: UIA_TransformCanRotatePropertyId
     * @type {Integer (Int32)}
     */
    static TransformCanRotatePropertyId => 30089

    /**
     * Native name: UIA_IsLegacyIAccessiblePatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsLegacyIAccessiblePatternAvailablePropertyId => 30090

    /**
     * Native name: UIA_LegacyIAccessibleChildIdPropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleChildIdPropertyId => 30091

    /**
     * Native name: UIA_LegacyIAccessibleNamePropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleNamePropertyId => 30092

    /**
     * Native name: UIA_LegacyIAccessibleValuePropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleValuePropertyId => 30093

    /**
     * Native name: UIA_LegacyIAccessibleDescriptionPropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleDescriptionPropertyId => 30094

    /**
     * Native name: UIA_LegacyIAccessibleRolePropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleRolePropertyId => 30095

    /**
     * Native name: UIA_LegacyIAccessibleStatePropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleStatePropertyId => 30096

    /**
     * Native name: UIA_LegacyIAccessibleHelpPropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleHelpPropertyId => 30097

    /**
     * Native name: UIA_LegacyIAccessibleKeyboardShortcutPropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleKeyboardShortcutPropertyId => 30098

    /**
     * Native name: UIA_LegacyIAccessibleSelectionPropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleSelectionPropertyId => 30099

    /**
     * Native name: UIA_LegacyIAccessibleDefaultActionPropertyId
     * @type {Integer (Int32)}
     */
    static LegacyIAccessibleDefaultActionPropertyId => 30100

    /**
     * Native name: UIA_AriaRolePropertyId
     * @type {Integer (Int32)}
     */
    static AriaRolePropertyId => 30101

    /**
     * Native name: UIA_AriaPropertiesPropertyId
     * @type {Integer (Int32)}
     */
    static AriaPropertiesPropertyId => 30102

    /**
     * Native name: UIA_IsDataValidForFormPropertyId
     * @type {Integer (Int32)}
     */
    static IsDataValidForFormPropertyId => 30103

    /**
     * Native name: UIA_ControllerForPropertyId
     * @type {Integer (Int32)}
     */
    static ControllerForPropertyId => 30104

    /**
     * Native name: UIA_DescribedByPropertyId
     * @type {Integer (Int32)}
     */
    static DescribedByPropertyId => 30105

    /**
     * Native name: UIA_FlowsToPropertyId
     * @type {Integer (Int32)}
     */
    static FlowsToPropertyId => 30106

    /**
     * Native name: UIA_ProviderDescriptionPropertyId
     * @type {Integer (Int32)}
     */
    static ProviderDescriptionPropertyId => 30107

    /**
     * Native name: UIA_IsItemContainerPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsItemContainerPatternAvailablePropertyId => 30108

    /**
     * Native name: UIA_IsVirtualizedItemPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsVirtualizedItemPatternAvailablePropertyId => 30109

    /**
     * Native name: UIA_IsSynchronizedInputPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsSynchronizedInputPatternAvailablePropertyId => 30110

    /**
     * Native name: UIA_OptimizeForVisualContentPropertyId
     * @type {Integer (Int32)}
     */
    static OptimizeForVisualContentPropertyId => 30111

    /**
     * Native name: UIA_IsObjectModelPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsObjectModelPatternAvailablePropertyId => 30112

    /**
     * Native name: UIA_AnnotationAnnotationTypeIdPropertyId
     * @type {Integer (Int32)}
     */
    static AnnotationAnnotationTypeIdPropertyId => 30113

    /**
     * Native name: UIA_AnnotationAnnotationTypeNamePropertyId
     * @type {Integer (Int32)}
     */
    static AnnotationAnnotationTypeNamePropertyId => 30114

    /**
     * Native name: UIA_AnnotationAuthorPropertyId
     * @type {Integer (Int32)}
     */
    static AnnotationAuthorPropertyId => 30115

    /**
     * Native name: UIA_AnnotationDateTimePropertyId
     * @type {Integer (Int32)}
     */
    static AnnotationDateTimePropertyId => 30116

    /**
     * Native name: UIA_AnnotationTargetPropertyId
     * @type {Integer (Int32)}
     */
    static AnnotationTargetPropertyId => 30117

    /**
     * Native name: UIA_IsAnnotationPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsAnnotationPatternAvailablePropertyId => 30118

    /**
     * Native name: UIA_IsTextPattern2AvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTextPattern2AvailablePropertyId => 30119

    /**
     * Native name: UIA_StylesStyleIdPropertyId
     * @type {Integer (Int32)}
     */
    static StylesStyleIdPropertyId => 30120

    /**
     * Native name: UIA_StylesStyleNamePropertyId
     * @type {Integer (Int32)}
     */
    static StylesStyleNamePropertyId => 30121

    /**
     * Native name: UIA_StylesFillColorPropertyId
     * @type {Integer (Int32)}
     */
    static StylesFillColorPropertyId => 30122

    /**
     * Native name: UIA_StylesFillPatternStylePropertyId
     * @type {Integer (Int32)}
     */
    static StylesFillPatternStylePropertyId => 30123

    /**
     * Native name: UIA_StylesShapePropertyId
     * @type {Integer (Int32)}
     */
    static StylesShapePropertyId => 30124

    /**
     * Native name: UIA_StylesFillPatternColorPropertyId
     * @type {Integer (Int32)}
     */
    static StylesFillPatternColorPropertyId => 30125

    /**
     * Native name: UIA_StylesExtendedPropertiesPropertyId
     * @type {Integer (Int32)}
     */
    static StylesExtendedPropertiesPropertyId => 30126

    /**
     * Native name: UIA_IsStylesPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsStylesPatternAvailablePropertyId => 30127

    /**
     * Native name: UIA_IsSpreadsheetPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsSpreadsheetPatternAvailablePropertyId => 30128

    /**
     * Native name: UIA_SpreadsheetItemFormulaPropertyId
     * @type {Integer (Int32)}
     */
    static SpreadsheetItemFormulaPropertyId => 30129

    /**
     * Native name: UIA_SpreadsheetItemAnnotationObjectsPropertyId
     * @type {Integer (Int32)}
     */
    static SpreadsheetItemAnnotationObjectsPropertyId => 30130

    /**
     * Native name: UIA_SpreadsheetItemAnnotationTypesPropertyId
     * @type {Integer (Int32)}
     */
    static SpreadsheetItemAnnotationTypesPropertyId => 30131

    /**
     * Native name: UIA_IsSpreadsheetItemPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsSpreadsheetItemPatternAvailablePropertyId => 30132

    /**
     * Native name: UIA_Transform2CanZoomPropertyId
     * @type {Integer (Int32)}
     */
    static Transform2CanZoomPropertyId => 30133

    /**
     * Native name: UIA_IsTransformPattern2AvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTransformPattern2AvailablePropertyId => 30134

    /**
     * Native name: UIA_LiveSettingPropertyId
     * @type {Integer (Int32)}
     */
    static LiveSettingPropertyId => 30135

    /**
     * Native name: UIA_IsTextChildPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTextChildPatternAvailablePropertyId => 30136

    /**
     * Native name: UIA_IsDragPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsDragPatternAvailablePropertyId => 30137

    /**
     * Native name: UIA_DragIsGrabbedPropertyId
     * @type {Integer (Int32)}
     */
    static DragIsGrabbedPropertyId => 30138

    /**
     * Native name: UIA_DragDropEffectPropertyId
     * @type {Integer (Int32)}
     */
    static DragDropEffectPropertyId => 30139

    /**
     * Native name: UIA_DragDropEffectsPropertyId
     * @type {Integer (Int32)}
     */
    static DragDropEffectsPropertyId => 30140

    /**
     * Native name: UIA_IsDropTargetPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsDropTargetPatternAvailablePropertyId => 30141

    /**
     * Native name: UIA_DropTargetDropTargetEffectPropertyId
     * @type {Integer (Int32)}
     */
    static DropTargetDropTargetEffectPropertyId => 30142

    /**
     * Native name: UIA_DropTargetDropTargetEffectsPropertyId
     * @type {Integer (Int32)}
     */
    static DropTargetDropTargetEffectsPropertyId => 30143

    /**
     * Native name: UIA_DragGrabbedItemsPropertyId
     * @type {Integer (Int32)}
     */
    static DragGrabbedItemsPropertyId => 30144

    /**
     * Native name: UIA_Transform2ZoomLevelPropertyId
     * @type {Integer (Int32)}
     */
    static Transform2ZoomLevelPropertyId => 30145

    /**
     * Native name: UIA_Transform2ZoomMinimumPropertyId
     * @type {Integer (Int32)}
     */
    static Transform2ZoomMinimumPropertyId => 30146

    /**
     * Native name: UIA_Transform2ZoomMaximumPropertyId
     * @type {Integer (Int32)}
     */
    static Transform2ZoomMaximumPropertyId => 30147

    /**
     * Native name: UIA_FlowsFromPropertyId
     * @type {Integer (Int32)}
     */
    static FlowsFromPropertyId => 30148

    /**
     * Native name: UIA_IsTextEditPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsTextEditPatternAvailablePropertyId => 30149

    /**
     * Native name: UIA_IsPeripheralPropertyId
     * @type {Integer (Int32)}
     */
    static IsPeripheralPropertyId => 30150

    /**
     * Native name: UIA_IsCustomNavigationPatternAvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsCustomNavigationPatternAvailablePropertyId => 30151

    /**
     * Native name: UIA_PositionInSetPropertyId
     * @type {Integer (Int32)}
     */
    static PositionInSetPropertyId => 30152

    /**
     * Native name: UIA_SizeOfSetPropertyId
     * @type {Integer (Int32)}
     */
    static SizeOfSetPropertyId => 30153

    /**
     * Native name: UIA_LevelPropertyId
     * @type {Integer (Int32)}
     */
    static LevelPropertyId => 30154

    /**
     * Native name: UIA_AnnotationTypesPropertyId
     * @type {Integer (Int32)}
     */
    static AnnotationTypesPropertyId => 30155

    /**
     * Native name: UIA_AnnotationObjectsPropertyId
     * @type {Integer (Int32)}
     */
    static AnnotationObjectsPropertyId => 30156

    /**
     * Native name: UIA_LandmarkTypePropertyId
     * @type {Integer (Int32)}
     */
    static LandmarkTypePropertyId => 30157

    /**
     * Native name: UIA_LocalizedLandmarkTypePropertyId
     * @type {Integer (Int32)}
     */
    static LocalizedLandmarkTypePropertyId => 30158

    /**
     * Native name: UIA_FullDescriptionPropertyId
     * @type {Integer (Int32)}
     */
    static FullDescriptionPropertyId => 30159

    /**
     * Native name: UIA_FillColorPropertyId
     * @type {Integer (Int32)}
     */
    static FillColorPropertyId => 30160

    /**
     * Native name: UIA_OutlineColorPropertyId
     * @type {Integer (Int32)}
     */
    static OutlineColorPropertyId => 30161

    /**
     * Native name: UIA_FillTypePropertyId
     * @type {Integer (Int32)}
     */
    static FillTypePropertyId => 30162

    /**
     * Native name: UIA_VisualEffectsPropertyId
     * @type {Integer (Int32)}
     */
    static VisualEffectsPropertyId => 30163

    /**
     * Native name: UIA_OutlineThicknessPropertyId
     * @type {Integer (Int32)}
     */
    static OutlineThicknessPropertyId => 30164

    /**
     * Native name: UIA_CenterPointPropertyId
     * @type {Integer (Int32)}
     */
    static CenterPointPropertyId => 30165

    /**
     * Native name: UIA_RotationPropertyId
     * @type {Integer (Int32)}
     */
    static RotationPropertyId => 30166

    /**
     * Native name: UIA_SizePropertyId
     * @type {Integer (Int32)}
     */
    static SizePropertyId => 30167

    /**
     * Native name: UIA_IsSelectionPattern2AvailablePropertyId
     * @type {Integer (Int32)}
     */
    static IsSelectionPattern2AvailablePropertyId => 30168

    /**
     * Native name: UIA_Selection2FirstSelectedItemPropertyId
     * @type {Integer (Int32)}
     */
    static Selection2FirstSelectedItemPropertyId => 30169

    /**
     * Native name: UIA_Selection2LastSelectedItemPropertyId
     * @type {Integer (Int32)}
     */
    static Selection2LastSelectedItemPropertyId => 30170

    /**
     * Native name: UIA_Selection2CurrentSelectedItemPropertyId
     * @type {Integer (Int32)}
     */
    static Selection2CurrentSelectedItemPropertyId => 30171

    /**
     * Native name: UIA_Selection2ItemCountPropertyId
     * @type {Integer (Int32)}
     */
    static Selection2ItemCountPropertyId => 30172

    /**
     * Native name: UIA_HeadingLevelPropertyId
     * @type {Integer (Int32)}
     */
    static HeadingLevelPropertyId => 30173

    /**
     * Native name: UIA_IsDialogPropertyId
     * @type {Integer (Int32)}
     */
    static IsDialogPropertyId => 30174
}
