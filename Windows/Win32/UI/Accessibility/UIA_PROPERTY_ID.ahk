#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UIA_PROPERTY_ID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UIA_RuntimeIdPropertyId => 30000

    /**
     * @type {Integer (Int32)}
     */
    static UIA_BoundingRectanglePropertyId => 30001

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ProcessIdPropertyId => 30002

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ControlTypePropertyId => 30003

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LocalizedControlTypePropertyId => 30004

    /**
     * @type {Integer (Int32)}
     */
    static UIA_NamePropertyId => 30005

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AcceleratorKeyPropertyId => 30006

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AccessKeyPropertyId => 30007

    /**
     * @type {Integer (Int32)}
     */
    static UIA_HasKeyboardFocusPropertyId => 30008

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsKeyboardFocusablePropertyId => 30009

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsEnabledPropertyId => 30010

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AutomationIdPropertyId => 30011

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ClassNamePropertyId => 30012

    /**
     * @type {Integer (Int32)}
     */
    static UIA_HelpTextPropertyId => 30013

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ClickablePointPropertyId => 30014

    /**
     * @type {Integer (Int32)}
     */
    static UIA_CulturePropertyId => 30015

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsControlElementPropertyId => 30016

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsContentElementPropertyId => 30017

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LabeledByPropertyId => 30018

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsPasswordPropertyId => 30019

    /**
     * @type {Integer (Int32)}
     */
    static UIA_NativeWindowHandlePropertyId => 30020

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ItemTypePropertyId => 30021

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsOffscreenPropertyId => 30022

    /**
     * @type {Integer (Int32)}
     */
    static UIA_OrientationPropertyId => 30023

    /**
     * @type {Integer (Int32)}
     */
    static UIA_FrameworkIdPropertyId => 30024

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsRequiredForFormPropertyId => 30025

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ItemStatusPropertyId => 30026

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsDockPatternAvailablePropertyId => 30027

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsExpandCollapsePatternAvailablePropertyId => 30028

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsGridItemPatternAvailablePropertyId => 30029

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsGridPatternAvailablePropertyId => 30030

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsInvokePatternAvailablePropertyId => 30031

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsMultipleViewPatternAvailablePropertyId => 30032

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsRangeValuePatternAvailablePropertyId => 30033

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsScrollPatternAvailablePropertyId => 30034

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsScrollItemPatternAvailablePropertyId => 30035

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsSelectionItemPatternAvailablePropertyId => 30036

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsSelectionPatternAvailablePropertyId => 30037

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTablePatternAvailablePropertyId => 30038

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTableItemPatternAvailablePropertyId => 30039

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTextPatternAvailablePropertyId => 30040

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTogglePatternAvailablePropertyId => 30041

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTransformPatternAvailablePropertyId => 30042

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsValuePatternAvailablePropertyId => 30043

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsWindowPatternAvailablePropertyId => 30044

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ValueValuePropertyId => 30045

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ValueIsReadOnlyPropertyId => 30046

    /**
     * @type {Integer (Int32)}
     */
    static UIA_RangeValueValuePropertyId => 30047

    /**
     * @type {Integer (Int32)}
     */
    static UIA_RangeValueIsReadOnlyPropertyId => 30048

    /**
     * @type {Integer (Int32)}
     */
    static UIA_RangeValueMinimumPropertyId => 30049

    /**
     * @type {Integer (Int32)}
     */
    static UIA_RangeValueMaximumPropertyId => 30050

    /**
     * @type {Integer (Int32)}
     */
    static UIA_RangeValueLargeChangePropertyId => 30051

    /**
     * @type {Integer (Int32)}
     */
    static UIA_RangeValueSmallChangePropertyId => 30052

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ScrollHorizontalScrollPercentPropertyId => 30053

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ScrollHorizontalViewSizePropertyId => 30054

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ScrollVerticalScrollPercentPropertyId => 30055

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ScrollVerticalViewSizePropertyId => 30056

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ScrollHorizontallyScrollablePropertyId => 30057

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ScrollVerticallyScrollablePropertyId => 30058

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SelectionSelectionPropertyId => 30059

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SelectionCanSelectMultiplePropertyId => 30060

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SelectionIsSelectionRequiredPropertyId => 30061

    /**
     * @type {Integer (Int32)}
     */
    static UIA_GridRowCountPropertyId => 30062

    /**
     * @type {Integer (Int32)}
     */
    static UIA_GridColumnCountPropertyId => 30063

    /**
     * @type {Integer (Int32)}
     */
    static UIA_GridItemRowPropertyId => 30064

    /**
     * @type {Integer (Int32)}
     */
    static UIA_GridItemColumnPropertyId => 30065

    /**
     * @type {Integer (Int32)}
     */
    static UIA_GridItemRowSpanPropertyId => 30066

    /**
     * @type {Integer (Int32)}
     */
    static UIA_GridItemColumnSpanPropertyId => 30067

    /**
     * @type {Integer (Int32)}
     */
    static UIA_GridItemContainingGridPropertyId => 30068

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DockDockPositionPropertyId => 30069

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ExpandCollapseExpandCollapseStatePropertyId => 30070

    /**
     * @type {Integer (Int32)}
     */
    static UIA_MultipleViewCurrentViewPropertyId => 30071

    /**
     * @type {Integer (Int32)}
     */
    static UIA_MultipleViewSupportedViewsPropertyId => 30072

    /**
     * @type {Integer (Int32)}
     */
    static UIA_WindowCanMaximizePropertyId => 30073

    /**
     * @type {Integer (Int32)}
     */
    static UIA_WindowCanMinimizePropertyId => 30074

    /**
     * @type {Integer (Int32)}
     */
    static UIA_WindowWindowVisualStatePropertyId => 30075

    /**
     * @type {Integer (Int32)}
     */
    static UIA_WindowWindowInteractionStatePropertyId => 30076

    /**
     * @type {Integer (Int32)}
     */
    static UIA_WindowIsModalPropertyId => 30077

    /**
     * @type {Integer (Int32)}
     */
    static UIA_WindowIsTopmostPropertyId => 30078

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SelectionItemIsSelectedPropertyId => 30079

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SelectionItemSelectionContainerPropertyId => 30080

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TableRowHeadersPropertyId => 30081

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TableColumnHeadersPropertyId => 30082

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TableRowOrColumnMajorPropertyId => 30083

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TableItemRowHeaderItemsPropertyId => 30084

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TableItemColumnHeaderItemsPropertyId => 30085

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ToggleToggleStatePropertyId => 30086

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TransformCanMovePropertyId => 30087

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TransformCanResizePropertyId => 30088

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TransformCanRotatePropertyId => 30089

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsLegacyIAccessiblePatternAvailablePropertyId => 30090

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleChildIdPropertyId => 30091

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleNamePropertyId => 30092

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleValuePropertyId => 30093

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleDescriptionPropertyId => 30094

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleRolePropertyId => 30095

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleStatePropertyId => 30096

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleHelpPropertyId => 30097

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleKeyboardShortcutPropertyId => 30098

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleSelectionPropertyId => 30099

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LegacyIAccessibleDefaultActionPropertyId => 30100

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AriaRolePropertyId => 30101

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AriaPropertiesPropertyId => 30102

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsDataValidForFormPropertyId => 30103

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ControllerForPropertyId => 30104

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DescribedByPropertyId => 30105

    /**
     * @type {Integer (Int32)}
     */
    static UIA_FlowsToPropertyId => 30106

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ProviderDescriptionPropertyId => 30107

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsItemContainerPatternAvailablePropertyId => 30108

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsVirtualizedItemPatternAvailablePropertyId => 30109

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsSynchronizedInputPatternAvailablePropertyId => 30110

    /**
     * @type {Integer (Int32)}
     */
    static UIA_OptimizeForVisualContentPropertyId => 30111

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsObjectModelPatternAvailablePropertyId => 30112

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AnnotationAnnotationTypeIdPropertyId => 30113

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AnnotationAnnotationTypeNamePropertyId => 30114

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AnnotationAuthorPropertyId => 30115

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AnnotationDateTimePropertyId => 30116

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AnnotationTargetPropertyId => 30117

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsAnnotationPatternAvailablePropertyId => 30118

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTextPattern2AvailablePropertyId => 30119

    /**
     * @type {Integer (Int32)}
     */
    static UIA_StylesStyleIdPropertyId => 30120

    /**
     * @type {Integer (Int32)}
     */
    static UIA_StylesStyleNamePropertyId => 30121

    /**
     * @type {Integer (Int32)}
     */
    static UIA_StylesFillColorPropertyId => 30122

    /**
     * @type {Integer (Int32)}
     */
    static UIA_StylesFillPatternStylePropertyId => 30123

    /**
     * @type {Integer (Int32)}
     */
    static UIA_StylesShapePropertyId => 30124

    /**
     * @type {Integer (Int32)}
     */
    static UIA_StylesFillPatternColorPropertyId => 30125

    /**
     * @type {Integer (Int32)}
     */
    static UIA_StylesExtendedPropertiesPropertyId => 30126

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsStylesPatternAvailablePropertyId => 30127

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsSpreadsheetPatternAvailablePropertyId => 30128

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SpreadsheetItemFormulaPropertyId => 30129

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SpreadsheetItemAnnotationObjectsPropertyId => 30130

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SpreadsheetItemAnnotationTypesPropertyId => 30131

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsSpreadsheetItemPatternAvailablePropertyId => 30132

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Transform2CanZoomPropertyId => 30133

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTransformPattern2AvailablePropertyId => 30134

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LiveSettingPropertyId => 30135

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTextChildPatternAvailablePropertyId => 30136

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsDragPatternAvailablePropertyId => 30137

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DragIsGrabbedPropertyId => 30138

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DragDropEffectPropertyId => 30139

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DragDropEffectsPropertyId => 30140

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsDropTargetPatternAvailablePropertyId => 30141

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DropTargetDropTargetEffectPropertyId => 30142

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DropTargetDropTargetEffectsPropertyId => 30143

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DragGrabbedItemsPropertyId => 30144

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Transform2ZoomLevelPropertyId => 30145

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Transform2ZoomMinimumPropertyId => 30146

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Transform2ZoomMaximumPropertyId => 30147

    /**
     * @type {Integer (Int32)}
     */
    static UIA_FlowsFromPropertyId => 30148

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsTextEditPatternAvailablePropertyId => 30149

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsPeripheralPropertyId => 30150

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsCustomNavigationPatternAvailablePropertyId => 30151

    /**
     * @type {Integer (Int32)}
     */
    static UIA_PositionInSetPropertyId => 30152

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SizeOfSetPropertyId => 30153

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LevelPropertyId => 30154

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AnnotationTypesPropertyId => 30155

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AnnotationObjectsPropertyId => 30156

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LandmarkTypePropertyId => 30157

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LocalizedLandmarkTypePropertyId => 30158

    /**
     * @type {Integer (Int32)}
     */
    static UIA_FullDescriptionPropertyId => 30159

    /**
     * @type {Integer (Int32)}
     */
    static UIA_FillColorPropertyId => 30160

    /**
     * @type {Integer (Int32)}
     */
    static UIA_OutlineColorPropertyId => 30161

    /**
     * @type {Integer (Int32)}
     */
    static UIA_FillTypePropertyId => 30162

    /**
     * @type {Integer (Int32)}
     */
    static UIA_VisualEffectsPropertyId => 30163

    /**
     * @type {Integer (Int32)}
     */
    static UIA_OutlineThicknessPropertyId => 30164

    /**
     * @type {Integer (Int32)}
     */
    static UIA_CenterPointPropertyId => 30165

    /**
     * @type {Integer (Int32)}
     */
    static UIA_RotationPropertyId => 30166

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SizePropertyId => 30167

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsSelectionPattern2AvailablePropertyId => 30168

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Selection2FirstSelectedItemPropertyId => 30169

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Selection2LastSelectedItemPropertyId => 30170

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Selection2CurrentSelectedItemPropertyId => 30171

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Selection2ItemCountPropertyId => 30172

    /**
     * @type {Integer (Int32)}
     */
    static UIA_HeadingLevelPropertyId => 30173

    /**
     * @type {Integer (Int32)}
     */
    static UIA_IsDialogPropertyId => 30174
}
