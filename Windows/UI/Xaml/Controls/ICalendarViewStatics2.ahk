#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarViewStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarViewStatics2
     * @type {Guid}
     */
    static IID => Guid("{f29e5024-b8fb-50c8-8a38-d443abb37009}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedDisabledBorderBrushProperty", "get_TodaySelectedInnerBorderBrushProperty", "get_BlackoutStrikethroughBrushProperty", "get_BlackoutBackgroundProperty", "get_CalendarItemHoverBackgroundProperty", "get_CalendarItemPressedBackgroundProperty", "get_CalendarItemDisabledBackgroundProperty", "get_TodayBackgroundProperty", "get_TodayBlackoutBackgroundProperty", "get_TodayHoverBackgroundProperty", "get_TodayPressedBackgroundProperty", "get_TodayDisabledBackgroundProperty", "get_TodayBlackoutForegroundProperty", "get_SelectedHoverForegroundProperty", "get_SelectedPressedForegroundProperty", "get_SelectedDisabledForegroundProperty", "get_OutOfScopeHoverForegroundProperty", "get_OutOfScopePressedForegroundProperty", "get_DisabledForegroundProperty", "get_DayItemMarginProperty", "get_MonthYearItemMarginProperty", "get_FirstOfMonthLabelMarginProperty", "get_FirstOfYearDecadeLabelMarginProperty", "get_CalendarItemCornerRadiusProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectedDisabledBorderBrushProperty {
        get => this.get_SelectedDisabledBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodaySelectedInnerBorderBrushProperty {
        get => this.get_TodaySelectedInnerBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BlackoutStrikethroughBrushProperty {
        get => this.get_BlackoutStrikethroughBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BlackoutBackgroundProperty {
        get => this.get_BlackoutBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarItemHoverBackgroundProperty {
        get => this.get_CalendarItemHoverBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarItemPressedBackgroundProperty {
        get => this.get_CalendarItemPressedBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarItemDisabledBackgroundProperty {
        get => this.get_CalendarItemDisabledBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodayBackgroundProperty {
        get => this.get_TodayBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodayBlackoutBackgroundProperty {
        get => this.get_TodayBlackoutBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodayHoverBackgroundProperty {
        get => this.get_TodayHoverBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodayPressedBackgroundProperty {
        get => this.get_TodayPressedBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodayDisabledBackgroundProperty {
        get => this.get_TodayDisabledBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodayBlackoutForegroundProperty {
        get => this.get_TodayBlackoutForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedHoverForegroundProperty {
        get => this.get_SelectedHoverForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedPressedForegroundProperty {
        get => this.get_SelectedPressedForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedDisabledForegroundProperty {
        get => this.get_SelectedDisabledForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OutOfScopeHoverForegroundProperty {
        get => this.get_OutOfScopeHoverForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OutOfScopePressedForegroundProperty {
        get => this.get_OutOfScopePressedForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DisabledForegroundProperty {
        get => this.get_DisabledForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DayItemMarginProperty {
        get => this.get_DayItemMarginProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MonthYearItemMarginProperty {
        get => this.get_MonthYearItemMarginProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfMonthLabelMarginProperty {
        get => this.get_FirstOfMonthLabelMarginProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfYearDecadeLabelMarginProperty {
        get => this.get_FirstOfYearDecadeLabelMarginProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarItemCornerRadiusProperty {
        get => this.get_CalendarItemCornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedDisabledBorderBrushProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TodaySelectedInnerBorderBrushProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BlackoutStrikethroughBrushProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BlackoutBackgroundProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CalendarItemHoverBackgroundProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CalendarItemPressedBackgroundProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CalendarItemDisabledBackgroundProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TodayBackgroundProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TodayBlackoutBackgroundProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TodayHoverBackgroundProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TodayPressedBackgroundProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TodayDisabledBackgroundProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TodayBlackoutForegroundProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedHoverForegroundProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedPressedForegroundProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedDisabledForegroundProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OutOfScopeHoverForegroundProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OutOfScopePressedForegroundProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DisabledForegroundProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DayItemMarginProperty() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MonthYearItemMarginProperty() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfMonthLabelMarginProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfYearDecadeLabelMarginProperty() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CalendarItemCornerRadiusProperty() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
