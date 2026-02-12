#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\PickerFlyoutBase.ahk
#Include .\IDatePickerFlyout.ahk
#Include .\IDatePickerFlyout2.ahk
#Include .\IDatePickerFlyoutStatics.ahk
#Include .\IDatePickerFlyoutStatics2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DatePickerFlyout.ahk
#Include .\DatePickedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that allows a user to pick a date.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DatePickerFlyout extends PickerFlyoutBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatePickerFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatePickerFlyout.IID

    /**
     * Gets the identifier for the [CalendarIdentifier](datepickerflyout_calendaridentifier.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.calendaridentifierproperty
     * @type {DependencyProperty} 
     */
    static CalendarIdentifierProperty {
        get => DatePickerFlyout.get_CalendarIdentifierProperty()
    }

    /**
     * Gets the identifier for the [Date](datepickerflyout_date.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.dateproperty
     * @type {DependencyProperty} 
     */
    static DateProperty {
        get => DatePickerFlyout.get_DateProperty()
    }

    /**
     * Gets the identifier for the [DayVisible](datepickerflyout_dayvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.dayvisibleproperty
     * @type {DependencyProperty} 
     */
    static DayVisibleProperty {
        get => DatePickerFlyout.get_DayVisibleProperty()
    }

    /**
     * Gets the identifier for the [MonthVisible](datepickerflyout_monthvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.monthvisibleproperty
     * @type {DependencyProperty} 
     */
    static MonthVisibleProperty {
        get => DatePickerFlyout.get_MonthVisibleProperty()
    }

    /**
     * Gets the identifier for the [YearVisible](datepickerflyout_yearvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.yearvisibleproperty
     * @type {DependencyProperty} 
     */
    static YearVisibleProperty {
        get => DatePickerFlyout.get_YearVisibleProperty()
    }

    /**
     * Gets the identifier for the [MinYear](datepickerflyout_minyear.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.minyearproperty
     * @type {DependencyProperty} 
     */
    static MinYearProperty {
        get => DatePickerFlyout.get_MinYearProperty()
    }

    /**
     * Gets the identifier for the [MaxYear](datepickerflyout_maxyear.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.maxyearproperty
     * @type {DependencyProperty} 
     */
    static MaxYearProperty {
        get => DatePickerFlyout.get_MaxYearProperty()
    }

    /**
     * Identifies the [DayFormat](datepickerflyout_dayformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.dayformatproperty
     * @type {DependencyProperty} 
     */
    static DayFormatProperty {
        get => DatePickerFlyout.get_DayFormatProperty()
    }

    /**
     * Identifies the [MonthFormat](datepickerflyout_monthformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.monthformatproperty
     * @type {DependencyProperty} 
     */
    static MonthFormatProperty {
        get => DatePickerFlyout.get_MonthFormatProperty()
    }

    /**
     * Identifies the [YearFormat](datepickerflyout_yearformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.yearformatproperty
     * @type {DependencyProperty} 
     */
    static YearFormatProperty {
        get => DatePickerFlyout.get_YearFormatProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CalendarIdentifierProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics := IDatePickerFlyoutStatics(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics.get_CalendarIdentifierProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DateProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics := IDatePickerFlyoutStatics(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics.get_DateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayVisibleProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics := IDatePickerFlyoutStatics(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics.get_DayVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthVisibleProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics := IDatePickerFlyoutStatics(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics.get_MonthVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_YearVisibleProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics := IDatePickerFlyoutStatics(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics.get_YearVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinYearProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics := IDatePickerFlyoutStatics(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics.get_MinYearProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxYearProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics := IDatePickerFlyoutStatics(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics.get_MaxYearProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DayFormatProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics2.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics2 := IDatePickerFlyoutStatics2(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics2.get_DayFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MonthFormatProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics2.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics2 := IDatePickerFlyoutStatics2(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics2.get_MonthFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_YearFormatProperty() {
        if (!DatePickerFlyout.HasProp("__IDatePickerFlyoutStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDatePickerFlyoutStatics2.IID)
            DatePickerFlyout.__IDatePickerFlyoutStatics2 := IDatePickerFlyoutStatics2(factoryPtr)
        }

        return DatePickerFlyout.__IDatePickerFlyoutStatics2.get_YearFormatProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the calendar system to use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.calendaridentifier
     * @type {HSTRING} 
     */
    CalendarIdentifier {
        get => this.get_CalendarIdentifier()
        set => this.put_CalendarIdentifier(value)
    }

    /**
     * Gets or sets the date currently set in the date picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.date
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * Gets or sets a value that indicates whether the day selector is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.dayvisible
     * @type {Boolean} 
     */
    DayVisible {
        get => this.get_DayVisible()
        set => this.put_DayVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the month selector is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.monthvisible
     * @type {Boolean} 
     */
    MonthVisible {
        get => this.get_MonthVisible()
        set => this.put_MonthVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the year selector is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.yearvisible
     * @type {Boolean} 
     */
    YearVisible {
        get => this.get_YearVisible()
        set => this.put_YearVisible(value)
    }

    /**
     * Gets or sets the minimum Gregorian year available for picking.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.minyear
     * @type {DateTime} 
     */
    MinYear {
        get => this.get_MinYear()
        set => this.put_MinYear(value)
    }

    /**
     * Gets or sets the maximum Gregorian year available for picking.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.maxyear
     * @type {DateTime} 
     */
    MaxYear {
        get => this.get_MaxYear()
        set => this.put_MaxYear(value)
    }

    /**
     * Gets or sets the display format for the day value.
     * @remarks
     * Change the format of the day value by setting the DayFormat property.
     * 
     * The string content of the day value is created by a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md). You inform the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) how to format the day value by providing a string that is either a *format template* or a *format pattern*. Common templates and patterns for day values are listed in the following table.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.dayformat
     * @type {HSTRING} 
     */
    DayFormat {
        get => this.get_DayFormat()
        set => this.put_DayFormat(value)
    }

    /**
     * Gets or sets the display format for the month value.
     * @remarks
     * Change the format of the month value by setting the MonthFormat property.
     * 
     * The string content of the month value is created by a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md). You inform the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) how to format the day value by providing a string that is either a *format template* or a *format pattern*. Common templates and patterns for day values are listed in the following table.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.monthformat
     * @type {HSTRING} 
     */
    MonthFormat {
        get => this.get_MonthFormat()
        set => this.put_MonthFormat(value)
    }

    /**
     * Gets or sets the display format for the year value.
     * @remarks
     * Change the format of the year value by setting the YearFormat property.
     * 
     * The string content of the year value is created by a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md). You inform the [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) how to format the year value by providing a string that is either a *format template* or a *format pattern*. Common templates and patterns for year values are listed in the following table.
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.yearformat
     * @type {HSTRING} 
     */
    YearFormat {
        get => this.get_YearFormat()
        set => this.put_YearFormat(value)
    }

    /**
     * Occurs when a date has been picked by the user.
     * @type {TypedEventHandler<DatePickerFlyout, DatePickedEventArgs>}
    */
    OnDatePicked {
        get {
            if(!this.HasProp("__OnDatePicked")){
                this.__OnDatePicked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4d9c196f-cdd3-54d8-98d9-4f29abbade76}"),
                    DatePickerFlyout,
                    DatePickedEventArgs
                )
                this.__OnDatePickedToken := this.add_DatePicked(this.__OnDatePicked.iface)
            }
            return this.__OnDatePicked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DatePickerFlyout](datepickerflyout.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickerFlyout")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDatePickedToken")) {
            this.remove_DatePicked(this.__OnDatePickedToken)
            this.__OnDatePicked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CalendarIdentifier() {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.get_CalendarIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CalendarIdentifier(value) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.put_CalendarIdentifier(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.get_Date()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_Date(value) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.put_Date(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DayVisible() {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.get_DayVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DayVisible(value) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.put_DayVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MonthVisible() {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.get_MonthVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MonthVisible(value) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.put_MonthVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_YearVisible() {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.get_YearVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_YearVisible(value) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.put_YearVisible(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MinYear() {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.get_MinYear()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MinYear(value) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.put_MinYear(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MaxYear() {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.get_MaxYear()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MaxYear(value) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.put_MaxYear(value)
    }

    /**
     * 
     * @param {TypedEventHandler<DatePickerFlyout, DatePickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DatePicked(handler) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.add_DatePicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DatePicked(token) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.remove_DatePicked(token)
    }

    /**
     * Begins an asynchronous operation to show the date picker placed in relation to the specified element.
     * @param {FrameworkElement} target The element to use as the flyout's placement target.
     * @returns {IAsyncOperation<IReference<DateTime>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerflyout.showatasync
     */
    ShowAtAsync(target) {
        if (!this.HasProp("__IDatePickerFlyout")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout := IDatePickerFlyout(outPtr)
        }

        return this.__IDatePickerFlyout.ShowAtAsync(target)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DayFormat() {
        if (!this.HasProp("__IDatePickerFlyout2")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout2 := IDatePickerFlyout2(outPtr)
        }

        return this.__IDatePickerFlyout2.get_DayFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DayFormat(value) {
        if (!this.HasProp("__IDatePickerFlyout2")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout2 := IDatePickerFlyout2(outPtr)
        }

        return this.__IDatePickerFlyout2.put_DayFormat(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MonthFormat() {
        if (!this.HasProp("__IDatePickerFlyout2")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout2 := IDatePickerFlyout2(outPtr)
        }

        return this.__IDatePickerFlyout2.get_MonthFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MonthFormat(value) {
        if (!this.HasProp("__IDatePickerFlyout2")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout2 := IDatePickerFlyout2(outPtr)
        }

        return this.__IDatePickerFlyout2.put_MonthFormat(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_YearFormat() {
        if (!this.HasProp("__IDatePickerFlyout2")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout2 := IDatePickerFlyout2(outPtr)
        }

        return this.__IDatePickerFlyout2.get_YearFormat()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_YearFormat(value) {
        if (!this.HasProp("__IDatePickerFlyout2")) {
            if ((queryResult := this.QueryInterface(IDatePickerFlyout2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerFlyout2 := IDatePickerFlyout2(outPtr)
        }

        return this.__IDatePickerFlyout2.put_YearFormat(value)
    }

;@endregion Instance Methods
}
