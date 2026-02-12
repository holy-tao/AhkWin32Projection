#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DataTemplate.ahk
#Include ..\Style.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarDatePicker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarDatePicker
     * @type {Guid}
     */
    static IID => Guid("{63c9c16f-668c-4491-9444-d45d8bf4fa29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Date", "put_Date", "get_IsCalendarOpen", "put_IsCalendarOpen", "get_DateFormat", "put_DateFormat", "get_PlaceholderText", "put_PlaceholderText", "get_Header", "put_Header", "get_HeaderTemplate", "put_HeaderTemplate", "get_CalendarViewStyle", "put_CalendarViewStyle", "get_MinDate", "put_MinDate", "get_MaxDate", "put_MaxDate", "get_IsTodayHighlighted", "put_IsTodayHighlighted", "get_DisplayMode", "put_DisplayMode", "get_FirstDayOfWeek", "put_FirstDayOfWeek", "get_DayOfWeekFormat", "put_DayOfWeekFormat", "get_CalendarIdentifier", "put_CalendarIdentifier", "get_IsOutOfScopeEnabled", "put_IsOutOfScopeEnabled", "get_IsGroupLabelVisible", "put_IsGroupLabelVisible", "add_CalendarViewDayItemChanging", "remove_CalendarViewDayItemChanging", "add_DateChanged", "remove_DateChanged", "add_Opened", "remove_Opened", "add_Closed", "remove_Closed", "SetDisplayDate", "SetYearDecadeDisplayDimensions"]

    /**
     * @type {IReference<DateTime>} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCalendarOpen {
        get => this.get_IsCalendarOpen()
        set => this.put_IsCalendarOpen(value)
    }

    /**
     * @type {HSTRING} 
     */
    DateFormat {
        get => this.get_DateFormat()
        set => this.put_DateFormat(value)
    }

    /**
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * @type {Style} 
     */
    CalendarViewStyle {
        get => this.get_CalendarViewStyle()
        set => this.put_CalendarViewStyle(value)
    }

    /**
     * @type {DateTime} 
     */
    MinDate {
        get => this.get_MinDate()
        set => this.put_MinDate(value)
    }

    /**
     * @type {DateTime} 
     */
    MaxDate {
        get => this.get_MaxDate()
        set => this.put_MaxDate(value)
    }

    /**
     * @type {Boolean} 
     */
    IsTodayHighlighted {
        get => this.get_IsTodayHighlighted()
        set => this.put_IsTodayHighlighted(value)
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
     * @type {HSTRING} 
     */
    DayOfWeekFormat {
        get => this.get_DayOfWeekFormat()
        set => this.put_DayOfWeekFormat(value)
    }

    /**
     * @type {HSTRING} 
     */
    CalendarIdentifier {
        get => this.get_CalendarIdentifier()
        set => this.put_CalendarIdentifier(value)
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
    IsGroupLabelVisible {
        get => this.get_IsGroupLabelVisible()
        set => this.put_IsGroupLabelVisible(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Date() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Date(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCalendarOpen() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsCalendarOpen(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DateFormat() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_DateFormat(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_PlaceholderText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_CalendarViewStyle() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
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
    put_CalendarViewStyle(value) {
        result := ComCall(19, this, "ptr", value, "int")
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
    put_MinDate(value) {
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
    get_MaxDate() {
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
    put_MaxDate(value) {
        result := ComCall(23, this, "ptr", value, "int")
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
        result := ComCall(24, this, "int*", &value := 0, "int")
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
        result := ComCall(25, this, "int", value, "int")
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
        result := ComCall(26, this, "int*", &value := 0, "int")
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
        result := ComCall(27, this, "int", value, "int")
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
        result := ComCall(28, this, "int*", &value := 0, "int")
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
        result := ComCall(29, this, "int", value, "int")
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
        result := ComCall(30, this, "ptr", value, "int")
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

        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CalendarIdentifier() {
        value := HSTRING()
        result := ComCall(32, this, "ptr", value, "int")
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

        result := ComCall(33, this, "ptr", value, "int")
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
        result := ComCall(34, this, "int*", &value := 0, "int")
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
        result := ComCall(35, this, "int", value, "int")
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
        result := ComCall(36, this, "int*", &value := 0, "int")
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
        result := ComCall(37, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CalendarViewDayItemChangingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CalendarViewDayItemChanging(handler) {
        token := EventRegistrationToken()
        result := ComCall(38, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(39, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CalendarDatePicker, CalendarDatePickerDateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(40, this, "ptr", handler, "ptr", token, "int")
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
    remove_DateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(41, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        token := EventRegistrationToken()
        result := ComCall(42, this, "ptr", handler, "ptr", token, "int")
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
    remove_Opened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(43, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        token := EventRegistrationToken()
        result := ComCall(44, this, "ptr", handler, "ptr", token, "int")
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
    remove_Closed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(45, this, "ptr", token, "int")
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
        result := ComCall(46, this, "ptr", date, "int")
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
        result := ComCall(47, this, "int", columns_, "int", rows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
