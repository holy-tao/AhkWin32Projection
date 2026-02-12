#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Enum that lists all the supported events in [XamlDirect](windows_ui_xaml_core_direct.md). 
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Core.Direct.XamlEventIndex](/windows/winui/api/microsoft.ui.xaml.core.direct.xamleventindex) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamleventindex
 * @namespace Windows.UI.Xaml.Core.Direct
 * @version WindowsRuntime 1.4
 */
class XamlEventIndex extends Win32Enum{

    /**
     * The _DataContextChanged_ event for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_DataContextChanged => 16

    /**
     * The _SizeChanged_ event for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_SizeChanged => 17

    /**
     * The _LayoutUpdated_ event for the [FrameworkElement](../windows.ui.xaml/frameworkelement.md) type.
     * @type {Integer (Int32)}
     */
    static FrameworkElement_LayoutUpdated => 18

    /**
     * The _KeyUp_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyUp => 22

    /**
     * The _KeyDown_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_KeyDown => 23

    /**
     * The _GotFocus_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_GotFocus => 24

    /**
     * The _LostFocus_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_LostFocus => 25

    /**
     * The _DragStarting_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_DragStarting => 26

    /**
     * The _DropCompleted_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_DropCompleted => 27

    /**
     * The _CharacterReceived_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_CharacterReceived => 28

    /**
     * The _DragEnter_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_DragEnter => 29

    /**
     * The _DragLeave_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_DragLeave => 30

    /**
     * The _DragOver_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_DragOver => 31

    /**
     * The _Drop_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Drop => 32

    /**
     * The _PointerPressed_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerPressed => 38

    /**
     * The _PointerMoved_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerMoved => 39

    /**
     * The _PointerReleased_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerReleased => 40

    /**
     * The _PointerEntered_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerEntered => 41

    /**
     * The _PointerExited_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerExited => 42

    /**
     * The _PointerCaptureLost_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerCaptureLost => 43

    /**
     * The _PointerCanceled_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerCanceled => 44

    /**
     * The _PointerWheelChanged_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PointerWheelChanged => 45

    /**
     * The _Tapped_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Tapped => 46

    /**
     * The _DoubleTapped_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_DoubleTapped => 47

    /**
     * The _Holding_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_Holding => 48

    /**
     * The _ContextRequested_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ContextRequested => 49

    /**
     * The _ContextCanceled_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ContextCanceled => 50

    /**
     * The _RightTapped_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_RightTapped => 51

    /**
     * The _ManipulationStarting_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ManipulationStarting => 52

    /**
     * The _ManipulationInertiaStarting_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ManipulationInertiaStarting => 53

    /**
     * The _ManipulationStarted_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ManipulationStarted => 54

    /**
     * The _ManipulationDelta_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ManipulationDelta => 55

    /**
     * The _ManipulationCompleted_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ManipulationCompleted => 56

    /**
     * The _ProcessKeyboardAccelerators_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_ProcessKeyboardAccelerators => 60

    /**
     * The _GettingFocus_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_GettingFocus => 61

    /**
     * The _LosingFocus_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_LosingFocus => 62

    /**
     * The _NoFocusCandidateFound_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_NoFocusCandidateFound => 63

    /**
     * The _PreviewKeyDown_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PreviewKeyDown => 64

    /**
     * The _PreviewKeyUp_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_PreviewKeyUp => 65

    /**
     * The _BringIntoViewRequested_ event for the [UIElement](../windows.ui.xaml/uielement.md) type.
     * @type {Integer (Int32)}
     */
    static UIElement_BringIntoViewRequested => 66

    /**
     * The _Opening_ event for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_Opening => 109

    /**
     * The _Opened_ event for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_Opened => 110

    /**
     * The _Closing_ event for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_Closing => 111

    /**
     * The _Closed_ event for the [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar_Closed => 112

    /**
     * The _SuggestionChosen_ event for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_SuggestionChosen => 113

    /**
     * The _TextChanged_ event for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_TextChanged => 114

    /**
     * The _QuerySubmitted_ event for the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox_QuerySubmitted => 115

    /**
     * The _CalendarViewDayItemChanging_ event for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_CalendarViewDayItemChanging => 116

    /**
     * The _DateChanged_ event for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_DateChanged => 117

    /**
     * The _Opened_ event for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_Opened => 118

    /**
     * The _Closed_ event for the [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker_Closed => 119

    /**
     * The _CalendarViewDayItemChanging_ event for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_CalendarViewDayItemChanging => 120

    /**
     * The _SelectedDatesChanged_ event for the [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView_SelectedDatesChanged => 121

    /**
     * The _DropDownClosed_ event for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_DropDownClosed => 122

    /**
     * The _DropDownOpened_ event for the [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox_DropDownOpened => 123

    /**
     * The _DynamicOverflowItemsChanging_ event for the [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar_DynamicOverflowItemsChanging => 124

    /**
     * The _Closing_ event for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_Closing => 126

    /**
     * The _Closed_ event for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_Closed => 127

    /**
     * The _Opened_ event for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_Opened => 128

    /**
     * The _PrimaryButtonClick_ event for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_PrimaryButtonClick => 129

    /**
     * The _SecondaryButtonClick_ event for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_SecondaryButtonClick => 130

    /**
     * The _CloseButtonClick_ event for the [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog_CloseButtonClick => 131

    /**
     * The _FocusEngaged_ event for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_FocusEngaged => 132

    /**
     * The _FocusDisengaged_ event for the [Control](../windows.ui.xaml.controls/control.md) type.
     * @type {Integer (Int32)}
     */
    static Control_FocusDisengaged => 133

    /**
     * The _DateChanged_ event for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_DateChanged => 135

    /**
     * The _Navigated_ event for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_Navigated => 136

    /**
     * The _Navigating_ event for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_Navigating => 137

    /**
     * The _NavigationFailed_ event for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_NavigationFailed => 138

    /**
     * The _NavigationStopped_ event for the [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame_NavigationStopped => 139

    /**
     * The _SectionHeaderClick_ event for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_SectionHeaderClick => 143

    /**
     * The _SectionsInViewChanged_ event for the [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub_SectionsInViewChanged => 144

    /**
     * The _HorizontalSnapPointsChanged_ event for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_HorizontalSnapPointsChanged => 148

    /**
     * The _VerticalSnapPointsChanged_ event for the [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter_VerticalSnapPointsChanged => 149

    /**
     * The _ItemClick_ event for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_ItemClick => 150

    /**
     * The _DragItemsStarting_ event for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_DragItemsStarting => 151

    /**
     * The _DragItemsCompleted_ event for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_DragItemsCompleted => 152

    /**
     * The _ContainerContentChanging_ event for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_ContainerContentChanging => 153

    /**
     * The _ChoosingItemContainer_ event for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_ChoosingItemContainer => 154

    /**
     * The _ChoosingGroupHeaderContainer_ event for the [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewBase_ChoosingGroupHeaderContainer => 155

    /**
     * The _ThumbnailRequested_ event for the [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls_ThumbnailRequested => 167

    /**
     * The _Click_ event for the [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItem_Click => 168

    /**
     * The _TextChanging_ event for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox_TextChanging => 177

    /**
     * The _ViewChanging_ event for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ViewChanging => 192

    /**
     * The _ViewChanged_ event for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_ViewChanged => 193

    /**
     * The _DirectManipulationStarted_ event for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_DirectManipulationStarted => 194

    /**
     * The _DirectManipulationCompleted_ event for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_DirectManipulationCompleted => 195

    /**
     * The _QueryChanged_ event for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_QueryChanged => 196

    /**
     * The _SuggestionsRequested_ event for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_SuggestionsRequested => 197

    /**
     * The _QuerySubmitted_ event for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_QuerySubmitted => 198

    /**
     * The _ResultSuggestionChosen_ event for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_ResultSuggestionChosen => 199

    /**
     * The _PrepareForFocusOnKeyboardInput_ event for the [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox_PrepareForFocusOnKeyboardInput => 200

    /**
     * The _ViewChangeStarted_ event for the [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) type.
     * @type {Integer (Int32)}
     */
    static SemanticZoom_ViewChangeStarted => 201

    /**
     * The _ViewChangeCompleted_ event for the [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) type.
     * @type {Integer (Int32)}
     */
    static SemanticZoom_ViewChangeCompleted => 202

    /**
     * The _BackClick_ event for the [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyout_BackClick => 203

    /**
     * The _HorizontalSnapPointsChanged_ event for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_HorizontalSnapPointsChanged => 208

    /**
     * The _VerticalSnapPointsChanged_ event for the [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel_VerticalSnapPointsChanged => 209

    /**
     * The _TimeChanged_ event for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_TimeChanged => 227

    /**
     * The _Toggled_ event for the [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch_Toggled => 228

    /**
     * The _Closed_ event for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_Closed => 229

    /**
     * The _Opened_ event for the [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip_Opened => 230

    /**
     * The _CleanUpVirtualizedItemEvent_ event for the [VirtualizingStackPanel](../windows.ui.xaml.controls/virtualizingstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static VirtualizingStackPanel_CleanUpVirtualizedItemEvent => 231

    /**
     * The _SeparateProcessLost_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_SeparateProcessLost => 232

    /**
     * The _LoadCompleted_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_LoadCompleted => 233

    /**
     * The _ScriptNotify_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_ScriptNotify => 234

    /**
     * The _NavigationFailed_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_NavigationFailed => 235

    /**
     * The _NavigationStarting_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_NavigationStarting => 236

    /**
     * The _ContentLoading_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_ContentLoading => 237

    /**
     * The _DOMContentLoaded_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_DOMContentLoaded => 238

    /**
     * The _NavigationCompleted_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_NavigationCompleted => 239

    /**
     * The _FrameNavigationStarting_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_FrameNavigationStarting => 240

    /**
     * The _FrameContentLoading_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_FrameContentLoading => 241

    /**
     * The _FrameDOMContentLoaded_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_FrameDOMContentLoaded => 242

    /**
     * The _FrameNavigationCompleted_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_FrameNavigationCompleted => 243

    /**
     * The _LongRunningScriptDetected_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_LongRunningScriptDetected => 244

    /**
     * The _UnsafeContentWarningDisplaying_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_UnsafeContentWarningDisplaying => 245

    /**
     * The _UnviewableContentIdentified_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_UnviewableContentIdentified => 246

    /**
     * The _ContainsFullScreenElementChanged_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_ContainsFullScreenElementChanged => 247

    /**
     * The _UnsupportedUriSchemeIdentified_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_UnsupportedUriSchemeIdentified => 248

    /**
     * The _NewWindowRequested_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_NewWindowRequested => 249

    /**
     * The _PermissionRequested_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_PermissionRequested => 250

    /**
     * The _Click_ event for the [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) type.
     * @type {Integer (Int32)}
     */
    static ButtonBase_Click => 256

    /**
     * The _HorizontalSnapPointsChanged_ event for the [CarouselPanel](../windows.ui.xaml.controls.primitives/carouselpanel.md) type.
     * @type {Integer (Int32)}
     */
    static CarouselPanel_HorizontalSnapPointsChanged => 257

    /**
     * The _VerticalSnapPointsChanged_ event for the [CarouselPanel](../windows.ui.xaml.controls.primitives/carouselpanel.md) type.
     * @type {Integer (Int32)}
     */
    static CarouselPanel_VerticalSnapPointsChanged => 258

    /**
     * The _HorizontalSnapPointsChanged_ event for the [OrientedVirtualizingPanel](../windows.ui.xaml.controls.primitives/orientedvirtualizingpanel.md) type.
     * @type {Integer (Int32)}
     */
    static OrientedVirtualizingPanel_HorizontalSnapPointsChanged => 263

    /**
     * The _VerticalSnapPointsChanged_ event for the [OrientedVirtualizingPanel](../windows.ui.xaml.controls.primitives/orientedvirtualizingpanel.md) type.
     * @type {Integer (Int32)}
     */
    static OrientedVirtualizingPanel_VerticalSnapPointsChanged => 264

    /**
     * The _ValueChanged_ event for the [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) type.
     * @type {Integer (Int32)}
     */
    static RangeBase_ValueChanged => 267

    /**
     * The _Scroll_ event for the [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollBar_Scroll => 268

    /**
     * The _SelectionChanged_ event for the [Selector](../windows.ui.xaml.controls.primitives/selector.md) type.
     * @type {Integer (Int32)}
     */
    static Selector_SelectionChanged => 269

    /**
     * The _DragStarted_ event for the [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) type.
     * @type {Integer (Int32)}
     */
    static Thumb_DragStarted => 270

    /**
     * The _DragDelta_ event for the [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) type.
     * @type {Integer (Int32)}
     */
    static Thumb_DragDelta => 271

    /**
     * The _DragCompleted_ event for the [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) type.
     * @type {Integer (Int32)}
     */
    static Thumb_DragCompleted => 272

    /**
     * The _Checked_ event for the [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleButton_Checked => 273

    /**
     * The _Unchecked_ event for the [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleButton_Unchecked => 274

    /**
     * The _Indeterminate_ event for the [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleButton_Indeterminate => 275

    /**
     * The _WebResourceRequested_ event for the [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView_WebResourceRequested => 283

    /**
     * The _AnchorRequested_ event for the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer_AnchorRequested => 291

    /**
     * The _SelectedDateChanged_ event for the [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker_SelectedDateChanged => 322

    /**
     * The _SelectedTimeChanged_ event for the [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker_SelectedTimeChanged => 323
}
