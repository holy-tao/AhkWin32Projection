#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include Primitives\CalendarViewTemplateSettings.ahk
#Include ..\Media\Brush.ahk
#Include ..\Media\FontFamily.ahk
#Include ..\..\Text\FontWeight.ahk
#Include ..\Thickness.ahk
#Include ..\Style.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarView
     * @type {Guid}
     */
    static IID => Guid("{cd639203-dfb5-4312-ac07-c0391824607b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CalendarIdentifier", "put_CalendarIdentifier", "get_DayOfWeekFormat", "put_DayOfWeekFormat", "get_IsGroupLabelVisible", "put_IsGroupLabelVisible", "get_DisplayMode", "put_DisplayMode", "get_FirstDayOfWeek", "put_FirstDayOfWeek", "get_IsOutOfScopeEnabled", "put_IsOutOfScopeEnabled", "get_IsTodayHighlighted", "put_IsTodayHighlighted", "get_MaxDate", "put_MaxDate", "get_MinDate", "put_MinDate", "get_NumberOfWeeksInView", "put_NumberOfWeeksInView", "get_SelectedDates", "get_SelectionMode", "put_SelectionMode", "get_TemplateSettings", "get_FocusBorderBrush", "put_FocusBorderBrush", "get_SelectedHoverBorderBrush", "put_SelectedHoverBorderBrush", "get_SelectedPressedBorderBrush", "put_SelectedPressedBorderBrush", "get_SelectedBorderBrush", "put_SelectedBorderBrush", "get_HoverBorderBrush", "put_HoverBorderBrush", "get_PressedBorderBrush", "put_PressedBorderBrush", "get_CalendarItemBorderBrush", "put_CalendarItemBorderBrush", "get_OutOfScopeBackground", "put_OutOfScopeBackground", "get_CalendarItemBackground", "put_CalendarItemBackground", "get_PressedForeground", "put_PressedForeground", "get_TodayForeground", "put_TodayForeground", "get_BlackoutForeground", "put_BlackoutForeground", "get_SelectedForeground", "put_SelectedForeground", "get_OutOfScopeForeground", "put_OutOfScopeForeground", "get_CalendarItemForeground", "put_CalendarItemForeground", "get_DayItemFontFamily", "put_DayItemFontFamily", "get_DayItemFontSize", "put_DayItemFontSize", "get_DayItemFontStyle", "put_DayItemFontStyle", "get_DayItemFontWeight", "put_DayItemFontWeight", "get_TodayFontWeight", "put_TodayFontWeight", "get_FirstOfMonthLabelFontFamily", "put_FirstOfMonthLabelFontFamily", "get_FirstOfMonthLabelFontSize", "put_FirstOfMonthLabelFontSize", "get_FirstOfMonthLabelFontStyle", "put_FirstOfMonthLabelFontStyle", "get_FirstOfMonthLabelFontWeight", "put_FirstOfMonthLabelFontWeight", "get_MonthYearItemFontFamily", "put_MonthYearItemFontFamily", "get_MonthYearItemFontSize", "put_MonthYearItemFontSize", "get_MonthYearItemFontStyle", "put_MonthYearItemFontStyle", "get_MonthYearItemFontWeight", "put_MonthYearItemFontWeight", "get_FirstOfYearDecadeLabelFontFamily", "put_FirstOfYearDecadeLabelFontFamily", "get_FirstOfYearDecadeLabelFontSize", "put_FirstOfYearDecadeLabelFontSize", "get_FirstOfYearDecadeLabelFontStyle", "put_FirstOfYearDecadeLabelFontStyle", "get_FirstOfYearDecadeLabelFontWeight", "put_FirstOfYearDecadeLabelFontWeight", "get_HorizontalDayItemAlignment", "put_HorizontalDayItemAlignment", "get_VerticalDayItemAlignment", "put_VerticalDayItemAlignment", "get_HorizontalFirstOfMonthLabelAlignment", "put_HorizontalFirstOfMonthLabelAlignment", "get_VerticalFirstOfMonthLabelAlignment", "put_VerticalFirstOfMonthLabelAlignment", "get_CalendarItemBorderThickness", "put_CalendarItemBorderThickness", "get_CalendarViewDayItemStyle", "put_CalendarViewDayItemStyle", "add_CalendarViewDayItemChanging", "remove_CalendarViewDayItemChanging", "add_SelectedDatesChanged", "remove_SelectedDatesChanged", "SetDisplayDate", "SetYearDecadeDisplayDimensions"]

    /**
     * @type {HSTRING} 
     */
    CalendarIdentifier {
        get => this.get_CalendarIdentifier()
        set => this.put_CalendarIdentifier(value)
    }

    /**
     * @type {HSTRING} 
     */
    DayOfWeekFormat {
        get => this.get_DayOfWeekFormat()
        set => this.put_DayOfWeekFormat(value)
    }

    /**
     * @type {Boolean} 
     */
    IsGroupLabelVisible {
        get => this.get_IsGroupLabelVisible()
        set => this.put_IsGroupLabelVisible(value)
    }

    /**
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
        set => this.put_DisplayMode(value)
    }

    /**
     * @type {Integer} 
     */
    FirstDayOfWeek {
        get => this.get_FirstDayOfWeek()
        set => this.put_FirstDayOfWeek(value)
    }

    /**
     * @type {Boolean} 
     */
    IsOutOfScopeEnabled {
        get => this.get_IsOutOfScopeEnabled()
        set => this.put_IsOutOfScopeEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsTodayHighlighted {
        get => this.get_IsTodayHighlighted()
        set => this.put_IsTodayHighlighted(value)
    }

    /**
     * @type {DateTime} 
     */
    MaxDate {
        get => this.get_MaxDate()
        set => this.put_MaxDate(value)
    }

    /**
     * @type {DateTime} 
     */
    MinDate {
        get => this.get_MinDate()
        set => this.put_MinDate(value)
    }

    /**
     * @type {Integer} 
     */
    NumberOfWeeksInView {
        get => this.get_NumberOfWeeksInView()
        set => this.put_NumberOfWeeksInView(value)
    }

    /**
     * @type {IVector<DateTime>} 
     */
    SelectedDates {
        get => this.get_SelectedDates()
    }

    /**
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * @type {CalendarViewTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * @type {Brush} 
     */
    FocusBorderBrush {
        get => this.get_FocusBorderBrush()
        set => this.put_FocusBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedHoverBorderBrush {
        get => this.get_SelectedHoverBorderBrush()
        set => this.put_SelectedHoverBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedPressedBorderBrush {
        get => this.get_SelectedPressedBorderBrush()
        set => this.put_SelectedPressedBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedBorderBrush {
        get => this.get_SelectedBorderBrush()
        set => this.put_SelectedBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    HoverBorderBrush {
        get => this.get_HoverBorderBrush()
        set => this.put_HoverBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    PressedBorderBrush {
        get => this.get_PressedBorderBrush()
        set => this.put_PressedBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CalendarItemBorderBrush {
        get => this.get_CalendarItemBorderBrush()
        set => this.put_CalendarItemBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    OutOfScopeBackground {
        get => this.get_OutOfScopeBackground()
        set => this.put_OutOfScopeBackground(value)
    }

    /**
     * @type {Brush} 
     */
    CalendarItemBackground {
        get => this.get_CalendarItemBackground()
        set => this.put_CalendarItemBackground(value)
    }

    /**
     * @type {Brush} 
     */
    PressedForeground {
        get => this.get_PressedForeground()
        set => this.put_PressedForeground(value)
    }

    /**
     * @type {Brush} 
     */
    TodayForeground {
        get => this.get_TodayForeground()
        set => this.put_TodayForeground(value)
    }

    /**
     * @type {Brush} 
     */
    BlackoutForeground {
        get => this.get_BlackoutForeground()
        set => this.put_BlackoutForeground(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedForeground {
        get => this.get_SelectedForeground()
        set => this.put_SelectedForeground(value)
    }

    /**
     * @type {Brush} 
     */
    OutOfScopeForeground {
        get => this.get_OutOfScopeForeground()
        set => this.put_OutOfScopeForeground(value)
    }

    /**
     * @type {Brush} 
     */
    CalendarItemForeground {
        get => this.get_CalendarItemForeground()
        set => this.put_CalendarItemForeground(value)
    }

    /**
     * @type {FontFamily} 
     */
    DayItemFontFamily {
        get => this.get_DayItemFontFamily()
        set => this.put_DayItemFontFamily(value)
    }

    /**
     * @type {Float} 
     */
    DayItemFontSize {
        get => this.get_DayItemFontSize()
        set => this.put_DayItemFontSize(value)
    }

    /**
     * @type {Integer} 
     */
    DayItemFontStyle {
        get => this.get_DayItemFontStyle()
        set => this.put_DayItemFontStyle(value)
    }

    /**
     * @type {FontWeight} 
     */
    DayItemFontWeight {
        get => this.get_DayItemFontWeight()
        set => this.put_DayItemFontWeight(value)
    }

    /**
     * @type {FontWeight} 
     */
    TodayFontWeight {
        get => this.get_TodayFontWeight()
        set => this.put_TodayFontWeight(value)
    }

    /**
     * @type {FontFamily} 
     */
    FirstOfMonthLabelFontFamily {
        get => this.get_FirstOfMonthLabelFontFamily()
        set => this.put_FirstOfMonthLabelFontFamily(value)
    }

    /**
     * @type {Float} 
     */
    FirstOfMonthLabelFontSize {
        get => this.get_FirstOfMonthLabelFontSize()
        set => this.put_FirstOfMonthLabelFontSize(value)
    }

    /**
     * @type {Integer} 
     */
    FirstOfMonthLabelFontStyle {
        get => this.get_FirstOfMonthLabelFontStyle()
        set => this.put_FirstOfMonthLabelFontStyle(value)
    }

    /**
     * @type {FontWeight} 
     */
    FirstOfMonthLabelFontWeight {
        get => this.get_FirstOfMonthLabelFontWeight()
        set => this.put_FirstOfMonthLabelFontWeight(value)
    }

    /**
     * @type {FontFamily} 
     */
    MonthYearItemFontFamily {
        get => this.get_MonthYearItemFontFamily()
        set => this.put_MonthYearItemFontFamily(value)
    }

    /**
     * @type {Float} 
     */
    MonthYearItemFontSize {
        get => this.get_MonthYearItemFontSize()
        set => this.put_MonthYearItemFontSize(value)
    }

    /**
     * @type {Integer} 
     */
    MonthYearItemFontStyle {
        get => this.get_MonthYearItemFontStyle()
        set => this.put_MonthYearItemFontStyle(value)
    }

    /**
     * @type {FontWeight} 
     */
    MonthYearItemFontWeight {
        get => this.get_MonthYearItemFontWeight()
        set => this.put_MonthYearItemFontWeight(value)
    }

    /**
     * @type {FontFamily} 
     */
    FirstOfYearDecadeLabelFontFamily {
        get => this.get_FirstOfYearDecadeLabelFontFamily()
        set => this.put_FirstOfYearDecadeLabelFontFamily(value)
    }

    /**
     * @type {Float} 
     */
    FirstOfYearDecadeLabelFontSize {
        get => this.get_FirstOfYearDecadeLabelFontSize()
        set => this.put_FirstOfYearDecadeLabelFontSize(value)
    }

    /**
     * @type {Integer} 
     */
    FirstOfYearDecadeLabelFontStyle {
        get => this.get_FirstOfYearDecadeLabelFontStyle()
        set => this.put_FirstOfYearDecadeLabelFontStyle(value)
    }

    /**
     * @type {FontWeight} 
     */
    FirstOfYearDecadeLabelFontWeight {
        get => this.get_FirstOfYearDecadeLabelFontWeight()
        set => this.put_FirstOfYearDecadeLabelFontWeight(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalDayItemAlignment {
        get => this.get_HorizontalDayItemAlignment()
        set => this.put_HorizontalDayItemAlignment(value)
    }

    /**
     * @type {Integer} 
     */
    VerticalDayItemAlignment {
        get => this.get_VerticalDayItemAlignment()
        set => this.put_VerticalDayItemAlignment(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalFirstOfMonthLabelAlignment {
        get => this.get_HorizontalFirstOfMonthLabelAlignment()
        set => this.put_HorizontalFirstOfMonthLabelAlignment(value)
    }

    /**
     * @type {Integer} 
     */
    VerticalFirstOfMonthLabelAlignment {
        get => this.get_VerticalFirstOfMonthLabelAlignment()
        set => this.put_VerticalFirstOfMonthLabelAlignment(value)
    }

    /**
     * @type {Thickness} 
     */
    CalendarItemBorderThickness {
        get => this.get_CalendarItemBorderThickness()
        set => this.put_CalendarItemBorderThickness(value)
    }

    /**
     * @type {Style} 
     */
    CalendarViewDayItemStyle {
        get => this.get_CalendarViewDayItemStyle()
        set => this.put_CalendarViewDayItemStyle(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CalendarIdentifier() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CalendarIdentifier(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DayOfWeekFormat() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DayOfWeekFormat(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGroupLabelVisible() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGroupLabelVisible(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DisplayMode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstDayOfWeek() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FirstDayOfWeek(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOutOfScopeEnabled() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOutOfScopeEnabled(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTodayHighlighted() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTodayHighlighted(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MaxDate() {
        value := DateTime()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MaxDate(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MinDate() {
        value := DateTime()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_MinDate(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfWeeksInView() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NumberOfWeeksInView(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<DateTime>} 
     */
    get_SelectedDates() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CalendarViewTemplateSettings} 
     */
    get_TemplateSettings() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CalendarViewTemplateSettings(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusBorderBrush() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusBorderBrush(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedHoverBorderBrush() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedHoverBorderBrush(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPressedBorderBrush() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPressedBorderBrush(value) {
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedBorderBrush() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedBorderBrush(value) {
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_HoverBorderBrush() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_HoverBorderBrush(value) {
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PressedBorderBrush() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PressedBorderBrush(value) {
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemBorderBrush() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemBorderBrush(value) {
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_OutOfScopeBackground() {
        result := ComCall(44, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_OutOfScopeBackground(value) {
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemBackground() {
        result := ComCall(46, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemBackground(value) {
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PressedForeground() {
        result := ComCall(48, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PressedForeground(value) {
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayForeground() {
        result := ComCall(50, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_TodayForeground(value) {
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BlackoutForeground() {
        result := ComCall(52, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BlackoutForeground(value) {
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedForeground() {
        result := ComCall(54, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedForeground(value) {
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_OutOfScopeForeground() {
        result := ComCall(56, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_OutOfScopeForeground(value) {
        result := ComCall(57, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemForeground() {
        result := ComCall(58, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemForeground(value) {
        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_DayItemFontFamily() {
        result := ComCall(60, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FontFamily(value)
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_DayItemFontFamily(value) {
        result := ComCall(61, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DayItemFontSize() {
        result := ComCall(62, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DayItemFontSize(value) {
        result := ComCall(63, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DayItemFontStyle() {
        result := ComCall(64, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DayItemFontStyle(value) {
        result := ComCall(65, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_DayItemFontWeight() {
        value := FontWeight()
        result := ComCall(66, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_DayItemFontWeight(value) {
        result := ComCall(67, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_TodayFontWeight() {
        value := FontWeight()
        result := ComCall(68, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_TodayFontWeight(value) {
        result := ComCall(69, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FirstOfMonthLabelFontFamily() {
        result := ComCall(70, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FontFamily(value)
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelFontFamily(value) {
        result := ComCall(71, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FirstOfMonthLabelFontSize() {
        result := ComCall(72, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelFontSize(value) {
        result := ComCall(73, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstOfMonthLabelFontStyle() {
        result := ComCall(74, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelFontStyle(value) {
        result := ComCall(75, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FirstOfMonthLabelFontWeight() {
        value := FontWeight()
        result := ComCall(76, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FirstOfMonthLabelFontWeight(value) {
        result := ComCall(77, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_MonthYearItemFontFamily() {
        result := ComCall(78, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FontFamily(value)
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemFontFamily(value) {
        result := ComCall(79, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MonthYearItemFontSize() {
        result := ComCall(80, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemFontSize(value) {
        result := ComCall(81, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonthYearItemFontStyle() {
        result := ComCall(82, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemFontStyle(value) {
        result := ComCall(83, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_MonthYearItemFontWeight() {
        value := FontWeight()
        result := ComCall(84, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_MonthYearItemFontWeight(value) {
        result := ComCall(85, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FirstOfYearDecadeLabelFontFamily() {
        result := ComCall(86, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FontFamily(value)
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelFontFamily(value) {
        result := ComCall(87, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FirstOfYearDecadeLabelFontSize() {
        result := ComCall(88, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelFontSize(value) {
        result := ComCall(89, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstOfYearDecadeLabelFontStyle() {
        result := ComCall(90, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelFontStyle(value) {
        result := ComCall(91, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FirstOfYearDecadeLabelFontWeight() {
        value := FontWeight()
        result := ComCall(92, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FirstOfYearDecadeLabelFontWeight(value) {
        result := ComCall(93, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalDayItemAlignment() {
        result := ComCall(94, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalDayItemAlignment(value) {
        result := ComCall(95, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalDayItemAlignment() {
        result := ComCall(96, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalDayItemAlignment(value) {
        result := ComCall(97, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalFirstOfMonthLabelAlignment() {
        result := ComCall(98, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalFirstOfMonthLabelAlignment(value) {
        result := ComCall(99, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalFirstOfMonthLabelAlignment() {
        result := ComCall(100, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalFirstOfMonthLabelAlignment(value) {
        result := ComCall(101, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_CalendarItemBorderThickness() {
        value := Thickness()
        result := ComCall(102, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemBorderThickness(value) {
        result := ComCall(103, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_CalendarViewDayItemStyle() {
        result := ComCall(104, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_CalendarViewDayItemStyle(value) {
        result := ComCall(105, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CalendarView, CalendarViewDayItemChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CalendarViewDayItemChanging(handler) {
        token := EventRegistrationToken()
        result := ComCall(106, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CalendarViewDayItemChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(107, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CalendarView, CalendarViewSelectedDatesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectedDatesChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(108, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectedDatesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(109, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DateTime} date 
     * @returns {HRESULT} 
     */
    SetDisplayDate(date) {
        result := ComCall(110, this, "ptr", date, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} columns_ 
     * @param {Integer} rows 
     * @returns {HRESULT} 
     */
    SetYearDecadeDisplayDimensions(columns_, rows) {
        result := ComCall(111, this, "int", columns_, "int", rows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
