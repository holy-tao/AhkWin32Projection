#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ICalendarView.ahk
#Include .\ICalendarView2.ahk
#Include .\ICalendarViewFactory.ahk
#Include .\ICalendarViewStatics.ahk
#Include .\ICalendarViewStatics2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CalendarView.ahk
#Include .\CalendarViewDayItemChangingEventArgs.ahk
#Include .\CalendarViewSelectedDatesChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that enables a user to select a date by using a visual calendar display.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Calendar view](/windows/uwp/design/controls-and-patterns/calendar-view).
 * 
 * The CalendarView gives you a standardized way to let users view and interact with a calendar. If you need to let a user select multiple dates, you must use a CalendarView. If you need to let a user pick only a single date and don't need a calendar to be always visible, consider using a [CalendarDatePicker](calendardatepicker.md) or [DatePicker](datepicker.md) control. You can use the CalendarView control in its default form with a minimal amount of Extensible Application Markup Language (XAML) or other code, or you can customize it in various ways to suit your app.
 * 
 * The CalendarView is made up of 3 separate views: the month view, year view, and decade view. By default, it starts with the month view open. You can specify a startup view by setting the [DisplayMode](calendarview_displaymode.md) property.
 * 
 * <img src="images/CalendarViews.png" alt="Calendar Month, Year, and Decade views" />
 * Users click the header in the month view to open the year view, and click the header in the year view to open the decade view. Users pick a year in the decade view to return to the year view, and pick a month in the year view to return to the month view. The two arrows to the side of the header navigate forward or backward by month, by year, or by decade.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CalendarView extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendarView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendarView.IID

    /**
     * Identifies the [CalendarIdentifier](calendarview_calendaridentifier.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaridentifierproperty
     * @type {DependencyProperty} 
     */
    static CalendarIdentifierProperty {
        get => CalendarView.get_CalendarIdentifierProperty()
    }

    /**
     * Identifies the [DayOfWeekFormat](calendarview_dayofweekformat.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayofweekformatproperty
     * @type {DependencyProperty} 
     */
    static DayOfWeekFormatProperty {
        get => CalendarView.get_DayOfWeekFormatProperty()
    }

    /**
     * Identifies the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.isgrouplabelvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsGroupLabelVisibleProperty {
        get => CalendarView.get_IsGroupLabelVisibleProperty()
    }

    /**
     * Identifies the [DisplayMode](calendarview_displaymode.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.displaymodeproperty
     * @type {DependencyProperty} 
     */
    static DisplayModeProperty {
        get => CalendarView.get_DisplayModeProperty()
    }

    /**
     * Identifies the [FirstDayOfWeek](calendarview_firstdayofweek.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstdayofweekproperty
     * @type {DependencyProperty} 
     */
    static FirstDayOfWeekProperty {
        get => CalendarView.get_FirstDayOfWeekProperty()
    }

    /**
     * Identifies the [IsOutOfScopeEnabled](calendarview_isoutofscopeenabled.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.isoutofscopeenabledproperty
     * @type {DependencyProperty} 
     */
    static IsOutOfScopeEnabledProperty {
        get => CalendarView.get_IsOutOfScopeEnabledProperty()
    }

    /**
     * Identifies the [IsTodayHighlighted](calendarview_istodayhighlighted.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.istodayhighlightedproperty
     * @type {DependencyProperty} 
     */
    static IsTodayHighlightedProperty {
        get => CalendarView.get_IsTodayHighlightedProperty()
    }

    /**
     * Identifies the [MaxDate](calendarview_maxdate.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.maxdateproperty
     * @type {DependencyProperty} 
     */
    static MaxDateProperty {
        get => CalendarView.get_MaxDateProperty()
    }

    /**
     * Identifies the [MinDate](calendarview_mindate.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.mindateproperty
     * @type {DependencyProperty} 
     */
    static MinDateProperty {
        get => CalendarView.get_MinDateProperty()
    }

    /**
     * Identifies the [NumberOfWeeksInView](calendarview_numberofweeksinview.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.numberofweeksinviewproperty
     * @type {DependencyProperty} 
     */
    static NumberOfWeeksInViewProperty {
        get => CalendarView.get_NumberOfWeeksInViewProperty()
    }

    /**
     * Identifies the [SelectedDates](calendarview_selecteddates.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selecteddatesproperty
     * @type {DependencyProperty} 
     */
    static SelectedDatesProperty {
        get => CalendarView.get_SelectedDatesProperty()
    }

    /**
     * Identifies the [SelectionMode](calendarview_selectionmode.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectionmodeproperty
     * @type {DependencyProperty} 
     */
    static SelectionModeProperty {
        get => CalendarView.get_SelectionModeProperty()
    }

    /**
     * Identifies the [TemplateSettings](calendarview_templatesettings.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.templatesettingsproperty
     * @type {DependencyProperty} 
     */
    static TemplateSettingsProperty {
        get => CalendarView.get_TemplateSettingsProperty()
    }

    /**
     * Identifies the [FocusBorderBrush](calendarview_focusborderbrush.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.focusborderbrushproperty
     * @type {DependencyProperty} 
     */
    static FocusBorderBrushProperty {
        get => CalendarView.get_FocusBorderBrushProperty()
    }

    /**
     * Identifies the  [SelectedHoverBorderBrush](calendarview_selectedhoverborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedhoverborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedHoverBorderBrushProperty {
        get => CalendarView.get_SelectedHoverBorderBrushProperty()
    }

    /**
     * Identifies the  [SelectedPressedBorderBrush](calendarview_selectedpressedborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedpressedborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedPressedBorderBrushProperty {
        get => CalendarView.get_SelectedPressedBorderBrushProperty()
    }

    /**
     * Identifies the  [SelectedBorderBrush](calendarview_selectedborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedBorderBrushProperty {
        get => CalendarView.get_SelectedBorderBrushProperty()
    }

    /**
     * Identifies the [HoverBorderBrush](calendarview_hoverborderbrush.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.hoverborderbrushproperty
     * @type {DependencyProperty} 
     */
    static HoverBorderBrushProperty {
        get => CalendarView.get_HoverBorderBrushProperty()
    }

    /**
     * Identifies the [PressedBorderBrush](calendarview_pressedborderbrush.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.pressedborderbrushproperty
     * @type {DependencyProperty} 
     */
    static PressedBorderBrushProperty {
        get => CalendarView.get_PressedBorderBrushProperty()
    }

    /**
     * Identifies the [CalendarItemBorderBrush](calendarview_calendaritemborderbrush.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemborderbrushproperty
     * @type {DependencyProperty} 
     */
    static CalendarItemBorderBrushProperty {
        get => CalendarView.get_CalendarItemBorderBrushProperty()
    }

    /**
     * Identifies the [OutOfScopeBackground](calendarview_outofscopebackground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.outofscopebackgroundproperty
     * @type {DependencyProperty} 
     */
    static OutOfScopeBackgroundProperty {
        get => CalendarView.get_OutOfScopeBackgroundProperty()
    }

    /**
     * Identifies the [CalendarItemBackground](calendarview_calendaritembackground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritembackgroundproperty
     * @type {DependencyProperty} 
     */
    static CalendarItemBackgroundProperty {
        get => CalendarView.get_CalendarItemBackgroundProperty()
    }

    /**
     * Identifies the [PressedForeground](calendarview_pressedforeground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.pressedforegroundproperty
     * @type {DependencyProperty} 
     */
    static PressedForegroundProperty {
        get => CalendarView.get_PressedForegroundProperty()
    }

    /**
     * Identifies the [TodayForeground](calendarview_todayforeground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayforegroundproperty
     * @type {DependencyProperty} 
     */
    static TodayForegroundProperty {
        get => CalendarView.get_TodayForegroundProperty()
    }

    /**
     * Identifies the [BlackoutForeground](calendarview_blackoutforeground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.blackoutforegroundproperty
     * @type {DependencyProperty} 
     */
    static BlackoutForegroundProperty {
        get => CalendarView.get_BlackoutForegroundProperty()
    }

    /**
     * Identifies the [SelectedForeground](calendarview_selectedforeground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedforegroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedForegroundProperty {
        get => CalendarView.get_SelectedForegroundProperty()
    }

    /**
     * Identifies the  [OutOfScopeForeground](calendarview_outofscopeforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.outofscopeforegroundproperty
     * @type {DependencyProperty} 
     */
    static OutOfScopeForegroundProperty {
        get => CalendarView.get_OutOfScopeForegroundProperty()
    }

    /**
     * Identifies the [CalendarItemForeground](calendarview_calendaritemforeground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemforegroundproperty
     * @type {DependencyProperty} 
     */
    static CalendarItemForegroundProperty {
        get => CalendarView.get_CalendarItemForegroundProperty()
    }

    /**
     * Identifies the [DayItemFontFamily](calendarview_dayitemfontfamily.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemfontfamilyproperty
     * @type {DependencyProperty} 
     */
    static DayItemFontFamilyProperty {
        get => CalendarView.get_DayItemFontFamilyProperty()
    }

    /**
     * Identifies the [DayItemFontSize](calendarview_dayitemfontsize.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemfontsizeproperty
     * @type {DependencyProperty} 
     */
    static DayItemFontSizeProperty {
        get => CalendarView.get_DayItemFontSizeProperty()
    }

    /**
     * Identifies the [DayItemFontStyle](calendarview_dayitemfontstyle.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemfontstyleproperty
     * @type {DependencyProperty} 
     */
    static DayItemFontStyleProperty {
        get => CalendarView.get_DayItemFontStyleProperty()
    }

    /**
     * Identifies the [DayItemFontWeight](calendarview_dayitemfontweight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemfontweightproperty
     * @type {DependencyProperty} 
     */
    static DayItemFontWeightProperty {
        get => CalendarView.get_DayItemFontWeightProperty()
    }

    /**
     * Identifies the [TodayFontWeight](calendarview_todayfontweight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayfontweightproperty
     * @type {DependencyProperty} 
     */
    static TodayFontWeightProperty {
        get => CalendarView.get_TodayFontWeightProperty()
    }

    /**
     * Identifies the [FirstOfMonthLabelFontFamily](calendarview_firstofmonthlabelfontfamily.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelfontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FirstOfMonthLabelFontFamilyProperty {
        get => CalendarView.get_FirstOfMonthLabelFontFamilyProperty()
    }

    /**
     * Identifies the [FirstOfMonthLabelFontSize](calendarview_firstofmonthlabelfontsize.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelfontsizeproperty
     * @type {DependencyProperty} 
     */
    static FirstOfMonthLabelFontSizeProperty {
        get => CalendarView.get_FirstOfMonthLabelFontSizeProperty()
    }

    /**
     * Identifies the [FirstOfMonthLabelFontStyle](calendarview_firstofmonthlabelfontstyle.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelfontstyleproperty
     * @type {DependencyProperty} 
     */
    static FirstOfMonthLabelFontStyleProperty {
        get => CalendarView.get_FirstOfMonthLabelFontStyleProperty()
    }

    /**
     * Identifies the [FirstOfMonthLabelFontWeight](calendarview_firstofmonthlabelfontweight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelfontweightproperty
     * @type {DependencyProperty} 
     */
    static FirstOfMonthLabelFontWeightProperty {
        get => CalendarView.get_FirstOfMonthLabelFontWeightProperty()
    }

    /**
     * Identifies the [MonthYearItemFontFamily](calendarview_monthyearitemfontfamily.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemfontfamilyproperty
     * @type {DependencyProperty} 
     */
    static MonthYearItemFontFamilyProperty {
        get => CalendarView.get_MonthYearItemFontFamilyProperty()
    }

    /**
     * Identifies the [MonthYearItemFontSize](calendarview_monthyearitemfontsize.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemfontsizeproperty
     * @type {DependencyProperty} 
     */
    static MonthYearItemFontSizeProperty {
        get => CalendarView.get_MonthYearItemFontSizeProperty()
    }

    /**
     * Identifies the [MonthYearItemFontStyle](calendarview_monthyearitemfontstyle.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemfontstyleproperty
     * @type {DependencyProperty} 
     */
    static MonthYearItemFontStyleProperty {
        get => CalendarView.get_MonthYearItemFontStyleProperty()
    }

    /**
     * Identifies the [MonthYearItemFontWeight](calendarview_monthyearitemfontweight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemfontweightproperty
     * @type {DependencyProperty} 
     */
    static MonthYearItemFontWeightProperty {
        get => CalendarView.get_MonthYearItemFontWeightProperty()
    }

    /**
     * Identifies the [FirstOfYearDecadeLabelFontFamily](calendarview_firstofyeardecadelabelfontfamily.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelfontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FirstOfYearDecadeLabelFontFamilyProperty {
        get => CalendarView.get_FirstOfYearDecadeLabelFontFamilyProperty()
    }

    /**
     * Identifies the [FirstOfYearDecadeLabelFontSize](calendarview_firstofyeardecadelabelfontsize.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelfontsizeproperty
     * @type {DependencyProperty} 
     */
    static FirstOfYearDecadeLabelFontSizeProperty {
        get => CalendarView.get_FirstOfYearDecadeLabelFontSizeProperty()
    }

    /**
     * Identifies the [FirstOfYearDecadeLabelFontStyle](calendarview_firstofyeardecadelabelfontstyle.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelfontstyleproperty
     * @type {DependencyProperty} 
     */
    static FirstOfYearDecadeLabelFontStyleProperty {
        get => CalendarView.get_FirstOfYearDecadeLabelFontStyleProperty()
    }

    /**
     * Identifies the [FirstOfYearDecadeLabelFontWeight](calendarview_firstofyeardecadelabelfontweight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelfontweightproperty
     * @type {DependencyProperty} 
     */
    static FirstOfYearDecadeLabelFontWeightProperty {
        get => CalendarView.get_FirstOfYearDecadeLabelFontWeightProperty()
    }

    /**
     * Identifies the  [HorizontalDayItemAlignment](calendarview_horizontaldayitemalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.horizontaldayitemalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalDayItemAlignmentProperty {
        get => CalendarView.get_HorizontalDayItemAlignmentProperty()
    }

    /**
     * Identifies the [VerticalDayItemAlignment](calendarview_verticaldayitemalignment.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.verticaldayitemalignmentproperty
     * @type {DependencyProperty} 
     */
    static VerticalDayItemAlignmentProperty {
        get => CalendarView.get_VerticalDayItemAlignmentProperty()
    }

    /**
     * Identifies the [HorizontalFirstOfMonthLabelAlignment](calendarview_horizontalfirstofmonthlabelalignment.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.horizontalfirstofmonthlabelalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalFirstOfMonthLabelAlignmentProperty {
        get => CalendarView.get_HorizontalFirstOfMonthLabelAlignmentProperty()
    }

    /**
     * Identifies the [VerticalFirstOfMonthLabelAlignment](calendarview_verticalfirstofmonthlabelalignment.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.verticalfirstofmonthlabelalignmentproperty
     * @type {DependencyProperty} 
     */
    static VerticalFirstOfMonthLabelAlignmentProperty {
        get => CalendarView.get_VerticalFirstOfMonthLabelAlignmentProperty()
    }

    /**
     * Identifies the [CalendarItemBorderThickness](calendarview_calendaritemborderthickness.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemborderthicknessproperty
     * @type {DependencyProperty} 
     */
    static CalendarItemBorderThicknessProperty {
        get => CalendarView.get_CalendarItemBorderThicknessProperty()
    }

    /**
     * Identifies the [CalendarViewDayItemStyle](calendarview_calendarviewdayitemstyle.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendarviewdayitemstyleproperty
     * @type {DependencyProperty} 
     */
    static CalendarViewDayItemStyleProperty {
        get => CalendarView.get_CalendarViewDayItemStyleProperty()
    }

    /**
     * Identifies the [SelectedDisabledBorderBrush](calendarview_selecteddisabledborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selecteddisabledborderbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedDisabledBorderBrushProperty {
        get => CalendarView.get_SelectedDisabledBorderBrushProperty()
    }

    /**
     * Identifies the [TodaySelectedInnerBorderBrush](calendarview_todayselectedinnerborderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayselectedinnerborderbrushproperty
     * @type {DependencyProperty} 
     */
    static TodaySelectedInnerBorderBrushProperty {
        get => CalendarView.get_TodaySelectedInnerBorderBrushProperty()
    }

    /**
     * Identifies the [BlackoutStrikethroughBrush](calendarview_blackoutstrikethroughbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.blackoutstrikethroughbrushproperty
     * @type {DependencyProperty} 
     */
    static BlackoutStrikethroughBrushProperty {
        get => CalendarView.get_BlackoutStrikethroughBrushProperty()
    }

    /**
     * Identifies the [BlackoutBackground](calendarview_blackoutbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.blackoutbackgroundproperty
     * @type {DependencyProperty} 
     */
    static BlackoutBackgroundProperty {
        get => CalendarView.get_BlackoutBackgroundProperty()
    }

    /**
     * Identifies the [CalendarItemHoverBackground](calendarview_calendaritemhoverbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemhoverbackgroundproperty
     * @type {DependencyProperty} 
     */
    static CalendarItemHoverBackgroundProperty {
        get => CalendarView.get_CalendarItemHoverBackgroundProperty()
    }

    /**
     * Identifies the [CalendarItemPressedBackground](calendarview_calendaritempressedbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritempressedbackgroundproperty
     * @type {DependencyProperty} 
     */
    static CalendarItemPressedBackgroundProperty {
        get => CalendarView.get_CalendarItemPressedBackgroundProperty()
    }

    /**
     * Identifies the [CalendarItemDisabledBackground](calendarview_calendaritemdisabledbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemdisabledbackgroundproperty
     * @type {DependencyProperty} 
     */
    static CalendarItemDisabledBackgroundProperty {
        get => CalendarView.get_CalendarItemDisabledBackgroundProperty()
    }

    /**
     * Identifies the [TodayBackground](calendarview_todaybackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todaybackgroundproperty
     * @type {DependencyProperty} 
     */
    static TodayBackgroundProperty {
        get => CalendarView.get_TodayBackgroundProperty()
    }

    /**
     * Identifies the [TodayBlackoutBackground](calendarview_todayblackoutbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayblackoutbackgroundproperty
     * @type {DependencyProperty} 
     */
    static TodayBlackoutBackgroundProperty {
        get => CalendarView.get_TodayBlackoutBackgroundProperty()
    }

    /**
     * Identifies the [TodayHoverBackground](calendarview_todayhoverbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayhoverbackgroundproperty
     * @type {DependencyProperty} 
     */
    static TodayHoverBackgroundProperty {
        get => CalendarView.get_TodayHoverBackgroundProperty()
    }

    /**
     * Identifies the [TodayPressedBackground](calendarview_todaypressedbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todaypressedbackgroundproperty
     * @type {DependencyProperty} 
     */
    static TodayPressedBackgroundProperty {
        get => CalendarView.get_TodayPressedBackgroundProperty()
    }

    /**
     * Identifies the [TodayDisabledBackground](calendarview_todaydisabledbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todaydisabledbackgroundproperty
     * @type {DependencyProperty} 
     */
    static TodayDisabledBackgroundProperty {
        get => CalendarView.get_TodayDisabledBackgroundProperty()
    }

    /**
     * Identifies the [TodayBlackoutForeground](calendarview_todayblackoutforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayblackoutforegroundproperty
     * @type {DependencyProperty} 
     */
    static TodayBlackoutForegroundProperty {
        get => CalendarView.get_TodayBlackoutForegroundProperty()
    }

    /**
     * Identifies the [SelectedHoverForeground](calendarview_selectedhoverforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedhoverforegroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedHoverForegroundProperty {
        get => CalendarView.get_SelectedHoverForegroundProperty()
    }

    /**
     * Identifies the [SelectedPressedForeground](calendarview_selectedpressedforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedpressedforegroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedPressedForegroundProperty {
        get => CalendarView.get_SelectedPressedForegroundProperty()
    }

    /**
     * Identifies the [SelectedDisabledForeground](calendarview_selecteddisabledforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selecteddisabledforegroundproperty
     * @type {DependencyProperty} 
     */
    static SelectedDisabledForegroundProperty {
        get => CalendarView.get_SelectedDisabledForegroundProperty()
    }

    /**
     * Identifies the [OutOfScopeHoverForeground](calendarview_outofscopehoverforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.outofscopehoverforegroundproperty
     * @type {DependencyProperty} 
     */
    static OutOfScopeHoverForegroundProperty {
        get => CalendarView.get_OutOfScopeHoverForegroundProperty()
    }

    /**
     * Identifies the [OutOfScopePressedForeground](calendarview_outofscopepressedforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.outofscopepressedforegroundproperty
     * @type {DependencyProperty} 
     */
    static OutOfScopePressedForegroundProperty {
        get => CalendarView.get_OutOfScopePressedForegroundProperty()
    }

    /**
     * Identifies the [DisabledForeground](calendarview_disabledforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.disabledforegroundproperty
     * @type {DependencyProperty} 
     */
    static DisabledForegroundProperty {
        get => CalendarView.get_DisabledForegroundProperty()
    }

    /**
     * Identifies the [DayItemMargin](calendarview_dayitemmargin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemmarginproperty
     * @type {DependencyProperty} 
     */
    static DayItemMarginProperty {
        get => CalendarView.get_DayItemMarginProperty()
    }

    /**
     * Identifies the [MonthYearItemMargin](calendarview_monthyearitemmargin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemmarginproperty
     * @type {DependencyProperty} 
     */
    static MonthYearItemMarginProperty {
        get => CalendarView.get_MonthYearItemMarginProperty()
    }

    /**
     * Identifies the [FirstOfMonthLabelMargin](calendarview_firstofmonthlabelmargin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelmarginproperty
     * @type {DependencyProperty} 
     */
    static FirstOfMonthLabelMarginProperty {
        get => CalendarView.get_FirstOfMonthLabelMarginProperty()
    }

    /**
     * Identifies the [FirstOfYearDecadeLabelMargin](calendarview_firstofyeardecadelabelmargin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelmarginproperty
     * @type {DependencyProperty} 
     */
    static FirstOfYearDecadeLabelMarginProperty {
        get => CalendarView.get_FirstOfYearDecadeLabelMarginProperty()
    }

    /**
     * Identifies the [CalendarItemCornerRadius](calendarview_calendaritemcornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemcornerradiusproperty
     * @type {DependencyProperty} 
     */
    static CalendarItemCornerRadiusProperty {
        get => CalendarView.get_CalendarItemCornerRadiusProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CalendarView} 
     */
    static CreateInstance() {
        if (!CalendarView.HasProp("__ICalendarViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewFactory.IID)
            CalendarView.__ICalendarViewFactory := ICalendarViewFactory(factoryPtr)
        }

        return CalendarView.__ICalendarViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarIdentifierProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_CalendarIdentifierProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayOfWeekFormatProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_DayOfWeekFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsGroupLabelVisibleProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_IsGroupLabelVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisplayModeProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_DisplayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstDayOfWeekProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstDayOfWeekProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsOutOfScopeEnabledProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_IsOutOfScopeEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTodayHighlightedProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_IsTodayHighlightedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxDateProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_MaxDateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinDateProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_MinDateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NumberOfWeeksInViewProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_NumberOfWeeksInViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedDatesProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_SelectedDatesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionModeProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_SelectionModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TemplateSettingsProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_TemplateSettingsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FocusBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedHoverBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_SelectedHoverBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedPressedBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_SelectedPressedBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_SelectedBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HoverBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_HoverBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PressedBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_PressedBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarItemBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_CalendarItemBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OutOfScopeBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_OutOfScopeBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarItemBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_CalendarItemBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PressedForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_PressedForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodayForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_TodayForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BlackoutForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_BlackoutForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_SelectedForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OutOfScopeForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_OutOfScopeForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarItemForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_CalendarItemForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayItemFontFamilyProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_DayItemFontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayItemFontSizeProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_DayItemFontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayItemFontStyleProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_DayItemFontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayItemFontWeightProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_DayItemFontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodayFontWeightProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_TodayFontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfMonthLabelFontFamilyProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstOfMonthLabelFontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfMonthLabelFontSizeProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstOfMonthLabelFontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfMonthLabelFontStyleProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstOfMonthLabelFontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfMonthLabelFontWeightProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstOfMonthLabelFontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthYearItemFontFamilyProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_MonthYearItemFontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthYearItemFontSizeProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_MonthYearItemFontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthYearItemFontStyleProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_MonthYearItemFontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthYearItemFontWeightProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_MonthYearItemFontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfYearDecadeLabelFontFamilyProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstOfYearDecadeLabelFontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfYearDecadeLabelFontSizeProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstOfYearDecadeLabelFontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfYearDecadeLabelFontStyleProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstOfYearDecadeLabelFontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfYearDecadeLabelFontWeightProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_FirstOfYearDecadeLabelFontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalDayItemAlignmentProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_HorizontalDayItemAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalDayItemAlignmentProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_VerticalDayItemAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalFirstOfMonthLabelAlignmentProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_HorizontalFirstOfMonthLabelAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalFirstOfMonthLabelAlignmentProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_VerticalFirstOfMonthLabelAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarItemBorderThicknessProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_CalendarItemBorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarViewDayItemStyleProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics.IID)
            CalendarView.__ICalendarViewStatics := ICalendarViewStatics(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics.get_CalendarViewDayItemStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedDisabledBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_SelectedDisabledBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodaySelectedInnerBorderBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_TodaySelectedInnerBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BlackoutStrikethroughBrushProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_BlackoutStrikethroughBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BlackoutBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_BlackoutBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarItemHoverBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_CalendarItemHoverBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarItemPressedBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_CalendarItemPressedBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarItemDisabledBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_CalendarItemDisabledBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodayBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_TodayBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodayBlackoutBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_TodayBlackoutBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodayHoverBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_TodayHoverBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodayPressedBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_TodayPressedBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodayDisabledBackgroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_TodayDisabledBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TodayBlackoutForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_TodayBlackoutForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedHoverForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_SelectedHoverForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedPressedForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_SelectedPressedForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedDisabledForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_SelectedDisabledForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OutOfScopeHoverForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_OutOfScopeHoverForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OutOfScopePressedForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_OutOfScopePressedForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisabledForegroundProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_DisabledForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayItemMarginProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_DayItemMarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthYearItemMarginProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_MonthYearItemMarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfMonthLabelMarginProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_FirstOfMonthLabelMarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstOfYearDecadeLabelMarginProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_FirstOfYearDecadeLabelMarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarItemCornerRadiusProperty() {
        if (!CalendarView.HasProp("__ICalendarViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewStatics2.IID)
            CalendarView.__ICalendarViewStatics2 := ICalendarViewStatics2(factoryPtr)
        }

        return CalendarView.__ICalendarViewStatics2.get_CalendarItemCornerRadiusProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the calendar system to use.
     * @remarks
     * <!--Borrow from remarks for DatePicker.CalendarSystem.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaridentifier
     * @type {HSTRING} 
     */
    CalendarIdentifier {
        get => this.get_CalendarIdentifier()
        set => this.put_CalendarIdentifier(value)
    }

    /**
     * Gets or sets the display format for the day of the week headers.
     * @remarks
     * Change the format of the day of the week headers by setting the DayOfWeekFormat property.
     * 
     * The string content of each day of the week header is created by a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md). You inform the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) how to format the day value by providing a *format pattern* string. Common patterns for day values are listed in the following table.
     * 
     * | format pattern | example |
     * | -------------- | --------------- |
     * | {dayofweek.abbreviated} | Sun Mon Tue |
     * | {dayofweek.abbreviated(2)} | Su Mo Tu |
     * | {dayofweek.abbreviated(3)} | Sun Mon Tue |
     * | {dayofweek.solo.abbreviated} | Sun Mon Tue |
     * | {dayofweek.solo.abbreviated(2)} | Su Mo Tu |
     * | {dayofweek.solo.abbreviated(3)} | Sun Mon Tue |
     * 
     * > [!CAUTION]
     * > When you use a _format pattern_ in XAML, you need to include a set of empty braces before the format string, like this: `DayOfWeekFormat="{}{dayofweek.abbreviated}"` Also see Examples.
     * 
     * For more info about format patterns, including when to use the _solo_ options, see the Remarks section of the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) class documentation.
     * 
     * > [!NOTE]
     * > You can set this property to any valid date/time format, but formats other than those listed previously don't make sense for the day of week header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayofweekformat
     * @type {HSTRING} 
     */
    DayOfWeekFormat {
        get => this.get_DayOfWeekFormat()
        set => this.put_DayOfWeekFormat(value)
    }

    /**
     * Gets or sets a value that indicates whether the month name is shown with the first day of the 
     * month when the DisplayMode is Month, or whether the year name is shown with the first month of the year 
     * when the DisplayMode is Year.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.isgrouplabelvisible
     * @type {Boolean} 
     */
    IsGroupLabelVisible {
        get => this.get_IsGroupLabelVisible()
        set => this.put_IsGroupLabelVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the calendar shows a picker for month, year, or decade.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.displaymode
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
        set => this.put_DisplayMode(value)
    }

    /**
     * Gets or sets a value that indicates which day is shown as the first day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstdayofweek
     * @type {Integer} 
     */
    FirstDayOfWeek {
        get => this.get_FirstDayOfWeek()
        set => this.put_FirstDayOfWeek(value)
    }

    /**
     * Gets or sets a value that indicates whether out-of-scope calendar items are shown with a unique foreground color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.isoutofscopeenabled
     * @type {Boolean} 
     */
    IsOutOfScopeEnabled {
        get => this.get_IsOutOfScopeEnabled()
        set => this.put_IsOutOfScopeEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the current date is highlighted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.istodayhighlighted
     * @type {Boolean} 
     */
    IsTodayHighlighted {
        get => this.get_IsTodayHighlighted()
        set => this.put_IsTodayHighlighted(value)
    }

    /**
     * Gets or sets the last date to be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.maxdate
     * @type {DateTime} 
     */
    MaxDate {
        get => this.get_MaxDate()
        set => this.put_MaxDate(value)
    }

    /**
     * Gets or sets the first date to display.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.mindate
     * @type {DateTime} 
     */
    MinDate {
        get => this.get_MinDate()
        set => this.put_MinDate(value)
    }

    /**
     * Gets or sets the number of weeks shown in the calendar view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.numberofweeksinview
     * @type {Integer} 
     */
    NumberOfWeeksInView {
        get => this.get_NumberOfWeeksInView()
        set => this.put_NumberOfWeeksInView(value)
    }

    /**
     * Gets a collection of selected dates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selecteddates
     * @type {IVector<DateTime>} 
     */
    SelectedDates {
        get => this.get_SelectedDates()
    }

    /**
     * Gets or sets a value that indicates what kind of selections are allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectionmode
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) sources when defining templates for a [CalendarView](calendarview.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.templatesettings
     * @type {CalendarViewTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets a brush that provides the border of a calendar item that has focus.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.focusborderbrush
     * @type {Brush} 
     */
    FocusBorderBrush {
        get => this.get_FocusBorderBrush()
        set => this.put_FocusBorderBrush(value)
    }

    /**
     * Gets or sets a brush that provides the border of a selected calendar item while the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedhoverborderbrush
     * @type {Brush} 
     */
    SelectedHoverBorderBrush {
        get => this.get_SelectedHoverBorderBrush()
        set => this.put_SelectedHoverBorderBrush(value)
    }

    /**
     * Gets or sets a brush that provides the border of a selected calendar item while it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedpressedborderbrush
     * @type {Brush} 
     */
    SelectedPressedBorderBrush {
        get => this.get_SelectedPressedBorderBrush()
        set => this.put_SelectedPressedBorderBrush(value)
    }

    /**
     * Gets or sets a brush that provides the border of the currently selected calendar item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedborderbrush
     * @type {Brush} 
     */
    SelectedBorderBrush {
        get => this.get_SelectedBorderBrush()
        set => this.put_SelectedBorderBrush(value)
    }

    /**
     * Gets or sets a brush that provides the border of a calendar item while the pointer is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.hoverborderbrush
     * @type {Brush} 
     */
    HoverBorderBrush {
        get => this.get_HoverBorderBrush()
        set => this.put_HoverBorderBrush(value)
    }

    /**
     * Gets or sets a brush that provides the border of a calendar item while it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.pressedborderbrush
     * @type {Brush} 
     */
    PressedBorderBrush {
        get => this.get_PressedBorderBrush()
        set => this.put_PressedBorderBrush(value)
    }

    /**
     * Gets or sets a brush that provides the border of a calendar item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemborderbrush
     * @type {Brush} 
     */
    CalendarItemBorderBrush {
        get => this.get_CalendarItemBorderBrush()
        set => this.put_CalendarItemBorderBrush(value)
    }

    /**
     * Gets or sets a brush that provides the background of a date that's out of scope.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.outofscopebackground
     * @type {Brush} 
     */
    OutOfScopeBackground {
        get => this.get_OutOfScopeBackground()
        set => this.put_OutOfScopeBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of a calendar item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritembackground
     * @type {Brush} 
     */
    CalendarItemBackground {
        get => this.get_CalendarItemBackground()
        set => this.put_CalendarItemBackground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of a calendar item while it's pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.pressedforeground
     * @type {Brush} 
     */
    PressedForeground {
        get => this.get_PressedForeground()
        set => this.put_PressedForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of the calendar item for the current date.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayforeground
     * @type {Brush} 
     */
    TodayForeground {
        get => this.get_TodayForeground()
        set => this.put_TodayForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of a date that can't be selected.
     * @remarks
     * To mark a date as not selectable, set the [CalendarViewDayItem.IsBlackout](calendarviewdayitem_isblackout.md) property to `true`. For more information, see [Updating calendar day items](/uwp/api/windows.ui.xaml.controls.calendarview#updating-calendar-day-items).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.blackoutforeground
     * @type {Brush} 
     */
    BlackoutForeground {
        get => this.get_BlackoutForeground()
        set => this.put_BlackoutForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of a calendar item that's selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedforeground
     * @type {Brush} 
     */
    SelectedForeground {
        get => this.get_SelectedForeground()
        set => this.put_SelectedForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of calendar items that are outside the current scope (month, year, or decade).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.outofscopeforeground
     * @type {Brush} 
     */
    OutOfScopeForeground {
        get => this.get_OutOfScopeForeground()
        set => this.put_OutOfScopeForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of a calendar item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemforeground
     * @type {Brush} 
     */
    CalendarItemForeground {
        get => this.get_CalendarItemForeground()
        set => this.put_CalendarItemForeground(value)
    }

    /**
     * Gets or sets the font used to display day values in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemfontfamily
     * @type {FontFamily} 
     */
    DayItemFontFamily {
        get => this.get_DayItemFontFamily()
        set => this.put_DayItemFontFamily(value)
    }

    /**
     * Gets or sets the font size used to display day values in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemfontsize
     * @type {Float} 
     */
    DayItemFontSize {
        get => this.get_DayItemFontSize()
        set => this.put_DayItemFontSize(value)
    }

    /**
     * Gets or sets the font style used to display day values in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemfontstyle
     * @type {Integer} 
     */
    DayItemFontStyle {
        get => this.get_DayItemFontStyle()
        set => this.put_DayItemFontStyle(value)
    }

    /**
     * Gets or sets the font weight used to display day values in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemfontweight
     * @type {FontWeight} 
     */
    DayItemFontWeight {
        get => this.get_DayItemFontWeight()
        set => this.put_DayItemFontWeight(value)
    }

    /**
     * Gets or sets the font weight used to display the current date in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayfontweight
     * @type {FontWeight} 
     */
    TodayFontWeight {
        get => this.get_TodayFontWeight()
        set => this.put_TodayFontWeight(value)
    }

    /**
     * Gets or sets the font used to display the first-of-month banner in the calendar.
     * @remarks
     * To make the first of month label visible or not, use the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelfontfamily
     * @type {FontFamily} 
     */
    FirstOfMonthLabelFontFamily {
        get => this.get_FirstOfMonthLabelFontFamily()
        set => this.put_FirstOfMonthLabelFontFamily(value)
    }

    /**
     * Gets or sets the font size used to display the first-of-month banner in the calendar.
     * @remarks
     * To make the first of month label visible or not, use the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelfontsize
     * @type {Float} 
     */
    FirstOfMonthLabelFontSize {
        get => this.get_FirstOfMonthLabelFontSize()
        set => this.put_FirstOfMonthLabelFontSize(value)
    }

    /**
     * Gets or sets the font style used to display the first-of-month banner in the calendar.
     * @remarks
     * To make the first of month label visible or not, use the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelfontstyle
     * @type {Integer} 
     */
    FirstOfMonthLabelFontStyle {
        get => this.get_FirstOfMonthLabelFontStyle()
        set => this.put_FirstOfMonthLabelFontStyle(value)
    }

    /**
     * Gets or sets the font weight used to display the first-of-month banner in the calendar.
     * @remarks
     * To make the first of month label visible or not, use the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelfontweight
     * @type {FontWeight} 
     */
    FirstOfMonthLabelFontWeight {
        get => this.get_FirstOfMonthLabelFontWeight()
        set => this.put_FirstOfMonthLabelFontWeight(value)
    }

    /**
     * Gets or sets the font used to display the month and year items in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemfontfamily
     * @type {FontFamily} 
     */
    MonthYearItemFontFamily {
        get => this.get_MonthYearItemFontFamily()
        set => this.put_MonthYearItemFontFamily(value)
    }

    /**
     * Gets or sets the font size used to display the month and year items in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemfontsize
     * @type {Float} 
     */
    MonthYearItemFontSize {
        get => this.get_MonthYearItemFontSize()
        set => this.put_MonthYearItemFontSize(value)
    }

    /**
     * Gets or sets the font style used to display the month and year items in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemfontstyle
     * @type {Integer} 
     */
    MonthYearItemFontStyle {
        get => this.get_MonthYearItemFontStyle()
        set => this.put_MonthYearItemFontStyle(value)
    }

    /**
     * Gets or sets the font weight used to display the month and year items in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemfontweight
     * @type {FontWeight} 
     */
    MonthYearItemFontWeight {
        get => this.get_MonthYearItemFontWeight()
        set => this.put_MonthYearItemFontWeight(value)
    }

    /**
     * Gets or sets the font used to display the first-of-year banner in the calendar.
     * @remarks
     * To make the first month of year label visible or not, use the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelfontfamily
     * @type {FontFamily} 
     */
    FirstOfYearDecadeLabelFontFamily {
        get => this.get_FirstOfYearDecadeLabelFontFamily()
        set => this.put_FirstOfYearDecadeLabelFontFamily(value)
    }

    /**
     * Gets or sets the font size used to display the first-of-year banner in the calendar.
     * @remarks
     * To make the first month of year label visible or not, use the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelfontsize
     * @type {Float} 
     */
    FirstOfYearDecadeLabelFontSize {
        get => this.get_FirstOfYearDecadeLabelFontSize()
        set => this.put_FirstOfYearDecadeLabelFontSize(value)
    }

    /**
     * Gets or sets the font style used to display the first-of-year banner in the calendar.
     * @remarks
     * To make the first month of year label visible or not, use the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelfontstyle
     * @type {Integer} 
     */
    FirstOfYearDecadeLabelFontStyle {
        get => this.get_FirstOfYearDecadeLabelFontStyle()
        set => this.put_FirstOfYearDecadeLabelFontStyle(value)
    }

    /**
     * Gets or sets the font weight used to display the first-of-year banner in the calendar.
     * @remarks
     * To make the first month of year label visible or not, use the [IsGroupLabelVisible](calendarview_isgrouplabelvisible.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelfontweight
     * @type {FontWeight} 
     */
    FirstOfYearDecadeLabelFontWeight {
        get => this.get_FirstOfYearDecadeLabelFontWeight()
        set => this.put_FirstOfYearDecadeLabelFontWeight(value)
    }

    /**
     * Gets or sets the horizontal alignment of day items in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.horizontaldayitemalignment
     * @type {Integer} 
     */
    HorizontalDayItemAlignment {
        get => this.get_HorizontalDayItemAlignment()
        set => this.put_HorizontalDayItemAlignment(value)
    }

    /**
     * Gets or sets the vertical alignment of day items in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.verticaldayitemalignment
     * @type {Integer} 
     */
    VerticalDayItemAlignment {
        get => this.get_VerticalDayItemAlignment()
        set => this.put_VerticalDayItemAlignment(value)
    }

    /**
     * Gets or sets the horizontal alignment of the first-of-month banner text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.horizontalfirstofmonthlabelalignment
     * @type {Integer} 
     */
    HorizontalFirstOfMonthLabelAlignment {
        get => this.get_HorizontalFirstOfMonthLabelAlignment()
        set => this.put_HorizontalFirstOfMonthLabelAlignment(value)
    }

    /**
     * Gets or sets the vertical alignment of the first-of-month banner text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.verticalfirstofmonthlabelalignment
     * @type {Integer} 
     */
    VerticalFirstOfMonthLabelAlignment {
        get => this.get_VerticalFirstOfMonthLabelAlignment()
        set => this.put_VerticalFirstOfMonthLabelAlignment(value)
    }

    /**
     * Gets or sets the thickness of a calendar item's border.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemborderthickness
     * @type {Thickness} 
     */
    CalendarItemBorderThickness {
        get => this.get_CalendarItemBorderThickness()
        set => this.put_CalendarItemBorderThickness(value)
    }

    /**
     * Gets or sets the [Style](../windows.ui.xaml/style.md) associated with the control's internal [CalendarViewDayItem](calendarviewdayitem.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendarviewdayitemstyle
     * @type {Style} 
     */
    CalendarViewDayItemStyle {
        get => this.get_CalendarViewDayItemStyle()
        set => this.put_CalendarViewDayItemStyle(value)
    }

    /**
     * Gets or sets a brush that provides the border of a selected calendar item that is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selecteddisabledborderbrush
     * @type {Brush} 
     */
    SelectedDisabledBorderBrush {
        get => this.get_SelectedDisabledBorderBrush()
        set => this.put_SelectedDisabledBorderBrush(value)
    }

    /**
     * Gets or sets a brush that provides the inner border of the current date when it is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayselectedinnerborderbrush
     * @type {Brush} 
     */
    TodaySelectedInnerBorderBrush {
        get => this.get_TodaySelectedInnerBorderBrush()
        set => this.put_TodaySelectedInnerBorderBrush(value)
    }

    /**
     * Gets or sets a brush that marks out a date that can't be selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.blackoutstrikethroughbrush
     * @type {Brush} 
     */
    BlackoutStrikethroughBrush {
        get => this.get_BlackoutStrikethroughBrush()
        set => this.put_BlackoutStrikethroughBrush(value)
    }

    /**
     * Gets or sets a brush that provides the background of a date that can't be selected.
     * @remarks
     * To mark a date as not selectable, set the [CalendarViewDayItem.IsBlackout](calendarviewdayitem_isblackout.md) property to `true`. For more information, see [Updating calendar day items](/uwp/api/windows.ui.xaml.controls.calendarview#updating-calendar-day-items).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.blackoutbackground
     * @type {Brush} 
     */
    BlackoutBackground {
        get => this.get_BlackoutBackground()
        set => this.put_BlackoutBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of a calendar item that the cursor is over.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemhoverbackground
     * @type {Brush} 
     */
    CalendarItemHoverBackground {
        get => this.get_CalendarItemHoverBackground()
        set => this.put_CalendarItemHoverBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of a calendar item that is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritempressedbackground
     * @type {Brush} 
     */
    CalendarItemPressedBackground {
        get => this.get_CalendarItemPressedBackground()
        set => this.put_CalendarItemPressedBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of a calendar item that is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemdisabledbackground
     * @type {Brush} 
     */
    CalendarItemDisabledBackground {
        get => this.get_CalendarItemDisabledBackground()
        set => this.put_CalendarItemDisabledBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of the current date in the calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todaybackground
     * @type {Brush} 
     */
    TodayBackground {
        get => this.get_TodayBackground()
        set => this.put_TodayBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of the current date when it can't be selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayblackoutbackground
     * @type {Brush} 
     */
    TodayBlackoutBackground {
        get => this.get_TodayBlackoutBackground()
        set => this.put_TodayBlackoutBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of the current date when the cursor is over it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayhoverbackground
     * @type {Brush} 
     */
    TodayHoverBackground {
        get => this.get_TodayHoverBackground()
        set => this.put_TodayHoverBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of the current date when it is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todaypressedbackground
     * @type {Brush} 
     */
    TodayPressedBackground {
        get => this.get_TodayPressedBackground()
        set => this.put_TodayPressedBackground(value)
    }

    /**
     * Gets or sets a brush that provides the background of the current date when it is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todaydisabledbackground
     * @type {Brush} 
     */
    TodayDisabledBackground {
        get => this.get_TodayDisabledBackground()
        set => this.put_TodayDisabledBackground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of the current date when it can't be selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.todayblackoutforeground
     * @type {Brush} 
     */
    TodayBlackoutForeground {
        get => this.get_TodayBlackoutForeground()
        set => this.put_TodayBlackoutForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of a selected calendar item that the cursor is over.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedhoverforeground
     * @type {Brush} 
     */
    SelectedHoverForeground {
        get => this.get_SelectedHoverForeground()
        set => this.put_SelectedHoverForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of a selected calendar item that is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selectedpressedforeground
     * @type {Brush} 
     */
    SelectedPressedForeground {
        get => this.get_SelectedPressedForeground()
        set => this.put_SelectedPressedForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of a disabled calendar item that is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.selecteddisabledforeground
     * @type {Brush} 
     */
    SelectedDisabledForeground {
        get => this.get_SelectedDisabledForeground()
        set => this.put_SelectedDisabledForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of an out-of-scope calendar item that the cursor is over.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.outofscopehoverforeground
     * @type {Brush} 
     */
    OutOfScopeHoverForeground {
        get => this.get_OutOfScopeHoverForeground()
        set => this.put_OutOfScopeHoverForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of an out-of-scope calendar item that is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.outofscopepressedforeground
     * @type {Brush} 
     */
    OutOfScopePressedForeground {
        get => this.get_OutOfScopePressedForeground()
        set => this.put_OutOfScopePressedForeground(value)
    }

    /**
     * Gets or sets a brush that provides the foreground of a calendar item that is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.disabledforeground
     * @type {Brush} 
     */
    DisabledForeground {
        get => this.get_DisabledForeground()
        set => this.put_DisabledForeground(value)
    }

    /**
     * Gets or sets the amount of space around the outside of a day item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.dayitemmargin
     * @type {Thickness} 
     */
    DayItemMargin {
        get => this.get_DayItemMargin()
        set => this.put_DayItemMargin(value)
    }

    /**
     * Gets or sets the amount of space around the outside of a month or year item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.monthyearitemmargin
     * @type {Thickness} 
     */
    MonthYearItemMargin {
        get => this.get_MonthYearItemMargin()
        set => this.put_MonthYearItemMargin(value)
    }

    /**
     * Gets or sets the amount of space around the first-of-month label.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofmonthlabelmargin
     * @type {Thickness} 
     */
    FirstOfMonthLabelMargin {
        get => this.get_FirstOfMonthLabelMargin()
        set => this.put_FirstOfMonthLabelMargin(value)
    }

    /**
     * Gets or sets the amount of space around the first-of-year/decade label.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.firstofyeardecadelabelmargin
     * @type {Thickness} 
     */
    FirstOfYearDecadeLabelMargin {
        get => this.get_FirstOfYearDecadeLabelMargin()
        set => this.put_FirstOfYearDecadeLabelMargin(value)
    }

    /**
     * Gets or sets the radius for the corners of calendar item.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.calendaritemcornerradius
     * @type {CornerRadius} 
     */
    CalendarItemCornerRadius {
        get => this.get_CalendarItemCornerRadius()
        set => this.put_CalendarItemCornerRadius(value)
    }

    /**
     * Occurs when a [CalendarViewDayItem](calendarviewdayitem.md) is loading.
     * @type {TypedEventHandler<CalendarView, CalendarViewDayItemChangingEventArgs>}
    */
    OnCalendarViewDayItemChanging {
        get {
            if(!this.HasProp("__OnCalendarViewDayItemChanging")){
                this.__OnCalendarViewDayItemChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6a74874e-f6b3-5c39-9e5f-1751b782bb32}"),
                    CalendarView,
                    CalendarViewDayItemChangingEventArgs
                )
                this.__OnCalendarViewDayItemChangingToken := this.add_CalendarViewDayItemChanging(this.__OnCalendarViewDayItemChanging.iface)
            }
            return this.__OnCalendarViewDayItemChanging
        }
    }

    /**
     * Occurs when the collection of selected dates is changed.
     * @type {TypedEventHandler<CalendarView, CalendarViewSelectedDatesChangedEventArgs>}
    */
    OnSelectedDatesChanged {
        get {
            if(!this.HasProp("__OnSelectedDatesChanged")){
                this.__OnSelectedDatesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d22361ee-5234-5d25-a53b-79a5ff6a03b8}"),
                    CalendarView,
                    CalendarViewSelectedDatesChangedEventArgs
                )
                this.__OnSelectedDatesChangedToken := this.add_SelectedDatesChanged(this.__OnSelectedDatesChanged.iface)
            }
            return this.__OnSelectedDatesChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCalendarViewDayItemChangingToken")) {
            this.remove_CalendarViewDayItemChanging(this.__OnCalendarViewDayItemChangingToken)
            this.__OnCalendarViewDayItemChanging.iface.Dispose()
        }

        if(this.HasProp("__OnSelectedDatesChangedToken")) {
            this.remove_SelectedDatesChanged(this.__OnSelectedDatesChangedToken)
            this.__OnSelectedDatesChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CalendarIdentifier() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_CalendarIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CalendarIdentifier(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_CalendarIdentifier(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DayOfWeekFormat() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_DayOfWeekFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DayOfWeekFormat(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_DayOfWeekFormat(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGroupLabelVisible() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_IsGroupLabelVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGroupLabelVisible(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_IsGroupLabelVisible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_DisplayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DisplayMode(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_DisplayMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstDayOfWeek() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstDayOfWeek()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FirstDayOfWeek(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstDayOfWeek(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOutOfScopeEnabled() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_IsOutOfScopeEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOutOfScopeEnabled(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_IsOutOfScopeEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTodayHighlighted() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_IsTodayHighlighted()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTodayHighlighted(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_IsTodayHighlighted(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MaxDate() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_MaxDate()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MaxDate(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_MaxDate(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MinDate() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_MinDate()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MinDate(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_MinDate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfWeeksInView() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_NumberOfWeeksInView()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NumberOfWeeksInView(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_NumberOfWeeksInView(value)
    }

    /**
     * 
     * @returns {IVector<DateTime>} 
     */
    get_SelectedDates() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_SelectedDates()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_SelectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_SelectionMode(value)
    }

    /**
     * 
     * @returns {CalendarViewTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_TemplateSettings()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusBorderBrush() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FocusBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusBorderBrush(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FocusBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedHoverBorderBrush() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_SelectedHoverBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedHoverBorderBrush(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_SelectedHoverBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPressedBorderBrush() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_SelectedPressedBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPressedBorderBrush(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_SelectedPressedBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedBorderBrush() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_SelectedBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedBorderBrush(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_SelectedBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_HoverBorderBrush() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_HoverBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_HoverBorderBrush(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_HoverBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PressedBorderBrush() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_PressedBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PressedBorderBrush(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_PressedBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemBorderBrush() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_CalendarItemBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemBorderBrush(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_CalendarItemBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_OutOfScopeBackground() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_OutOfScopeBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_OutOfScopeBackground(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_OutOfScopeBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemBackground() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_CalendarItemBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemBackground(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_CalendarItemBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PressedForeground() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_PressedForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PressedForeground(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_PressedForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayForeground() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_TodayForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodayForeground(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_TodayForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BlackoutForeground() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_BlackoutForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BlackoutForeground(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_BlackoutForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedForeground() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_SelectedForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedForeground(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_SelectedForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_OutOfScopeForeground() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_OutOfScopeForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_OutOfScopeForeground(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_OutOfScopeForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemForeground() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_CalendarItemForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemForeground(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_CalendarItemForeground(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_DayItemFontFamily() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_DayItemFontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_DayItemFontFamily(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_DayItemFontFamily(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DayItemFontSize() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_DayItemFontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DayItemFontSize(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_DayItemFontSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DayItemFontStyle() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_DayItemFontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DayItemFontStyle(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_DayItemFontStyle(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_DayItemFontWeight() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_DayItemFontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_DayItemFontWeight(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_DayItemFontWeight(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_TodayFontWeight() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_TodayFontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_TodayFontWeight(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_TodayFontWeight(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FirstOfMonthLabelFontFamily() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstOfMonthLabelFontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelFontFamily(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstOfMonthLabelFontFamily(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FirstOfMonthLabelFontSize() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstOfMonthLabelFontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelFontSize(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstOfMonthLabelFontSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstOfMonthLabelFontStyle() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstOfMonthLabelFontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelFontStyle(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstOfMonthLabelFontStyle(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FirstOfMonthLabelFontWeight() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstOfMonthLabelFontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelFontWeight(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstOfMonthLabelFontWeight(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_MonthYearItemFontFamily() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_MonthYearItemFontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemFontFamily(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_MonthYearItemFontFamily(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MonthYearItemFontSize() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_MonthYearItemFontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemFontSize(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_MonthYearItemFontSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonthYearItemFontStyle() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_MonthYearItemFontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemFontStyle(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_MonthYearItemFontStyle(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_MonthYearItemFontWeight() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_MonthYearItemFontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemFontWeight(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_MonthYearItemFontWeight(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FirstOfYearDecadeLabelFontFamily() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstOfYearDecadeLabelFontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelFontFamily(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstOfYearDecadeLabelFontFamily(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FirstOfYearDecadeLabelFontSize() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstOfYearDecadeLabelFontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelFontSize(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstOfYearDecadeLabelFontSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstOfYearDecadeLabelFontStyle() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstOfYearDecadeLabelFontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelFontStyle(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstOfYearDecadeLabelFontStyle(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FirstOfYearDecadeLabelFontWeight() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_FirstOfYearDecadeLabelFontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelFontWeight(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_FirstOfYearDecadeLabelFontWeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalDayItemAlignment() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_HorizontalDayItemAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalDayItemAlignment(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_HorizontalDayItemAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalDayItemAlignment() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_VerticalDayItemAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalDayItemAlignment(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_VerticalDayItemAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalFirstOfMonthLabelAlignment() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_HorizontalFirstOfMonthLabelAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalFirstOfMonthLabelAlignment(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_HorizontalFirstOfMonthLabelAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalFirstOfMonthLabelAlignment() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_VerticalFirstOfMonthLabelAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalFirstOfMonthLabelAlignment(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_VerticalFirstOfMonthLabelAlignment(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_CalendarItemBorderThickness() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_CalendarItemBorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemBorderThickness(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_CalendarItemBorderThickness(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_CalendarViewDayItemStyle() {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.get_CalendarViewDayItemStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_CalendarViewDayItemStyle(value) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.put_CalendarViewDayItemStyle(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CalendarView, CalendarViewDayItemChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CalendarViewDayItemChanging(handler) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.add_CalendarViewDayItemChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CalendarViewDayItemChanging(token) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.remove_CalendarViewDayItemChanging(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CalendarView, CalendarViewSelectedDatesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectedDatesChanged(handler) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.add_SelectedDatesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectedDatesChanged(token) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.remove_SelectedDatesChanged(token)
    }

    /**
     * Shows the specified date in the calendar.
     * @param {DateTime} date The date to show in the calendar.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.setdisplaydate
     */
    SetDisplayDate(date) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.SetDisplayDate(date)
    }

    /**
     * Sets the number of rows and columns to use in the Year and Decade display modes.
     * @param {Integer} columns_ The number of columns in the view.
     * @param {Integer} rows The number of rows in the view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarview.setyeardecadedisplaydimensions
     */
    SetYearDecadeDisplayDimensions(columns_, rows) {
        if (!this.HasProp("__ICalendarView")) {
            if ((queryResult := this.QueryInterface(ICalendarView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView := ICalendarView(outPtr)
        }

        return this.__ICalendarView.SetYearDecadeDisplayDimensions(columns_, rows)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedDisabledBorderBrush() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_SelectedDisabledBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedDisabledBorderBrush(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_SelectedDisabledBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodaySelectedInnerBorderBrush() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_TodaySelectedInnerBorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodaySelectedInnerBorderBrush(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_TodaySelectedInnerBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BlackoutStrikethroughBrush() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_BlackoutStrikethroughBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BlackoutStrikethroughBrush(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_BlackoutStrikethroughBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BlackoutBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_BlackoutBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BlackoutBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_BlackoutBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemHoverBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_CalendarItemHoverBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemHoverBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_CalendarItemHoverBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemPressedBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_CalendarItemPressedBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemPressedBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_CalendarItemPressedBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemDisabledBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_CalendarItemDisabledBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemDisabledBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_CalendarItemDisabledBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_TodayBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodayBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_TodayBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayBlackoutBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_TodayBlackoutBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodayBlackoutBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_TodayBlackoutBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayHoverBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_TodayHoverBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodayHoverBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_TodayHoverBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayPressedBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_TodayPressedBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodayPressedBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_TodayPressedBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayDisabledBackground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_TodayDisabledBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodayDisabledBackground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_TodayDisabledBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayBlackoutForeground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_TodayBlackoutForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodayBlackoutForeground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_TodayBlackoutForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedHoverForeground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_SelectedHoverForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedHoverForeground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_SelectedHoverForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPressedForeground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_SelectedPressedForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPressedForeground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_SelectedPressedForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedDisabledForeground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_SelectedDisabledForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedDisabledForeground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_SelectedDisabledForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_OutOfScopeHoverForeground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_OutOfScopeHoverForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_OutOfScopeHoverForeground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_OutOfScopeHoverForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_OutOfScopePressedForeground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_OutOfScopePressedForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_OutOfScopePressedForeground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_OutOfScopePressedForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_DisabledForeground() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_DisabledForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_DisabledForeground(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_DisabledForeground(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_DayItemMargin() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_DayItemMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_DayItemMargin(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_DayItemMargin(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_MonthYearItemMargin() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_MonthYearItemMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemMargin(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_MonthYearItemMargin(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FirstOfMonthLabelMargin() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_FirstOfMonthLabelMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelMargin(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_FirstOfMonthLabelMargin(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FirstOfYearDecadeLabelMargin() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_FirstOfYearDecadeLabelMargin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelMargin(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_FirstOfYearDecadeLabelMargin(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CalendarItemCornerRadius() {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.get_CalendarItemCornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemCornerRadius(value) {
        if (!this.HasProp("__ICalendarView2")) {
            if ((queryResult := this.QueryInterface(ICalendarView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarView2 := ICalendarView2(outPtr)
        }

        return this.__ICalendarView2.put_CalendarItemCornerRadius(value)
    }

;@endregion Instance Methods
}
