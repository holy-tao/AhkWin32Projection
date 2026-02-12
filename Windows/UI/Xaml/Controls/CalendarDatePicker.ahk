#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ICalendarDatePicker.ahk
#Include .\ICalendarDatePicker2.ahk
#Include .\ICalendarDatePicker3.ahk
#Include .\ICalendarDatePickerStatics.ahk
#Include .\ICalendarDatePickerStatics2.ahk
#Include .\ICalendarDatePickerFactory.ahk
#Include .\ICalendarDatePickerStatics3.ahk
#Include .\CalendarViewDayItemChangingEventHandler.ahk
#Include .\CalendarView.ahk
#Include .\CalendarViewDayItemChangingEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CalendarDatePicker.ahk
#Include .\CalendarDatePickerDateChangedEventArgs.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that allows a user to pick a date from a calendar display.
 * @remarks
 * CalendarDatePicker is a drop down control that's optimized for picking a single date from a calendar view where contextual information like the day of the week or fullness of the calendar is important. It's similar to the [DatePicker](datepicker.md) control, but the [DatePicker](datepicker.md) is optimized for picking a known date, such as a date of birth, where the context of the calendar is not important.
 * 
 * You can use the CalendarDatePicker control in its default form with a minimal amount of Extensible Application Markup Language (XAML) or other code, or you can customize it in various ways to suit your app. Here's a simple CalendarDatePicker created in Extensible Application Markup Language (XAML) and code.
 * 
 * ```csharp
 * CalendarDatePicker arrivalCalendarDatePicker = new CalendarDatePicker();
 * ```
 * 
 * ```xaml
 * <CalendarDatePicker x:Name="arrivalCalendarDatePicker"/>
 * ```
 * 
 * Here's what the control look like when it's closed and a date is not selected.
 * 
 * <img src="images/Controls/CalendarDatePicker_Closed.png" alt="Closed calendar date picker" />
 * 
 * Here's what it looks like with the calendar open and a date selected.
 * 
 * <img src="images/Controls/CalendarDatePicker_Open.png" alt="Open calendar date picker" />
 * 
 * CalendarDatePicker has an internal [CalendarView](calendarview.md) for picking a date. A subset of [CalendarView](calendarview.md) properties, like [IsTodayHighlighted](calendardatepicker_istodayhighlighted.md) and [FirstDayOfWeek](calendardatepicker_firstdayofweek.md), exist on CalendarDatePicker and are forwarded to the internal [CalendarView](calendarview.md) to let you modify it. However, you can't change the [SelectionMode](calendarview_selectionmode.md) of the internal [CalendarView](calendarview.md) to allow multiple selection. If you need to let a user pick multiple dates or need a calendar to be always visible, consider using a [CalendarView](calendarview.md) instead of a CalendarDatePicker. See the [CalendarView](calendarview.md) class for more info on how you can modify the calendar display.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CalendarDatePicker extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendarDatePicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendarDatePicker.IID

    /**
     * Identifies the [Date](calendardatepicker_date.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.dateproperty
     * @type {DependencyProperty} 
     */
    static DateProperty {
        get => CalendarDatePicker.get_DateProperty()
    }

    /**
     * Identifies the [IsCalendarOpen](calendardatepicker_iscalendaropen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.iscalendaropenproperty
     * @type {DependencyProperty} 
     */
    static IsCalendarOpenProperty {
        get => CalendarDatePicker.get_IsCalendarOpenProperty()
    }

    /**
     * Identifies the [DateFormat](calendardatepicker_dateformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.dateformatproperty
     * @type {DependencyProperty} 
     */
    static DateFormatProperty {
        get => CalendarDatePicker.get_DateFormatProperty()
    }

    /**
     * Identifies the [PlaceholderText](calendardatepicker_placeholdertext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.placeholdertextproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderTextProperty {
        get => CalendarDatePicker.get_PlaceholderTextProperty()
    }

    /**
     * Identifies the [Header](calendardatepicker_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => CalendarDatePicker.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](calendardatepicker_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => CalendarDatePicker.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [CalendarViewStyle](calendardatepicker_calendarviewstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.calendarviewstyleproperty
     * @type {DependencyProperty} 
     */
    static CalendarViewStyleProperty {
        get => CalendarDatePicker.get_CalendarViewStyleProperty()
    }

    /**
     * Identifies the [MinDate](calendardatepicker_mindate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.mindateproperty
     * @type {DependencyProperty} 
     */
    static MinDateProperty {
        get => CalendarDatePicker.get_MinDateProperty()
    }

    /**
     * Identifies the [MaxDate](calendardatepicker_maxdate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.maxdateproperty
     * @type {DependencyProperty} 
     */
    static MaxDateProperty {
        get => CalendarDatePicker.get_MaxDateProperty()
    }

    /**
     * Identifies the [IsTodayHighlighted](calendardatepicker_istodayhighlighted.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.istodayhighlightedproperty
     * @type {DependencyProperty} 
     */
    static IsTodayHighlightedProperty {
        get => CalendarDatePicker.get_IsTodayHighlightedProperty()
    }

    /**
     * Identifies the [DisplayMode](calendardatepicker_displaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.displaymodeproperty
     * @type {DependencyProperty} 
     */
    static DisplayModeProperty {
        get => CalendarDatePicker.get_DisplayModeProperty()
    }

    /**
     * Identifies the [FirstDayOfWeek](calendardatepicker_firstdayofweek.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.firstdayofweekproperty
     * @type {DependencyProperty} 
     */
    static FirstDayOfWeekProperty {
        get => CalendarDatePicker.get_FirstDayOfWeekProperty()
    }

    /**
     * Identifies the [DayOfWeekFormat](calendardatepicker_dayofweekformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.dayofweekformatproperty
     * @type {DependencyProperty} 
     */
    static DayOfWeekFormatProperty {
        get => CalendarDatePicker.get_DayOfWeekFormatProperty()
    }

    /**
     * Identifies the [CalendarIdentifier](calendardatepicker_calendaridentifier.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.calendaridentifierproperty
     * @type {DependencyProperty} 
     */
    static CalendarIdentifierProperty {
        get => CalendarDatePicker.get_CalendarIdentifierProperty()
    }

    /**
     * Identifies the [IsOutOfScopeEnabled](calendardatepicker_isoutofscopeenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.isoutofscopeenabledproperty
     * @type {DependencyProperty} 
     */
    static IsOutOfScopeEnabledProperty {
        get => CalendarDatePicker.get_IsOutOfScopeEnabledProperty()
    }

    /**
     * Identifies the [IsGroupLabelVisible](calendardatepicker_isgrouplabelvisible.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.isgrouplabelvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsGroupLabelVisibleProperty {
        get => CalendarDatePicker.get_IsGroupLabelVisibleProperty()
    }

    /**
     * Identifies the [LightDismissOverlayMode](calendardatepicker_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => CalendarDatePicker.get_LightDismissOverlayModeProperty()
    }

    /**
     * Identifies the [Description](calendardatepicker_description.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.descriptionproperty
     * @type {DependencyProperty} 
     */
    static DescriptionProperty {
        get => CalendarDatePicker.get_DescriptionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DateProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_DateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCalendarOpenProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_IsCalendarOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DateFormatProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_DateFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderTextProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_PlaceholderTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarViewStyleProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_CalendarViewStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinDateProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_MinDateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxDateProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_MaxDateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTodayHighlightedProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_IsTodayHighlightedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisplayModeProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_DisplayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FirstDayOfWeekProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_FirstDayOfWeekProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayOfWeekFormatProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_DayOfWeekFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarIdentifierProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_CalendarIdentifierProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsOutOfScopeEnabledProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_IsOutOfScopeEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsGroupLabelVisibleProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics := ICalendarDatePickerStatics(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics.get_IsGroupLabelVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics2.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics2 := ICalendarDatePickerStatics2(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics2.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {CalendarDatePicker} 
     */
    static CreateInstance() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerFactory.IID)
            CalendarDatePicker.__ICalendarDatePickerFactory := ICalendarDatePickerFactory(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DescriptionProperty() {
        if (!CalendarDatePicker.HasProp("__ICalendarDatePickerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarDatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarDatePickerStatics3.IID)
            CalendarDatePicker.__ICalendarDatePickerStatics3 := ICalendarDatePickerStatics3(factoryPtr)
        }

        return CalendarDatePicker.__ICalendarDatePickerStatics3.get_DescriptionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the date currently set in the calendar picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.date
     * @type {IReference<DateTime>} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * Gets or sets a value that indicates whether the calendar view of the [CalendarDatePicker](calendardatepicker.md) is currently shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.iscalendaropen
     * @type {Boolean} 
     */
    IsCalendarOpen {
        get => this.get_IsCalendarOpen()
        set => this.put_IsCalendarOpen(value)
    }

    /**
     * Gets or sets the display format for the date value in the picker's text box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.dateformat
     * @type {HSTRING} 
     */
    DateFormat {
        get => this.get_DateFormat()
        set => this.put_DateFormat(value)
    }

    /**
     * Gets or sets the text that is displayed in the picker's text box until the value is changed by a user action or some other operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * Gets or sets the content for the calendar picker's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the [Style](../windows.ui.xaml/style.md) associated with the control's internal [CalendarView](calendarview.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.calendarviewstyle
     * @type {Style} 
     */
    CalendarViewStyle {
        get => this.get_CalendarViewStyle()
        set => this.put_CalendarViewStyle(value)
    }

    /**
     * Gets or sets the earliest date that can be set in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.mindate
     * @type {DateTime} 
     */
    MinDate {
        get => this.get_MinDate()
        set => this.put_MinDate(value)
    }

    /**
     * Gets or sets the latest date that can be set in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.maxdate
     * @type {DateTime} 
     */
    MaxDate {
        get => this.get_MaxDate()
        set => this.put_MaxDate(value)
    }

    /**
     * Gets or sets a value that indicates whether the current date is highlighted in the picker's [CalendarView](calendarview.md).
     * @remarks
     * This property affects the [CalendarDatePicker](calendardatepicker.md)'s internal [CalendarView](calendarview.md). For more info, see [CalendarView.IsTodayHighlighted](calendarview_istodayhighlighted.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.istodayhighlighted
     * @type {Boolean} 
     */
    IsTodayHighlighted {
        get => this.get_IsTodayHighlighted()
        set => this.put_IsTodayHighlighted(value)
    }

    /**
     * Gets or sets a value that indicates whether the calendar shows selections for month, year, or decade in the picker's [CalendarView](calendarview.md).
     * @remarks
     * This property affects the [CalendarDatePicker](calendardatepicker.md)'s internal [CalendarView](calendarview.md). For more info, see [CalendarView.DisplayMode](calendarview_displaymode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.displaymode
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
        set => this.put_DisplayMode(value)
    }

    /**
     * Gets or sets a value that indicates which day is shown as the first day of the week in the picker's [CalendarView](calendarview.md).
     * @remarks
     * This property affects the [CalendarDatePicker](calendardatepicker.md)'s internal [CalendarView](calendarview.md). For more info, see [CalendarView.FirstDayOfWeek](calendarview_firstdayofweek.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.firstdayofweek
     * @type {Integer} 
     */
    FirstDayOfWeek {
        get => this.get_FirstDayOfWeek()
        set => this.put_FirstDayOfWeek(value)
    }

    /**
     * Gets or sets the display format for the day of the week headers in the picker's [CalendarView](calendarview.md).
     * @remarks
     * This property affects the [CalendarDatePicker](calendardatepicker.md)'s internal [CalendarView](calendarview.md). For more info, see [CalendarView.DayOfWeekFormat](calendarview_dayofweekformat.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.dayofweekformat
     * @type {HSTRING} 
     */
    DayOfWeekFormat {
        get => this.get_DayOfWeekFormat()
        set => this.put_DayOfWeekFormat(value)
    }

    /**
     * Gets or sets the calendar system to use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.calendaridentifier
     * @type {HSTRING} 
     */
    CalendarIdentifier {
        get => this.get_CalendarIdentifier()
        set => this.put_CalendarIdentifier(value)
    }

    /**
     * Gets or sets a value that indicates whether out-of-scope calendar items are shown with a unique foreground color in the picker's [CalendarView](calendarview.md).
     * @remarks
     * This property affects the [CalendarDatePicker](calendardatepicker.md)'s internal [CalendarView](calendarview.md). For more info, see [CalendarView.IsOutOfScopeEnabled](calendarview_isoutofscopeenabled.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.isoutofscopeenabled
     * @type {Boolean} 
     */
    IsOutOfScopeEnabled {
        get => this.get_IsOutOfScopeEnabled()
        set => this.put_IsOutOfScopeEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the month name is shown with the first day of the month in the picker's [CalendarView](calendarview.md).
     * @remarks
     * This property affects the [CalendarDatePicker](calendardatepicker.md)'s internal [CalendarView](calendarview.md). For more info, see [CalendarView.IsGroupLabelVisible](calendarview_isgrouplabelvisible.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.isgrouplabelvisible
     * @type {Boolean} 
     */
    IsGroupLabelVisible {
        get => this.get_IsGroupLabelVisible()
        set => this.put_IsGroupLabelVisible(value)
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as the open calendar view of a [CalendarDatePicker](calendardatepicker.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set LightDismissOverlayMode to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Gets or sets content that is shown below the control. The content should provide guidance about the input expected by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.description
     * @type {IInspectable} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Occurs when a [CalendarViewDayItem](calendarviewdayitem.md) is loading in the picker's [CalendarView](calendarview.md).
     * @remarks
     * This method is comes from the [CalendarDatePicker](calendardatepicker.md)'s internal [CalendarView](calendarview.md). For more info, see [CalendarView.CalendarViewDayItemChanging](calendarview_calendarviewdayitemchanging.md).
     * @type {CalendarViewDayItemChangingEventHandler}
    */
    OnCalendarViewDayItemChanging {
        get {
            if(!this.HasProp("__OnCalendarViewDayItemChanging")){
                this.__OnCalendarViewDayItemChanging := WinRTEventHandler(
                    CalendarViewDayItemChangingEventHandler,
                    CalendarViewDayItemChangingEventHandler.IID,
                    CalendarView,
                    CalendarViewDayItemChangingEventArgs
                )
                this.__OnCalendarViewDayItemChangingToken := this.add_CalendarViewDayItemChanging(this.__OnCalendarViewDayItemChanging.iface)
            }
            return this.__OnCalendarViewDayItemChanging
        }
    }

    /**
     * Occurs when the date value is changed.
     * @type {TypedEventHandler<CalendarDatePicker, CalendarDatePickerDateChangedEventArgs>}
    */
    OnDateChanged {
        get {
            if(!this.HasProp("__OnDateChanged")){
                this.__OnDateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5ff44775-026e-51db-b462-44c19c45a777}"),
                    CalendarDatePicker,
                    CalendarDatePickerDateChangedEventArgs
                )
                this.__OnDateChangedToken := this.add_DateChanged(this.__OnDateChanged.iface)
            }
            return this.__OnDateChanged
        }
    }

    /**
     * Occurs when the picker's [CalendarView](calendarview.md) is shown.
     * @type {EventHandler<IInspectable>}
    */
    OnOpened {
        get {
            if(!this.HasProp("__OnOpened")){
                this.__OnOpened := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnOpenedToken := this.add_Opened(this.__OnOpened.iface)
            }
            return this.__OnOpened
        }
    }

    /**
     * Occurs when the picker's [CalendarView](calendarview.md) is hidden.
     * @type {EventHandler<IInspectable>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
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

        if(this.HasProp("__OnDateChangedToken")) {
            this.remove_DateChanged(this.__OnDateChangedToken)
            this.__OnDateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnOpenedToken")) {
            this.remove_Opened(this.__OnOpenedToken)
            this.__OnOpened.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Date() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_Date()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Date(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_Date(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCalendarOpen() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_IsCalendarOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCalendarOpen(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_IsCalendarOpen(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DateFormat() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_DateFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DateFormat(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_DateFormat(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_PlaceholderText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_CalendarViewStyle() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_CalendarViewStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_CalendarViewStyle(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_CalendarViewStyle(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MinDate() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_MinDate()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MinDate(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_MinDate(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MaxDate() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_MaxDate()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MaxDate(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_MaxDate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTodayHighlighted() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_IsTodayHighlighted()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTodayHighlighted(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_IsTodayHighlighted(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_DisplayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DisplayMode(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_DisplayMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstDayOfWeek() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_FirstDayOfWeek()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FirstDayOfWeek(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_FirstDayOfWeek(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DayOfWeekFormat() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_DayOfWeekFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DayOfWeekFormat(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_DayOfWeekFormat(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CalendarIdentifier() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_CalendarIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CalendarIdentifier(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_CalendarIdentifier(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOutOfScopeEnabled() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_IsOutOfScopeEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOutOfScopeEnabled(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_IsOutOfScopeEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGroupLabelVisible() {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.get_IsGroupLabelVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGroupLabelVisible(value) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.put_IsGroupLabelVisible(value)
    }

    /**
     * 
     * @param {CalendarViewDayItemChangingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CalendarViewDayItemChanging(handler) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.add_CalendarViewDayItemChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CalendarViewDayItemChanging(token) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.remove_CalendarViewDayItemChanging(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CalendarDatePicker, CalendarDatePickerDateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DateChanged(handler) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.add_DateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DateChanged(token) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.remove_DateChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.remove_Opened(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.remove_Closed(token)
    }

    /**
     * Shows the specified date in the calendar picker.
     * @remarks
     * <!--<p>This method affects the internal <xref targtype="class_winrt" rid="w_ui_xaml_ctrl.calendarview">CalendarView</xref> of the <xref targtype="class_winrt" rid="w_ui_xaml_ctrl.calendardatepicker">CalendarDatePicker</xref>. For more info, see <xref targtype="method_winrt" rid="w_ui_xaml_ctrl.calendarview_setdisplaydate">CalendarView.SetDisplayDate</xref>.</p>-->
     * @param {DateTime} date The date to show.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.setdisplaydate
     */
    SetDisplayDate(date) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.SetDisplayDate(date)
    }

    /**
     * Sets the number of rows and columns to use in the **Year** and **Decade** display modes of the picker's [CalendarView](calendarview.md).
     * @remarks
     * This method affects the [CalendarDatePicker](calendardatepicker.md)'s internal [CalendarView](calendarview.md). For more info, see [CalendarView.SetYearDecadeDisplayDimensions](calendarview_setyeardecadedisplaydimensions_388826447.md).
     * @param {Integer} columns_ The number of columns in the view.
     * @param {Integer} rows The number of rows in the view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepicker.setyeardecadedisplaydimensions
     */
    SetYearDecadeDisplayDimensions(columns_, rows) {
        if (!this.HasProp("__ICalendarDatePicker")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker := ICalendarDatePicker(outPtr)
        }

        return this.__ICalendarDatePicker.SetYearDecadeDisplayDimensions(columns_, rows)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__ICalendarDatePicker2")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker2 := ICalendarDatePicker2(outPtr)
        }

        return this.__ICalendarDatePicker2.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__ICalendarDatePicker2")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker2 := ICalendarDatePicker2(outPtr)
        }

        return this.__ICalendarDatePicker2.put_LightDismissOverlayMode(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Description() {
        if (!this.HasProp("__ICalendarDatePicker3")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker3 := ICalendarDatePicker3(outPtr)
        }

        return this.__ICalendarDatePicker3.get_Description()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__ICalendarDatePicker3")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePicker3 := ICalendarDatePicker3(outPtr)
        }

        return this.__ICalendarDatePicker3.put_Description(value)
    }

;@endregion Instance Methods
}
