#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IDatePicker.ahk
#Include .\IDatePicker2.ahk
#Include .\IDatePicker3.ahk
#Include .\IDatePickerStatics2.ahk
#Include .\IDatePickerStatics3.ahk
#Include .\IDatePickerStatics.ahk
#Include .\IDatePickerFactory.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\DatePickerValueChangedEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DatePicker.ahk
#Include .\DatePickerSelectedValueChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that allows a user to pick a date value.
 * @remarks
 * Use a `DatePicker` to let a user enter a date value. The user picks the date using [ComboBox](combobox.md) selection for month, day, and year values. You can customize the `DatePicker` in various ways to suit your app.
 * 
 * ![A date picker control.](images/date-time/date-picker-closed.png)
 * 
 * For more info, design guidance, and code examples, see [Date picker](/windows/uwp/design/controls-and-patterns/date-picker).
 * 
 * The `DatePicker` supports each of the calendar systems supported by Windows. These calendars are specified in the [Windows.Globalization.CalendarIdentifiers](../windows.globalization/calendaridentifiers.md) class. The `DatePicker` uses the correct calendar for your app's default language, or you can set the [CalendarIdentifier](datepicker_calendaridentifier.md) property to use a specific calendar system.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DatePicker extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatePicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatePicker.IID

    /**
     * Identifies the [LightDismissOverlayMode](datepicker_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => DatePicker.get_LightDismissOverlayModeProperty()
    }

    /**
     * Identifies the [SelectedDate](datepicker_selecteddate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.selecteddateproperty
     * @type {DependencyProperty} 
     */
    static SelectedDateProperty {
        get => DatePicker.get_SelectedDateProperty()
    }

    /**
     * Identifies the [Header](datepicker_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => DatePicker.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](datepicker_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => DatePicker.get_HeaderTemplateProperty()
    }

    /**
     * Gets the identifier for the [CalendarIdentifier](datepicker_calendaridentifier.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.calendaridentifierproperty
     * @type {DependencyProperty} 
     */
    static CalendarIdentifierProperty {
        get => DatePicker.get_CalendarIdentifierProperty()
    }

    /**
     * Gets the identifier for the [Date](datepicker_date.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.dateproperty
     * @type {DependencyProperty} 
     */
    static DateProperty {
        get => DatePicker.get_DateProperty()
    }

    /**
     * Gets the identifier for the [DayVisible](datepicker_dayvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.dayvisibleproperty
     * @type {DependencyProperty} 
     */
    static DayVisibleProperty {
        get => DatePicker.get_DayVisibleProperty()
    }

    /**
     * Gets the identifier for the [MonthVisible](datepicker_monthvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.monthvisibleproperty
     * @type {DependencyProperty} 
     */
    static MonthVisibleProperty {
        get => DatePicker.get_MonthVisibleProperty()
    }

    /**
     * Gets the identifier for the [YearVisible](datepicker_yearvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.yearvisibleproperty
     * @type {DependencyProperty} 
     */
    static YearVisibleProperty {
        get => DatePicker.get_YearVisibleProperty()
    }

    /**
     * Gets the identifier for the [DayFormat](datepicker_dayformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.dayformatproperty
     * @type {DependencyProperty} 
     */
    static DayFormatProperty {
        get => DatePicker.get_DayFormatProperty()
    }

    /**
     * Gets the identifier for the [MonthFormat](datepicker_monthformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.monthformatproperty
     * @type {DependencyProperty} 
     */
    static MonthFormatProperty {
        get => DatePicker.get_MonthFormatProperty()
    }

    /**
     * Gets the identifier for the [YearFormat](datepicker_yearformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.yearformatproperty
     * @type {DependencyProperty} 
     */
    static YearFormatProperty {
        get => DatePicker.get_YearFormatProperty()
    }

    /**
     * Gets the identifier for the [MinYear](datepicker_minyear.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.minyearproperty
     * @type {DependencyProperty} 
     */
    static MinYearProperty {
        get => DatePicker.get_MinYearProperty()
    }

    /**
     * Gets the identifier for the [MaxYear](datepicker_maxyear.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.maxyearproperty
     * @type {DependencyProperty} 
     */
    static MaxYearProperty {
        get => DatePicker.get_MaxYearProperty()
    }

    /**
     * Gets the identifier for the [Orientation](datepicker_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => DatePicker.get_OrientationProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics2.IID)
            DatePicker.__IDatePickerStatics2 := IDatePickerStatics2(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics2.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedDateProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics3.IID)
            DatePicker.__IDatePickerStatics3 := IDatePickerStatics3(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics3.get_SelectedDateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarIdentifierProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_CalendarIdentifierProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DateProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_DateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayVisibleProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_DayVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthVisibleProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_MonthVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_YearVisibleProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_YearVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayFormatProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_DayFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthFormatProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_MonthFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_YearFormatProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_YearFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinYearProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_MinYearProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxYearProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_MaxYearProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!DatePicker.HasProp("__IDatePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerStatics.IID)
            DatePicker.__IDatePickerStatics := IDatePickerStatics(factoryPtr)
        }

        return DatePicker.__IDatePickerStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DatePicker} 
     */
    static CreateInstance() {
        if (!DatePicker.HasProp("__IDatePickerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFactory.IID)
            DatePicker.__IDatePickerFactory := IDatePickerFactory(factoryPtr)
        }

        return DatePicker.__IDatePickerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content for the control's header.
     * @remarks
     * You can set a data template for the Header value by using the [HeaderTemplate](datepicker_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the control's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the calendar system to use.
     * @remarks
     * The `DatePicker` supports each of the calendar systems supported by Windows. These calendars are specified in the [Windows.Globalization.CalendarIdentifiers](../windows.globalization/calendaridentifiers.md) class. The `DatePicker` uses the correct calendar for your app's default language, or you can set the [CalendarIdentifier](datepicker_calendaridentifier.md) property to use a specific calendar system.
     * 
     * To set the `CalendarIdentifier` in XAML, use the identifier string. To set it in code, use the corresponding [CalendarIdentifiers](../windows.globalization/calendaridentifiers.md) property. See the Examples section.
     * 
     * This table lists the supported calendar systems. See the [CalendarIdentifiers](../windows.globalization/calendaridentifiers.md) documentation for more information about each calendar system.
     * 
     * <table>
     *    <tr><th>Calendar system</th><th>Identifier string</th><th>Localized?</th></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.gregorian">Gregorian</a></td><td>"GregorianCalendar"</td><td>Yes.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.hebrew">Hebrew</a></td><td>"HebrewCalendar"</td><td>No. Strings always in Hebrew.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.hijri">Hijri</a></td><td>"HijriCalendar"</td><td>No. Strings always in Arabic.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.japanese">Japanese</a></td><td>"JapaneseCalendar"</td><td>No. Strings always in Japanese.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.julian">Julian</a></td><td>"JulianCalendar"</td><td>Yes.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.korean">Korean</a></td><td>"KoreanCalendar"</td><td>Yes.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.taiwan">Taiwan</a></td><td>"TaiwanCalendar"</td><td>Yes.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.thai">Thai</a></td><td>"ThaiCalendar"</td><td>Yes.</td></tr>
     *    <tr><td><a href="https://docs.microsoft.com/uwp/api/windows.globalization.calendaridentifiers.umalqura">UmAlQura</a></td><td>"UmAlQuraCalendar"</td><td>No. Strings always in Arabic.</td></tr>
     * </table>
     * 
     * The string content of each [ComboBox](combobox.md) in the [DatePicker](datepicker.md) is created by a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md). The [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) uses the `CalendarIdentifier` set on the [DatePicker](datepicker.md) to determine which calendar to use to format the content. If the `CalendarIdentifier` is not set, the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) uses the default calendar for the app’s preferred language (see [ApplicationLanguages](../windows.globalization/applicationlanguages.md)).
     * 
     * If the specified calendar system is localized, it will display in the app’s preferred language. For example, if you specify a Korean calendar and the app language is "en-us", the [DatePicker](datepicker.md) will display in English because there are translations for the Korean calendar. However, if you specify a Japanese calendar and the app preferred language is "en-us", the [DatePicker](datepicker.md) will still display in Japanese because there are no translations for the Japanese calendar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.calendaridentifier
     * @type {HSTRING} 
     */
    CalendarIdentifier {
        get => this.get_CalendarIdentifier()
        set => this.put_CalendarIdentifier(value)
    }

    /**
     * Gets or sets the date currently set in the date picker.
     * @remarks
     * The date picker control has both `Date` and [SelectedDate](/uwp/api/windows.ui.xaml.controls.datepicker.selecteddate) properties. The difference between these is that `Date` is not nullable, while `SelectedDate` is nullable.
     * 
     * The value of `SelectedDate` is used to populate the date picker and is `null` by default. If `SelectedDate` is `null`, the `Date` property is set to 12/31/1600; otherwise, the `Date` value is synchronized with the `SelectedDate` value. When `SelectedDate` is `null`, the picker is 'unset' and shows the field names instead of a date.
     * 
     * To use the `Date` value in your app, you typically use a data binding to the [Date](/uwp/api/windows.ui.xaml.controls.datepicker.date) property, or handle the [DateChanged](/uwp/api/windows.ui.xaml.controls.datepicker.datechanged) event.
     * 
     * The `Date` property can't be set as a XAML attribute string, because the Windows Runtime XAML parser doesn't have a conversion logic for converting strings to dates as [DateTime](../windows.foundation/datetime.md) / [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) objects. Here are some suggested ways these objects can be defined in code and set to a date other than the current date.
     * 
     * + [DateTime](../windows.foundation/datetime.md): Instantiate a [Windows.Globalization.Calendar](../windows.globalization/calendar.md) object (it is initialized to the current date). Set properties such as [Day](../windows.globalization/calendar_day.md) or [Year](../windows.globalization/calendar_year.md), or call methods such as [AddMonths](../windows.globalization/calendar_addmonths_787442092.md), to adjust the date. Then, call [Calendar.GetDateTime](../windows.globalization/calendar_getdatetime_624256552.md) and use the returned [DateTime](../windows.foundation/datetime.md) to set Date.
     * + [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true): Call the  constructor. For the inner [System.DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true), use the  constructor signature. Or, construct a default [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) (it is initialized to the current date) and call methods such as [AddMonths](/dotnet/api/system.datetimeoffset.addmonths?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * Another possible technique is to define a date that's available as a data object or in the data context, then set `Date` as a XAML attribute that references a [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) that can access the date as data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.date
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * Gets or sets a value that indicates whether the day selector is shown.
     * @remarks
     * By default, the [DatePicker](datepicker.md) shows [ComboBox](combobox.md) elements to select the month, day, and year. Set `DayVisible` to **false** to hide the [ComboBox](combobox.md) that displays or changes the day component of a date.
     * 
     * Here's the picker with the day field hidden.
     * 
     * ![A date picker with the day field hidden.](images/date-time/date-picker-day-hidden.png)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.dayvisible
     * @type {Boolean} 
     */
    DayVisible {
        get => this.get_DayVisible()
        set => this.put_DayVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the month selector is shown.
     * @remarks
     * By default, the [DatePicker](datepicker.md) shows [ComboBox](combobox.md) elements to select the month, day, and year. Set `MonthVisible` to **false** to hide the [ComboBox](combobox.md) that displays or changes the month component of a date.
     * 
     * Here's the picker with the month field hidden.
     * 
     * ![images/date-time/date-picker-month-hidden.png](A date picker with the month field hidden.)
     * 
     * It's typically not useful to show the day field without the month for context. A more common usage is to hide both the day and month, and show only the year, like this.
     * 
     * ```xaml
     * <DatePicker x:Name="yearDatePicker" Header="In what year was Microsoft founded?" 
     *             MonthVisible="False" DayVisible="False"/>
     * ```
     * 
     * ![A date picker with the day and month fields hidden.](images/date-time/date-picker-year-only.png)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.monthvisible
     * @type {Boolean} 
     */
    MonthVisible {
        get => this.get_MonthVisible()
        set => this.put_MonthVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the year selector is shown.
     * @remarks
     * By default, the [DatePicker](datepicker.md) shows [ComboBox](combobox.md) elements to select the month, day, and year. Set `YearVisible` to **false** to hide the [ComboBox](combobox.md) that displays or changes the year component of a date.
     * 
     * Here's the picker with the year field hidden.
     * 
     * ![A date picker with the year field hidden.](images/date-time/date-picker-year-hidden.png)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.yearvisible
     * @type {Boolean} 
     */
    YearVisible {
        get => this.get_YearVisible()
        set => this.put_YearVisible(value)
    }

    /**
     * Gets or sets the display format for the day value.
     * @remarks
     * Change the format of the day picker by setting the `DayFormat` property.
     * 
     * The string content of each [ComboBox](combobox.md) in the [DatePicker](datepicker.md) is created by a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md). You inform the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) how to format the day value by providing a string that is either a *format template* or a *format pattern*. Common templates and patterns for day values are listed in the following table.
     * 
     * <table>
     *    <tr><th>format pattern</th><th>format template</th></tr>
     *    <tr><td>`{day.integer} | {day.integer(n)}`</td><td>`day`</td></tr>
     *    <tr><td>`{dayofweek.full} | {dayofweek.abbreviated} | {dayofweek.abbreviated(n)}`</td><td>`dayofweek | dayofweek.full | dayofweek.abbreviated`</td></tr>
     * </table>
     * 
     * In some cases, using a format pattern gives you more precise control over the formatting. For example, you can use a format pattern to specify that the day picker always shows 2 digits, including a leading 0 when needed. You can also combine multiple format patterns. For example, you can combine the `{day}` and `{dayofweek.abbreviated}` formats to make the day picker show both the numeric date and the day of the week, like this: **14 Thu**. See the Examples section for more info.
     * 
     * For the complete list of format templates and format patterns, see the Remarks section of the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) class documentation.
     * 
     * > [!NOTE]
     * > Some date formats should be avoided if the date picker might be displayed in a small area, such as adding the full string value of the day of week. These strings can be long and might be clipped if the DatePicker's width is forced to be small.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.dayformat
     * @type {HSTRING} 
     */
    DayFormat {
        get => this.get_DayFormat()
        set => this.put_DayFormat(value)
    }

    /**
     * Gets or sets the display format for the month value.
     * @remarks
     * Change the format of the month picker by setting the `MonthFormat` property.
     * 
     * The string content of each [ComboBox](combobox.md) in the [DatePicker](datepicker.md) is created by a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md). You instruct the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) how to format the month value by providing a string that is either a *format template* or a *format pattern*. Common templates and patterns for month values are listed in the following table.
     * 
     * <table>
     *    <tr><th>format pattern</th><th>format template</th></tr>
     *    <tr><td>`{month.integer} | {month.integer(n)} `</td><td>`month.numeric`</td></tr>
     *    <tr><td>`{month.full} | {month.abbreviated} | {month.abbreviated(n)}`</td><td>`month | month.full | month.abbreviated`</td></tr>
     * </table>
     * 
     * In some cases, using a format pattern gives you more precise control over the formatting. For example, you can use a format pattern to specify that the month picker always shows 2 digits, including a leading 0 when needed. You can also combine multiple format patterns. For example, you can combine the `{month.integer}` and `{month.abbreviated}` formats to make the month picker show the month number and name, like this: **12 Dec**. See the Examples section for more info.
     * 
     * For the complete list of format templates and format patterns, see the Remarks section of the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) class documentation.
     * 
     * > [!NOTE]
     * > Some date formats should be avoided if the date picker might be displayed in a small area, such as adding the full string value of the day of week. These strings can be long and might be clipped if the DatePicker's width is forced to be small.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.monthformat
     * @type {HSTRING} 
     */
    MonthFormat {
        get => this.get_MonthFormat()
        set => this.put_MonthFormat(value)
    }

    /**
     * Gets or sets the display format for the year value.
     * @remarks
     * Change the format of the year picker by setting the `YearFormat` property.
     * 
     * The string content of each [ComboBox](combobox.md) in the [DatePicker](datepicker.md) is created by a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md). You inform the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) how to format the year value by providing a string that is either a *format template* or a *format pattern*. Common templates and patterns for year values are listed in the following table.
     * 
     * <table>
     *    <tr><th>format pattern</th><th>format template</th></tr>
     *    <tr><td>`{year.full} | {year.abbreviated} | {year.abbreviated(n)}`</td><td>`year | year.full | year.abbreviated`</td></tr>
     *    <tr><td>`{era.full} | {era.abbreviated} | {era.abbreviated(n)}`</td><td>n/a</td></tr>
     * </table>
     * 
     * > [!NOTE]
     * > "Era" only applies when the [CalendarIdentifier](datepicker_calendaridentifier.md) is set to the Japanese calendar. For the Japanese calendar, era is shown in the year picker.
     * 
     * For the complete list of format templates and format patterns, see the Remarks section of the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) class documentation.
     * 
     * > [!NOTE]
     * > Some date formats should be avoided if the date picker might be displayed in a small area, such as adding the full string value of the day of week. These strings can be long and might be clipped if the DatePicker's width is forced to be small.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.yearformat
     * @type {HSTRING} 
     */
    YearFormat {
        get => this.get_YearFormat()
        set => this.put_YearFormat(value)
    }

    /**
     * Gets or sets the minimum Gregorian year available for picking.
     * @remarks
     * You can set the `MinYear` and [MaxYear](datepicker_maxyear.md) properties to restrict the date values in the picker. By default, `MinYear` is set to 100 years prior to the current date and `MaxYear` is set to 100 years past the current date.
     * 
     * If you set only `MinYear` or `MaxYear`, you need to ensure that a valid date range is created by the date you set and the default value of the other date; otherwise, no date will be available to select in the picker. For example, setting only `yearDatePicker.MaxYear = new DateTimeOffset(new DateTime(900, 1, 1));` creates an invalid date range with the default value of `MinYear`.
     * 
     * The MinYear property can't be set as a XAML attribute string, because the Windows Runtime XAML parser doesn't have a conversion logic for converting strings to dates as [DateTime](../windows.foundation/datetime.md) / [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) objects. Here are some suggested ways these objects can be defined in code and set to a date other than the current date.
     * 
     * + [DateTime](../windows.foundation/datetime.md): Instantiate a [Windows.Globalization.Calendar](../windows.globalization/calendar.md) object (it is initialized to the current date). Set [Year](../windows.globalization/calendar_year.md), or call [AddYears](../windows.globalization/calendar_addyears_1853430648.md), to adjust the date. Then, call [Calendar.GetDateTime](../windows.globalization/calendar_getdatetime_624256552.md) and use the returned [DateTime](../windows.foundation/datetime.md) to set MinYear.
     * + [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true): Call the  constructor. For the inner [System.DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true), use the  constructor signature. Or, construct a default [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) (it is initialized to the current date) and call [AddYears](/dotnet/api/system.datetimeoffset.addyears?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * Another possible technique is to define a date that's available as a data object or in the data context, then set MinYear as a XAML attribute that references a [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) that can access the date as data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.minyear
     * @type {DateTime} 
     */
    MinYear {
        get => this.get_MinYear()
        set => this.put_MinYear(value)
    }

    /**
     * Gets or sets the maximum Gregorian year available for picking.
     * @remarks
     * You can set the [MinYear](datepicker_minyear.md) and `MaxYear` properties to restrict the date values in the picker. By default, `MinYear` is set to 100 years prior to the current date and `MaxYear` is set to 100 years past the current date.
     * 
     * If you set only `MinYear` or `MaxYear`, you need to ensure that a valid date range is created by the date you set and the default value of the other date; otherwise, no date will be available to select in the picker. For example, setting only `yearDatePicker.MaxYear = new DateTimeOffset(new DateTime(900, 1, 1));` creates an invalid date range with the default value of `MinYear`.
     * 
     * The MaxYear property can't be set as a XAML attribute string, because the Windows Runtime XAML parser doesn't have a conversion logic for converting strings to dates as [DateTime](../windows.foundation/datetime.md) / [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) objects. Here are some suggested ways these objects can be defined in code and set to a date other than the current date.
     * 
     * + [DateTime](../windows.foundation/datetime.md): Instantiate a [Windows.Globalization.Calendar](../windows.globalization/calendar.md) object (it is initialized to the current date). Set [Year](../windows.globalization/calendar_year.md), or call [AddYears](../windows.globalization/calendar_addyears_1853430648.md), to adjust the date. Then, call [Calendar.GetDateTime](../windows.globalization/calendar_getdatetime_624256552.md) and use the returned [DateTime](../windows.foundation/datetime.md) to set MaxYear.
     * + [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true): Call the  constructor. For the inner [System.DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true), use the  constructor signature. Or, construct a default [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) (it is initialized to the current date) and call [AddYears](/dotnet/api/system.datetimeoffset.addyears?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * Another possible technique is to define a date that's available as a data object or in the data context, then set MaxYear as a XAML attribute that references a [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) that can access the date as data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.maxyear
     * @type {DateTime} 
     */
    MaxYear {
        get => this.get_MaxYear()
        set => this.put_MaxYear(value)
    }

    /**
     * Gets or sets a value that indicates whether the day, month, and year selectors are stacked horizontally or vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as the open [DatePickerFlyout](datepickerflyout.md) of a [DatePicker](datepicker.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set LightDismissOverlayMode to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Gets or sets the date currently selected in the date picker, or **null** if no date is selected.
     * @remarks
     * The date picker control has both [Date](datepicker_date.md) and `SelectedDate` properties. The difference between these is that `Date` is not nullable, while `SelectedDate` is nullable.
     * 
     * The value of `SelectedDate` is used to populate the date picker and is `null` by default. If `SelectedDate` is `null`, the `Date` property is set to 12/31/1600; otherwise, the `Date` value is synchronized with the `SelectedDate` value. When `SelectedDate` is `null`, the picker is 'unset' and shows the field names instead of a date.
     * 
     * To use the `SelectedDate` value in your app, you typically use a data binding to the `SelectedDate` property, or handle the [SelectedDateChanged](datepicker_selecteddatechanged.md) event.
     * 
     * The `SelectedDate` property can't be set as a XAML attribute string, because the Windows Runtime XAML parser doesn't have a conversion logic for converting strings to dates as [DateTime](/uwp/api/windows.foundation.datetime) / [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) objects. Here are some suggested ways these objects can be defined in code and set to a date other than the current date.
     * 
     * + [DateTime](../windows.foundation/datetime.md): Instantiate a [Windows.Globalization.Calendar](../windows.globalization/calendar.md) object (it is initialized to the current date). Set properties such as [Day](../windows.globalization/calendar_day.md) or [Year](../windows.globalization/calendar_year.md), or call methods such as [AddMonths](../windows.globalization/calendar_addmonths_787442092.md), to adjust the date. Then, call [Calendar.GetDateTime](../windows.globalization/calendar_getdatetime_624256552.md) and use the returned [DateTime](../windows.foundation/datetime.md) to set Date.
     * + [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true): Call the  constructor. For the inner [System.DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true), use the  constructor signature. Or, construct a default [DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) (it is initialized to the current date) and call methods such as [AddMonths](/dotnet/api/system.datetimeoffset.addmonths?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * Another possible technique is to define a date that's available as a data object or in the data context, then set Date as a XAML attribute that references a [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) that can access the date as data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepicker.selecteddate
     * @type {IReference<DateTime>} 
     */
    SelectedDate {
        get => this.get_SelectedDate()
        set => this.put_SelectedDate(value)
    }

    /**
     * Occurs when the date value is changed.
     * @remarks
     * When you handle this event, use the [OldDate](datepickervaluechangedeventargs_olddate.md) and [NewDate](datepickervaluechangedeventargs_newdate.md) properties of the [DatePickerValueChangedEventArgs](datepickervaluechangedeventargs.md) event data for your logic. These properties use different data types depending on your programming language (C# and Visual Basic use [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true); Visual C++ component extensions (C++/CX) uses [Windows::Foundation::DateTime](/windows/desktop/api/windows.foundation/ns-windows-foundation-datetime)).
     * @type {EventHandler<DatePickerValueChangedEventArgs>}
    */
    OnDateChanged {
        get {
            if(!this.HasProp("__OnDateChanged")){
                this.__OnDateChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{f11e9015-3cb1-5f5d-9269-363dbb46f318}"),
                    IInspectable,
                    DatePickerValueChangedEventArgs
                )
                this.__OnDateChangedToken := this.add_DateChanged(this.__OnDateChanged.iface)
            }
            return this.__OnDateChanged
        }
    }

    /**
     * Occurs when the date value is changed.
     * @remarks
     * When you handle this event, use the [OldDate](datepickerselectedvaluechangedeventargs_olddate.md) and [NewDate](datepickerselectedvaluechangedeventargs_newdate.md) properties of the [DatePickerSelectedValueChangedEventArgs](datepickerselectedvaluechangedeventargs.md) event data for your logic. These properties use different data types depending on your programming language (C# and Visual Basic use [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true); Visual C++ component extensions (C++/CX) uses [Windows::Foundation::DateTime](/windows/desktop/api/windows.foundation/ns-windows-foundation-datetime)).
     * @type {TypedEventHandler<DatePicker, DatePickerSelectedValueChangedEventArgs>}
    */
    OnSelectedDateChanged {
        get {
            if(!this.HasProp("__OnSelectedDateChanged")){
                this.__OnSelectedDateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d915ec0c-dd94-5771-8ee4-d6e7f35ee07e}"),
                    DatePicker,
                    DatePickerSelectedValueChangedEventArgs
                )
                this.__OnSelectedDateChangedToken := this.add_SelectedDateChanged(this.__OnSelectedDateChanged.iface)
            }
            return this.__OnSelectedDateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDateChangedToken")) {
            this.remove_DateChanged(this.__OnDateChangedToken)
            this.__OnDateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSelectedDateChangedToken")) {
            this.remove_SelectedDateChanged(this.__OnSelectedDateChangedToken)
            this.__OnSelectedDateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CalendarIdentifier() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_CalendarIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CalendarIdentifier(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_CalendarIdentifier(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_Date()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_Date(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_Date(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DayVisible() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_DayVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DayVisible(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_DayVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MonthVisible() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_MonthVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MonthVisible(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_MonthVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_YearVisible() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_YearVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_YearVisible(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_YearVisible(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DayFormat() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_DayFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DayFormat(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_DayFormat(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MonthFormat() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_MonthFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MonthFormat(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_MonthFormat(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_YearFormat() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_YearFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_YearFormat(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_YearFormat(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MinYear() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_MinYear()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MinYear(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_MinYear(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MaxYear() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_MaxYear()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MaxYear(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_MaxYear(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.put_Orientation(value)
    }

    /**
     * 
     * @param {EventHandler<DatePickerValueChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DateChanged(handler) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.add_DateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DateChanged(token) {
        if (!this.HasProp("__IDatePicker")) {
            if ((queryResult := this.QueryInterface(IDatePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker := IDatePicker(outPtr)
        }

        return this.__IDatePicker.remove_DateChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__IDatePicker2")) {
            if ((queryResult := this.QueryInterface(IDatePicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker2 := IDatePicker2(outPtr)
        }

        return this.__IDatePicker2.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__IDatePicker2")) {
            if ((queryResult := this.QueryInterface(IDatePicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker2 := IDatePicker2(outPtr)
        }

        return this.__IDatePicker2.put_LightDismissOverlayMode(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_SelectedDate() {
        if (!this.HasProp("__IDatePicker3")) {
            if ((queryResult := this.QueryInterface(IDatePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker3 := IDatePicker3(outPtr)
        }

        return this.__IDatePicker3.get_SelectedDate()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_SelectedDate(value) {
        if (!this.HasProp("__IDatePicker3")) {
            if ((queryResult := this.QueryInterface(IDatePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker3 := IDatePicker3(outPtr)
        }

        return this.__IDatePicker3.put_SelectedDate(value)
    }

    /**
     * 
     * @param {TypedEventHandler<DatePicker, DatePickerSelectedValueChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectedDateChanged(handler) {
        if (!this.HasProp("__IDatePicker3")) {
            if ((queryResult := this.QueryInterface(IDatePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker3 := IDatePicker3(outPtr)
        }

        return this.__IDatePicker3.add_SelectedDateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectedDateChanged(token) {
        if (!this.HasProp("__IDatePicker3")) {
            if ((queryResult := this.QueryInterface(IDatePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePicker3 := IDatePicker3(outPtr)
        }

        return this.__IDatePicker3.remove_SelectedDateChanged(token)
    }

;@endregion Instance Methods
}
