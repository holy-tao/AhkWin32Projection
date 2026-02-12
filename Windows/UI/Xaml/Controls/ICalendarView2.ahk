#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Brush.ahk
#Include ..\Thickness.ahk
#Include ..\CornerRadius.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarView2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarView2
     * @type {Guid}
     */
    static IID => Guid("{f55ab64a-5504-5d9e-9d20-2ffdb88fc56b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedDisabledBorderBrush", "put_SelectedDisabledBorderBrush", "get_TodaySelectedInnerBorderBrush", "put_TodaySelectedInnerBorderBrush", "get_BlackoutStrikethroughBrush", "put_BlackoutStrikethroughBrush", "get_BlackoutBackground", "put_BlackoutBackground", "get_CalendarItemHoverBackground", "put_CalendarItemHoverBackground", "get_CalendarItemPressedBackground", "put_CalendarItemPressedBackground", "get_CalendarItemDisabledBackground", "put_CalendarItemDisabledBackground", "get_TodayBackground", "put_TodayBackground", "get_TodayBlackoutBackground", "put_TodayBlackoutBackground", "get_TodayHoverBackground", "put_TodayHoverBackground", "get_TodayPressedBackground", "put_TodayPressedBackground", "get_TodayDisabledBackground", "put_TodayDisabledBackground", "get_TodayBlackoutForeground", "put_TodayBlackoutForeground", "get_SelectedHoverForeground", "put_SelectedHoverForeground", "get_SelectedPressedForeground", "put_SelectedPressedForeground", "get_SelectedDisabledForeground", "put_SelectedDisabledForeground", "get_OutOfScopeHoverForeground", "put_OutOfScopeHoverForeground", "get_OutOfScopePressedForeground", "put_OutOfScopePressedForeground", "get_DisabledForeground", "put_DisabledForeground", "get_DayItemMargin", "put_DayItemMargin", "get_MonthYearItemMargin", "put_MonthYearItemMargin", "get_FirstOfMonthLabelMargin", "put_FirstOfMonthLabelMargin", "get_FirstOfYearDecadeLabelMargin", "put_FirstOfYearDecadeLabelMargin", "get_CalendarItemCornerRadius", "put_CalendarItemCornerRadius"]

    /**
     * @type {Brush} 
     */
    SelectedDisabledBorderBrush {
        get => this.get_SelectedDisabledBorderBrush()
        set => this.put_SelectedDisabledBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    TodaySelectedInnerBorderBrush {
        get => this.get_TodaySelectedInnerBorderBrush()
        set => this.put_TodaySelectedInnerBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    BlackoutStrikethroughBrush {
        get => this.get_BlackoutStrikethroughBrush()
        set => this.put_BlackoutStrikethroughBrush(value)
    }

    /**
     * @type {Brush} 
     */
    BlackoutBackground {
        get => this.get_BlackoutBackground()
        set => this.put_BlackoutBackground(value)
    }

    /**
     * @type {Brush} 
     */
    CalendarItemHoverBackground {
        get => this.get_CalendarItemHoverBackground()
        set => this.put_CalendarItemHoverBackground(value)
    }

    /**
     * @type {Brush} 
     */
    CalendarItemPressedBackground {
        get => this.get_CalendarItemPressedBackground()
        set => this.put_CalendarItemPressedBackground(value)
    }

    /**
     * @type {Brush} 
     */
    CalendarItemDisabledBackground {
        get => this.get_CalendarItemDisabledBackground()
        set => this.put_CalendarItemDisabledBackground(value)
    }

    /**
     * @type {Brush} 
     */
    TodayBackground {
        get => this.get_TodayBackground()
        set => this.put_TodayBackground(value)
    }

    /**
     * @type {Brush} 
     */
    TodayBlackoutBackground {
        get => this.get_TodayBlackoutBackground()
        set => this.put_TodayBlackoutBackground(value)
    }

    /**
     * @type {Brush} 
     */
    TodayHoverBackground {
        get => this.get_TodayHoverBackground()
        set => this.put_TodayHoverBackground(value)
    }

    /**
     * @type {Brush} 
     */
    TodayPressedBackground {
        get => this.get_TodayPressedBackground()
        set => this.put_TodayPressedBackground(value)
    }

    /**
     * @type {Brush} 
     */
    TodayDisabledBackground {
        get => this.get_TodayDisabledBackground()
        set => this.put_TodayDisabledBackground(value)
    }

    /**
     * @type {Brush} 
     */
    TodayBlackoutForeground {
        get => this.get_TodayBlackoutForeground()
        set => this.put_TodayBlackoutForeground(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedHoverForeground {
        get => this.get_SelectedHoverForeground()
        set => this.put_SelectedHoverForeground(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedPressedForeground {
        get => this.get_SelectedPressedForeground()
        set => this.put_SelectedPressedForeground(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedDisabledForeground {
        get => this.get_SelectedDisabledForeground()
        set => this.put_SelectedDisabledForeground(value)
    }

    /**
     * @type {Brush} 
     */
    OutOfScopeHoverForeground {
        get => this.get_OutOfScopeHoverForeground()
        set => this.put_OutOfScopeHoverForeground(value)
    }

    /**
     * @type {Brush} 
     */
    OutOfScopePressedForeground {
        get => this.get_OutOfScopePressedForeground()
        set => this.put_OutOfScopePressedForeground(value)
    }

    /**
     * @type {Brush} 
     */
    DisabledForeground {
        get => this.get_DisabledForeground()
        set => this.put_DisabledForeground(value)
    }

    /**
     * @type {Thickness} 
     */
    DayItemMargin {
        get => this.get_DayItemMargin()
        set => this.put_DayItemMargin(value)
    }

    /**
     * @type {Thickness} 
     */
    MonthYearItemMargin {
        get => this.get_MonthYearItemMargin()
        set => this.put_MonthYearItemMargin(value)
    }

    /**
     * @type {Thickness} 
     */
    FirstOfMonthLabelMargin {
        get => this.get_FirstOfMonthLabelMargin()
        set => this.put_FirstOfMonthLabelMargin(value)
    }

    /**
     * @type {Thickness} 
     */
    FirstOfYearDecadeLabelMargin {
        get => this.get_FirstOfYearDecadeLabelMargin()
        set => this.put_FirstOfYearDecadeLabelMargin(value)
    }

    /**
     * @type {CornerRadius} 
     */
    CalendarItemCornerRadius {
        get => this.get_CalendarItemCornerRadius()
        set => this.put_CalendarItemCornerRadius(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedDisabledBorderBrush() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
    put_SelectedDisabledBorderBrush(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodaySelectedInnerBorderBrush() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_TodaySelectedInnerBorderBrush(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BlackoutStrikethroughBrush() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
    put_BlackoutStrikethroughBrush(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BlackoutBackground() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
    put_BlackoutBackground(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemHoverBackground() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
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
    put_CalendarItemHoverBackground(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemPressedBackground() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
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
    put_CalendarItemPressedBackground(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CalendarItemDisabledBackground() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
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
    put_CalendarItemDisabledBackground(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayBackground() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
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
    put_TodayBackground(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayBlackoutBackground() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
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
    put_TodayBlackoutBackground(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayHoverBackground() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
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
    put_TodayHoverBackground(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayPressedBackground() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
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
    put_TodayPressedBackground(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayDisabledBackground() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
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
    put_TodayDisabledBackground(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_TodayBlackoutForeground() {
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
    put_TodayBlackoutForeground(value) {
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
    get_SelectedHoverForeground() {
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
    put_SelectedHoverForeground(value) {
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
    get_SelectedPressedForeground() {
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
    put_SelectedPressedForeground(value) {
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
    get_SelectedDisabledForeground() {
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
    put_SelectedDisabledForeground(value) {
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
    get_OutOfScopeHoverForeground() {
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
    put_OutOfScopeHoverForeground(value) {
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
    get_OutOfScopePressedForeground() {
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
    put_OutOfScopePressedForeground(value) {
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
    get_DisabledForeground() {
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
    put_DisabledForeground(value) {
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_DayItemMargin() {
        value := Thickness()
        result := ComCall(44, this, "ptr", value, "int")
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
    put_DayItemMargin(value) {
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_MonthYearItemMargin() {
        value := Thickness()
        result := ComCall(46, this, "ptr", value, "int")
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
    put_MonthYearItemMargin(value) {
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FirstOfMonthLabelMargin() {
        value := Thickness()
        result := ComCall(48, this, "ptr", value, "int")
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
    put_FirstOfMonthLabelMargin(value) {
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_FirstOfYearDecadeLabelMargin() {
        value := Thickness()
        result := ComCall(50, this, "ptr", value, "int")
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
    put_FirstOfYearDecadeLabelMargin(value) {
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CalendarItemCornerRadius() {
        value := CornerRadius()
        result := ComCall(52, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CalendarItemCornerRadius(value) {
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
