#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Enum that lists all the supported properties in [XamlDirect](windows_ui_xaml_core_direct.md).
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Core.Direct.XamlPropertyIndex](/windows/winui/api/microsoft.ui.xaml.core.direct.xamlpropertyindex) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamlpropertyindex
 * @namespace Windows.UI.Xaml.Core.Direct
 * @version WindowsRuntime 1.4
 */
class XamlPropertyIndex extends Win32Enum{

    /**
     * The _AcceleratorKey_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_AcceleratorKey => 5

    /**
     * The _AccessibilityView_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_AccessibilityView => 6

    /**
     * The _AccessKey_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_AccessKey => 7

    /**
     * The _AutomationId_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_AutomationId => 8

    /**
     * The _ControlledPeers_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_ControlledPeers => 9

    /**
     * The _HelpText_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_HelpText => 10

    /**
     * The _IsRequiredForForm_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_IsRequiredForForm => 11

    /**
     * The _ItemStatus_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_ItemStatus => 12

    /**
     * The _ItemType_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_ItemType => 13

    /**
     * The _LabeledBy_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_LabeledBy => 14

    /**
     * The _LiveSetting_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_LiveSetting => 15

    /**
     * The _Name_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_Name => 16

    /**
     * The _Placement_ property for the [ToolTipService](../windows.ui.xaml.controls/tooltipservice.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTipService_Placement => 24

    /**
     * The _PlacementTarget_ property for the [ToolTipService](../windows.ui.xaml.controls/tooltipservice.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTipService_PlacementTarget => 25

    /**
     * The _ToolTip_ property for the [ToolTipService](../windows.ui.xaml.controls/tooltipservice.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTipService_ToolTip => 26

    /**
     * The _AnnotationAlternates_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_AnnotationAlternates => 28

    /**
     * The _Capitals_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_Capitals => 29

    /**
     * The _CapitalSpacing_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_CapitalSpacing => 30

    /**
     * The _CaseSensitiveForms_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_CaseSensitiveForms => 31

    /**
     * The _ContextualAlternates_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_ContextualAlternates => 32

    /**
     * The _ContextualLigatures_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_ContextualLigatures => 33

    /**
     * The _ContextualSwashes_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_ContextualSwashes => 34

    /**
     * The _DiscretionaryLigatures_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_DiscretionaryLigatures => 35

    /**
     * The _EastAsianExpertForms_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_EastAsianExpertForms => 36

    /**
     * The _EastAsianLanguage_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_EastAsianLanguage => 37

    /**
     * The _EastAsianWidths_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_EastAsianWidths => 38

    /**
     * The _Fraction_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_Fraction => 39

    /**
     * The _HistoricalForms_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_HistoricalForms => 40

    /**
     * The _HistoricalLigatures_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_HistoricalLigatures => 41

    /**
     * The _Kerning_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_Kerning => 42

    /**
     * The _MathematicalGreek_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_MathematicalGreek => 43

    /**
     * The _NumeralAlignment_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_NumeralAlignment => 44

    /**
     * The _NumeralStyle_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_NumeralStyle => 45

    /**
     * The _SlashedZero_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_SlashedZero => 46

    /**
     * The _StandardLigatures_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StandardLigatures => 47

    /**
     * The _StandardSwashes_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StandardSwashes => 48

    /**
     * The _StylisticAlternates_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticAlternates => 49

    /**
     * The _StylisticSet1_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet1 => 50

    /**
     * The _StylisticSet10_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet10 => 51

    /**
     * The _StylisticSet11_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet11 => 52

    /**
     * The _StylisticSet12_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet12 => 53

    /**
     * The _StylisticSet13_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet13 => 54

    /**
     * The _StylisticSet14_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet14 => 55

    /**
     * The _StylisticSet15_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet15 => 56

    /**
     * The _StylisticSet16_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet16 => 57

    /**
     * The _StylisticSet17_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet17 => 58

    /**
     * The _StylisticSet18_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet18 => 59

    /**
     * The _StylisticSet19_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet19 => 60

    /**
     * The _StylisticSet2_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet2 => 61

    /**
     * The _StylisticSet20_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet20 => 62

    /**
     * The _StylisticSet3_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet3 => 63

    /**
     * The _StylisticSet4_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet4 => 64

    /**
     * The _StylisticSet5_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet5 => 65

    /**
     * The _StylisticSet6_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet6 => 66

    /**
     * The _StylisticSet7_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet7 => 67

    /**
     * The _StylisticSet8_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet8 => 68

    /**
     * The _StylisticSet9_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_StylisticSet9 => 69

    /**
     * The _Variants_ property for the [Typography](../windows.ui.xaml.documents/typography.md) type.
     * @type {Integer (Int32)}
     */
    static Typography_Variants => 70

    /**
     * The _EventsSource_ property for the [AutomationPeer](../windows.ui.xaml.automation.peers/automationpeer.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationPeer_EventsSource => 75

    /**
     * The _SelectedItem_ property for the [AutoSuggestBoxSuggestionChosenEventArgs](../windows.ui.xaml.controls/autosuggestboxsuggestionchoseneventargs.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBoxSuggestionChosenEventArgs_SelectedItem => 76

    /**
     * The _Reason_ property for the [AutoSuggestBoxTextChangedEventArgs](../windows.ui.xaml.controls/autosuggestboxtextchangedeventargs.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBoxTextChangedEventArgs_Reason => 77

    /**
     * The _Opacity_ property for the [Brush](../windows.ui.xaml.media/brush.md) type.
     * @type {Integer (Int32)}
     */
    static Brush_Opacity => 78

    /**
     * The _RelativeTransform_ property for the [Brush](../windows.ui.xaml.media/brush.md) type.
     * @type {Integer (Int32)}
     */
    static Brush_RelativeTransform => 79

    /**
     * The _Transform_ property for the [Brush](../windows.ui.xaml.media/brush.md) type.
     * @type {Integer (Int32)}
     */
    static Brush_Transform => 80

    /**
     * The _IsSourceGrouped_ property for the [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) type.
     * @type {Integer (Int32)}
     */
    static CollectionViewSource_IsSourceGrouped => 81

    /**
     * The _ItemsPath_ property for the [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) type.
     * @type {Integer (Int32)}
     */
    static CollectionViewSource_ItemsPath => 82

    /**
     * The _Source_ property for the [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) type.
     * @type {Integer (Int32)}
     */
    static CollectionViewSource_Source => 83

    /**
     * The _View_ property for the [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) type.
     * @type {Integer (Int32)}
     */
    static CollectionViewSource_View => 84

    /**
     * The _KeyTime_ property for the [ColorKeyFrame](../windows.ui.xaml.media.animation/colorkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static ColorKeyFrame_KeyTime => 90

    /**
     * The _Value_ property for the [ColorKeyFrame](../windows.ui.xaml.media.animation/colorkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static ColorKeyFrame_Value => 91

    /**
     * The _ActualWidth_ property for the [ColumnDefinition](../windows.ui.xaml.controls/columndefinition.md) type.
     * @type {Integer (Int32)}
     */
    static ColumnDefinition_ActualWidth => 92

    /**
     * The _MaxWidth_ property for the [ColumnDefinition](../windows.ui.xaml.controls/columndefinition.md) type.
     * @type {Integer (Int32)}
     */
    static ColumnDefinition_MaxWidth => 93

    /**
     * The _MinWidth_ property for the [ColumnDefinition](../windows.ui.xaml.controls/columndefinition.md) type.
     * @type {Integer (Int32)}
     */
    static ColumnDefinition_MinWidth => 94

    /**
     * The _Width_ property for the [ColumnDefinition](../windows.ui.xaml.controls/columndefinition.md) type.
     * @type {Integer (Int32)}
     */
    static ColumnDefinition_Width => 95

    /**
     * The _DropDownClosedHeight_ property for the [ComboBoxTemplateSettings](../windows.ui.xaml.controls.primitives/comboboxtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBoxTemplateSettings_DropDownClosedHeight => 96

    /**
     * The _DropDownOffset_ property for the [ComboBoxTemplateSettings](../windows.ui.xaml.controls.primitives/comboboxtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBoxTemplateSettings_DropDownOffset => 97

    /**
     * The _DropDownOpenedHeight_ property for the [ComboBoxTemplateSettings](../windows.ui.xaml.controls.primitives/comboboxtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBoxTemplateSettings_DropDownOpenedHeight => 98

    /**
     * The _SelectedItemDirection_ property for the [ComboBoxTemplateSettings](../windows.ui.xaml.controls.primitives/comboboxtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBoxTemplateSettings_SelectedItemDirection => 99

    /**
     * The _KeyTime_ property for the [DoubleKeyFrame](../windows.ui.xaml.media.animation/doublekeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleKeyFrame_KeyTime => 107

    /**
     * The _Value_ property for the [DoubleKeyFrame](../windows.ui.xaml.media.animation/doublekeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleKeyFrame_Value => 108

    /**
     * The _EasingMode_ property for the [EasingFunctionBase](../windows.ui.xaml.media.animation/easingfunctionbase.md) type.
     * @type {Integer (Int32)}
     */
    static EasingFunctionBase_EasingMode => 111

    /**
     * The _AttachedFlyout_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_AttachedFlyout => 114

    /**
     * The _Placement_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_Placement => 115

    /**
     * The _Bounds_ property for the [Geometry](../windows.ui.xaml.media/geometry.md) type.
     * @type {Integer (Int32)}
     */
    static Geometry_Bounds => 118

    /**
     * The _Transform_ property for the [Geometry](../windows.ui.xaml.media/geometry.md) type.
     * @type {Integer (Int32)}
     */
    static Geometry_Transform => 119

    /**
     * The _Color_ property for the [GradientStop](../windows.ui.xaml.media/gradientstop.md) type.
     * @type {Integer (Int32)}
     */
    static GradientStop_Color => 120

    /**
     * The _Offset_ property for the [GradientStop](../windows.ui.xaml.media/gradientstop.md) type.
     * @type {Integer (Int32)}
     */
    static GradientStop_Offset => 121

    /**
     * The _ContainerStyle_ property for the [GroupStyle](../windows.ui.xaml.controls/groupstyle.md) type.
     * @type {Integer (Int32)}
     */
    static GroupStyle_ContainerStyle => 124

    /**
     * The _ContainerStyleSelector_ property for the [GroupStyle](../windows.ui.xaml.controls/groupstyle.md) type.
     * @type {Integer (Int32)}
     */
    static GroupStyle_ContainerStyleSelector => 125

    /**
     * The _HeaderContainerStyle_ property for the [GroupStyle](../windows.ui.xaml.controls/groupstyle.md) type.
     * @type {Integer (Int32)}
     */
    static GroupStyle_HeaderContainerStyle => 126

    /**
     * The _HeaderTemplate_ property for the [GroupStyle](../windows.ui.xaml.controls/groupstyle.md) type.
     * @type {Integer (Int32)}
     */
    static GroupStyle_HeaderTemplate => 127

    /**
     * The _HeaderTemplateSelector_ property for the [GroupStyle](../windows.ui.xaml.controls/groupstyle.md) type.
     * @type {Integer (Int32)}
     */
    static GroupStyle_HeaderTemplateSelector => 128

    /**
     * The _HidesIfEmpty_ property for the [GroupStyle](../windows.ui.xaml.controls/groupstyle.md) type.
     * @type {Integer (Int32)}
     */
    static GroupStyle_HidesIfEmpty => 129

    /**
     * The _Panel_ property for the [GroupStyle](../windows.ui.xaml.controls/groupstyle.md) type.
     * @type {Integer (Int32)}
     */
    static GroupStyle_Panel => 130

    /**
     * The _DesiredDeceleration_ property for the [InertiaExpansionBehavior](../windows.ui.xaml.input/inertiaexpansionbehavior.md) type.
     * @type {Integer (Int32)}
     */
    static InertiaExpansionBehavior_DesiredDeceleration => 144

    /**
     * The _DesiredExpansion_ property for the [InertiaExpansionBehavior](../windows.ui.xaml.input/inertiaexpansionbehavior.md) type.
     * @type {Integer (Int32)}
     */
    static InertiaExpansionBehavior_DesiredExpansion => 145

    /**
     * The _DesiredDeceleration_ property for the [InertiaRotationBehavior](../windows.ui.xaml.input/inertiarotationbehavior.md) type.
     * @type {Integer (Int32)}
     */
    static InertiaRotationBehavior_DesiredDeceleration => 146

    /**
     * The _DesiredRotation_ property for the [InertiaRotationBehavior](../windows.ui.xaml.input/inertiarotationbehavior.md) type.
     * @type {Integer (Int32)}
     */
    static InertiaRotationBehavior_DesiredRotation => 147

    /**
     * The _DesiredDeceleration_ property for the [InertiaTranslationBehavior](../windows.ui.xaml.input/inertiatranslationbehavior.md) type.
     * @type {Integer (Int32)}
     */
    static InertiaTranslationBehavior_DesiredDeceleration => 148

    /**
     * The _DesiredDisplacement_ property for the [InertiaTranslationBehavior](../windows.ui.xaml.input/inertiatranslationbehavior.md) type.
     * @type {Integer (Int32)}
     */
    static InertiaTranslationBehavior_DesiredDisplacement => 149

    /**
     * The _Names_ property for the [InputScope](../windows.ui.xaml.input/inputscope.md) type.
     * @type {Integer (Int32)}
     */
    static InputScope_Names => 150

    /**
     * The _NameValue_ property for the [InputScopeName](../windows.ui.xaml.input/inputscopename.md) type.
     * @type {Integer (Int32)}
     */
    static InputScopeName_NameValue => 151

    /**
     * The _ControlPoint1_ property for the [KeySpline](../windows.ui.xaml.media.animation/keyspline.md) type.
     * @type {Integer (Int32)}
     */
    static KeySpline_ControlPoint1 => 153

    /**
     * The _ControlPoint2_ property for the [KeySpline](../windows.ui.xaml.media.animation/keyspline.md) type.
     * @type {Integer (Int32)}
     */
    static KeySpline_ControlPoint2 => 154

    /**
     * The _Center_ property for the [ManipulationPivot](../windows.ui.xaml.input/manipulationpivot.md) type.
     * @type {Integer (Int32)}
     */
    static ManipulationPivot_Center => 159

    /**
     * The _Radius_ property for the [ManipulationPivot](../windows.ui.xaml.input/manipulationpivot.md) type.
     * @type {Integer (Int32)}
     */
    static ManipulationPivot_Radius => 160

    /**
     * The _KeyTime_ property for the [ObjectKeyFrame](../windows.ui.xaml.media.animation/objectkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static ObjectKeyFrame_KeyTime => 183

    /**
     * The _Value_ property for the [ObjectKeyFrame](../windows.ui.xaml.media.animation/objectkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static ObjectKeyFrame_Value => 184

    /**
     * The _SourcePageType_ property for the [PageStackEntry](../windows.ui.xaml.navigation/pagestackentry.md) type.
     * @type {Integer (Int32)}
     */
    static PageStackEntry_SourcePageType => 185

    /**
     * The _IsClosed_ property for the [PathFigure](../windows.ui.xaml.media/pathfigure.md) type.
     * @type {Integer (Int32)}
     */
    static PathFigure_IsClosed => 192

    /**
     * The _IsFilled_ property for the [PathFigure](../windows.ui.xaml.media/pathfigure.md) type.
     * @type {Integer (Int32)}
     */
    static PathFigure_IsFilled => 193

    /**
     * The _Segments_ property for the [PathFigure](../windows.ui.xaml.media/pathfigure.md) type.
     * @type {Integer (Int32)}
     */
    static PathFigure_Segments => 194

    /**
     * The _StartPoint_ property for the [PathFigure](../windows.ui.xaml.media/pathfigure.md) type.
     * @type {Integer (Int32)}
     */
    static PathFigure_StartPoint => 195

    /**
     * The _IsInContact_ property for the [Pointer](../windows.ui.xaml.input/pointer.md) type.
     * @type {Integer (Int32)}
     */
    static Pointer_IsInContact => 199

    /**
     * The _IsInRange_ property for the [Pointer](../windows.ui.xaml.input/pointer.md) type.
     * @type {Integer (Int32)}
     */
    static Pointer_IsInRange => 200

    /**
     * The _PointerDeviceType_ property for the [Pointer](../windows.ui.xaml.input/pointer.md) type.
     * @type {Integer (Int32)}
     */
    static Pointer_PointerDeviceType => 201

    /**
     * The _PointerId_ property for the [Pointer](../windows.ui.xaml.input/pointer.md) type.
     * @type {Integer (Int32)}
     */
    static Pointer_PointerId => 202

    /**
     * The _KeyTime_ property for the [PointKeyFrame](../windows.ui.xaml.media.animation/pointkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static PointKeyFrame_KeyTime => 205

    /**
     * The _Value_ property for the [PointKeyFrame](../windows.ui.xaml.media.animation/pointkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static PointKeyFrame_Value => 206

    /**
     * The _DocumentSource_ property for the [PrintDocument](../windows.ui.xaml.printing/printdocument.md) type.
     * @type {Integer (Int32)}
     */
    static PrintDocument_DocumentSource => 209

    /**
     * The _ContainerAnimationEndPosition_ property for the [ProgressBarTemplateSettings](../windows.ui.xaml.controls.primitives/progressbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBarTemplateSettings_ContainerAnimationEndPosition => 211

    /**
     * The _ContainerAnimationStartPosition_ property for the [ProgressBarTemplateSettings](../windows.ui.xaml.controls.primitives/progressbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBarTemplateSettings_ContainerAnimationStartPosition => 212

    /**
     * The _EllipseAnimationEndPosition_ property for the [ProgressBarTemplateSettings](../windows.ui.xaml.controls.primitives/progressbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBarTemplateSettings_EllipseAnimationEndPosition => 213

    /**
     * The _EllipseAnimationWellPosition_ property for the [ProgressBarTemplateSettings](../windows.ui.xaml.controls.primitives/progressbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBarTemplateSettings_EllipseAnimationWellPosition => 214

    /**
     * The _EllipseDiameter_ property for the [ProgressBarTemplateSettings](../windows.ui.xaml.controls.primitives/progressbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBarTemplateSettings_EllipseDiameter => 215

    /**
     * The _EllipseOffset_ property for the [ProgressBarTemplateSettings](../windows.ui.xaml.controls.primitives/progressbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBarTemplateSettings_EllipseOffset => 216

    /**
     * The _IndicatorLengthDelta_ property for the [ProgressBarTemplateSettings](../windows.ui.xaml.controls.primitives/progressbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBarTemplateSettings_IndicatorLengthDelta => 217

    /**
     * The _EllipseDiameter_ property for the [ProgressRingTemplateSettings](../windows.ui.xaml.controls.primitives/progressringtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressRingTemplateSettings_EllipseDiameter => 218

    /**
     * The _EllipseOffset_ property for the [ProgressRingTemplateSettings](../windows.ui.xaml.controls.primitives/progressringtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressRingTemplateSettings_EllipseOffset => 219

    /**
     * The _MaxSideLength_ property for the [ProgressRingTemplateSettings](../windows.ui.xaml.controls.primitives/progressringtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressRingTemplateSettings_MaxSideLength => 220

    /**
     * The _Path_ property for the [PropertyPath](../windows.ui.xaml/propertypath.md) type.
     * @type {Integer (Int32)}
     */
    static PropertyPath_Path => 221

    /**
     * The _ActualHeight_ property for the [RowDefinition](../windows.ui.xaml.controls/rowdefinition.md) type.
     * @type {Integer (Int32)}
     */
    static RowDefinition_ActualHeight => 226

    /**
     * The _Height_ property for the [RowDefinition](../windows.ui.xaml.controls/rowdefinition.md) type.
     * @type {Integer (Int32)}
     */
    static RowDefinition_Height => 227

    /**
     * The _MaxHeight_ property for the [RowDefinition](../windows.ui.xaml.controls/rowdefinition.md) type.
     * @type {Integer (Int32)}
     */
    static RowDefinition_MaxHeight => 228

    /**
     * The _MinHeight_ property for the [RowDefinition](../windows.ui.xaml.controls/rowdefinition.md) type.
     * @type {Integer (Int32)}
     */
    static RowDefinition_MinHeight => 229

    /**
     * The _IsSealed_ property for the [SetterBase](../windows.ui.xaml/setterbase.md) type.
     * @type {Integer (Int32)}
     */
    static SetterBase_IsSealed => 233

    /**
     * The _BorderBrush_ property for the [SettingsFlyoutTemplateSettings](../windows.ui.xaml.controls.primitives/settingsflyouttemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyoutTemplateSettings_BorderBrush => 234

    /**
     * The _BorderThickness_ property for the [SettingsFlyoutTemplateSettings](../windows.ui.xaml.controls.primitives/settingsflyouttemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyoutTemplateSettings_BorderThickness => 235

    /**
     * The _ContentTransitions_ property for the [SettingsFlyoutTemplateSettings](../windows.ui.xaml.controls.primitives/settingsflyouttemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyoutTemplateSettings_ContentTransitions => 236

    /**
     * The _HeaderBackground_ property for the [SettingsFlyoutTemplateSettings](../windows.ui.xaml.controls.primitives/settingsflyouttemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyoutTemplateSettings_HeaderBackground => 237

    /**
     * The _HeaderForeground_ property for the [SettingsFlyoutTemplateSettings](../windows.ui.xaml.controls.primitives/settingsflyouttemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyoutTemplateSettings_HeaderForeground => 238

    /**
     * The _IconSource_ property for the [SettingsFlyoutTemplateSettings](../windows.ui.xaml.controls.primitives/settingsflyouttemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyoutTemplateSettings_IconSource => 239

    /**
     * The _BasedOn_ property for the [Style](../windows.ui.xaml/style.md) type.
     * @type {Integer (Int32)}
     */
    static Style_BasedOn => 244

    /**
     * The _IsSealed_ property for the [Style](../windows.ui.xaml/style.md) type.
     * @type {Integer (Int32)}
     */
    static Style_IsSealed => 245

    /**
     * The _Setters_ property for the [Style](../windows.ui.xaml/style.md) type.
     * @type {Integer (Int32)}
     */
    static Style_Setters => 246

    /**
     * The _TargetType_ property for the [Style](../windows.ui.xaml/style.md) type.
     * @type {Integer (Int32)}
     */
    static Style_TargetType => 247

    /**
     * The _CharacterSpacing_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_CharacterSpacing => 249

    /**
     * The _FontFamily_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_FontFamily => 250

    /**
     * The _FontSize_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_FontSize => 251

    /**
     * The _FontStretch_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_FontStretch => 252

    /**
     * The _FontStyle_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_FontStyle => 253

    /**
     * The _FontWeight_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_FontWeight => 254

    /**
     * The _Foreground_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_Foreground => 255

    /**
     * The _IsTextScaleFactorEnabled_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_IsTextScaleFactorEnabled => 256

    /**
     * The _Language_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_Language => 257

    /**
     * The _AutoReverse_ property for the [Timeline](../windows.ui.xaml.media.animation/timeline.md) type.
     * @type {Integer (Int32)}
     */
    static Timeline_AutoReverse => 263

    /**
     * The _BeginTime_ property for the [Timeline](../windows.ui.xaml.media.animation/timeline.md) type.
     * @type {Integer (Int32)}
     */
    static Timeline_BeginTime => 264

    /**
     * The _Duration_ property for the [Timeline](../windows.ui.xaml.media.animation/timeline.md) type.
     * @type {Integer (Int32)}
     */
    static Timeline_Duration => 265

    /**
     * The _FillBehavior_ property for the [Timeline](../windows.ui.xaml.media.animation/timeline.md) type.
     * @type {Integer (Int32)}
     */
    static Timeline_FillBehavior => 266

    /**
     * The _RepeatBehavior_ property for the [Timeline](../windows.ui.xaml.media.animation/timeline.md) type.
     * @type {Integer (Int32)}
     */
    static Timeline_RepeatBehavior => 267

    /**
     * The _SpeedRatio_ property for the [Timeline](../windows.ui.xaml.media.animation/timeline.md) type.
     * @type {Integer (Int32)}
     */
    static Timeline_SpeedRatio => 268

    /**
     * The _Text_ property for the [TimelineMarker](../windows.ui.xaml.media/timelinemarker.md) type.
     * @type {Integer (Int32)}
     */
    static TimelineMarker_Text => 269

    /**
     * The _Time_ property for the [TimelineMarker](../windows.ui.xaml.media/timelinemarker.md) type.
     * @type {Integer (Int32)}
     */
    static TimelineMarker_Time => 270

    /**
     * The _Type_ property for the [TimelineMarker](../windows.ui.xaml.media/timelinemarker.md) type.
     * @type {Integer (Int32)}
     */
    static TimelineMarker_Type => 271

    /**
     * The _CurtainCurrentToOffOffset_ property for the [ToggleSwitchTemplateSettings](../windows.ui.xaml.controls.primitives/toggleswitchtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitchTemplateSettings_CurtainCurrentToOffOffset => 273

    /**
     * The _CurtainCurrentToOnOffset_ property for the [ToggleSwitchTemplateSettings](../windows.ui.xaml.controls.primitives/toggleswitchtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitchTemplateSettings_CurtainCurrentToOnOffset => 274

    /**
     * The _CurtainOffToOnOffset_ property for the [ToggleSwitchTemplateSettings](../windows.ui.xaml.controls.primitives/toggleswitchtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitchTemplateSettings_CurtainOffToOnOffset => 275

    /**
     * The _CurtainOnToOffOffset_ property for the [ToggleSwitchTemplateSettings](../windows.ui.xaml.controls.primitives/toggleswitchtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitchTemplateSettings_CurtainOnToOffOffset => 276

    /**
     * The _KnobCurrentToOffOffset_ property for the [ToggleSwitchTemplateSettings](../windows.ui.xaml.controls.primitives/toggleswitchtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitchTemplateSettings_KnobCurrentToOffOffset => 277

    /**
     * The _KnobCurrentToOnOffset_ property for the [ToggleSwitchTemplateSettings](../windows.ui.xaml.controls.primitives/toggleswitchtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitchTemplateSettings_KnobCurrentToOnOffset => 278

    /**
     * The _KnobOffToOnOffset_ property for the [ToggleSwitchTemplateSettings](../windows.ui.xaml.controls.primitives/toggleswitchtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitchTemplateSettings_KnobOffToOnOffset => 279

    /**
     * The _KnobOnToOffOffset_ property for the [ToggleSwitchTemplateSettings](../windows.ui.xaml.controls.primitives/toggleswitchtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitchTemplateSettings_KnobOnToOffOffset => 280

    /**
     * The _FromHorizontalOffset_ property for the [ToolTipTemplateSettings](../windows.ui.xaml.controls.primitives/tooltiptemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTipTemplateSettings_FromHorizontalOffset => 281

    /**
     * The _FromVerticalOffset_ property for the [ToolTipTemplateSettings](../windows.ui.xaml.controls.primitives/tooltiptemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTipTemplateSettings_FromVerticalOffset => 282

    /**
     * The _AllowDrop_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_AllowDrop => 292

    /**
     * The _CacheMode_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_CacheMode => 293

    /**
     * The _Clip_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Clip => 295

    /**
     * The _CompositeMode_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_CompositeMode => 296

    /**
     * The _IsDoubleTapEnabled_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_IsDoubleTapEnabled => 297

    /**
     * The _IsHitTestVisible_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_IsHitTestVisible => 298

    /**
     * The _IsHoldingEnabled_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_IsHoldingEnabled => 299

    /**
     * The _IsRightTapEnabled_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_IsRightTapEnabled => 300

    /**
     * The _IsTapEnabled_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_IsTapEnabled => 301

    /**
     * The _ManipulationMode_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ManipulationMode => 302

    /**
     * The _Opacity_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Opacity => 303

    /**
     * The _PointerCaptures_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerCaptures => 304

    /**
     * The _Projection_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Projection => 305

    /**
     * The _RenderSize_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_RenderSize => 306

    /**
     * The _RenderTransform_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_RenderTransform => 307

    /**
     * The _RenderTransformOrigin_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_RenderTransformOrigin => 308

    /**
     * The _Transitions_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Transitions => 309

    /**
     * The _UseLayoutRounding_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_UseLayoutRounding => 311

    /**
     * The _Visibility_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Visibility => 312

    /**
     * The _Storyboard_ property for the [VisualState](../windows.ui.xaml/visualstate.md) type.
     * @type {Integer (Int32)}
     */
    static VisualState_Storyboard => 322

    /**
     * The _States_ property for the [VisualStateGroup](../windows.ui.xaml/visualstategroup.md) type.
     * @type {Integer (Int32)}
     */
    static VisualStateGroup_States => 323

    /**
     * The _Transitions_ property for the [VisualStateGroup](../windows.ui.xaml/visualstategroup.md) type.
     * @type {Integer (Int32)}
     */
    static VisualStateGroup_Transitions => 324

    /**
     * The _CustomVisualStateManager_ property for the [VisualStateManager](../windows.ui.xaml/visualstatemanager.md) type.
     * @type {Integer (Int32)}
     */
    static VisualStateManager_CustomVisualStateManager => 325

    /**
     * The _VisualStateGroups_ property for the [VisualStateManager](../windows.ui.xaml/visualstatemanager.md) type.
     * @type {Integer (Int32)}
     */
    static VisualStateManager_VisualStateGroups => 326

    /**
     * The _From_ property for the [VisualTransition](../windows.ui.xaml/visualtransition.md) type.
     * @type {Integer (Int32)}
     */
    static VisualTransition_From => 327

    /**
     * The _GeneratedDuration_ property for the [VisualTransition](../windows.ui.xaml/visualtransition.md) type.
     * @type {Integer (Int32)}
     */
    static VisualTransition_GeneratedDuration => 328

    /**
     * The _GeneratedEasingFunction_ property for the [VisualTransition](../windows.ui.xaml/visualtransition.md) type.
     * @type {Integer (Int32)}
     */
    static VisualTransition_GeneratedEasingFunction => 329

    /**
     * The _Storyboard_ property for the [VisualTransition](../windows.ui.xaml/visualtransition.md) type.
     * @type {Integer (Int32)}
     */
    static VisualTransition_Storyboard => 330

    /**
     * The _To_ property for the [VisualTransition](../windows.ui.xaml/visualtransition.md) type.
     * @type {Integer (Int32)}
     */
    static VisualTransition_To => 331

    /**
     * The _IsLargeArc_ property for the [ArcSegment](../windows.ui.xaml.media/arcsegment.md) type.
     * @type {Integer (Int32)}
     */
    static ArcSegment_IsLargeArc => 332

    /**
     * The _Point_ property for the [ArcSegment](../windows.ui.xaml.media/arcsegment.md) type.
     * @type {Integer (Int32)}
     */
    static ArcSegment_Point => 333

    /**
     * The _RotationAngle_ property for the [ArcSegment](../windows.ui.xaml.media/arcsegment.md) type.
     * @type {Integer (Int32)}
     */
    static ArcSegment_RotationAngle => 334

    /**
     * The _Size_ property for the [ArcSegment](../windows.ui.xaml.media/arcsegment.md) type.
     * @type {Integer (Int32)}
     */
    static ArcSegment_Size => 335

    /**
     * The _SweepDirection_ property for the [ArcSegment](../windows.ui.xaml.media/arcsegment.md) type.
     * @type {Integer (Int32)}
     */
    static ArcSegment_SweepDirection => 336

    /**
     * The _Amplitude_ property for the [BackEase](../windows.ui.xaml.media.animation/backease.md) type.
     * @type {Integer (Int32)}
     */
    static BackEase_Amplitude => 337

    /**
     * The _Storyboard_ property for the [BeginStoryboard](../windows.ui.xaml.media.animation/beginstoryboard.md) type.
     * @type {Integer (Int32)}
     */
    static BeginStoryboard_Storyboard => 338

    /**
     * The _Point1_ property for the [BezierSegment](../windows.ui.xaml.media/beziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static BezierSegment_Point1 => 339

    /**
     * The _Point2_ property for the [BezierSegment](../windows.ui.xaml.media/beziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static BezierSegment_Point2 => 340

    /**
     * The _Point3_ property for the [BezierSegment](../windows.ui.xaml.media/beziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static BezierSegment_Point3 => 341

    /**
     * The _PixelHeight_ property for the [BitmapSource](../windows.ui.xaml.media.imaging/bitmapsource.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapSource_PixelHeight => 342

    /**
     * The _PixelWidth_ property for the [BitmapSource](../windows.ui.xaml.media.imaging/bitmapsource.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapSource_PixelWidth => 343

    /**
     * The _LineHeight_ property for the [Block](../windows.ui.xaml.documents/block.md) type.
     * @type {Integer (Int32)}
     */
    static Block_LineHeight => 344

    /**
     * The _LineStackingStrategy_ property for the [Block](../windows.ui.xaml.documents/block.md) type.
     * @type {Integer (Int32)}
     */
    static Block_LineStackingStrategy => 345

    /**
     * The _Margin_ property for the [Block](../windows.ui.xaml.documents/block.md) type.
     * @type {Integer (Int32)}
     */
    static Block_Margin => 346

    /**
     * The _TextAlignment_ property for the [Block](../windows.ui.xaml.documents/block.md) type.
     * @type {Integer (Int32)}
     */
    static Block_TextAlignment => 347

    /**
     * The _Bounces_ property for the [BounceEase](../windows.ui.xaml.media.animation/bounceease.md) type.
     * @type {Integer (Int32)}
     */
    static BounceEase_Bounces => 348

    /**
     * The _Bounciness_ property for the [BounceEase](../windows.ui.xaml.media.animation/bounceease.md) type.
     * @type {Integer (Int32)}
     */
    static BounceEase_Bounciness => 349

    /**
     * The _By_ property for the [ColorAnimation](../windows.ui.xaml.media.animation/coloranimation.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimation_By => 350

    /**
     * The _EasingFunction_ property for the [ColorAnimation](../windows.ui.xaml.media.animation/coloranimation.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimation_EasingFunction => 351

    /**
     * The _EnableDependentAnimation_ property for the [ColorAnimation](../windows.ui.xaml.media.animation/coloranimation.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimation_EnableDependentAnimation => 352

    /**
     * The _From_ property for the [ColorAnimation](../windows.ui.xaml.media.animation/coloranimation.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimation_From => 353

    /**
     * The _To_ property for the [ColorAnimation](../windows.ui.xaml.media.animation/coloranimation.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimation_To => 354

    /**
     * The _EnableDependentAnimation_ property for the [ColorAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/coloranimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimationUsingKeyFrames_EnableDependentAnimation => 355

    /**
     * The _KeyFrames_ property for the [ColorAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/coloranimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimationUsingKeyFrames_KeyFrames => 356

    /**
     * The _HorizontalOffset_ property for the [ContentThemeTransition](../windows.ui.xaml.media.animation/contentthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static ContentThemeTransition_HorizontalOffset => 357

    /**
     * The _VerticalOffset_ property for the [ContentThemeTransition](../windows.ui.xaml.media.animation/contentthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static ContentThemeTransition_VerticalOffset => 358

    /**
     * The _TargetType_ property for the [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md) type.
     * @type {Integer (Int32)}
     */
    static ControlTemplate_TargetType => 359

    /**
     * The _Interval_ property for the [DispatcherTimer](../windows.ui.xaml/dispatchertimer.md) type.
     * @type {Integer (Int32)}
     */
    static DispatcherTimer_Interval => 362

    /**
     * The _By_ property for the [DoubleAnimation](../windows.ui.xaml.media.animation/doubleanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimation_By => 363

    /**
     * The _EasingFunction_ property for the [DoubleAnimation](../windows.ui.xaml.media.animation/doubleanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimation_EasingFunction => 364

    /**
     * The _EnableDependentAnimation_ property for the [DoubleAnimation](../windows.ui.xaml.media.animation/doubleanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimation_EnableDependentAnimation => 365

    /**
     * The _From_ property for the [DoubleAnimation](../windows.ui.xaml.media.animation/doubleanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimation_From => 366

    /**
     * The _To_ property for the [DoubleAnimation](../windows.ui.xaml.media.animation/doubleanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimation_To => 367

    /**
     * The _EnableDependentAnimation_ property for the [DoubleAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/doubleanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimationUsingKeyFrames_EnableDependentAnimation => 368

    /**
     * The _KeyFrames_ property for the [DoubleAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/doubleanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimationUsingKeyFrames_KeyFrames => 369

    /**
     * The _EasingFunction_ property for the [EasingColorKeyFrame](../windows.ui.xaml.media.animation/easingcolorkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static EasingColorKeyFrame_EasingFunction => 372

    /**
     * The _EasingFunction_ property for the [EasingDoubleKeyFrame](../windows.ui.xaml.media.animation/easingdoublekeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static EasingDoubleKeyFrame_EasingFunction => 373

    /**
     * The _EasingFunction_ property for the [EasingPointKeyFrame](../windows.ui.xaml.media.animation/easingpointkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static EasingPointKeyFrame_EasingFunction => 374

    /**
     * The _Edge_ property for the [EdgeUIThemeTransition](../windows.ui.xaml.media.animation/edgeuithemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static EdgeUIThemeTransition_Edge => 375

    /**
     * The _Oscillations_ property for the [ElasticEase](../windows.ui.xaml.media.animation/elasticease.md) type.
     * @type {Integer (Int32)}
     */
    static ElasticEase_Oscillations => 376

    /**
     * The _Springiness_ property for the [ElasticEase](../windows.ui.xaml.media.animation/elasticease.md) type.
     * @type {Integer (Int32)}
     */
    static ElasticEase_Springiness => 377

    /**
     * The _Center_ property for the [EllipseGeometry](../windows.ui.xaml.media/ellipsegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static EllipseGeometry_Center => 378

    /**
     * The _RadiusX_ property for the [EllipseGeometry](../windows.ui.xaml.media/ellipsegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static EllipseGeometry_RadiusX => 379

    /**
     * The _RadiusY_ property for the [EllipseGeometry](../windows.ui.xaml.media/ellipsegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static EllipseGeometry_RadiusY => 380

    /**
     * The _FromHorizontalOffset_ property for the [EntranceThemeTransition](../windows.ui.xaml.media.animation/entrancethemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static EntranceThemeTransition_FromHorizontalOffset => 381

    /**
     * The _FromVerticalOffset_ property for the [EntranceThemeTransition](../windows.ui.xaml.media.animation/entrancethemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static EntranceThemeTransition_FromVerticalOffset => 382

    /**
     * The _IsStaggeringEnabled_ property for the [EntranceThemeTransition](../windows.ui.xaml.media.animation/entrancethemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static EntranceThemeTransition_IsStaggeringEnabled => 383

    /**
     * The _Actions_ property for the [EventTrigger](../windows.ui.xaml/eventtrigger.md) type.
     * @type {Integer (Int32)}
     */
    static EventTrigger_Actions => 384

    /**
     * The _RoutedEvent_ property for the [EventTrigger](../windows.ui.xaml/eventtrigger.md) type.
     * @type {Integer (Int32)}
     */
    static EventTrigger_RoutedEvent => 385

    /**
     * The _Exponent_ property for the [ExponentialEase](../windows.ui.xaml.media.animation/exponentialease.md) type.
     * @type {Integer (Int32)}
     */
    static ExponentialEase_Exponent => 386

    /**
     * The _Content_ property for the [Flyout](../windows.ui.xaml.controls/flyout.md) type.
     * @type {Integer (Int32)}
     */
    static Flyout_Content => 387

    /**
     * The _FlyoutPresenterStyle_ property for the [Flyout](../windows.ui.xaml.controls/flyout.md) type.
     * @type {Integer (Int32)}
     */
    static Flyout_FlyoutPresenterStyle => 388

    /**
     * The _ActualHeight_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_ActualHeight => 389

    /**
     * The _ActualWidth_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_ActualWidth => 390

    /**
     * The _DataContext_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_DataContext => 391

    /**
     * The _FlowDirection_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_FlowDirection => 392

    /**
     * The _Height_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Height => 393

    /**
     * The _HorizontalAlignment_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_HorizontalAlignment => 394

    /**
     * The _Language_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Language => 396

    /**
     * The _Margin_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Margin => 397

    /**
     * The _MaxHeight_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_MaxHeight => 398

    /**
     * The _MaxWidth_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_MaxWidth => 399

    /**
     * The _MinHeight_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_MinHeight => 400

    /**
     * The _MinWidth_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_MinWidth => 401

    /**
     * The _Parent_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Parent => 402

    /**
     * The _RequestedTheme_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_RequestedTheme => 403

    /**
     * The _Resources_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Resources => 404

    /**
     * The _Style_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Style => 405

    /**
     * The _Tag_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Tag => 406

    /**
     * The _Triggers_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Triggers => 407

    /**
     * The _VerticalAlignment_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_VerticalAlignment => 408

    /**
     * The _Width_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_Width => 409

    /**
     * The _Owner_ property for the [FrameworkElementAutomationPeer](../windows.ui.xaml.automation.peers/frameworkelementautomationpeer.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElementAutomationPeer_Owner => 410

    /**
     * The _Children_ property for the [GeometryGroup](../windows.ui.xaml.media/geometrygroup.md) type.
     * @type {Integer (Int32)}
     */
    static GeometryGroup_Children => 411

    /**
     * The _FillRule_ property for the [GeometryGroup](../windows.ui.xaml.media/geometrygroup.md) type.
     * @type {Integer (Int32)}
     */
    static GeometryGroup_FillRule => 412

    /**
     * The _ColorInterpolationMode_ property for the [GradientBrush](../windows.ui.xaml.media/gradientbrush.md) type.
     * @type {Integer (Int32)}
     */
    static GradientBrush_ColorInterpolationMode => 413

    /**
     * The _GradientStops_ property for the [GradientBrush](../windows.ui.xaml.media/gradientbrush.md) type.
     * @type {Integer (Int32)}
     */
    static GradientBrush_GradientStops => 414

    /**
     * The _MappingMode_ property for the [GradientBrush](../windows.ui.xaml.media/gradientbrush.md) type.
     * @type {Integer (Int32)}
     */
    static GradientBrush_MappingMode => 415

    /**
     * The _SpreadMethod_ property for the [GradientBrush](../windows.ui.xaml.media/gradientbrush.md) type.
     * @type {Integer (Int32)}
     */
    static GradientBrush_SpreadMethod => 416

    /**
     * The _DragItemsCount_ property for the [GridViewItemTemplateSettings](../windows.ui.xaml.controls.primitives/gridviewitemtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemTemplateSettings_DragItemsCount => 417

    /**
     * The _Item_ property for the [ItemAutomationPeer](../windows.ui.xaml.automation.peers/itemautomationpeer.md) type.
     * @type {Integer (Int32)}
     */
    static ItemAutomationPeer_Item => 419

    /**
     * The _ItemsControlAutomationPeer_ property for the [ItemAutomationPeer](../windows.ui.xaml.automation.peers/itemautomationpeer.md) type.
     * @type {Integer (Int32)}
     */
    static ItemAutomationPeer_ItemsControlAutomationPeer => 420

    /**
     * The _EndPoint_ property for the [LineGeometry](../windows.ui.xaml.media/linegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static LineGeometry_EndPoint => 422

    /**
     * The _StartPoint_ property for the [LineGeometry](../windows.ui.xaml.media/linegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static LineGeometry_StartPoint => 423

    /**
     * The _Point_ property for the [LineSegment](../windows.ui.xaml.media/linesegment.md) type.
     * @type {Integer (Int32)}
     */
    static LineSegment_Point => 424

    /**
     * The _DragItemsCount_ property for the [ListViewItemTemplateSettings](../windows.ui.xaml.controls.primitives/listviewitemtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemTemplateSettings_DragItemsCount => 425

    /**
     * The _ProjectionMatrix_ property for the [Matrix3DProjection](../windows.ui.xaml.media/matrix3dprojection.md) type.
     * @type {Integer (Int32)}
     */
    static Matrix3DProjection_ProjectionMatrix => 426

    /**
     * The _Items_ property for the [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyout_Items => 427

    /**
     * The _MenuFlyoutPresenterStyle_ property for the [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyout_MenuFlyoutPresenterStyle => 428

    /**
     * The _EnableDependentAnimation_ property for the [ObjectAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/objectanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static ObjectAnimationUsingKeyFrames_EnableDependentAnimation => 429

    /**
     * The _KeyFrames_ property for the [ObjectAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/objectanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static ObjectAnimationUsingKeyFrames_KeyFrames => 430

    /**
     * The _Edge_ property for the [PaneThemeTransition](../windows.ui.xaml.media.animation/panethemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static PaneThemeTransition_Edge => 431

    /**
     * The _Figures_ property for the [PathGeometry](../windows.ui.xaml.media/pathgeometry.md) type.
     * @type {Integer (Int32)}
     */
    static PathGeometry_Figures => 432

    /**
     * The _FillRule_ property for the [PathGeometry](../windows.ui.xaml.media/pathgeometry.md) type.
     * @type {Integer (Int32)}
     */
    static PathGeometry_FillRule => 433

    /**
     * The _CenterOfRotationX_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_CenterOfRotationX => 434

    /**
     * The _CenterOfRotationY_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_CenterOfRotationY => 435

    /**
     * The _CenterOfRotationZ_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_CenterOfRotationZ => 436

    /**
     * The _GlobalOffsetX_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_GlobalOffsetX => 437

    /**
     * The _GlobalOffsetY_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_GlobalOffsetY => 438

    /**
     * The _GlobalOffsetZ_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_GlobalOffsetZ => 439

    /**
     * The _LocalOffsetX_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_LocalOffsetX => 440

    /**
     * The _LocalOffsetY_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_LocalOffsetY => 441

    /**
     * The _LocalOffsetZ_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_LocalOffsetZ => 442

    /**
     * The _ProjectionMatrix_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_ProjectionMatrix => 443

    /**
     * The _RotationX_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_RotationX => 444

    /**
     * The _RotationY_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_RotationY => 445

    /**
     * The _RotationZ_ property for the [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection_RotationZ => 446

    /**
     * The _By_ property for the [PointAnimation](../windows.ui.xaml.media.animation/pointanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimation_By => 447

    /**
     * The _EasingFunction_ property for the [PointAnimation](../windows.ui.xaml.media.animation/pointanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimation_EasingFunction => 448

    /**
     * The _EnableDependentAnimation_ property for the [PointAnimation](../windows.ui.xaml.media.animation/pointanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimation_EnableDependentAnimation => 449

    /**
     * The _From_ property for the [PointAnimation](../windows.ui.xaml.media.animation/pointanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimation_From => 450

    /**
     * The _To_ property for the [PointAnimation](../windows.ui.xaml.media.animation/pointanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimation_To => 451

    /**
     * The _EnableDependentAnimation_ property for the [PointAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/pointanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimationUsingKeyFrames_EnableDependentAnimation => 452

    /**
     * The _KeyFrames_ property for the [PointAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/pointanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimationUsingKeyFrames_KeyFrames => 453

    /**
     * The _Points_ property for the [PolyBezierSegment](../windows.ui.xaml.media/polybeziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static PolyBezierSegment_Points => 456

    /**
     * The _Points_ property for the [PolyLineSegment](../windows.ui.xaml.media/polylinesegment.md) type.
     * @type {Integer (Int32)}
     */
    static PolyLineSegment_Points => 457

    /**
     * The _Points_ property for the [PolyQuadraticBezierSegment](../windows.ui.xaml.media/polyquadraticbeziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static PolyQuadraticBezierSegment_Points => 458

    /**
     * The _FromHorizontalOffset_ property for the [PopupThemeTransition](../windows.ui.xaml.media.animation/popupthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static PopupThemeTransition_FromHorizontalOffset => 459

    /**
     * The _FromVerticalOffset_ property for the [PopupThemeTransition](../windows.ui.xaml.media.animation/popupthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static PopupThemeTransition_FromVerticalOffset => 460

    /**
     * The _Power_ property for the [PowerEase](../windows.ui.xaml.media.animation/powerease.md) type.
     * @type {Integer (Int32)}
     */
    static PowerEase_Power => 461

    /**
     * The _Point1_ property for the [QuadraticBezierSegment](../windows.ui.xaml.media/quadraticbeziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static QuadraticBezierSegment_Point1 => 466

    /**
     * The _Point2_ property for the [QuadraticBezierSegment](../windows.ui.xaml.media/quadraticbeziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static QuadraticBezierSegment_Point2 => 467

    /**
     * The _Rect_ property for the [RectangleGeometry](../windows.ui.xaml.media/rectanglegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static RectangleGeometry_Rect => 470

    /**
     * The _Mode_ property for the [RelativeSource](../windows.ui.xaml.data/relativesource.md) type.
     * @type {Integer (Int32)}
     */
    static RelativeSource_Mode => 471

    /**
     * The _PixelHeight_ property for the [RenderTargetBitmap](../windows.ui.xaml.media.imaging/rendertargetbitmap.md) type.
     * @type {Integer (Int32)}
     */
    static RenderTargetBitmap_PixelHeight => 472

    /**
     * The _PixelWidth_ property for the [RenderTargetBitmap](../windows.ui.xaml.media.imaging/rendertargetbitmap.md) type.
     * @type {Integer (Int32)}
     */
    static RenderTargetBitmap_PixelWidth => 473

    /**
     * The _Property_ property for the [Setter](../windows.ui.xaml/setter.md) type.
     * @type {Integer (Int32)}
     */
    static Setter_Property => 474

    /**
     * The _Value_ property for the [Setter](../windows.ui.xaml/setter.md) type.
     * @type {Integer (Int32)}
     */
    static Setter_Value => 475

    /**
     * The _Color_ property for the [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md) type.
     * @type {Integer (Int32)}
     */
    static SolidColorBrush_Color => 476

    /**
     * The _KeySpline_ property for the [SplineColorKeyFrame](../windows.ui.xaml.media.animation/splinecolorkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static SplineColorKeyFrame_KeySpline => 477

    /**
     * The _KeySpline_ property for the [SplineDoubleKeyFrame](../windows.ui.xaml.media.animation/splinedoublekeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static SplineDoubleKeyFrame_KeySpline => 478

    /**
     * The _KeySpline_ property for the [SplinePointKeyFrame](../windows.ui.xaml.media.animation/splinepointkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static SplinePointKeyFrame_KeySpline => 479

    /**
     * The _AlignmentX_ property for the [TileBrush](../windows.ui.xaml.media/tilebrush.md) type.
     * @type {Integer (Int32)}
     */
    static TileBrush_AlignmentX => 483

    /**
     * The _AlignmentY_ property for the [TileBrush](../windows.ui.xaml.media/tilebrush.md) type.
     * @type {Integer (Int32)}
     */
    static TileBrush_AlignmentY => 484

    /**
     * The _Stretch_ property for the [TileBrush](../windows.ui.xaml.media/tilebrush.md) type.
     * @type {Integer (Int32)}
     */
    static TileBrush_Stretch => 485

    /**
     * The _Converter_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_Converter => 487

    /**
     * The _ConverterLanguage_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_ConverterLanguage => 488

    /**
     * The _ConverterParameter_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_ConverterParameter => 489

    /**
     * The _ElementName_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_ElementName => 490

    /**
     * The _FallbackValue_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_FallbackValue => 491

    /**
     * The _Mode_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_Mode => 492

    /**
     * The _Path_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_Path => 493

    /**
     * The _RelativeSource_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_RelativeSource => 494

    /**
     * The _Source_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_Source => 495

    /**
     * The _TargetNullValue_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_TargetNullValue => 496

    /**
     * The _UpdateSourceTrigger_ property for the [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding_UpdateSourceTrigger => 497

    /**
     * The _CreateOptions_ property for the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage_CreateOptions => 498

    /**
     * The _DecodePixelHeight_ property for the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage_DecodePixelHeight => 499

    /**
     * The _DecodePixelType_ property for the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage_DecodePixelType => 500

    /**
     * The _DecodePixelWidth_ property for the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage_DecodePixelWidth => 501

    /**
     * The _UriSource_ property for the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage_UriSource => 502

    /**
     * The _Background_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_Background => 503

    /**
     * The _BorderBrush_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_BorderBrush => 504

    /**
     * The _BorderThickness_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_BorderThickness => 505

    /**
     * The _Child_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_Child => 506

    /**
     * The _ChildTransitions_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_ChildTransitions => 507

    /**
     * The _CornerRadius_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_CornerRadius => 508

    /**
     * The _Padding_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_Padding => 509

    /**
     * The _Source_ property for the [CaptureElement](../windows.ui.xaml.controls/captureelement.md) type.
     * @type {Integer (Int32)}
     */
    static CaptureElement_Source => 510

    /**
     * The _Stretch_ property for the [CaptureElement](../windows.ui.xaml.controls/captureelement.md) type.
     * @type {Integer (Int32)}
     */
    static CaptureElement_Stretch => 511

    /**
     * The _CenterX_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_CenterX => 514

    /**
     * The _CenterY_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_CenterY => 515

    /**
     * The _Rotation_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_Rotation => 516

    /**
     * The _ScaleX_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_ScaleX => 517

    /**
     * The _ScaleY_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_ScaleY => 518

    /**
     * The _SkewX_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_SkewX => 519

    /**
     * The _SkewY_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_SkewY => 520

    /**
     * The _TranslateX_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_TranslateX => 521

    /**
     * The _TranslateY_ property for the [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform_TranslateY => 522

    /**
     * The _CharacterSpacing_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_CharacterSpacing => 523

    /**
     * The _Content_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_Content => 524

    /**
     * The _ContentTemplate_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_ContentTemplate => 525

    /**
     * The _ContentTemplateSelector_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_ContentTemplateSelector => 526

    /**
     * The _ContentTransitions_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_ContentTransitions => 527

    /**
     * The _FontFamily_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_FontFamily => 528

    /**
     * The _FontSize_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_FontSize => 529

    /**
     * The _FontStretch_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_FontStretch => 530

    /**
     * The _FontStyle_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_FontStyle => 531

    /**
     * The _FontWeight_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_FontWeight => 532

    /**
     * The _Foreground_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_Foreground => 533

    /**
     * The _IsTextScaleFactorEnabled_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_IsTextScaleFactorEnabled => 534

    /**
     * The _LineStackingStrategy_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_LineStackingStrategy => 535

    /**
     * The _MaxLines_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_MaxLines => 536

    /**
     * The _OpticalMarginAlignment_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_OpticalMarginAlignment => 537

    /**
     * The _TextLineBounds_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_TextLineBounds => 539

    /**
     * The _TextWrapping_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_TextWrapping => 540

    /**
     * The _Background_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_Background => 541

    /**
     * The _BorderBrush_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_BorderBrush => 542

    /**
     * The _BorderThickness_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_BorderThickness => 543

    /**
     * The _CharacterSpacing_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_CharacterSpacing => 544

    /**
     * The _FocusState_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_FocusState => 546

    /**
     * The _FontFamily_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_FontFamily => 547

    /**
     * The _FontSize_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_FontSize => 548

    /**
     * The _FontStretch_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_FontStretch => 549

    /**
     * The _FontStyle_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_FontStyle => 550

    /**
     * The _FontWeight_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_FontWeight => 551

    /**
     * The _Foreground_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_Foreground => 552

    /**
     * The _HorizontalContentAlignment_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_HorizontalContentAlignment => 553

    /**
     * The _IsEnabled_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_IsEnabled => 554

    /**
     * The _IsTabStop_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_IsTabStop => 555

    /**
     * The _IsTextScaleFactorEnabled_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_IsTextScaleFactorEnabled => 556

    /**
     * The _Padding_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_Padding => 557

    /**
     * The _TabIndex_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_TabIndex => 558

    /**
     * The _TabNavigation_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_TabNavigation => 559

    /**
     * The _Template_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_Template => 560

    /**
     * The _VerticalContentAlignment_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_VerticalContentAlignment => 561

    /**
     * The _TargetName_ property for the [DragItemThemeAnimation](../windows.ui.xaml.media.animation/dragitemthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DragItemThemeAnimation_TargetName => 565

    /**
     * The _Direction_ property for the [DragOverThemeAnimation](../windows.ui.xaml.media.animation/dragoverthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DragOverThemeAnimation_Direction => 566

    /**
     * The _TargetName_ property for the [DragOverThemeAnimation](../windows.ui.xaml.media.animation/dragoverthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DragOverThemeAnimation_TargetName => 567

    /**
     * The _ToOffset_ property for the [DragOverThemeAnimation](../windows.ui.xaml.media.animation/dragoverthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DragOverThemeAnimation_ToOffset => 568

    /**
     * The _TargetName_ property for the [DropTargetItemThemeAnimation](../windows.ui.xaml.media.animation/droptargetitemthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DropTargetItemThemeAnimation_TargetName => 569

    /**
     * The _TargetName_ property for the [FadeInThemeAnimation](../windows.ui.xaml.media.animation/fadeinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static FadeInThemeAnimation_TargetName => 570

    /**
     * The _TargetName_ property for the [FadeOutThemeAnimation](../windows.ui.xaml.media.animation/fadeoutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static FadeOutThemeAnimation_TargetName => 571

    /**
     * The _Fill_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_Fill => 574

    /**
     * The _FontRenderingEmSize_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_FontRenderingEmSize => 575

    /**
     * The _FontUri_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_FontUri => 576

    /**
     * The _Indices_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_Indices => 577

    /**
     * The _OriginX_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_OriginX => 578

    /**
     * The _OriginY_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_OriginY => 579

    /**
     * The _StyleSimulations_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_StyleSimulations => 580

    /**
     * The _UnicodeString_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_UnicodeString => 581

    /**
     * The _Foreground_ property for the [IconElement](../windows.ui.xaml.controls/iconelement.md) type.
     * @type {Integer (Int32)}
     */
    static IconElement_Foreground => 584

    /**
     * The _NineGrid_ property for the [Image](../windows.ui.xaml.controls/image.md) type.
     * @type {Integer (Int32)}
     */
    static Image_NineGrid => 586

    /**
     * The _PlayToSource_ property for the [Image](../windows.ui.xaml.controls/image.md) type.
     * @type {Integer (Int32)}
     */
    static Image_PlayToSource => 587

    /**
     * The _Source_ property for the [Image](../windows.ui.xaml.controls/image.md) type.
     * @type {Integer (Int32)}
     */
    static Image_Source => 588

    /**
     * The _Stretch_ property for the [Image](../windows.ui.xaml.controls/image.md) type.
     * @type {Integer (Int32)}
     */
    static Image_Stretch => 589

    /**
     * The _ImageSource_ property for the [ImageBrush](../windows.ui.xaml.media/imagebrush.md) type.
     * @type {Integer (Int32)}
     */
    static ImageBrush_ImageSource => 591

    /**
     * The _Child_ property for the [InlineUIContainer](../windows.ui.xaml.documents/inlineuicontainer.md) type.
     * @type {Integer (Int32)}
     */
    static InlineUIContainer_Child => 592

    /**
     * The _Footer_ property for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_Footer => 594

    /**
     * The _FooterTemplate_ property for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_FooterTemplate => 595

    /**
     * The _FooterTransitions_ property for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_FooterTransitions => 596

    /**
     * The _Header_ property for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_Header => 597

    /**
     * The _HeaderTemplate_ property for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_HeaderTemplate => 598

    /**
     * The _HeaderTransitions_ property for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_HeaderTransitions => 599

    /**
     * The _Padding_ property for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_Padding => 601

    /**
     * The _EndPoint_ property for the [LinearGradientBrush](../windows.ui.xaml.media/lineargradientbrush.md) type.
     * @type {Integer (Int32)}
     */
    static LinearGradientBrush_EndPoint => 602

    /**
     * The _StartPoint_ property for the [LinearGradientBrush](../windows.ui.xaml.media/lineargradientbrush.md) type.
     * @type {Integer (Int32)}
     */
    static LinearGradientBrush_StartPoint => 603

    /**
     * The _Matrix_ property for the [MatrixTransform](../windows.ui.xaml.media/matrixtransform.md) type.
     * @type {Integer (Int32)}
     */
    static MatrixTransform_Matrix => 604

    /**
     * The _ActualStereo3DVideoPackingMode_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_ActualStereo3DVideoPackingMode => 605

    /**
     * The _AreTransportControlsEnabled_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_AreTransportControlsEnabled => 606

    /**
     * The _AspectRatioHeight_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_AspectRatioHeight => 607

    /**
     * The _AspectRatioWidth_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_AspectRatioWidth => 608

    /**
     * The _AudioCategory_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_AudioCategory => 609

    /**
     * The _AudioDeviceType_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_AudioDeviceType => 610

    /**
     * The _AudioStreamCount_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_AudioStreamCount => 611

    /**
     * The _AudioStreamIndex_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_AudioStreamIndex => 612

    /**
     * The _AutoPlay_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_AutoPlay => 613

    /**
     * The _Balance_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_Balance => 614

    /**
     * The _BufferingProgress_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_BufferingProgress => 615

    /**
     * The _CanPause_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_CanPause => 616

    /**
     * The _CanSeek_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_CanSeek => 617

    /**
     * The _CurrentState_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_CurrentState => 618

    /**
     * The _DefaultPlaybackRate_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_DefaultPlaybackRate => 619

    /**
     * The _DownloadProgress_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_DownloadProgress => 620

    /**
     * The _DownloadProgressOffset_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_DownloadProgressOffset => 621

    /**
     * The _IsAudioOnly_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_IsAudioOnly => 623

    /**
     * The _IsFullWindow_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_IsFullWindow => 624

    /**
     * The _IsLooping_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_IsLooping => 625

    /**
     * The _IsMuted_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_IsMuted => 626

    /**
     * The _IsStereo3DVideo_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_IsStereo3DVideo => 627

    /**
     * The _Markers_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_Markers => 628

    /**
     * The _NaturalDuration_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_NaturalDuration => 629

    /**
     * The _NaturalVideoHeight_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_NaturalVideoHeight => 630

    /**
     * The _NaturalVideoWidth_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_NaturalVideoWidth => 631

    /**
     * The _PlaybackRate_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_PlaybackRate => 632

    /**
     * The _PlayToPreferredSourceUri_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_PlayToPreferredSourceUri => 633

    /**
     * The _PlayToSource_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_PlayToSource => 634

    /**
     * The _Position_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_Position => 635

    /**
     * The _PosterSource_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_PosterSource => 636

    /**
     * The _ProtectionManager_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_ProtectionManager => 637

    /**
     * The _RealTimePlayback_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_RealTimePlayback => 638

    /**
     * The _Source_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_Source => 639

    /**
     * The _Stereo3DVideoPackingMode_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_Stereo3DVideoPackingMode => 640

    /**
     * The _Stereo3DVideoRenderMode_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_Stereo3DVideoRenderMode => 641

    /**
     * The _Stretch_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_Stretch => 642

    /**
     * The _TransportControls_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_TransportControls => 643

    /**
     * The _Volume_ property for the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement_Volume => 644

    /**
     * The _Background_ property for the [Panel](../windows.ui.xaml.controls/panel.md) type.
     * @type {Integer (Int32)}
     */
    static Panel_Background => 647

    /**
     * The _Children_ property for the [Panel](../windows.ui.xaml.controls/panel.md) type.
     * @type {Integer (Int32)}
     */
    static Panel_Children => 648

    /**
     * The _ChildrenTransitions_ property for the [Panel](../windows.ui.xaml.controls/panel.md) type.
     * @type {Integer (Int32)}
     */
    static Panel_ChildrenTransitions => 649

    /**
     * The _IsItemsHost_ property for the [Panel](../windows.ui.xaml.controls/panel.md) type.
     * @type {Integer (Int32)}
     */
    static Panel_IsItemsHost => 651

    /**
     * The _Inlines_ property for the [Paragraph](../windows.ui.xaml.documents/paragraph.md) type.
     * @type {Integer (Int32)}
     */
    static Paragraph_Inlines => 652

    /**
     * The _TextIndent_ property for the [Paragraph](../windows.ui.xaml.documents/paragraph.md) type.
     * @type {Integer (Int32)}
     */
    static Paragraph_TextIndent => 653

    /**
     * The _TargetName_ property for the [PointerDownThemeAnimation](../windows.ui.xaml.media.animation/pointerdownthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointerDownThemeAnimation_TargetName => 660

    /**
     * The _TargetName_ property for the [PointerUpThemeAnimation](../windows.ui.xaml.media.animation/pointerupthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointerUpThemeAnimation_TargetName => 662

    /**
     * The _FromHorizontalOffset_ property for the [PopInThemeAnimation](../windows.ui.xaml.media.animation/popinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PopInThemeAnimation_FromHorizontalOffset => 664

    /**
     * The _FromVerticalOffset_ property for the [PopInThemeAnimation](../windows.ui.xaml.media.animation/popinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PopInThemeAnimation_FromVerticalOffset => 665

    /**
     * The _TargetName_ property for the [PopInThemeAnimation](../windows.ui.xaml.media.animation/popinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PopInThemeAnimation_TargetName => 666

    /**
     * The _TargetName_ property for the [PopOutThemeAnimation](../windows.ui.xaml.media.animation/popoutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PopOutThemeAnimation_TargetName => 667

    /**
     * The _Child_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_Child => 668

    /**
     * The _ChildTransitions_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_ChildTransitions => 669

    /**
     * The _HorizontalOffset_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_HorizontalOffset => 670

    /**
     * The _IsLightDismissEnabled_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_IsLightDismissEnabled => 673

    /**
     * The _IsOpen_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_IsOpen => 674

    /**
     * The _VerticalOffset_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_VerticalOffset => 676

    /**
     * The _FromHorizontalOffset_ property for the [RepositionThemeAnimation](../windows.ui.xaml.media.animation/repositionthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static RepositionThemeAnimation_FromHorizontalOffset => 683

    /**
     * The _FromVerticalOffset_ property for the [RepositionThemeAnimation](../windows.ui.xaml.media.animation/repositionthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static RepositionThemeAnimation_FromVerticalOffset => 684

    /**
     * The _TargetName_ property for the [RepositionThemeAnimation](../windows.ui.xaml.media.animation/repositionthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static RepositionThemeAnimation_TargetName => 685

    /**
     * The _MergedDictionaries_ property for the [ResourceDictionary](../windows.ui.xaml/resourcedictionary.md) type.
     * @type {Integer (Int32)}
     */
    static ResourceDictionary_MergedDictionaries => 687

    /**
     * The _Source_ property for the [ResourceDictionary](../windows.ui.xaml/resourcedictionary.md) type.
     * @type {Integer (Int32)}
     */
    static ResourceDictionary_Source => 688

    /**
     * The _ThemeDictionaries_ property for the [ResourceDictionary](../windows.ui.xaml/resourcedictionary.md) type.
     * @type {Integer (Int32)}
     */
    static ResourceDictionary_ThemeDictionaries => 689

    /**
     * The _Blocks_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_Blocks => 691

    /**
     * The _CharacterSpacing_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_CharacterSpacing => 692

    /**
     * The _FontFamily_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_FontFamily => 693

    /**
     * The _FontSize_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_FontSize => 694

    /**
     * The _FontStretch_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_FontStretch => 695

    /**
     * The _FontStyle_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_FontStyle => 696

    /**
     * The _FontWeight_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_FontWeight => 697

    /**
     * The _Foreground_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_Foreground => 698

    /**
     * The _HasOverflowContent_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_HasOverflowContent => 699

    /**
     * The _IsColorFontEnabled_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_IsColorFontEnabled => 700

    /**
     * The _IsTextScaleFactorEnabled_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_IsTextScaleFactorEnabled => 701

    /**
     * The _IsTextSelectionEnabled_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_IsTextSelectionEnabled => 702

    /**
     * The _LineHeight_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_LineHeight => 703

    /**
     * The _LineStackingStrategy_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_LineStackingStrategy => 704

    /**
     * The _MaxLines_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_MaxLines => 705

    /**
     * The _OpticalMarginAlignment_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_OpticalMarginAlignment => 706

    /**
     * The _OverflowContentTarget_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_OverflowContentTarget => 707

    /**
     * The _Padding_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_Padding => 708

    /**
     * The _SelectedText_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_SelectedText => 709

    /**
     * The _SelectionHighlightColor_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_SelectionHighlightColor => 710

    /**
     * The _TextAlignment_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_TextAlignment => 711

    /**
     * The _TextIndent_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_TextIndent => 712

    /**
     * The _TextLineBounds_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_TextLineBounds => 713

    /**
     * The _TextReadingOrder_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_TextReadingOrder => 714

    /**
     * The _TextTrimming_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_TextTrimming => 715

    /**
     * The _TextWrapping_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_TextWrapping => 716

    /**
     * The _HasOverflowContent_ property for the [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlockOverflow_HasOverflowContent => 717

    /**
     * The _MaxLines_ property for the [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlockOverflow_MaxLines => 718

    /**
     * The _OverflowContentTarget_ property for the [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlockOverflow_OverflowContentTarget => 719

    /**
     * The _Padding_ property for the [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlockOverflow_Padding => 720

    /**
     * The _Angle_ property for the [RotateTransform](../windows.ui.xaml.media/rotatetransform.md) type.
     * @type {Integer (Int32)}
     */
    static RotateTransform_Angle => 721

    /**
     * The _CenterX_ property for the [RotateTransform](../windows.ui.xaml.media/rotatetransform.md) type.
     * @type {Integer (Int32)}
     */
    static RotateTransform_CenterX => 722

    /**
     * The _CenterY_ property for the [RotateTransform](../windows.ui.xaml.media/rotatetransform.md) type.
     * @type {Integer (Int32)}
     */
    static RotateTransform_CenterY => 723

    /**
     * The _FlowDirection_ property for the [Run](../windows.ui.xaml.documents/run.md) type.
     * @type {Integer (Int32)}
     */
    static Run_FlowDirection => 725

    /**
     * The _Text_ property for the [Run](../windows.ui.xaml.documents/run.md) type.
     * @type {Integer (Int32)}
     */
    static Run_Text => 726

    /**
     * The _CenterX_ property for the [ScaleTransform](../windows.ui.xaml.media/scaletransform.md) type.
     * @type {Integer (Int32)}
     */
    static ScaleTransform_CenterX => 727

    /**
     * The _CenterY_ property for the [ScaleTransform](../windows.ui.xaml.media/scaletransform.md) type.
     * @type {Integer (Int32)}
     */
    static ScaleTransform_CenterY => 728

    /**
     * The _ScaleX_ property for the [ScaleTransform](../windows.ui.xaml.media/scaletransform.md) type.
     * @type {Integer (Int32)}
     */
    static ScaleTransform_ScaleX => 729

    /**
     * The _ScaleY_ property for the [ScaleTransform](../windows.ui.xaml.media/scaletransform.md) type.
     * @type {Integer (Int32)}
     */
    static ScaleTransform_ScaleY => 730

    /**
     * The _IsSealed_ property for the [SetterBaseCollection](../windows.ui.xaml/setterbasecollection.md) type.
     * @type {Integer (Int32)}
     */
    static SetterBaseCollection_IsSealed => 732

    /**
     * The _Fill_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_Fill => 733

    /**
     * The _GeometryTransform_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_GeometryTransform => 734

    /**
     * The _Stretch_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_Stretch => 735

    /**
     * The _Stroke_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_Stroke => 736

    /**
     * The _StrokeDashArray_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_StrokeDashArray => 737

    /**
     * The _StrokeDashCap_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_StrokeDashCap => 738

    /**
     * The _StrokeDashOffset_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_StrokeDashOffset => 739

    /**
     * The _StrokeEndLineCap_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_StrokeEndLineCap => 740

    /**
     * The _StrokeLineJoin_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_StrokeLineJoin => 741

    /**
     * The _StrokeMiterLimit_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_StrokeMiterLimit => 742

    /**
     * The _StrokeStartLineCap_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_StrokeStartLineCap => 743

    /**
     * The _StrokeThickness_ property for the [Shape](../windows.ui.xaml.shapes/shape.md) type.
     * @type {Integer (Int32)}
     */
    static Shape_StrokeThickness => 744

    /**
     * The _AngleX_ property for the [SkewTransform](../windows.ui.xaml.media/skewtransform.md) type.
     * @type {Integer (Int32)}
     */
    static SkewTransform_AngleX => 745

    /**
     * The _AngleY_ property for the [SkewTransform](../windows.ui.xaml.media/skewtransform.md) type.
     * @type {Integer (Int32)}
     */
    static SkewTransform_AngleY => 746

    /**
     * The _CenterX_ property for the [SkewTransform](../windows.ui.xaml.media/skewtransform.md) type.
     * @type {Integer (Int32)}
     */
    static SkewTransform_CenterX => 747

    /**
     * The _CenterY_ property for the [SkewTransform](../windows.ui.xaml.media/skewtransform.md) type.
     * @type {Integer (Int32)}
     */
    static SkewTransform_CenterY => 748

    /**
     * The _Inlines_ property for the [Span](../windows.ui.xaml.documents/span.md) type.
     * @type {Integer (Int32)}
     */
    static Span_Inlines => 749

    /**
     * The _ClosedLength_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_ClosedLength => 750

    /**
     * The _ClosedTarget_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_ClosedTarget => 751

    /**
     * The _ClosedTargetName_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_ClosedTargetName => 752

    /**
     * The _ContentTarget_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_ContentTarget => 753

    /**
     * The _ContentTargetName_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_ContentTargetName => 754

    /**
     * The _ContentTranslationDirection_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_ContentTranslationDirection => 755

    /**
     * The _ContentTranslationOffset_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_ContentTranslationOffset => 756

    /**
     * The _OffsetFromCenter_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_OffsetFromCenter => 757

    /**
     * The _OpenedLength_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_OpenedLength => 758

    /**
     * The _OpenedTarget_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_OpenedTarget => 759

    /**
     * The _OpenedTargetName_ property for the [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation_OpenedTargetName => 760

    /**
     * The _ClosedLength_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_ClosedLength => 761

    /**
     * The _ClosedTarget_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_ClosedTarget => 762

    /**
     * The _ClosedTargetName_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_ClosedTargetName => 763

    /**
     * The _ContentTarget_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_ContentTarget => 764

    /**
     * The _ContentTargetName_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_ContentTargetName => 765

    /**
     * The _ContentTranslationDirection_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_ContentTranslationDirection => 766

    /**
     * The _ContentTranslationOffset_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_ContentTranslationOffset => 767

    /**
     * The _OffsetFromCenter_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_OffsetFromCenter => 768

    /**
     * The _OpenedLength_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_OpenedLength => 769

    /**
     * The _OpenedTarget_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_OpenedTarget => 770

    /**
     * The _OpenedTargetName_ property for the [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation_OpenedTargetName => 771

    /**
     * The _Children_ property for the [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) type.
     * @type {Integer (Int32)}
     */
    static Storyboard_Children => 772

    /**
     * The _TargetName_ property for the [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) type.
     * @type {Integer (Int32)}
     */
    static Storyboard_TargetName => 774

    /**
     * The _TargetProperty_ property for the [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) type.
     * @type {Integer (Int32)}
     */
    static Storyboard_TargetProperty => 775

    /**
     * The _FromHorizontalOffset_ property for the [SwipeBackThemeAnimation](../windows.ui.xaml.media.animation/swipebackthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SwipeBackThemeAnimation_FromHorizontalOffset => 776

    /**
     * The _FromVerticalOffset_ property for the [SwipeBackThemeAnimation](../windows.ui.xaml.media.animation/swipebackthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SwipeBackThemeAnimation_FromVerticalOffset => 777

    /**
     * The _TargetName_ property for the [SwipeBackThemeAnimation](../windows.ui.xaml.media.animation/swipebackthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SwipeBackThemeAnimation_TargetName => 778

    /**
     * The _TargetName_ property for the [SwipeHintThemeAnimation](../windows.ui.xaml.media.animation/swipehintthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SwipeHintThemeAnimation_TargetName => 779

    /**
     * The _ToHorizontalOffset_ property for the [SwipeHintThemeAnimation](../windows.ui.xaml.media.animation/swipehintthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SwipeHintThemeAnimation_ToHorizontalOffset => 780

    /**
     * The _ToVerticalOffset_ property for the [SwipeHintThemeAnimation](../windows.ui.xaml.media.animation/swipehintthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SwipeHintThemeAnimation_ToVerticalOffset => 781

    /**
     * The _CharacterSpacing_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_CharacterSpacing => 782

    /**
     * The _FontFamily_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_FontFamily => 783

    /**
     * The _FontSize_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_FontSize => 784

    /**
     * The _FontStretch_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_FontStretch => 785

    /**
     * The _FontStyle_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_FontStyle => 786

    /**
     * The _FontWeight_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_FontWeight => 787

    /**
     * The _Foreground_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_Foreground => 788

    /**
     * The _Inlines_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_Inlines => 789

    /**
     * The _IsColorFontEnabled_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_IsColorFontEnabled => 790

    /**
     * The _IsTextScaleFactorEnabled_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_IsTextScaleFactorEnabled => 791

    /**
     * The _IsTextSelectionEnabled_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_IsTextSelectionEnabled => 792

    /**
     * The _LineHeight_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_LineHeight => 793

    /**
     * The _LineStackingStrategy_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_LineStackingStrategy => 794

    /**
     * The _MaxLines_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_MaxLines => 795

    /**
     * The _OpticalMarginAlignment_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_OpticalMarginAlignment => 796

    /**
     * The _Padding_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_Padding => 797

    /**
     * The _SelectedText_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_SelectedText => 798

    /**
     * The _SelectionHighlightColor_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_SelectionHighlightColor => 799

    /**
     * The _Text_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_Text => 800

    /**
     * The _TextAlignment_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_TextAlignment => 801

    /**
     * The _TextDecorations_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_TextDecorations => 802

    /**
     * The _TextLineBounds_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_TextLineBounds => 803

    /**
     * The _TextReadingOrder_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_TextReadingOrder => 804

    /**
     * The _TextTrimming_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_TextTrimming => 805

    /**
     * The _TextWrapping_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_TextWrapping => 806

    /**
     * The _Children_ property for the [TransformGroup](../windows.ui.xaml.media/transformgroup.md) type.
     * @type {Integer (Int32)}
     */
    static TransformGroup_Children => 811

    /**
     * The _Value_ property for the [TransformGroup](../windows.ui.xaml.media/transformgroup.md) type.
     * @type {Integer (Int32)}
     */
    static TransformGroup_Value => 812

    /**
     * The _X_ property for the [TranslateTransform](../windows.ui.xaml.media/translatetransform.md) type.
     * @type {Integer (Int32)}
     */
    static TranslateTransform_X => 814

    /**
     * The _Y_ property for the [TranslateTransform](../windows.ui.xaml.media/translatetransform.md) type.
     * @type {Integer (Int32)}
     */
    static TranslateTransform_Y => 815

    /**
     * The _Child_ property for the [Viewbox](../windows.ui.xaml.controls/viewbox.md) type.
     * @type {Integer (Int32)}
     */
    static Viewbox_Child => 819

    /**
     * The _Stretch_ property for the [Viewbox](../windows.ui.xaml.controls/viewbox.md) type.
     * @type {Integer (Int32)}
     */
    static Viewbox_Stretch => 820

    /**
     * The _StretchDirection_ property for the [Viewbox](../windows.ui.xaml.controls/viewbox.md) type.
     * @type {Integer (Int32)}
     */
    static Viewbox_StretchDirection => 821

    /**
     * The _SourceName_ property for the [WebViewBrush](../windows.ui.xaml.controls/webviewbrush.md) type.
     * @type {Integer (Int32)}
     */
    static WebViewBrush_SourceName => 825

    /**
     * The _IsCompact_ property for the [AppBarSeparator](../windows.ui.xaml.controls/appbarseparator.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarSeparator_IsCompact => 826

    /**
     * The _UriSource_ property for the [BitmapIcon](../windows.ui.xaml.controls/bitmapicon.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapIcon_UriSource => 827

    /**
     * The _Left_ property for the [Canvas](../windows.ui.xaml.controls/canvas.md) type.
     * @type {Integer (Int32)}
     */
    static Canvas_Left => 828

    /**
     * The _Top_ property for the [Canvas](../windows.ui.xaml.controls/canvas.md) type.
     * @type {Integer (Int32)}
     */
    static Canvas_Top => 829

    /**
     * The _ZIndex_ property for the [Canvas](../windows.ui.xaml.controls/canvas.md) type.
     * @type {Integer (Int32)}
     */
    static Canvas_ZIndex => 830

    /**
     * The _Content_ property for the [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ContentControl_Content => 832

    /**
     * The _ContentTemplate_ property for the [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ContentControl_ContentTemplate => 833

    /**
     * The _ContentTemplateSelector_ property for the [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ContentControl_ContentTemplateSelector => 834

    /**
     * The _ContentTransitions_ property for the [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ContentControl_ContentTransitions => 835

    /**
     * The _CalendarIdentifier_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_CalendarIdentifier => 837

    /**
     * The _Date_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_Date => 838

    /**
     * The _DayFormat_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_DayFormat => 839

    /**
     * The _DayVisible_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_DayVisible => 840

    /**
     * The _Header_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_Header => 841

    /**
     * The _HeaderTemplate_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_HeaderTemplate => 842

    /**
     * The _MaxYear_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_MaxYear => 843

    /**
     * The _MinYear_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_MinYear => 844

    /**
     * The _MonthFormat_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_MonthFormat => 845

    /**
     * The _MonthVisible_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_MonthVisible => 846

    /**
     * The _Orientation_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_Orientation => 847

    /**
     * The _YearFormat_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_YearFormat => 848

    /**
     * The _YearVisible_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_YearVisible => 849

    /**
     * The _FontFamily_ property for the [FontIcon](../windows.ui.xaml.controls/fonticon.md) type.
     * @type {Integer (Int32)}
     */
    static FontIcon_FontFamily => 851

    /**
     * The _FontSize_ property for the [FontIcon](../windows.ui.xaml.controls/fonticon.md) type.
     * @type {Integer (Int32)}
     */
    static FontIcon_FontSize => 852

    /**
     * The _FontStyle_ property for the [FontIcon](../windows.ui.xaml.controls/fonticon.md) type.
     * @type {Integer (Int32)}
     */
    static FontIcon_FontStyle => 853

    /**
     * The _FontWeight_ property for the [FontIcon](../windows.ui.xaml.controls/fonticon.md) type.
     * @type {Integer (Int32)}
     */
    static FontIcon_FontWeight => 854

    /**
     * The _Glyph_ property for the [FontIcon](../windows.ui.xaml.controls/fonticon.md) type.
     * @type {Integer (Int32)}
     */
    static FontIcon_Glyph => 855

    /**
     * The _IsTextScaleFactorEnabled_ property for the [FontIcon](../windows.ui.xaml.controls/fonticon.md) type.
     * @type {Integer (Int32)}
     */
    static FontIcon_IsTextScaleFactorEnabled => 856

    /**
     * The _Column_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_Column => 857

    /**
     * The _ColumnDefinitions_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_ColumnDefinitions => 858

    /**
     * The _ColumnSpan_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_ColumnSpan => 859

    /**
     * The _Row_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_Row => 860

    /**
     * The _RowDefinitions_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_RowDefinitions => 861

    /**
     * The _RowSpan_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_RowSpan => 862

    /**
     * The _DefaultSectionIndex_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_DefaultSectionIndex => 863

    /**
     * The _Header_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_Header => 864

    /**
     * The _HeaderTemplate_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_HeaderTemplate => 865

    /**
     * The _IsActiveView_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_IsActiveView => 866

    /**
     * The _IsZoomedInView_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_IsZoomedInView => 867

    /**
     * The _Orientation_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_Orientation => 868

    /**
     * The _SectionHeaders_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_SectionHeaders => 869

    /**
     * The _Sections_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_Sections => 870

    /**
     * The _SectionsInView_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_SectionsInView => 871

    /**
     * The _SemanticZoomOwner_ property for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_SemanticZoomOwner => 872

    /**
     * The _ContentTemplate_ property for the [HubSection](../windows.ui.xaml.controls/hubsection.md) type.
     * @type {Integer (Int32)}
     */
    static HubSection_ContentTemplate => 873

    /**
     * The _Header_ property for the [HubSection](../windows.ui.xaml.controls/hubsection.md) type.
     * @type {Integer (Int32)}
     */
    static HubSection_Header => 874

    /**
     * The _HeaderTemplate_ property for the [HubSection](../windows.ui.xaml.controls/hubsection.md) type.
     * @type {Integer (Int32)}
     */
    static HubSection_HeaderTemplate => 875

    /**
     * The _IsHeaderInteractive_ property for the [HubSection](../windows.ui.xaml.controls/hubsection.md) type.
     * @type {Integer (Int32)}
     */
    static HubSection_IsHeaderInteractive => 876

    /**
     * The _NavigateUri_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_NavigateUri => 877

    /**
     * The _DisplayMemberPath_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_DisplayMemberPath => 879

    /**
     * The _GroupStyle_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_GroupStyle => 880

    /**
     * The _GroupStyleSelector_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_GroupStyleSelector => 881

    /**
     * The _IsGrouping_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_IsGrouping => 882

    /**
     * The _ItemContainerStyle_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_ItemContainerStyle => 884

    /**
     * The _ItemContainerStyleSelector_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_ItemContainerStyleSelector => 885

    /**
     * The _ItemContainerTransitions_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_ItemContainerTransitions => 886

    /**
     * The _Items_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_Items => 887

    /**
     * The _ItemsPanel_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_ItemsPanel => 889

    /**
     * The _ItemsSource_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_ItemsSource => 890

    /**
     * The _ItemTemplate_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_ItemTemplate => 891

    /**
     * The _ItemTemplateSelector_ property for the [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl_ItemTemplateSelector => 892

    /**
     * The _X1_ property for the [Line](../windows.ui.xaml.shapes/line.md) type.
     * @type {Integer (Int32)}
     */
    static Line_X1 => 893

    /**
     * The _X2_ property for the [Line](../windows.ui.xaml.shapes/line.md) type.
     * @type {Integer (Int32)}
     */
    static Line_X2 => 894

    /**
     * The _Y1_ property for the [Line](../windows.ui.xaml.shapes/line.md) type.
     * @type {Integer (Int32)}
     */
    static Line_Y1 => 895

    /**
     * The _Y2_ property for the [Line](../windows.ui.xaml.shapes/line.md) type.
     * @type {Integer (Int32)}
     */
    static Line_Y2 => 896

    /**
     * The _IsFastForwardButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsFastForwardButtonVisible => 898

    /**
     * The _IsFastRewindButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsFastRewindButtonVisible => 900

    /**
     * The _IsFullWindowButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsFullWindowButtonVisible => 902

    /**
     * The _IsPlaybackRateButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsPlaybackRateButtonVisible => 904

    /**
     * The _IsSeekBarVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsSeekBarVisible => 905

    /**
     * The _IsStopButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsStopButtonVisible => 908

    /**
     * The _IsVolumeButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsVolumeButtonVisible => 910

    /**
     * The _IsZoomButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsZoomButtonVisible => 912

    /**
     * The _Header_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_Header => 913

    /**
     * The _HeaderTemplate_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_HeaderTemplate => 914

    /**
     * The _IsPasswordRevealButtonEnabled_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_IsPasswordRevealButtonEnabled => 915

    /**
     * The _MaxLength_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_MaxLength => 916

    /**
     * The _Password_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_Password => 917

    /**
     * The _PasswordChar_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_PasswordChar => 918

    /**
     * The _PlaceholderText_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_PlaceholderText => 919

    /**
     * The _PreventKeyboardDisplayOnProgrammaticFocus_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_PreventKeyboardDisplayOnProgrammaticFocus => 920

    /**
     * The _SelectionHighlightColor_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_SelectionHighlightColor => 921

    /**
     * The _Data_ property for the [Path](../windows.ui.xaml.shapes/path.md) type.
     * @type {Integer (Int32)}
     */
    static Path_Data => 922

    /**
     * The _Data_ property for the [PathIcon](../windows.ui.xaml.controls/pathicon.md) type.
     * @type {Integer (Int32)}
     */
    static PathIcon_Data => 923

    /**
     * The _FillRule_ property for the [Polygon](../windows.ui.xaml.shapes/polygon.md) type.
     * @type {Integer (Int32)}
     */
    static Polygon_FillRule => 924

    /**
     * The _Points_ property for the [Polygon](../windows.ui.xaml.shapes/polygon.md) type.
     * @type {Integer (Int32)}
     */
    static Polygon_Points => 925

    /**
     * The _FillRule_ property for the [Polyline](../windows.ui.xaml.shapes/polyline.md) type.
     * @type {Integer (Int32)}
     */
    static Polyline_FillRule => 926

    /**
     * The _Points_ property for the [Polyline](../windows.ui.xaml.shapes/polyline.md) type.
     * @type {Integer (Int32)}
     */
    static Polyline_Points => 927

    /**
     * The _IsActive_ property for the [ProgressRing](../windows.ui.xaml.controls/progressring.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressRing_IsActive => 928

    /**
     * The _TemplateSettings_ property for the [ProgressRing](../windows.ui.xaml.controls/progressring.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressRing_TemplateSettings => 929

    /**
     * The _LargeChange_ property for the [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) type.
     * @type {Integer (Int32)}
     */
    static RangeBase_LargeChange => 930

    /**
     * The _Maximum_ property for the [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) type.
     * @type {Integer (Int32)}
     */
    static RangeBase_Maximum => 931

    /**
     * The _Minimum_ property for the [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) type.
     * @type {Integer (Int32)}
     */
    static RangeBase_Minimum => 932

    /**
     * The _SmallChange_ property for the [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) type.
     * @type {Integer (Int32)}
     */
    static RangeBase_SmallChange => 933

    /**
     * The _Value_ property for the [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) type.
     * @type {Integer (Int32)}
     */
    static RangeBase_Value => 934

    /**
     * The _RadiusX_ property for the [Rectangle](../windows.ui.xaml.shapes/rectangle.md) type.
     * @type {Integer (Int32)}
     */
    static Rectangle_RadiusX => 935

    /**
     * The _RadiusY_ property for the [Rectangle](../windows.ui.xaml.shapes/rectangle.md) type.
     * @type {Integer (Int32)}
     */
    static Rectangle_RadiusY => 936

    /**
     * The _AcceptsReturn_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_AcceptsReturn => 937

    /**
     * The _Header_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_Header => 938

    /**
     * The _HeaderTemplate_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_HeaderTemplate => 939

    /**
     * The _InputScope_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_InputScope => 940

    /**
     * The _IsColorFontEnabled_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_IsColorFontEnabled => 941

    /**
     * The _IsReadOnly_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_IsReadOnly => 942

    /**
     * The _IsSpellCheckEnabled_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_IsSpellCheckEnabled => 943

    /**
     * The _IsTextPredictionEnabled_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_IsTextPredictionEnabled => 944

    /**
     * The _PlaceholderText_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_PlaceholderText => 945

    /**
     * The _PreventKeyboardDisplayOnProgrammaticFocus_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_PreventKeyboardDisplayOnProgrammaticFocus => 946

    /**
     * The _SelectionHighlightColor_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_SelectionHighlightColor => 947

    /**
     * The _TextAlignment_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_TextAlignment => 948

    /**
     * The _TextWrapping_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_TextWrapping => 949

    /**
     * The _ChooseSuggestionOnEnter_ property for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_ChooseSuggestionOnEnter => 950

    /**
     * The _FocusOnKeyboardInput_ property for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_FocusOnKeyboardInput => 951

    /**
     * The _PlaceholderText_ property for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_PlaceholderText => 952

    /**
     * The _QueryText_ property for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_QueryText => 953

    /**
     * The _SearchHistoryContext_ property for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_SearchHistoryContext => 954

    /**
     * The _SearchHistoryEnabled_ property for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_SearchHistoryEnabled => 955

    /**
     * The _CanChangeViews_ property for the [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) type.
     * @type {Integer (Int32)}
     */
    static SemanticZoom_CanChangeViews => 956

    /**
     * The _IsZoomedInViewActive_ property for the [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) type.
     * @type {Integer (Int32)}
     */
    static SemanticZoom_IsZoomedInViewActive => 957

    /**
     * The _IsZoomOutButtonEnabled_ property for the [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) type.
     * @type {Integer (Int32)}
     */
    static SemanticZoom_IsZoomOutButtonEnabled => 958

    /**
     * The _ZoomedInView_ property for the [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) type.
     * @type {Integer (Int32)}
     */
    static SemanticZoom_ZoomedInView => 959

    /**
     * The _ZoomedOutView_ property for the [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) type.
     * @type {Integer (Int32)}
     */
    static SemanticZoom_ZoomedOutView => 960

    /**
     * The _AreScrollSnapPointsRegular_ property for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_AreScrollSnapPointsRegular => 961

    /**
     * The _Orientation_ property for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_Orientation => 962

    /**
     * The _Symbol_ property for the [SymbolIcon](../windows.ui.xaml.controls/symbolicon.md) type.
     * @type {Integer (Int32)}
     */
    static SymbolIcon_Symbol => 963

    /**
     * The _AcceptsReturn_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_AcceptsReturn => 964

    /**
     * The _Header_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_Header => 965

    /**
     * The _HeaderTemplate_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_HeaderTemplate => 966

    /**
     * The _InputScope_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_InputScope => 967

    /**
     * The _IsColorFontEnabled_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_IsColorFontEnabled => 968

    /**
     * The _IsReadOnly_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_IsReadOnly => 971

    /**
     * The _IsSpellCheckEnabled_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_IsSpellCheckEnabled => 972

    /**
     * The _IsTextPredictionEnabled_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_IsTextPredictionEnabled => 973

    /**
     * The _MaxLength_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_MaxLength => 974

    /**
     * The _PlaceholderText_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_PlaceholderText => 975

    /**
     * The _PreventKeyboardDisplayOnProgrammaticFocus_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_PreventKeyboardDisplayOnProgrammaticFocus => 976

    /**
     * The _SelectedText_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_SelectedText => 977

    /**
     * The _SelectionHighlightColor_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_SelectionHighlightColor => 978

    /**
     * The _SelectionLength_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_SelectionLength => 979

    /**
     * The _SelectionStart_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_SelectionStart => 980

    /**
     * The _Text_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_Text => 981

    /**
     * The _TextAlignment_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_TextAlignment => 982

    /**
     * The _TextWrapping_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_TextWrapping => 983

    /**
     * The _IsDragging_ property for the [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) type.
     * @type {Integer (Int32)}
     */
    static Thumb_IsDragging => 984

    /**
     * The _Fill_ property for the [TickBar](../windows.ui.xaml.controls.primitives/tickbar.md) type.
     * @type {Integer (Int32)}
     */
    static TickBar_Fill => 985

    /**
     * The _ClockIdentifier_ property for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_ClockIdentifier => 986

    /**
     * The _Header_ property for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_Header => 987

    /**
     * The _HeaderTemplate_ property for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_HeaderTemplate => 988

    /**
     * The _MinuteIncrement_ property for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_MinuteIncrement => 989

    /**
     * The _Time_ property for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_Time => 990

    /**
     * The _Header_ property for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_Header => 991

    /**
     * The _HeaderTemplate_ property for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_HeaderTemplate => 992

    /**
     * The _IsOn_ property for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_IsOn => 993

    /**
     * The _OffContent_ property for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_OffContent => 994

    /**
     * The _OffContentTemplate_ property for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_OffContentTemplate => 995

    /**
     * The _OnContent_ property for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_OnContent => 996

    /**
     * The _OnContentTemplate_ property for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_OnContentTemplate => 997

    /**
     * The _TemplateSettings_ property for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_TemplateSettings => 998

    /**
     * The _Content_ property for the [UserControl](../windows.ui.xaml.controls/usercontrol.md) type.
     * @type {Integer (Int32)}
     */
    static UserControl_Content => 999

    /**
     * The _ColumnSpan_ property for the [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid_ColumnSpan => 1000

    /**
     * The _HorizontalChildrenAlignment_ property for the [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid_HorizontalChildrenAlignment => 1001

    /**
     * The _ItemHeight_ property for the [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid_ItemHeight => 1002

    /**
     * The _ItemWidth_ property for the [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid_ItemWidth => 1003

    /**
     * The _MaximumRowsOrColumns_ property for the [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid_MaximumRowsOrColumns => 1004

    /**
     * The _Orientation_ property for the [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid_Orientation => 1005

    /**
     * The _RowSpan_ property for the [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid_RowSpan => 1006

    /**
     * The _VerticalChildrenAlignment_ property for the [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid_VerticalChildrenAlignment => 1007

    /**
     * The _AllowedScriptNotifyUris_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_AllowedScriptNotifyUris => 1008

    /**
     * The _CanGoBack_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_CanGoBack => 1009

    /**
     * The _CanGoForward_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_CanGoForward => 1010

    /**
     * The _ContainsFullScreenElement_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_ContainsFullScreenElement => 1011

    /**
     * The _DataTransferPackage_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_DataTransferPackage => 1012

    /**
     * The _DefaultBackgroundColor_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_DefaultBackgroundColor => 1013

    /**
     * The _DocumentTitle_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_DocumentTitle => 1014

    /**
     * The _Source_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_Source => 1015

    /**
     * The _ClosedDisplayMode_ property for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_ClosedDisplayMode => 1016

    /**
     * The _IsOpen_ property for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_IsOpen => 1017

    /**
     * The _IsSticky_ property for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_IsSticky => 1018

    /**
     * The _AutoMaximizeSuggestionArea_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_AutoMaximizeSuggestionArea => 1019

    /**
     * The _Header_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_Header => 1020

    /**
     * The _IsSuggestionListOpen_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_IsSuggestionListOpen => 1021

    /**
     * The _MaxSuggestionListHeight_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_MaxSuggestionListHeight => 1022

    /**
     * The _PlaceholderText_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_PlaceholderText => 1023

    /**
     * The _Text_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_Text => 1024

    /**
     * The _TextBoxStyle_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_TextBoxStyle => 1025

    /**
     * The _TextMemberPath_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_TextMemberPath => 1026

    /**
     * The _UpdateTextOnSelect_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_UpdateTextOnSelect => 1027

    /**
     * The _ClickMode_ property for the [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) type.
     * @type {Integer (Int32)}
     */
    static ButtonBase_ClickMode => 1029

    /**
     * The _Command_ property for the [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) type.
     * @type {Integer (Int32)}
     */
    static ButtonBase_Command => 1030

    /**
     * The _CommandParameter_ property for the [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) type.
     * @type {Integer (Int32)}
     */
    static ButtonBase_CommandParameter => 1031

    /**
     * The _IsPointerOver_ property for the [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) type.
     * @type {Integer (Int32)}
     */
    static ButtonBase_IsPointerOver => 1032

    /**
     * The _IsPressed_ property for the [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) type.
     * @type {Integer (Int32)}
     */
    static ButtonBase_IsPressed => 1033

    /**
     * The _FullSizeDesired_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_FullSizeDesired => 1034

    /**
     * The _IsPrimaryButtonEnabled_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_IsPrimaryButtonEnabled => 1035

    /**
     * The _IsSecondaryButtonEnabled_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_IsSecondaryButtonEnabled => 1036

    /**
     * The _PrimaryButtonCommand_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_PrimaryButtonCommand => 1037

    /**
     * The _PrimaryButtonCommandParameter_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_PrimaryButtonCommandParameter => 1038

    /**
     * The _PrimaryButtonText_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_PrimaryButtonText => 1039

    /**
     * The _SecondaryButtonCommand_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_SecondaryButtonCommand => 1040

    /**
     * The _SecondaryButtonCommandParameter_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_SecondaryButtonCommandParameter => 1041

    /**
     * The _SecondaryButtonText_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_SecondaryButtonText => 1042

    /**
     * The _Title_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_Title => 1043

    /**
     * The _TitleTemplate_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_TitleTemplate => 1044

    /**
     * The _BackStack_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_BackStack => 1045

    /**
     * The _BackStackDepth_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_BackStackDepth => 1046

    /**
     * The _CacheSize_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_CacheSize => 1047

    /**
     * The _CanGoBack_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_CanGoBack => 1048

    /**
     * The _CanGoForward_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_CanGoForward => 1049

    /**
     * The _CurrentSourcePageType_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_CurrentSourcePageType => 1050

    /**
     * The _ForwardStack_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_ForwardStack => 1051

    /**
     * The _SourcePageType_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_SourcePageType => 1052

    /**
     * The _CheckBrush_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_CheckBrush => 1053

    /**
     * The _CheckHintBrush_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_CheckHintBrush => 1054

    /**
     * The _CheckSelectingBrush_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_CheckSelectingBrush => 1055

    /**
     * The _ContentMargin_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_ContentMargin => 1056

    /**
     * The _DisabledOpacity_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_DisabledOpacity => 1057

    /**
     * The _DragBackground_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_DragBackground => 1058

    /**
     * The _DragForeground_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_DragForeground => 1059

    /**
     * The _DragOpacity_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_DragOpacity => 1060

    /**
     * The _FocusBorderBrush_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_FocusBorderBrush => 1061

    /**
     * The _GridViewItemPresenterHorizontalContentAlignment_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_GridViewItemPresenterHorizontalContentAlignment => 1062

    /**
     * The _GridViewItemPresenterPadding_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_GridViewItemPresenterPadding => 1063

    /**
     * The _PlaceholderBackground_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_PlaceholderBackground => 1064

    /**
     * The _PointerOverBackground_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_PointerOverBackground => 1065

    /**
     * The _PointerOverBackgroundMargin_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_PointerOverBackgroundMargin => 1066

    /**
     * The _ReorderHintOffset_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_ReorderHintOffset => 1067

    /**
     * The _SelectedBackground_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_SelectedBackground => 1068

    /**
     * The _SelectedBorderThickness_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_SelectedBorderThickness => 1069

    /**
     * The _SelectedForeground_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_SelectedForeground => 1070

    /**
     * The _SelectedPointerOverBackground_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_SelectedPointerOverBackground => 1071

    /**
     * The _SelectedPointerOverBorderBrush_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_SelectedPointerOverBorderBrush => 1072

    /**
     * The _SelectionCheckMarkVisualEnabled_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_SelectionCheckMarkVisualEnabled => 1073

    /**
     * The _GridViewItemPresenterVerticalContentAlignment_ property for the [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter_GridViewItemPresenterVerticalContentAlignment => 1074

    /**
     * The _CacheLength_ property for the [ItemsStackPanel](../windows.ui.xaml.controls/itemsstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsStackPanel_CacheLength => 1076

    /**
     * The _GroupHeaderPlacement_ property for the [ItemsStackPanel](../windows.ui.xaml.controls/itemsstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsStackPanel_GroupHeaderPlacement => 1077

    /**
     * The _GroupPadding_ property for the [ItemsStackPanel](../windows.ui.xaml.controls/itemsstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsStackPanel_GroupPadding => 1078

    /**
     * The _ItemsUpdatingScrollMode_ property for the [ItemsStackPanel](../windows.ui.xaml.controls/itemsstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsStackPanel_ItemsUpdatingScrollMode => 1079

    /**
     * The _Orientation_ property for the [ItemsStackPanel](../windows.ui.xaml.controls/itemsstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsStackPanel_Orientation => 1080

    /**
     * The _CacheLength_ property for the [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid_CacheLength => 1081

    /**
     * The _GroupHeaderPlacement_ property for the [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid_GroupHeaderPlacement => 1082

    /**
     * The _GroupPadding_ property for the [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid_GroupPadding => 1083

    /**
     * The _ItemHeight_ property for the [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid_ItemHeight => 1084

    /**
     * The _ItemWidth_ property for the [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid_ItemWidth => 1085

    /**
     * The _MaximumRowsOrColumns_ property for the [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid_MaximumRowsOrColumns => 1086

    /**
     * The _Orientation_ property for the [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid_Orientation => 1087

    /**
     * The _CheckBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBrush => 1088

    /**
     * The _CheckHintBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckHintBrush => 1089

    /**
     * The _CheckSelectingBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckSelectingBrush => 1090

    /**
     * The _ContentMargin_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_ContentMargin => 1091

    /**
     * The _DisabledOpacity_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_DisabledOpacity => 1092

    /**
     * The _DragBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_DragBackground => 1093

    /**
     * The _DragForeground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_DragForeground => 1094

    /**
     * The _DragOpacity_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_DragOpacity => 1095

    /**
     * The _FocusBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_FocusBorderBrush => 1096

    /**
     * The _ListViewItemPresenterHorizontalContentAlignment_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_ListViewItemPresenterHorizontalContentAlignment => 1097

    /**
     * The _ListViewItemPresenterPadding_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_ListViewItemPresenterPadding => 1098

    /**
     * The _PlaceholderBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_PlaceholderBackground => 1099

    /**
     * The _PointerOverBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_PointerOverBackground => 1100

    /**
     * The _PointerOverBackgroundMargin_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_PointerOverBackgroundMargin => 1101

    /**
     * The _ReorderHintOffset_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_ReorderHintOffset => 1102

    /**
     * The _SelectedBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedBackground => 1103

    /**
     * The _SelectedBorderThickness_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedBorderThickness => 1104

    /**
     * The _SelectedForeground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedForeground => 1105

    /**
     * The _SelectedPointerOverBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedPointerOverBackground => 1106

    /**
     * The _SelectedPointerOverBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedPointerOverBorderBrush => 1107

    /**
     * The _SelectionCheckMarkVisualEnabled_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectionCheckMarkVisualEnabled => 1108

    /**
     * The _ListViewItemPresenterVerticalContentAlignment_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_ListViewItemPresenterVerticalContentAlignment => 1109

    /**
     * The _Command_ property for the [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItem_Command => 1110

    /**
     * The _CommandParameter_ property for the [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItem_CommandParameter => 1111

    /**
     * The _Text_ property for the [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItem_Text => 1112

    /**
     * The _BottomAppBar_ property for the [Page](../windows.ui.xaml.controls/page.md) type.
     * @type {Integer (Int32)}
     */
    static Page_BottomAppBar => 1114

    /**
     * The _Frame_ property for the [Page](../windows.ui.xaml.controls/page.md) type.
     * @type {Integer (Int32)}
     */
    static Page_Frame => 1115

    /**
     * The _NavigationCacheMode_ property for the [Page](../windows.ui.xaml.controls/page.md) type.
     * @type {Integer (Int32)}
     */
    static Page_NavigationCacheMode => 1116

    /**
     * The _TopAppBar_ property for the [Page](../windows.ui.xaml.controls/page.md) type.
     * @type {Integer (Int32)}
     */
    static Page_TopAppBar => 1117

    /**
     * The _IsIndeterminate_ property for the [ProgressBar](../windows.ui.xaml.controls/progressbar.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBar_IsIndeterminate => 1118

    /**
     * The _ShowError_ property for the [ProgressBar](../windows.ui.xaml.controls/progressbar.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBar_ShowError => 1119

    /**
     * The _ShowPaused_ property for the [ProgressBar](../windows.ui.xaml.controls/progressbar.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBar_ShowPaused => 1120

    /**
     * The _TemplateSettings_ property for the [ProgressBar](../windows.ui.xaml.controls/progressbar.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBar_TemplateSettings => 1121

    /**
     * The _IndicatorMode_ property for the [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollBar_IndicatorMode => 1122

    /**
     * The _Orientation_ property for the [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollBar_Orientation => 1123

    /**
     * The _ViewportSize_ property for the [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollBar_ViewportSize => 1124

    /**
     * The _IsSynchronizedWithCurrentItem_ property for the [Selector](../windows.ui.xaml.controls.primitives/selector.md) type.
     * @type {Integer (Int32)}
     */
    static Selector_IsSynchronizedWithCurrentItem => 1126

    /**
     * The _SelectedIndex_ property for the [Selector](../windows.ui.xaml.controls.primitives/selector.md) type.
     * @type {Integer (Int32)}
     */
    static Selector_SelectedIndex => 1127

    /**
     * The _SelectedItem_ property for the [Selector](../windows.ui.xaml.controls.primitives/selector.md) type.
     * @type {Integer (Int32)}
     */
    static Selector_SelectedItem => 1128

    /**
     * The _SelectedValue_ property for the [Selector](../windows.ui.xaml.controls.primitives/selector.md) type.
     * @type {Integer (Int32)}
     */
    static Selector_SelectedValue => 1129

    /**
     * The _SelectedValuePath_ property for the [Selector](../windows.ui.xaml.controls.primitives/selector.md) type.
     * @type {Integer (Int32)}
     */
    static Selector_SelectedValuePath => 1130

    /**
     * The _IsSelected_ property for the [SelectorItem](../windows.ui.xaml.controls.primitives/selectoritem.md) type.
     * @type {Integer (Int32)}
     */
    static SelectorItem_IsSelected => 1131

    /**
     * The _HeaderBackground_ property for the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyout_HeaderBackground => 1132

    /**
     * The _HeaderForeground_ property for the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyout_HeaderForeground => 1133

    /**
     * The _IconSource_ property for the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyout_IconSource => 1134

    /**
     * The _TemplateSettings_ property for the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyout_TemplateSettings => 1135

    /**
     * The _Title_ property for the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyout_Title => 1136

    /**
     * The _Header_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_Header => 1137

    /**
     * The _HeaderTemplate_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_HeaderTemplate => 1138

    /**
     * The _IntermediateValue_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_IntermediateValue => 1139

    /**
     * The _IsDirectionReversed_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_IsDirectionReversed => 1140

    /**
     * The _IsThumbToolTipEnabled_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_IsThumbToolTipEnabled => 1141

    /**
     * The _Orientation_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_Orientation => 1142

    /**
     * The _SnapsTo_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_SnapsTo => 1143

    /**
     * The _StepFrequency_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_StepFrequency => 1144

    /**
     * The _ThumbToolTipValueConverter_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_ThumbToolTipValueConverter => 1145

    /**
     * The _TickFrequency_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_TickFrequency => 1146

    /**
     * The _TickPlacement_ property for the [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider_TickPlacement => 1147

    /**
     * The _CompositionScaleX_ property for the [SwapChainPanel](../windows.ui.xaml.controls/swapchainpanel.md) type.
     * @type {Integer (Int32)}
     */
    static SwapChainPanel_CompositionScaleX => 1148

    /**
     * The _CompositionScaleY_ property for the [SwapChainPanel](../windows.ui.xaml.controls/swapchainpanel.md) type.
     * @type {Integer (Int32)}
     */
    static SwapChainPanel_CompositionScaleY => 1149

    /**
     * The _HorizontalOffset_ property for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_HorizontalOffset => 1150

    /**
     * The _IsOpen_ property for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_IsOpen => 1151

    /**
     * The _Placement_ property for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_Placement => 1152

    /**
     * The _PlacementTarget_ property for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_PlacementTarget => 1153

    /**
     * The _TemplateSettings_ property for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_TemplateSettings => 1154

    /**
     * The _VerticalOffset_ property for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_VerticalOffset => 1155

    /**
     * The _Flyout_ property for the [Button](../windows.ui.xaml.controls/button.md) type.
     * @type {Integer (Int32)}
     */
    static Button_Flyout => 1156

    /**
     * The _Header_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_Header => 1157

    /**
     * The _HeaderTemplate_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_HeaderTemplate => 1158

    /**
     * The _IsDropDownOpen_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_IsDropDownOpen => 1159

    /**
     * The _IsEditable_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_IsEditable => 1160

    /**
     * The _IsSelectionBoxHighlighted_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_IsSelectionBoxHighlighted => 1161

    /**
     * The _MaxDropDownHeight_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_MaxDropDownHeight => 1162

    /**
     * The _PlaceholderText_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_PlaceholderText => 1163

    /**
     * The _SelectionBoxItem_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_SelectionBoxItem => 1164

    /**
     * The _SelectionBoxItemTemplate_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_SelectionBoxItemTemplate => 1165

    /**
     * The _TemplateSettings_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_TemplateSettings => 1166

    /**
     * The _PrimaryCommands_ property for the [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar_PrimaryCommands => 1167

    /**
     * The _SecondaryCommands_ property for the [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar_SecondaryCommands => 1168

    /**
     * The _UseTouchAnimationsForAllNavigation_ property for the [FlipView](../windows.ui.xaml.controls/flipview.md) type.
     * @type {Integer (Int32)}
     */
    static FlipView_UseTouchAnimationsForAllNavigation => 1169

    /**
     * The _NavigateUri_ property for the [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md) type.
     * @type {Integer (Int32)}
     */
    static HyperlinkButton_NavigateUri => 1170

    /**
     * The _SelectedItems_ property for the [ListBox](../windows.ui.xaml.controls/listbox.md) type.
     * @type {Integer (Int32)}
     */
    static ListBox_SelectedItems => 1171

    /**
     * The _SelectionMode_ property for the [ListBox](../windows.ui.xaml.controls/listbox.md) type.
     * @type {Integer (Int32)}
     */
    static ListBox_SelectionMode => 1172

    /**
     * The _CanDragItems_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_CanDragItems => 1173

    /**
     * The _CanReorderItems_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_CanReorderItems => 1174

    /**
     * The _DataFetchSize_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_DataFetchSize => 1175

    /**
     * The _Footer_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_Footer => 1176

    /**
     * The _FooterTemplate_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_FooterTemplate => 1177

    /**
     * The _FooterTransitions_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_FooterTransitions => 1178

    /**
     * The _Header_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_Header => 1179

    /**
     * The _HeaderTemplate_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_HeaderTemplate => 1180

    /**
     * The _HeaderTransitions_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_HeaderTransitions => 1181

    /**
     * The _IncrementalLoadingThreshold_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_IncrementalLoadingThreshold => 1182

    /**
     * The _IncrementalLoadingTrigger_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_IncrementalLoadingTrigger => 1183

    /**
     * The _IsActiveView_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_IsActiveView => 1184

    /**
     * The _IsItemClickEnabled_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_IsItemClickEnabled => 1185

    /**
     * The _IsSwipeEnabled_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_IsSwipeEnabled => 1186

    /**
     * The _IsZoomedInView_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_IsZoomedInView => 1187

    /**
     * The _ReorderMode_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_ReorderMode => 1188

    /**
     * The _SelectedItems_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_SelectedItems => 1189

    /**
     * The _SelectionMode_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_SelectionMode => 1190

    /**
     * The _SemanticZoomOwner_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_SemanticZoomOwner => 1191

    /**
     * The _ShowsScrollingPlaceholders_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_ShowsScrollingPlaceholders => 1192

    /**
     * The _Delay_ property for the [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md) type.
     * @type {Integer (Int32)}
     */
    static RepeatButton_Delay => 1193

    /**
     * The _Interval_ property for the [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md) type.
     * @type {Integer (Int32)}
     */
    static RepeatButton_Interval => 1194

    /**
     * The _BringIntoViewOnFocusChange_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_BringIntoViewOnFocusChange => 1195

    /**
     * The _ComputedHorizontalScrollBarVisibility_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ComputedHorizontalScrollBarVisibility => 1196

    /**
     * The _ComputedVerticalScrollBarVisibility_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ComputedVerticalScrollBarVisibility => 1197

    /**
     * The _ExtentHeight_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ExtentHeight => 1198

    /**
     * The _ExtentWidth_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ExtentWidth => 1199

    /**
     * The _HorizontalOffset_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_HorizontalOffset => 1200

    /**
     * The _HorizontalScrollBarVisibility_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_HorizontalScrollBarVisibility => 1201

    /**
     * The _HorizontalScrollMode_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_HorizontalScrollMode => 1202

    /**
     * The _HorizontalSnapPointsAlignment_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_HorizontalSnapPointsAlignment => 1203

    /**
     * The _HorizontalSnapPointsType_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_HorizontalSnapPointsType => 1204

    /**
     * The _IsDeferredScrollingEnabled_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_IsDeferredScrollingEnabled => 1205

    /**
     * The _IsHorizontalRailEnabled_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_IsHorizontalRailEnabled => 1206

    /**
     * The _IsHorizontalScrollChainingEnabled_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_IsHorizontalScrollChainingEnabled => 1207

    /**
     * The _IsScrollInertiaEnabled_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_IsScrollInertiaEnabled => 1208

    /**
     * The _IsVerticalRailEnabled_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_IsVerticalRailEnabled => 1209

    /**
     * The _IsVerticalScrollChainingEnabled_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_IsVerticalScrollChainingEnabled => 1210

    /**
     * The _IsZoomChainingEnabled_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_IsZoomChainingEnabled => 1211

    /**
     * The _IsZoomInertiaEnabled_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_IsZoomInertiaEnabled => 1212

    /**
     * The _LeftHeader_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_LeftHeader => 1213

    /**
     * The _MaxZoomFactor_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_MaxZoomFactor => 1214

    /**
     * The _MinZoomFactor_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_MinZoomFactor => 1215

    /**
     * The _ScrollableHeight_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ScrollableHeight => 1216

    /**
     * The _ScrollableWidth_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ScrollableWidth => 1217

    /**
     * The _TopHeader_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_TopHeader => 1218

    /**
     * The _TopLeftHeader_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_TopLeftHeader => 1219

    /**
     * The _VerticalOffset_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_VerticalOffset => 1220

    /**
     * The _VerticalScrollBarVisibility_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_VerticalScrollBarVisibility => 1221

    /**
     * The _VerticalScrollMode_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_VerticalScrollMode => 1222

    /**
     * The _VerticalSnapPointsAlignment_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_VerticalSnapPointsAlignment => 1223

    /**
     * The _VerticalSnapPointsType_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_VerticalSnapPointsType => 1224

    /**
     * The _ViewportHeight_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ViewportHeight => 1225

    /**
     * The _ViewportWidth_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ViewportWidth => 1226

    /**
     * The _ZoomFactor_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ZoomFactor => 1227

    /**
     * The _ZoomMode_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ZoomMode => 1228

    /**
     * The _ZoomSnapPoints_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ZoomSnapPoints => 1229

    /**
     * The _ZoomSnapPointsType_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ZoomSnapPointsType => 1230

    /**
     * The _IsChecked_ property for the [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleButton_IsChecked => 1231

    /**
     * The _IsThreeState_ property for the [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleButton_IsThreeState => 1232

    /**
     * The _IsChecked_ property for the [ToggleMenuFlyoutItem](../windows.ui.xaml.controls/togglemenuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleMenuFlyoutItem_IsChecked => 1233

    /**
     * The _AreScrollSnapPointsRegular_ property for the [VirtualizingStackPanel](../windows.ui.xaml.controls/virtualizingstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static VirtualizingStackPanel_AreScrollSnapPointsRegular => 1234

    /**
     * The _IsVirtualizing_ property for the [VirtualizingStackPanel](../windows.ui.xaml.controls/virtualizingstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static VirtualizingStackPanel_IsVirtualizing => 1236

    /**
     * The _Orientation_ property for the [VirtualizingStackPanel](../windows.ui.xaml.controls/virtualizingstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static VirtualizingStackPanel_Orientation => 1237

    /**
     * The _VirtualizationMode_ property for the [VirtualizingStackPanel](../windows.ui.xaml.controls/virtualizingstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static VirtualizingStackPanel_VirtualizationMode => 1238

    /**
     * The _HorizontalChildrenAlignment_ property for the [WrapGrid](../windows.ui.xaml.controls/wrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static WrapGrid_HorizontalChildrenAlignment => 1239

    /**
     * The _ItemHeight_ property for the [WrapGrid](../windows.ui.xaml.controls/wrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static WrapGrid_ItemHeight => 1240

    /**
     * The _ItemWidth_ property for the [WrapGrid](../windows.ui.xaml.controls/wrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static WrapGrid_ItemWidth => 1241

    /**
     * The _MaximumRowsOrColumns_ property for the [WrapGrid](../windows.ui.xaml.controls/wrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static WrapGrid_MaximumRowsOrColumns => 1242

    /**
     * The _Orientation_ property for the [WrapGrid](../windows.ui.xaml.controls/wrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static WrapGrid_Orientation => 1243

    /**
     * The _VerticalChildrenAlignment_ property for the [WrapGrid](../windows.ui.xaml.controls/wrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static WrapGrid_VerticalChildrenAlignment => 1244

    /**
     * The _Icon_ property for the [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton_Icon => 1245

    /**
     * The _IsCompact_ property for the [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton_IsCompact => 1246

    /**
     * The _Label_ property for the [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton_Label => 1247

    /**
     * The _Icon_ property for the [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton_Icon => 1248

    /**
     * The _IsCompact_ property for the [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton_IsCompact => 1249

    /**
     * The _Label_ property for the [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton_Label => 1250

    /**
     * The _TemplateSettings_ property for the [GridViewItem](../windows.ui.xaml.controls/gridviewitem.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItem_TemplateSettings => 1251

    /**
     * The _TemplateSettings_ property for the [ListViewItem](../windows.ui.xaml.controls/listviewitem.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItem_TemplateSettings => 1252

    /**
     * The _GroupName_ property for the [RadioButton](../windows.ui.xaml.controls/radiobutton.md) type.
     * @type {Integer (Int32)}
     */
    static RadioButton_GroupName => 1253

    /**
     * The _ColorFontPaletteIndex_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_ColorFontPaletteIndex => 1267

    /**
     * The _IsColorFontEnabled_ property for the [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs_IsColorFontEnabled => 1268

    /**
     * The _HasMoreContentAfter_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_HasMoreContentAfter => 1274

    /**
     * The _HasMoreContentBefore_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_HasMoreContentBefore => 1275

    /**
     * The _HasMoreViews_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_HasMoreViews => 1276

    /**
     * The _HeaderText_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_HeaderText => 1277

    /**
     * The _WeekDay1_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_WeekDay1 => 1280

    /**
     * The _WeekDay2_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_WeekDay2 => 1281

    /**
     * The _WeekDay3_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_WeekDay3 => 1282

    /**
     * The _WeekDay4_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_WeekDay4 => 1283

    /**
     * The _WeekDay5_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_WeekDay5 => 1284

    /**
     * The _WeekDay6_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_WeekDay6 => 1285

    /**
     * The _WeekDay7_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_WeekDay7 => 1286

    /**
     * The _CalendarIdentifier_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarIdentifier => 1291

    /**
     * The _DayOfWeekFormat_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_DayOfWeekFormat => 1299

    /**
     * The _DisplayMode_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_DisplayMode => 1302

    /**
     * The _FirstDayOfWeek_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstDayOfWeek => 1303

    /**
     * The _IsOutOfScopeEnabled_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_IsOutOfScopeEnabled => 1317

    /**
     * The _IsTodayHighlighted_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_IsTodayHighlighted => 1318

    /**
     * The _MaxDate_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_MaxDate => 1320

    /**
     * The _MinDate_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_MinDate => 1321

    /**
     * The _NumberOfWeeksInView_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_NumberOfWeeksInView => 1327

    /**
     * The _SelectedDates_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedDates => 1333

    /**
     * The _SelectionMode_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectionMode => 1335

    /**
     * The _TemplateSettings_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_TemplateSettings => 1336

    /**
     * The _Date_ property for the [CalendarViewDayItem](../windows.ui.xaml.controls/calendarviewdayitem.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewDayItem_Date => 1339

    /**
     * The _IsBlackout_ property for the [CalendarViewDayItem](../windows.ui.xaml.controls/calendarviewdayitem.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewDayItem_IsBlackout => 1340

    /**
     * The _IsFastForwardEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsFastForwardEnabled => 1382

    /**
     * The _IsFastRewindEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsFastRewindEnabled => 1383

    /**
     * The _IsFullWindowEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsFullWindowEnabled => 1384

    /**
     * The _IsPlaybackRateEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsPlaybackRateEnabled => 1385

    /**
     * The _IsSeekEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsSeekEnabled => 1386

    /**
     * The _IsStopEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsStopEnabled => 1387

    /**
     * The _IsVolumeEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsVolumeEnabled => 1388

    /**
     * The _IsZoomEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsZoomEnabled => 1389

    /**
     * The _LineHeight_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_LineHeight => 1425

    /**
     * The _MinViewWidth_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_MinViewWidth => 1435

    /**
     * The _SelectedRanges_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_SelectedRanges => 1459

    /**
     * The _CompactPaneGridLength_ property for the [SplitViewTemplateSettings](../windows.ui.xaml.controls.primitives/splitviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SplitViewTemplateSettings_CompactPaneGridLength => 1462

    /**
     * The _NegativeOpenPaneLength_ property for the [SplitViewTemplateSettings](../windows.ui.xaml.controls.primitives/splitviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SplitViewTemplateSettings_NegativeOpenPaneLength => 1463

    /**
     * The _NegativeOpenPaneLengthMinusCompactLength_ property for the [SplitViewTemplateSettings](../windows.ui.xaml.controls.primitives/splitviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SplitViewTemplateSettings_NegativeOpenPaneLengthMinusCompactLength => 1464

    /**
     * The _OpenPaneGridLength_ property for the [SplitViewTemplateSettings](../windows.ui.xaml.controls.primitives/splitviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SplitViewTemplateSettings_OpenPaneGridLength => 1465

    /**
     * The _OpenPaneLengthMinusCompactLength_ property for the [SplitViewTemplateSettings](../windows.ui.xaml.controls.primitives/splitviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SplitViewTemplateSettings_OpenPaneLengthMinusCompactLength => 1466

    /**
     * The _CompactPaneLength_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_CompactPaneLength => 1467

    /**
     * The _Content_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_Content => 1468

    /**
     * The _DisplayMode_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_DisplayMode => 1469

    /**
     * The _IsPaneOpen_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_IsPaneOpen => 1470

    /**
     * The _OpenPaneLength_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_OpenPaneLength => 1471

    /**
     * The _Pane_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_Pane => 1472

    /**
     * The _PanePlacement_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_PanePlacement => 1473

    /**
     * The _TemplateSettings_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_TemplateSettings => 1474

    /**
     * The _Transform3D_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Transform3D => 1475

    /**
     * The _CenterX_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_CenterX => 1476

    /**
     * The _CenterY_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_CenterY => 1478

    /**
     * The _CenterZ_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_CenterZ => 1480

    /**
     * The _RotationX_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_RotationX => 1482

    /**
     * The _RotationY_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_RotationY => 1484

    /**
     * The _RotationZ_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_RotationZ => 1486

    /**
     * The _ScaleX_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_ScaleX => 1488

    /**
     * The _ScaleY_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_ScaleY => 1490

    /**
     * The _ScaleZ_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_ScaleZ => 1492

    /**
     * The _TranslateX_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_TranslateX => 1494

    /**
     * The _TranslateY_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_TranslateY => 1496

    /**
     * The _TranslateZ_ property for the [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D_TranslateZ => 1498

    /**
     * The _Depth_ property for the [PerspectiveTransform3D](../windows.ui.xaml.media.media3d/perspectivetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static PerspectiveTransform3D_Depth => 1500

    /**
     * The _OffsetX_ property for the [PerspectiveTransform3D](../windows.ui.xaml.media.media3d/perspectivetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static PerspectiveTransform3D_OffsetX => 1501

    /**
     * The _OffsetY_ property for the [PerspectiveTransform3D](../windows.ui.xaml.media.media3d/perspectivetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static PerspectiveTransform3D_OffsetY => 1502

    /**
     * The _Above_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_Above => 1508

    /**
     * The _AlignBottomWith_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignBottomWith => 1509

    /**
     * The _AlignLeftWith_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignLeftWith => 1510

    /**
     * The _AlignRightWith_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignRightWith => 1515

    /**
     * The _AlignTopWith_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignTopWith => 1516

    /**
     * The _Below_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_Below => 1517

    /**
     * The _LeftOf_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_LeftOf => 1520

    /**
     * The _RightOf_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_RightOf => 1521

    /**
     * The _OpenPaneLength_ property for the [SplitViewTemplateSettings](../windows.ui.xaml.controls.primitives/splitviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static SplitViewTemplateSettings_OpenPaneLength => 1524

    /**
     * The _PasswordRevealMode_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_PasswordRevealMode => 1527

    /**
     * The _PaneBackground_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_PaneBackground => 1528

    /**
     * The _AreStickyGroupHeadersEnabled_ property for the [ItemsStackPanel](../windows.ui.xaml.controls/itemsstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsStackPanel_AreStickyGroupHeadersEnabled => 1529

    /**
     * The _AreStickyGroupHeadersEnabled_ property for the [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid_AreStickyGroupHeadersEnabled => 1530

    /**
     * The _Items_ property for the [MenuFlyoutSubItem](../windows.ui.xaml.controls/menuflyoutsubitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutSubItem_Items => 1531

    /**
     * The _Text_ property for the [MenuFlyoutSubItem](../windows.ui.xaml.controls/menuflyoutsubitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutSubItem_Text => 1532

    /**
     * The _CanDrag_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_CanDrag => 1534

    /**
     * The _ExtensionInstance_ property for the [DataTemplate](../windows.ui.xaml/datatemplate.md) type.
     * @type {Integer (Int32)}
     */
    static DataTemplate_ExtensionInstance => 1535

    /**
     * The _AlignHorizontalCenterWith_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignHorizontalCenterWith => 1552

    /**
     * The _AlignVerticalCenterWith_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignVerticalCenterWith => 1553

    /**
     * The _Path_ property for the [TargetPropertyPath](../windows.ui.xaml/targetpropertypath.md) type.
     * @type {Integer (Int32)}
     */
    static TargetPropertyPath_Path => 1555

    /**
     * The _Target_ property for the [TargetPropertyPath](../windows.ui.xaml/targetpropertypath.md) type.
     * @type {Integer (Int32)}
     */
    static TargetPropertyPath_Target => 1556

    /**
     * The _Setters_ property for the [VisualState](../windows.ui.xaml/visualstate.md) type.
     * @type {Integer (Int32)}
     */
    static VisualState_Setters => 1558

    /**
     * The _StateTriggers_ property for the [VisualState](../windows.ui.xaml/visualstate.md) type.
     * @type {Integer (Int32)}
     */
    static VisualState_StateTriggers => 1559

    /**
     * The _MinWindowHeight_ property for the [AdaptiveTrigger](../windows.ui.xaml/adaptivetrigger.md) type.
     * @type {Integer (Int32)}
     */
    static AdaptiveTrigger_MinWindowHeight => 1560

    /**
     * The _MinWindowWidth_ property for the [AdaptiveTrigger](../windows.ui.xaml/adaptivetrigger.md) type.
     * @type {Integer (Int32)}
     */
    static AdaptiveTrigger_MinWindowWidth => 1561

    /**
     * The _Target_ property for the [Setter](../windows.ui.xaml/setter.md) type.
     * @type {Integer (Int32)}
     */
    static Setter_Target => 1562

    /**
     * The _BlackoutForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_BlackoutForeground => 1565

    /**
     * The _CalendarItemBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarItemBackground => 1566

    /**
     * The _CalendarItemBorderBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarItemBorderBrush => 1567

    /**
     * The _CalendarItemBorderThickness_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarItemBorderThickness => 1568

    /**
     * The _CalendarItemForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarItemForeground => 1569

    /**
     * The _CalendarViewDayItemStyle_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarViewDayItemStyle => 1570

    /**
     * The _DayItemFontFamily_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_DayItemFontFamily => 1571

    /**
     * The _DayItemFontSize_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_DayItemFontSize => 1572

    /**
     * The _DayItemFontStyle_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_DayItemFontStyle => 1573

    /**
     * The _DayItemFontWeight_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_DayItemFontWeight => 1574

    /**
     * The _FirstOfMonthLabelFontFamily_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfMonthLabelFontFamily => 1575

    /**
     * The _FirstOfMonthLabelFontSize_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfMonthLabelFontSize => 1576

    /**
     * The _FirstOfMonthLabelFontStyle_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfMonthLabelFontStyle => 1577

    /**
     * The _FirstOfMonthLabelFontWeight_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfMonthLabelFontWeight => 1578

    /**
     * The _FirstOfYearDecadeLabelFontFamily_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfYearDecadeLabelFontFamily => 1579

    /**
     * The _FirstOfYearDecadeLabelFontSize_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfYearDecadeLabelFontSize => 1580

    /**
     * The _FirstOfYearDecadeLabelFontStyle_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfYearDecadeLabelFontStyle => 1581

    /**
     * The _FirstOfYearDecadeLabelFontWeight_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfYearDecadeLabelFontWeight => 1582

    /**
     * The _FocusBorderBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FocusBorderBrush => 1583

    /**
     * The _HorizontalDayItemAlignment_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_HorizontalDayItemAlignment => 1584

    /**
     * The _HorizontalFirstOfMonthLabelAlignment_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_HorizontalFirstOfMonthLabelAlignment => 1585

    /**
     * The _HoverBorderBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_HoverBorderBrush => 1586

    /**
     * The _MonthYearItemFontFamily_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_MonthYearItemFontFamily => 1588

    /**
     * The _MonthYearItemFontSize_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_MonthYearItemFontSize => 1589

    /**
     * The _MonthYearItemFontStyle_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_MonthYearItemFontStyle => 1590

    /**
     * The _MonthYearItemFontWeight_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_MonthYearItemFontWeight => 1591

    /**
     * The _OutOfScopeBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_OutOfScopeBackground => 1592

    /**
     * The _OutOfScopeForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_OutOfScopeForeground => 1593

    /**
     * The _PressedBorderBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_PressedBorderBrush => 1594

    /**
     * The _PressedForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_PressedForeground => 1595

    /**
     * The _SelectedBorderBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedBorderBrush => 1596

    /**
     * The _SelectedForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedForeground => 1597

    /**
     * The _SelectedHoverBorderBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedHoverBorderBrush => 1598

    /**
     * The _SelectedPressedBorderBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedPressedBorderBrush => 1599

    /**
     * The _TodayFontWeight_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_TodayFontWeight => 1600

    /**
     * The _TodayForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_TodayForeground => 1601

    /**
     * The _VerticalDayItemAlignment_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_VerticalDayItemAlignment => 1602

    /**
     * The _VerticalFirstOfMonthLabelAlignment_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_VerticalFirstOfMonthLabelAlignment => 1603

    /**
     * The _IsCompact_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsCompact => 1605

    /**
     * The _AlignBottomWithPanel_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignBottomWithPanel => 1606

    /**
     * The _AlignHorizontalCenterWithPanel_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignHorizontalCenterWithPanel => 1607

    /**
     * The _AlignLeftWithPanel_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignLeftWithPanel => 1608

    /**
     * The _AlignRightWithPanel_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignRightWithPanel => 1609

    /**
     * The _AlignTopWithPanel_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignTopWithPanel => 1610

    /**
     * The _AlignVerticalCenterWithPanel_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_AlignVerticalCenterWithPanel => 1611

    /**
     * The _IsMultiSelectCheckBoxEnabled_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_IsMultiSelectCheckBoxEnabled => 1612

    /**
     * The _Level_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_Level => 1614

    /**
     * The _PositionInSet_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_PositionInSet => 1615

    /**
     * The _SizeOfSet_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_SizeOfSet => 1616

    /**
     * The _CheckBoxBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxBrush => 1617

    /**
     * The _CheckMode_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckMode => 1618

    /**
     * The _PressedBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_PressedBackground => 1620

    /**
     * The _SelectedPressedBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedPressedBackground => 1621

    /**
     * The _IsTemplateFocusTarget_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_IsTemplateFocusTarget => 1623

    /**
     * The _UseSystemFocusVisuals_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_UseSystemFocusVisuals => 1624

    /**
     * The _FocusSecondaryBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_FocusSecondaryBorderBrush => 1628

    /**
     * The _PointerOverForeground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_PointerOverForeground => 1630

    /**
     * The _MirroredWhenRightToLeft_ property for the [FontIcon](../windows.ui.xaml.controls/fonticon.md) type.
     * @type {Integer (Int32)}
     */
    static FontIcon_MirroredWhenRightToLeft => 1631

    /**
     * The _CenterX_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_CenterX => 1632

    /**
     * The _CenterY_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_CenterY => 1633

    /**
     * The _ClipRect_ property for the [CalendarViewTemplateSettings](../windows.ui.xaml.controls.primitives/calendarviewtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewTemplateSettings_ClipRect => 1634

    /**
     * The _TextReadingOrder_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_TextReadingOrder => 1650

    /**
     * The _TextReadingOrder_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_TextReadingOrder => 1651

    /**
     * The _TextReadingOrder_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_TextReadingOrder => 1652

    /**
     * The _ExecutionMode_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_ExecutionMode => 1653

    /**
     * The _DeferredPermissionRequests_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_DeferredPermissionRequests => 1655

    /**
     * The _Settings_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_Settings => 1656

    /**
     * The _DesiredCandidateWindowAlignment_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_DesiredCandidateWindowAlignment => 1660

    /**
     * The _DesiredCandidateWindowAlignment_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_DesiredCandidateWindowAlignment => 1662

    /**
     * The _CalendarIdentifier_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_CalendarIdentifier => 1663

    /**
     * The _CalendarViewStyle_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_CalendarViewStyle => 1664

    /**
     * The _Date_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_Date => 1665

    /**
     * The _DateFormat_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_DateFormat => 1666

    /**
     * The _DayOfWeekFormat_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_DayOfWeekFormat => 1667

    /**
     * The _DisplayMode_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_DisplayMode => 1668

    /**
     * The _FirstDayOfWeek_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_FirstDayOfWeek => 1669

    /**
     * The _Header_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_Header => 1670

    /**
     * The _HeaderTemplate_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_HeaderTemplate => 1671

    /**
     * The _IsCalendarOpen_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_IsCalendarOpen => 1672

    /**
     * The _IsGroupLabelVisible_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_IsGroupLabelVisible => 1673

    /**
     * The _IsOutOfScopeEnabled_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_IsOutOfScopeEnabled => 1674

    /**
     * The _IsTodayHighlighted_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_IsTodayHighlighted => 1675

    /**
     * The _MaxDate_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_MaxDate => 1676

    /**
     * The _MinDate_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_MinDate => 1677

    /**
     * The _PlaceholderText_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_PlaceholderText => 1678

    /**
     * The _IsGroupLabelVisible_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_IsGroupLabelVisible => 1679

    /**
     * The _Background_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_Background => 1680

    /**
     * The _BorderBrush_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_BorderBrush => 1681

    /**
     * The _BorderThickness_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_BorderThickness => 1682

    /**
     * The _CornerRadius_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_CornerRadius => 1683

    /**
     * The _Padding_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_Padding => 1684

    /**
     * The _BorderBrush_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_BorderBrush => 1685

    /**
     * The _BorderThickness_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_BorderThickness => 1686

    /**
     * The _CornerRadius_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_CornerRadius => 1687

    /**
     * The _Padding_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_Padding => 1688

    /**
     * The _BorderBrush_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_BorderBrush => 1689

    /**
     * The _BorderThickness_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_BorderThickness => 1690

    /**
     * The _CornerRadius_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_CornerRadius => 1691

    /**
     * The _Padding_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_Padding => 1692

    /**
     * The _BorderBrush_ property for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_BorderBrush => 1693

    /**
     * The _BorderThickness_ property for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_BorderThickness => 1694

    /**
     * The _CornerRadius_ property for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_CornerRadius => 1695

    /**
     * The _Padding_ property for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_Padding => 1696

    /**
     * The _InputScope_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_InputScope => 1697

    /**
     * The _DropoutOrder_ property for the [MediaTransportControlsHelper](../windows.ui.xaml.controls/mediatransportcontrolshelper.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControlsHelper_DropoutOrder => 1698

    /**
     * The _ChosenSuggestion_ property for the [AutoSuggestBoxQuerySubmittedEventArgs](../windows.ui.xaml.controls/autosuggestboxquerysubmittedeventargs.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBoxQuerySubmittedEventArgs_ChosenSuggestion => 1699

    /**
     * The _QueryText_ property for the [AutoSuggestBoxQuerySubmittedEventArgs](../windows.ui.xaml.controls/autosuggestboxquerysubmittedeventargs.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBoxQuerySubmittedEventArgs_QueryText => 1700

    /**
     * The _QueryIcon_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_QueryIcon => 1701

    /**
     * The _IsActive_ property for the [StateTrigger](../windows.ui.xaml/statetrigger.md) type.
     * @type {Integer (Int32)}
     */
    static StateTrigger_IsActive => 1702

    /**
     * The _HorizontalContentAlignment_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_HorizontalContentAlignment => 1703

    /**
     * The _VerticalContentAlignment_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_VerticalContentAlignment => 1704

    /**
     * The _ClipRect_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_ClipRect => 1705

    /**
     * The _CompactRootMargin_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_CompactRootMargin => 1706

    /**
     * The _CompactVerticalDelta_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_CompactVerticalDelta => 1707

    /**
     * The _HiddenRootMargin_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_HiddenRootMargin => 1708

    /**
     * The _HiddenVerticalDelta_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_HiddenVerticalDelta => 1709

    /**
     * The _MinimalRootMargin_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_MinimalRootMargin => 1710

    /**
     * The _MinimalVerticalDelta_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_MinimalVerticalDelta => 1711

    /**
     * The _ContentHeight_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_ContentHeight => 1712

    /**
     * The _NegativeOverflowContentHeight_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_NegativeOverflowContentHeight => 1713

    /**
     * The _OverflowContentClipRect_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentClipRect => 1714

    /**
     * The _OverflowContentHeight_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentHeight => 1715

    /**
     * The _OverflowContentHorizontalOffset_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentHorizontalOffset => 1716

    /**
     * The _OverflowContentMaxHeight_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentMaxHeight => 1717

    /**
     * The _OverflowContentMinWidth_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentMinWidth => 1718

    /**
     * The _TemplateSettings_ property for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_TemplateSettings => 1719

    /**
     * The _CommandBarOverflowPresenterStyle_ property for the [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar_CommandBarOverflowPresenterStyle => 1720

    /**
     * The _CommandBarTemplateSettings_ property for the [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar_CommandBarTemplateSettings => 1721

    /**
     * The _EntranceTarget_ property for the [DrillInThemeAnimation](../windows.ui.xaml.media.animation/drillinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillInThemeAnimation_EntranceTarget => 1722

    /**
     * The _EntranceTargetName_ property for the [DrillInThemeAnimation](../windows.ui.xaml.media.animation/drillinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillInThemeAnimation_EntranceTargetName => 1723

    /**
     * The _ExitTarget_ property for the [DrillInThemeAnimation](../windows.ui.xaml.media.animation/drillinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillInThemeAnimation_ExitTarget => 1724

    /**
     * The _ExitTargetName_ property for the [DrillInThemeAnimation](../windows.ui.xaml.media.animation/drillinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillInThemeAnimation_ExitTargetName => 1725

    /**
     * The _EntranceTarget_ property for the [DrillOutThemeAnimation](../windows.ui.xaml.media.animation/drilloutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillOutThemeAnimation_EntranceTarget => 1726

    /**
     * The _EntranceTargetName_ property for the [DrillOutThemeAnimation](../windows.ui.xaml.media.animation/drilloutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillOutThemeAnimation_EntranceTargetName => 1727

    /**
     * The _ExitTarget_ property for the [DrillOutThemeAnimation](../windows.ui.xaml.media.animation/drilloutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillOutThemeAnimation_ExitTarget => 1728

    /**
     * The _ExitTargetName_ property for the [DrillOutThemeAnimation](../windows.ui.xaml.media.animation/drilloutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillOutThemeAnimation_ExitTargetName => 1729

    /**
     * The _DataTemplateComponent_ property for the [XamlBindingHelper](../windows.ui.xaml.markup/xamlbindinghelper.md) type.
     * @type {Integer (Int32)}
     */
    static XamlBindingHelper_DataTemplateComponent => 1730

    /**
     * The _Annotations_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_Annotations => 1732

    /**
     * The _Element_ property for the [AutomationAnnotation](../windows.ui.xaml.automation/automationannotation.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationAnnotation_Element => 1733

    /**
     * The _Type_ property for the [AutomationAnnotation](../windows.ui.xaml.automation/automationannotation.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationAnnotation_Type => 1734

    /**
     * The _Peer_ property for the [AutomationPeerAnnotation](../windows.ui.xaml.automation.peers/automationpeerannotation.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationPeerAnnotation_Peer => 1735

    /**
     * The _Type_ property for the [AutomationPeerAnnotation](../windows.ui.xaml.automation.peers/automationpeerannotation.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationPeerAnnotation_Type => 1736

    /**
     * The _UnderlineStyle_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_UnderlineStyle => 1741

    /**
     * @type {Integer (Int32)}
     */
    static CalendarView_DisabledForeground => 1742

    /**
     * @type {Integer (Int32)}
     */
    static CalendarView_TodayBackground => 1743

    /**
     * @type {Integer (Int32)}
     */
    static CalendarView_TodayBlackoutBackground => 1744

    /**
     * @type {Integer (Int32)}
     */
    static CalendarView_TodaySelectedInnerBorderBrush => 1747

    /**
     * The _IsFocusEngaged_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_IsFocusEngaged => 1749

    /**
     * The _IsFocusEngagementEnabled_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_IsFocusEngagementEnabled => 1752

    /**
     * The _ClipboardCopyFormat_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_ClipboardCopyFormat => 1754

    /**
     * The _OverflowContentMaxWidth_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentMaxWidth => 1757

    /**
     * The _DropDownContentMinWidth_ property for the [ComboBoxTemplateSettings](../windows.ui.xaml.controls.primitives/comboboxtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBoxTemplateSettings_DropDownContentMinWidth => 1758

    /**
     * The _FlyoutContentMinWidth_ property for the [MenuFlyoutPresenterTemplateSettings](../windows.ui.xaml.controls.primitives/menuflyoutpresentertemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutPresenterTemplateSettings_FlyoutContentMinWidth => 1762

    /**
     * The _TemplateSettings_ property for the [MenuFlyoutPresenter](../windows.ui.xaml.controls/menuflyoutpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutPresenter_TemplateSettings => 1763

    /**
     * The _LandmarkType_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_LandmarkType => 1766

    /**
     * The _LocalizedLandmarkType_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_LocalizedLandmarkType => 1767

    /**
     * The _IsStaggeringEnabled_ property for the [RepositionThemeTransition](../windows.ui.xaml.media.animation/repositionthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static RepositionThemeTransition_IsStaggeringEnabled => 1769

    /**
     * The _SingleSelectionFollowsFocus_ property for the [ListBox](../windows.ui.xaml.controls/listbox.md) type.
     * @type {Integer (Int32)}
     */
    static ListBox_SingleSelectionFollowsFocus => 1770

    /**
     * The _SingleSelectionFollowsFocus_ property for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_SingleSelectionFollowsFocus => 1771

    /**
     * The _AutoPlay_ property for the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage_AutoPlay => 1773

    /**
     * The _IsAnimatedBitmap_ property for the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage_IsAnimatedBitmap => 1774

    /**
     * The _IsPlaying_ property for the [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage_IsPlaying => 1775

    /**
     * The _FullDescription_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_FullDescription => 1776

    /**
     * The _IsDataValidForForm_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_IsDataValidForForm => 1777

    /**
     * The _IsPeripheral_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_IsPeripheral => 1778

    /**
     * The _LocalizedControlType_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_LocalizedControlType => 1779

    /**
     * The _AllowFocusOnInteraction_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_AllowFocusOnInteraction => 1780

    /**
     * The _AllowFocusOnInteraction_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_AllowFocusOnInteraction => 1781

    /**
     * The _AllowFocusOnInteraction_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_AllowFocusOnInteraction => 1782

    /**
     * The _RequiresPointer_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_RequiresPointer => 1783

    /**
     * The _ContextFlyout_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ContextFlyout => 1785

    /**
     * The _AccessKey_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_AccessKey => 1786

    /**
     * The _AccessKeyScopeOwner_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_AccessKeyScopeOwner => 1787

    /**
     * The _IsAccessKeyScope_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_IsAccessKeyScope => 1788

    /**
     * The _DescribedBy_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_DescribedBy => 1790

    /**
     * The _AccessKey_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_AccessKey => 1803

    /**
     * The _XYFocusDown_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_XYFocusDown => 1804

    /**
     * The _XYFocusLeft_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_XYFocusLeft => 1805

    /**
     * The _XYFocusRight_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_XYFocusRight => 1806

    /**
     * The _XYFocusUp_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_XYFocusUp => 1807

    /**
     * The _XYFocusDown_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_XYFocusDown => 1808

    /**
     * The _XYFocusLeft_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_XYFocusLeft => 1809

    /**
     * The _XYFocusRight_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_XYFocusRight => 1810

    /**
     * The _XYFocusUp_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_XYFocusUp => 1811

    /**
     * The _XYFocusDown_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_XYFocusDown => 1812

    /**
     * The _XYFocusLeft_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_XYFocusLeft => 1813

    /**
     * The _XYFocusRight_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_XYFocusRight => 1814

    /**
     * The _XYFocusUp_ property for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_XYFocusUp => 1815

    /**
     * The _EffectiveOverflowButtonVisibility_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_EffectiveOverflowButtonVisibility => 1816

    /**
     * The _IsInOverflow_ property for the [AppBarSeparator](../windows.ui.xaml.controls/appbarseparator.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarSeparator_IsInOverflow => 1817

    /**
     * The _DefaultLabelPosition_ property for the [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar_DefaultLabelPosition => 1818

    /**
     * The _IsDynamicOverflowEnabled_ property for the [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar_IsDynamicOverflowEnabled => 1819

    /**
     * The _OverflowButtonVisibility_ property for the [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar_OverflowButtonVisibility => 1820

    /**
     * The _IsInOverflow_ property for the [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton_IsInOverflow => 1821

    /**
     * The _LabelPosition_ property for the [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton_LabelPosition => 1822

    /**
     * The _IsInOverflow_ property for the [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton_IsInOverflow => 1823

    /**
     * The _LabelPosition_ property for the [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton_LabelPosition => 1824

    /**
     * The _LightDismissOverlayMode_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_LightDismissOverlayMode => 1825

    /**
     * The _LightDismissOverlayMode_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_LightDismissOverlayMode => 1827

    /**
     * The _LightDismissOverlayMode_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_LightDismissOverlayMode => 1829

    /**
     * The _LightDismissOverlayMode_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_LightDismissOverlayMode => 1830

    /**
     * The _LightDismissOverlayMode_ property for the [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView_LightDismissOverlayMode => 1831

    /**
     * The _LightDismissOverlayMode_ property for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_LightDismissOverlayMode => 1832

    /**
     * The _LightDismissOverlayMode_ property for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_LightDismissOverlayMode => 1833

    /**
     * The _LightDismissOverlayMode_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_LightDismissOverlayMode => 1834

    /**
     * The _LightDismissOverlayMode_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_LightDismissOverlayMode => 1835

    /**
     * The _DynamicOverflowOrder_ property for the [AppBarSeparator](../windows.ui.xaml.controls/appbarseparator.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarSeparator_DynamicOverflowOrder => 1836

    /**
     * The _DynamicOverflowOrder_ property for the [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton_DynamicOverflowOrder => 1837

    /**
     * The _DynamicOverflowOrder_ property for the [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton_DynamicOverflowOrder => 1838

    /**
     * The _FocusVisualMargin_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_FocusVisualMargin => 1839

    /**
     * The _FocusVisualPrimaryBrush_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_FocusVisualPrimaryBrush => 1840

    /**
     * The _FocusVisualPrimaryThickness_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_FocusVisualPrimaryThickness => 1841

    /**
     * The _FocusVisualSecondaryBrush_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_FocusVisualSecondaryBrush => 1842

    /**
     * The _FocusVisualSecondaryThickness_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_FocusVisualSecondaryThickness => 1843

    /**
     * The _AllowFocusWhenDisabled_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_AllowFocusWhenDisabled => 1846

    /**
     * The _AllowFocusWhenDisabled_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_AllowFocusWhenDisabled => 1847

    /**
     * The _IsTextSearchEnabled_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_IsTextSearchEnabled => 1848

    /**
     * The _ExitDisplayModeOnAccessKeyInvoked_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_ExitDisplayModeOnAccessKeyInvoked => 1849

    /**
     * The _ExitDisplayModeOnAccessKeyInvoked_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ExitDisplayModeOnAccessKeyInvoked => 1850

    /**
     * The _IsFullWindow_ property for the [MediaPlayerPresenter](../windows.ui.xaml.controls/mediaplayerpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerPresenter_IsFullWindow => 1851

    /**
     * The _MediaPlayer_ property for the [MediaPlayerPresenter](../windows.ui.xaml.controls/mediaplayerpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerPresenter_MediaPlayer => 1852

    /**
     * The _Stretch_ property for the [MediaPlayerPresenter](../windows.ui.xaml.controls/mediaplayerpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerPresenter_Stretch => 1853

    /**
     * The _AreTransportControlsEnabled_ property for the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement_AreTransportControlsEnabled => 1854

    /**
     * The _AutoPlay_ property for the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement_AutoPlay => 1855

    /**
     * The _IsFullWindow_ property for the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement_IsFullWindow => 1856

    /**
     * The _MediaPlayer_ property for the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement_MediaPlayer => 1857

    /**
     * The _PosterSource_ property for the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement_PosterSource => 1858

    /**
     * The _Source_ property for the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement_Source => 1859

    /**
     * The _Stretch_ property for the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement_Stretch => 1860

    /**
     * The _TransportControls_ property for the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement_TransportControls => 1861

    /**
     * The _FastPlayFallbackBehaviour_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_FastPlayFallbackBehaviour => 1862

    /**
     * The _IsNextTrackButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsNextTrackButtonVisible => 1863

    /**
     * The _IsPreviousTrackButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsPreviousTrackButtonVisible => 1864

    /**
     * The _IsSkipBackwardButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsSkipBackwardButtonVisible => 1865

    /**
     * The _IsSkipBackwardEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsSkipBackwardEnabled => 1866

    /**
     * The _IsSkipForwardButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsSkipForwardButtonVisible => 1867

    /**
     * The _IsSkipForwardEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsSkipForwardEnabled => 1868

    /**
     * The _ElementSoundMode_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_ElementSoundMode => 1869

    /**
     * The _ElementSoundMode_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_ElementSoundMode => 1870

    /**
     * The _ElementSoundMode_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_ElementSoundMode => 1871

    /**
     * The _FlowsFrom_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_FlowsFrom => 1876

    /**
     * The _FlowsTo_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_FlowsTo => 1877

    /**
     * The _TextDecorations_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_TextDecorations => 1879

    /**
     * The _TextDecorations_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_TextDecorations => 1881

    /**
     * The _DefaultStyleResourceUri_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_DefaultStyleResourceUri => 1882

    /**
     * The _PrimaryButtonStyle_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_PrimaryButtonStyle => 1884

    /**
     * The _SecondaryButtonStyle_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_SecondaryButtonStyle => 1885

    /**
     * The _KeyTipHorizontalOffset_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_KeyTipHorizontalOffset => 1890

    /**
     * The _KeyTipPlacementMode_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_KeyTipPlacementMode => 1891

    /**
     * The _KeyTipVerticalOffset_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_KeyTipVerticalOffset => 1892

    /**
     * The _KeyTipHorizontalOffset_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyTipHorizontalOffset => 1893

    /**
     * The _KeyTipPlacementMode_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyTipPlacementMode => 1894

    /**
     * The _KeyTipVerticalOffset_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyTipVerticalOffset => 1895

    /**
     * The _OverlayInputPassThroughElement_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_OverlayInputPassThroughElement => 1896

    /**
     * The _XYFocusKeyboardNavigation_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_XYFocusKeyboardNavigation => 1897

    /**
     * The _Culture_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_Culture => 1898

    /**
     * The _XYFocusDownNavigationStrategy_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_XYFocusDownNavigationStrategy => 1918

    /**
     * The _XYFocusLeftNavigationStrategy_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_XYFocusLeftNavigationStrategy => 1919

    /**
     * The _XYFocusRightNavigationStrategy_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_XYFocusRightNavigationStrategy => 1920

    /**
     * The _XYFocusUpNavigationStrategy_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_XYFocusUpNavigationStrategy => 1921

    /**
     * The _XYFocusDownNavigationStrategy_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_XYFocusDownNavigationStrategy => 1922

    /**
     * The _XYFocusLeftNavigationStrategy_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_XYFocusLeftNavigationStrategy => 1923

    /**
     * The _XYFocusRightNavigationStrategy_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_XYFocusRightNavigationStrategy => 1924

    /**
     * The _XYFocusUpNavigationStrategy_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_XYFocusUpNavigationStrategy => 1925

    /**
     * The _AccessKeyScopeOwner_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_AccessKeyScopeOwner => 1926

    /**
     * The _IsAccessKeyScope_ property for the [TextElement](../windows.ui.xaml.documents/textelement.md) type.
     * @type {Integer (Int32)}
     */
    static TextElement_IsAccessKeyScope => 1927

    /**
     * The _FocusState_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_FocusState => 1934

    /**
     * The _CloseButtonCommand_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_CloseButtonCommand => 1936

    /**
     * The _CloseButtonCommandParameter_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_CloseButtonCommandParameter => 1937

    /**
     * The _CloseButtonStyle_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_CloseButtonStyle => 1938

    /**
     * The _CloseButtonText_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_CloseButtonText => 1939

    /**
     * The _DefaultButton_ property for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_DefaultButton => 1940

    /**
     * The _SelectionHighlightColorWhenNotFocused_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_SelectionHighlightColorWhenNotFocused => 1941

    /**
     * The _SelectionHighlightColorWhenNotFocused_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_SelectionHighlightColorWhenNotFocused => 1942

    /**
     * The _RasterizePixelHeight_ property for the [SvgImageSource](../windows.ui.xaml.media.imaging/svgimagesource.md) type.
     * @type {Integer (Int32)}
     */
    static SvgImageSource_RasterizePixelHeight => 1948

    /**
     * The _RasterizePixelWidth_ property for the [SvgImageSource](../windows.ui.xaml.media.imaging/svgimagesource.md) type.
     * @type {Integer (Int32)}
     */
    static SvgImageSource_RasterizePixelWidth => 1949

    /**
     * The _UriSource_ property for the [SvgImageSource](../windows.ui.xaml.media.imaging/svgimagesource.md) type.
     * @type {Integer (Int32)}
     */
    static SvgImageSource_UriSource => 1950

    /**
     * The _DecodedPhysicalSize_ property for the [LoadedImageSurface](../windows.ui.xaml.media/loadedimagesurface.md) type.
     * @type {Integer (Int32)}
     */
    static LoadedImageSurface_DecodedPhysicalSize => 1955

    /**
     * The _DecodedSize_ property for the [LoadedImageSurface](../windows.ui.xaml.media/loadedimagesurface.md) type.
     * @type {Integer (Int32)}
     */
    static LoadedImageSurface_DecodedSize => 1956

    /**
     * The _NaturalSize_ property for the [LoadedImageSurface](../windows.ui.xaml.media/loadedimagesurface.md) type.
     * @type {Integer (Int32)}
     */
    static LoadedImageSurface_NaturalSize => 1957

    /**
     * The _SelectionChangedTrigger_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_SelectionChangedTrigger => 1958

    /**
     * The _FallbackColor_ property for the [XamlCompositionBrushBase](../windows.ui.xaml.media/xamlcompositionbrushbase.md) type.
     * @type {Integer (Int32)}
     */
    static XamlCompositionBrushBase_FallbackColor => 1960

    /**
     * The _Lights_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Lights => 1962

    /**
     * The _Icon_ property for the [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItem_Icon => 1963

    /**
     * The _Icon_ property for the [MenuFlyoutSubItem](../windows.ui.xaml.controls/menuflyoutsubitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutSubItem_Icon => 1964

    /**
     * The _ShowAsMonochrome_ property for the [BitmapIcon](../windows.ui.xaml.controls/bitmapicon.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapIcon_ShowAsMonochrome => 1965

    /**
     * The _HighContrastAdjustment_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_HighContrastAdjustment => 1967

    /**
     * The _MaxLength_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_MaxLength => 1968

    /**
     * The _TabFocusNavigation_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_TabFocusNavigation => 1969

    /**
     * The _IsTemplateKeyTipTarget_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_IsTemplateKeyTipTarget => 1970

    /**
     * The _IsTabStop_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_IsTabStop => 1972

    /**
     * The _TabIndex_ property for the [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink_TabIndex => 1973

    /**
     * The _IsRepeatButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsRepeatButtonVisible => 1974

    /**
     * The _IsRepeatEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsRepeatEnabled => 1975

    /**
     * The _ShowAndHideAutomatically_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_ShowAndHideAutomatically => 1976

    /**
     * The _DisabledFormattingAccelerators_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_DisabledFormattingAccelerators => 1977

    /**
     * The _CharacterCasing_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_CharacterCasing => 1978

    /**
     * The _CharacterCasing_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_CharacterCasing => 1979

    /**
     * The _IsTextTrimmed_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_IsTextTrimmed => 1980

    /**
     * The _IsTextTrimmed_ property for the [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlockOverflow_IsTextTrimmed => 1981

    /**
     * The _IsTextTrimmed_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_IsTextTrimmed => 1982

    /**
     * The _Background_ property for the [TextHighlighter](../windows.ui.xaml.documents/texthighlighter.md) type.
     * @type {Integer (Int32)}
     */
    static TextHighlighter_Background => 1985

    /**
     * The _Foreground_ property for the [TextHighlighter](../windows.ui.xaml.documents/texthighlighter.md) type.
     * @type {Integer (Int32)}
     */
    static TextHighlighter_Foreground => 1986

    /**
     * The _Ranges_ property for the [TextHighlighter](../windows.ui.xaml.documents/texthighlighter.md) type.
     * @type {Integer (Int32)}
     */
    static TextHighlighter_Ranges => 1987

    /**
     * The _TextHighlighters_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_TextHighlighters => 1988

    /**
     * The _TextHighlighters_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_TextHighlighters => 1989

    /**
     * The _ActualTheme_ property for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_ActualTheme => 1992

    /**
     * The _ColumnSpacing_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_ColumnSpacing => 1993

    /**
     * The _RowSpacing_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_RowSpacing => 1994

    /**
     * The _Spacing_ property for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_Spacing => 1995

    /**
     * The _HorizontalTextAlignment_ property for the [Block](../windows.ui.xaml.documents/block.md) type.
     * @type {Integer (Int32)}
     */
    static Block_HorizontalTextAlignment => 1996

    /**
     * The _HorizontalTextAlignment_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_HorizontalTextAlignment => 1997

    /**
     * The _HorizontalTextAlignment_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_HorizontalTextAlignment => 1998

    /**
     * The _HorizontalTextAlignment_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_HorizontalTextAlignment => 1999

    /**
     * The _HorizontalTextAlignment_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_HorizontalTextAlignment => 2000

    /**
     * The _PlaceholderForeground_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_PlaceholderForeground => 2001

    /**
     * The _PlaceholderForeground_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_PlaceholderForeground => 2002

    /**
     * The _IsEnabled_ property for the [KeyboardAccelerator](../windows.ui.xaml.input/keyboardaccelerator.md) type.
     * @type {Integer (Int32)}
     */
    static KeyboardAccelerator_IsEnabled => 2003

    /**
     * The _Key_ property for the [KeyboardAccelerator](../windows.ui.xaml.input/keyboardaccelerator.md) type.
     * @type {Integer (Int32)}
     */
    static KeyboardAccelerator_Key => 2004

    /**
     * The _Modifiers_ property for the [KeyboardAccelerator](../windows.ui.xaml.input/keyboardaccelerator.md) type.
     * @type {Integer (Int32)}
     */
    static KeyboardAccelerator_Modifiers => 2005

    /**
     * The _ScopeOwner_ property for the [KeyboardAccelerator](../windows.ui.xaml.input/keyboardaccelerator.md) type.
     * @type {Integer (Int32)}
     */
    static KeyboardAccelerator_ScopeOwner => 2006

    /**
     * The _KeyboardAccelerators_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyboardAccelerators => 2007

    /**
     * The _RevealBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_RevealBackground => 2009

    /**
     * The _RevealBackgroundShowsAboveContent_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_RevealBackgroundShowsAboveContent => 2010

    /**
     * The _RevealBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_RevealBorderBrush => 2011

    /**
     * The _RevealBorderThickness_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_RevealBorderThickness => 2012

    /**
     * The _KeyTipTarget_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyTipTarget => 2014

    /**
     * The _KeyboardAcceleratorTextMinWidth_ property for the [AppBarButtonTemplateSettings](../windows.ui.xaml.controls.primitives/appbarbuttontemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButtonTemplateSettings_KeyboardAcceleratorTextMinWidth => 2015

    /**
     * The _KeyboardAcceleratorTextMinWidth_ property for the [AppBarToggleButtonTemplateSettings](../windows.ui.xaml.controls.primitives/appbartogglebuttontemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButtonTemplateSettings_KeyboardAcceleratorTextMinWidth => 2016

    /**
     * The _KeyboardAcceleratorTextMinWidth_ property for the [MenuFlyoutItemTemplateSettings](../windows.ui.xaml.controls.primitives/menuflyoutitemtemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItemTemplateSettings_KeyboardAcceleratorTextMinWidth => 2017

    /**
     * The _TemplateSettings_ property for the [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItem_TemplateSettings => 2019

    /**
     * The _TemplateSettings_ property for the [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton_TemplateSettings => 2021

    /**
     * The _TemplateSettings_ property for the [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton_TemplateSettings => 2023

    /**
     * The _KeyboardAcceleratorPlacementMode_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyboardAcceleratorPlacementMode => 2028

    /**
     * The _IsCompactOverlayButtonVisible_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsCompactOverlayButtonVisible => 2032

    /**
     * The _IsCompactOverlayEnabled_ property for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_IsCompactOverlayEnabled => 2033

    /**
     * The _KeyboardAcceleratorPlacementTarget_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyboardAcceleratorPlacementTarget => 2061

    /**
     * The _CenterPoint_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_CenterPoint => 2062

    /**
     * The _Rotation_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Rotation => 2063

    /**
     * The _RotationAxis_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_RotationAxis => 2064

    /**
     * The _Scale_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Scale => 2065

    /**
     * The _TransformMatrix_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_TransformMatrix => 2066

    /**
     * The _Translation_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Translation => 2067

    /**
     * The _HandwritingView_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_HandwritingView => 2068

    /**
     * The _HeadingLevel_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_HeadingLevel => 2069

    /**
     * The _IsHandwritingViewEnabled_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_IsHandwritingViewEnabled => 2076

    /**
     * The _ContentLinkProviders_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_ContentLinkProviders => 2078

    /**
     * The _ContentLinkBackgroundColor_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_ContentLinkBackgroundColor => 2079

    /**
     * The _ContentLinkForegroundColor_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_ContentLinkForegroundColor => 2080

    /**
     * The _AreCandidatesEnabled_ property for the [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) type.
     * @type {Integer (Int32)}
     */
    static HandwritingView_AreCandidatesEnabled => 2081

    /**
     * The _IsOpen_ property for the [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) type.
     * @type {Integer (Int32)}
     */
    static HandwritingView_IsOpen => 2082

    /**
     * The _PlacementTarget_ property for the [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) type.
     * @type {Integer (Int32)}
     */
    static HandwritingView_PlacementTarget => 2084

    /**
     * The _PlacementAlignment_ property for the [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) type.
     * @type {Integer (Int32)}
     */
    static HandwritingView_PlacementAlignment => 2085

    /**
     * The _HandwritingView_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_HandwritingView => 2086

    /**
     * The _IsHandwritingViewEnabled_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_IsHandwritingViewEnabled => 2087

    /**
     * The _KeyboardAcceleratorTextOverride_ property for the [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItem_KeyboardAcceleratorTextOverride => 2090

    /**
     * The _KeyboardAcceleratorTextOverride_ property for the [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton_KeyboardAcceleratorTextOverride => 2091

    /**
     * The _KeyboardAcceleratorTextOverride_ property for the [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton_KeyboardAcceleratorTextOverride => 2092

    /**
     * The _Background_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_Background => 2093

    /**
     * The _Cursor_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_Cursor => 2094

    /**
     * The _ElementSoundMode_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_ElementSoundMode => 2095

    /**
     * The _FocusState_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_FocusState => 2096

    /**
     * The _IsTabStop_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_IsTabStop => 2097

    /**
     * The _TabIndex_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_TabIndex => 2098

    /**
     * The _XYFocusDown_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_XYFocusDown => 2099

    /**
     * The _XYFocusDownNavigationStrategy_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_XYFocusDownNavigationStrategy => 2100

    /**
     * The _XYFocusLeft_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_XYFocusLeft => 2101

    /**
     * The _XYFocusLeftNavigationStrategy_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_XYFocusLeftNavigationStrategy => 2102

    /**
     * The _XYFocusRight_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_XYFocusRight => 2103

    /**
     * The _XYFocusRightNavigationStrategy_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_XYFocusRightNavigationStrategy => 2104

    /**
     * The _XYFocusUp_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_XYFocusUp => 2105

    /**
     * The _XYFocusUpNavigationStrategy_ property for the [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink_XYFocusUpNavigationStrategy => 2106

    /**
     * The _Foreground_ property for the [IconSource](../windows.ui.xaml.controls/iconsource.md) type.
     * @type {Integer (Int32)}
     */
    static IconSource_Foreground => 2112

    /**
     * The _ShowAsMonochrome_ property for the [BitmapIconSource](../windows.ui.xaml.controls/bitmapiconsource.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapIconSource_ShowAsMonochrome => 2113

    /**
     * The _UriSource_ property for the [BitmapIconSource](../windows.ui.xaml.controls/bitmapiconsource.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapIconSource_UriSource => 2114

    /**
     * The _FontFamily_ property for the [FontIconSource](../windows.ui.xaml.controls/fonticonsource.md) type.
     * @type {Integer (Int32)}
     */
    static FontIconSource_FontFamily => 2115

    /**
     * The _FontSize_ property for the [FontIconSource](../windows.ui.xaml.controls/fonticonsource.md) type.
     * @type {Integer (Int32)}
     */
    static FontIconSource_FontSize => 2116

    /**
     * The _FontStyle_ property for the [FontIconSource](../windows.ui.xaml.controls/fonticonsource.md) type.
     * @type {Integer (Int32)}
     */
    static FontIconSource_FontStyle => 2117

    /**
     * The _FontWeight_ property for the [FontIconSource](../windows.ui.xaml.controls/fonticonsource.md) type.
     * @type {Integer (Int32)}
     */
    static FontIconSource_FontWeight => 2118

    /**
     * The _Glyph_ property for the [FontIconSource](../windows.ui.xaml.controls/fonticonsource.md) type.
     * @type {Integer (Int32)}
     */
    static FontIconSource_Glyph => 2119

    /**
     * The _IsTextScaleFactorEnabled_ property for the [FontIconSource](../windows.ui.xaml.controls/fonticonsource.md) type.
     * @type {Integer (Int32)}
     */
    static FontIconSource_IsTextScaleFactorEnabled => 2120

    /**
     * The _MirroredWhenRightToLeft_ property for the [FontIconSource](../windows.ui.xaml.controls/fonticonsource.md) type.
     * @type {Integer (Int32)}
     */
    static FontIconSource_MirroredWhenRightToLeft => 2121

    /**
     * The _Data_ property for the [PathIconSource](../windows.ui.xaml.controls/pathiconsource.md) type.
     * @type {Integer (Int32)}
     */
    static PathIconSource_Data => 2122

    /**
     * The _Symbol_ property for the [SymbolIconSource](../windows.ui.xaml.controls/symboliconsource.md) type.
     * @type {Integer (Int32)}
     */
    static SymbolIconSource_Symbol => 2123

    /**
     * The _Shadow_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Shadow => 2130

    /**
     * The _IconSource_ property for the [IconSourceElement](../windows.ui.xaml.controls/iconsourceelement.md) type.
     * @type {Integer (Int32)}
     */
    static IconSourceElement_IconSource => 2131

    /**
     * The _CanPasteClipboardContent_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_CanPasteClipboardContent => 2137

    /**
     * The _CanPasteClipboardContent_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_CanPasteClipboardContent => 2138

    /**
     * The _CanRedo_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_CanRedo => 2139

    /**
     * The _CanUndo_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_CanUndo => 2140

    /**
     * The _ShowMode_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_ShowMode => 2141

    /**
     * The _Target_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_Target => 2142

    /**
     * The _CornerRadius_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_CornerRadius => 2143

    /**
     * The _IsDialog_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_IsDialog => 2149

    /**
     * The _DynamicOverflowOrder_ property for the [AppBarElementContainer](../windows.ui.xaml.controls/appbarelementcontainer.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarElementContainer_DynamicOverflowOrder => 2150

    /**
     * The _IsCompact_ property for the [AppBarElementContainer](../windows.ui.xaml.controls/appbarelementcontainer.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarElementContainer_IsCompact => 2151

    /**
     * The _IsInOverflow_ property for the [AppBarElementContainer](../windows.ui.xaml.controls/appbarelementcontainer.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarElementContainer_IsInOverflow => 2152

    /**
     * The _CanContentRenderOutsideBounds_ property for the [ScrollContentPresenter](../windows.ui.xaml.controls/scrollcontentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollContentPresenter_CanContentRenderOutsideBounds => 2157

    /**
     * The _CanContentRenderOutsideBounds_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_CanContentRenderOutsideBounds => 2158

    /**
     * The _SelectionFlyout_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_SelectionFlyout => 2159

    /**
     * The _SelectionFlyout_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_SelectionFlyout => 2160

    /**
     * The _BackgroundSizing_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_BackgroundSizing => 2161

    /**
     * The _BackgroundSizing_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_BackgroundSizing => 2162

    /**
     * The _BackgroundSizing_ property for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_BackgroundSizing => 2163

    /**
     * The _BackgroundSizing_ property for the [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid_BackgroundSizing => 2164

    /**
     * The _BackgroundSizing_ property for the [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel_BackgroundSizing => 2165

    /**
     * The _BackgroundSizing_ property for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_BackgroundSizing => 2166

    /**
     * The _HorizontalAnchorRatio_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_HorizontalAnchorRatio => 2170

    /**
     * The _VerticalAnchorRatio_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_VerticalAnchorRatio => 2171

    /**
     * The _Text_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_Text => 2208

    /**
     * The _Description_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_Description => 2217

    /**
     * The _PlacementRect_ property for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_PlacementRect => 2218

    /**
     * The _SelectionFlyout_ property for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock_SelectionFlyout => 2219

    /**
     * The _SelectionFlyout_ property for the [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock_SelectionFlyout => 2220

    /**
     * The _SelectionFlyout_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_SelectionFlyout => 2221

    /**
     * The _BackgroundTransition_ property for the [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border_BackgroundTransition => 2222

    /**
     * The _BackgroundTransition_ property for the [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter_BackgroundTransition => 2223

    /**
     * The _BackgroundTransition_ property for the [Panel](../windows.ui.xaml.controls/panel.md) type.
     * @type {Integer (Int32)}
     */
    static Panel_BackgroundTransition => 2224

    /**
     * The _Accent_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_Accent => 2227

    /**
     * The _AltHigh_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_AltHigh => 2228

    /**
     * The _AltLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_AltLow => 2229

    /**
     * The _AltMedium_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_AltMedium => 2230

    /**
     * The _AltMediumHigh_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_AltMediumHigh => 2231

    /**
     * The _AltMediumLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_AltMediumLow => 2232

    /**
     * The _BaseHigh_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_BaseHigh => 2233

    /**
     * The _BaseLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_BaseLow => 2234

    /**
     * The _BaseMedium_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_BaseMedium => 2235

    /**
     * The _BaseMediumHigh_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_BaseMediumHigh => 2236

    /**
     * The _BaseMediumLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_BaseMediumLow => 2237

    /**
     * The _ChromeAltLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeAltLow => 2238

    /**
     * The _ChromeBlackHigh_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeBlackHigh => 2239

    /**
     * The _ChromeBlackLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeBlackLow => 2240

    /**
     * The _ChromeBlackMedium_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeBlackMedium => 2241

    /**
     * The _ChromeBlackMediumLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeBlackMediumLow => 2242

    /**
     * The _ChromeDisabledHigh_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeDisabledHigh => 2243

    /**
     * The _ChromeDisabledLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeDisabledLow => 2244

    /**
     * The _ChromeGray_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeGray => 2245

    /**
     * The _ChromeHigh_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeHigh => 2246

    /**
     * The _ChromeLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeLow => 2247

    /**
     * The _ChromeMedium_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeMedium => 2248

    /**
     * The _ChromeMediumLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeMediumLow => 2249

    /**
     * The _ChromeWhite_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ChromeWhite => 2250

    /**
     * The _ErrorText_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ErrorText => 2252

    /**
     * The _ListLow_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ListLow => 2253

    /**
     * The _ListMedium_ property for the [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources_ListMedium => 2254

    /**
     * The _TranslationTransition_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_TranslationTransition => 2255

    /**
     * The _OpacityTransition_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_OpacityTransition => 2256

    /**
     * The _RotationTransition_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_RotationTransition => 2257

    /**
     * The _ScaleTransition_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ScaleTransition => 2258

    /**
     * The _Duration_ property for the [BrushTransition](../windows.ui.xaml/brushtransition.md) type.
     * @type {Integer (Int32)}
     */
    static BrushTransition_Duration => 2261

    /**
     * The _Duration_ property for the [ScalarTransition](../windows.ui.xaml/scalartransition.md) type.
     * @type {Integer (Int32)}
     */
    static ScalarTransition_Duration => 2262

    /**
     * The _Duration_ property for the [Vector3Transition](../windows.ui.xaml/vector3transition.md) type.
     * @type {Integer (Int32)}
     */
    static Vector3Transition_Duration => 2263

    /**
     * The _Components_ property for the [Vector3Transition](../windows.ui.xaml/vector3transition.md) type.
     * @type {Integer (Int32)}
     */
    static Vector3Transition_Components => 2266

    /**
     * The _IsOpen_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_IsOpen => 2267

    /**
     * The _Kind_ property for the [StandardUICommand](../windows.ui.xaml.input/standarduicommand.md) type.
     * @type {Integer (Int32)}
     */
    static StandardUICommand_Kind => 2275

    /**
     * The _CanBeScrollAnchor_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_CanBeScrollAnchor => 2276

    /**
     * The _Receivers_ property for the [ThemeShadow](../windows.ui.xaml.media/themeshadow.md) type.
     * @type {Integer (Int32)}
     */
    static ThemeShadow_Receivers => 2279

    /**
     * The _SizesContentToTemplatedParent_ property for the [ScrollContentPresenter](../windows.ui.xaml.controls/scrollcontentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollContentPresenter_SizesContentToTemplatedParent => 2280

    /**
     * The _TextBoxStyle_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_TextBoxStyle => 2281

    /**
     * The _IsNavigationStackEnabled_ property for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_IsNavigationStackEnabled => 2282

    /**
     * The _ProofingMenuFlyout_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_ProofingMenuFlyout => 2283

    /**
     * The _ProofingMenuFlyout_ property for the [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox_ProofingMenuFlyout => 2284

    /**
     * The _ReduceViewportForCoreInputViewOcclusions_ property for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ReduceViewportForCoreInputViewOcclusions => 2295

    /**
     * The _AreOpenCloseAnimationsEnabled_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_AreOpenCloseAnimationsEnabled => 2296

    /**
     * The _InputDevicePrefersPrimaryCommands_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_InputDevicePrefersPrimaryCommands => 2297

    /**
     * The _Description_ property for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_Description => 2300

    /**
     * The _Description_ property for the [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox_Description => 2308

    /**
     * The _Description_ property for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_Description => 2316

    /**
     * The _Description_ property for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_Description => 2331

    /**
     * The _Description_ property for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_Description => 2339

    /**
     * The _AccessKey_ property for the [XamlUICommand](../windows.ui.xaml.input/xamluicommand.md) type.
     * @type {Integer (Int32)}
     */
    static XamlUICommand_AccessKey => 2347

    /**
     * The _Command_ property for the [XamlUICommand](../windows.ui.xaml.input/xamluicommand.md) type.
     * @type {Integer (Int32)}
     */
    static XamlUICommand_Command => 2348

    /**
     * The _Description_ property for the [XamlUICommand](../windows.ui.xaml.input/xamluicommand.md) type.
     * @type {Integer (Int32)}
     */
    static XamlUICommand_Description => 2349

    /**
     * The _IconSource_ property for the [XamlUICommand](../windows.ui.xaml.input/xamluicommand.md) type.
     * @type {Integer (Int32)}
     */
    static XamlUICommand_IconSource => 2350

    /**
     * The _KeyboardAccelerators_ property for the [XamlUICommand](../windows.ui.xaml.input/xamluicommand.md) type.
     * @type {Integer (Int32)}
     */
    static XamlUICommand_KeyboardAccelerators => 2351

    /**
     * The _Label_ property for the [XamlUICommand](../windows.ui.xaml.input/xamluicommand.md) type.
     * @type {Integer (Int32)}
     */
    static XamlUICommand_Label => 2352

    /**
     * The _SelectedDate_ property for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_SelectedDate => 2355

    /**
     * The _SelectedTime_ property for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_SelectedTime => 2356

    /**
     * The _NegativeCompactVerticalDelta_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_NegativeCompactVerticalDelta => 2367

    /**
     * The _NegativeHiddenVerticalDelta_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_NegativeHiddenVerticalDelta => 2368

    /**
     * The _NegativeMinimalVerticalDelta_ property for the [AppBarTemplateSettings](../windows.ui.xaml.controls.primitives/appbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarTemplateSettings_NegativeMinimalVerticalDelta => 2369

    /**
     * The _ShouldConstrainToRootBounds_ property for the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutBase_ShouldConstrainToRootBounds => 2378

    /**
     * The _ShouldConstrainToRootBounds_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_ShouldConstrainToRootBounds => 2379

    /**
     * The _IsDefaultShadowEnabled_ property for the [FlyoutPresenter](../windows.ui.xaml.controls/flyoutpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutPresenter_IsDefaultShadowEnabled => 2380

    /**
     * The _IsDefaultShadowEnabled_ property for the [MenuFlyoutPresenter](../windows.ui.xaml.controls/menuflyoutpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutPresenter_IsDefaultShadowEnabled => 2381

    /**
     * The _ActualOffset_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ActualOffset => 2382

    /**
     * The _ActualSize_ property for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ActualSize => 2383

    /**
     * The _OverflowContentCompactYTranslation_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentCompactYTranslation => 2384

    /**
     * The _OverflowContentHiddenYTranslation_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentHiddenYTranslation => 2385

    /**
     * The _OverflowContentMinimalYTranslation_ property for the [CommandBarTemplateSettings](../windows.ui.xaml.controls.primitives/commandbartemplatesettings.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarTemplateSettings_OverflowContentMinimalYTranslation => 2386

    /**
     * The _IsCommandBarOpen_ property for the [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) type.
     * @type {Integer (Int32)}
     */
    static HandwritingView_IsCommandBarOpen => 2395

    /**
     * The _IsSwitchToKeyboardEnabled_ property for the [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) type.
     * @type {Integer (Int32)}
     */
    static HandwritingView_IsSwitchToKeyboardEnabled => 2396

    /**
     * The _SelectionIndicatorVisualEnabled_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectionIndicatorVisualEnabled => 2399

    /**
     * The _SelectionIndicatorBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectionIndicatorBrush => 2400

    /**
     * The _SelectionIndicatorMode_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectionIndicatorMode => 2401

    /**
     * The _SelectionIndicatorPointerOverBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectionIndicatorPointerOverBrush => 2402

    /**
     * The _SelectionIndicatorPressedBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectionIndicatorPressedBrush => 2403

    /**
     * The _SelectedBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedBorderBrush => 2410

    /**
     * The _SelectedInnerBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedInnerBorderBrush => 2411

    /**
     * The _CheckBoxCornerRadius_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxCornerRadius => 2412

    /**
     * The _SelectionIndicatorCornerRadius_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectionIndicatorCornerRadius => 2413

    /**
     * The _SelectedDisabledBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedDisabledBorderBrush => 2414

    /**
     * The _SelectedPressedBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedPressedBorderBrush => 2415

    /**
     * The _SelectedDisabledBackground_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectedDisabledBackground => 2416

    /**
     * The _PointerOverBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_PointerOverBorderBrush => 2417

    /**
     * The _CheckBoxPointerOverBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxPointerOverBrush => 2418

    /**
     * The _CheckBoxPressedBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxPressedBrush => 2419

    /**
     * The _CheckDisabledBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckDisabledBrush => 2420

    /**
     * The _CheckPressedBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckPressedBrush => 2421

    /**
     * The _CheckBoxBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxBorderBrush => 2422

    /**
     * The _CheckBoxDisabledBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxDisabledBorderBrush => 2423

    /**
     * The _CheckBoxPressedBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxPressedBorderBrush => 2424

    /**
     * The _CheckBoxDisabledBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxDisabledBrush => 2425

    /**
     * The _CheckBoxSelectedBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxSelectedBrush => 2426

    /**
     * The _CheckBoxSelectedDisabledBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxSelectedDisabledBrush => 2427

    /**
     * The _CheckBoxSelectedPointerOverBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxSelectedPointerOverBrush => 2428

    /**
     * The _CheckBoxSelectedPressedBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxSelectedPressedBrush => 2429

    /**
     * The _CheckBoxPointerOverBorderBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_CheckBoxPointerOverBorderBrush => 2430

    /**
     * The _SelectionIndicatorDisabledBrush_ property for the [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter_SelectionIndicatorDisabledBrush => 2431

    /**
     * The _BlackoutBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_BlackoutBackground => 2432

    /**
     * The _BlackoutStrikethroughBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_BlackoutStrikethroughBrush => 2433

    /**
     * The _CalendarItemCornerRadius_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarItemCornerRadius => 2434

    /**
     * The _CalendarItemDisabledBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarItemDisabledBackground => 2435

    /**
     * The _CalendarItemHoverBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarItemHoverBackground => 2436

    /**
     * The _CalendarItemPressedBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarItemPressedBackground => 2437

    /**
     * The _DayItemMargin_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_DayItemMargin => 2438

    /**
     * The _FirstOfMonthLabelMargin_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfMonthLabelMargin => 2439

    /**
     * The _FirstOfYearDecadeLabelMargin_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_FirstOfYearDecadeLabelMargin => 2440

    /**
     * The _MonthYearItemMargin_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_MonthYearItemMargin => 2441

    /**
     * The _OutOfScopeHoverForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_OutOfScopeHoverForeground => 2442

    /**
     * The _OutOfScopePressedForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_OutOfScopePressedForeground => 2443

    /**
     * The _SelectedDisabledBorderBrush_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedDisabledBorderBrush => 2444

    /**
     * The _SelectedDisabledForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedDisabledForeground => 2445

    /**
     * The _SelectedHoverForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedHoverForeground => 2446

    /**
     * The _SelectedPressedForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedPressedForeground => 2447

    /**
     * The _TodayBlackoutForeground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_TodayBlackoutForeground => 2448

    /**
     * The _TodayDisabledBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_TodayDisabledBackground => 2449

    /**
     * The _TodayHoverBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_TodayHoverBackground => 2450

    /**
     * The _TodayPressedBackground_ property for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_TodayPressedBackground => 2451

    /**
     * The _ActualPlacement_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_ActualPlacement => 2452

    /**
     * The _DesiredPlacement_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_DesiredPlacement => 2453

    /**
     * The _PlacementTarget_ property for the [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup_PlacementTarget => 2454

    /**
     * The _AutomationControlType_ property for the [AutomationProperties](../windows.ui.xaml.automation/automationproperties.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationProperties_AutomationControlType => 2455
}
