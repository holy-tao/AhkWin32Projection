#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarViewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarViewStatics
     * @type {Guid}
     */
    static IID => Guid("{7260f1c4-2f5d-41bd-99bb-4571b20b79a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CalendarIdentifierProperty", "get_DayOfWeekFormatProperty", "get_IsGroupLabelVisibleProperty", "get_DisplayModeProperty", "get_FirstDayOfWeekProperty", "get_IsOutOfScopeEnabledProperty", "get_IsTodayHighlightedProperty", "get_MaxDateProperty", "get_MinDateProperty", "get_NumberOfWeeksInViewProperty", "get_SelectedDatesProperty", "get_SelectionModeProperty", "get_TemplateSettingsProperty", "get_FocusBorderBrushProperty", "get_SelectedHoverBorderBrushProperty", "get_SelectedPressedBorderBrushProperty", "get_SelectedBorderBrushProperty", "get_HoverBorderBrushProperty", "get_PressedBorderBrushProperty", "get_CalendarItemBorderBrushProperty", "get_OutOfScopeBackgroundProperty", "get_CalendarItemBackgroundProperty", "get_PressedForegroundProperty", "get_TodayForegroundProperty", "get_BlackoutForegroundProperty", "get_SelectedForegroundProperty", "get_OutOfScopeForegroundProperty", "get_CalendarItemForegroundProperty", "get_DayItemFontFamilyProperty", "get_DayItemFontSizeProperty", "get_DayItemFontStyleProperty", "get_DayItemFontWeightProperty", "get_TodayFontWeightProperty", "get_FirstOfMonthLabelFontFamilyProperty", "get_FirstOfMonthLabelFontSizeProperty", "get_FirstOfMonthLabelFontStyleProperty", "get_FirstOfMonthLabelFontWeightProperty", "get_MonthYearItemFontFamilyProperty", "get_MonthYearItemFontSizeProperty", "get_MonthYearItemFontStyleProperty", "get_MonthYearItemFontWeightProperty", "get_FirstOfYearDecadeLabelFontFamilyProperty", "get_FirstOfYearDecadeLabelFontSizeProperty", "get_FirstOfYearDecadeLabelFontStyleProperty", "get_FirstOfYearDecadeLabelFontWeightProperty", "get_HorizontalDayItemAlignmentProperty", "get_VerticalDayItemAlignmentProperty", "get_HorizontalFirstOfMonthLabelAlignmentProperty", "get_VerticalFirstOfMonthLabelAlignmentProperty", "get_CalendarItemBorderThicknessProperty", "get_CalendarViewDayItemStyleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CalendarIdentifierProperty {
        get => this.get_CalendarIdentifierProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DayOfWeekFormatProperty {
        get => this.get_DayOfWeekFormatProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsGroupLabelVisibleProperty {
        get => this.get_IsGroupLabelVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DisplayModeProperty {
        get => this.get_DisplayModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstDayOfWeekProperty {
        get => this.get_FirstDayOfWeekProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsOutOfScopeEnabledProperty {
        get => this.get_IsOutOfScopeEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsTodayHighlightedProperty {
        get => this.get_IsTodayHighlightedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxDateProperty {
        get => this.get_MaxDateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinDateProperty {
        get => this.get_MinDateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NumberOfWeeksInViewProperty {
        get => this.get_NumberOfWeeksInViewProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedDatesProperty {
        get => this.get_SelectedDatesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionModeProperty {
        get => this.get_SelectionModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TemplateSettingsProperty {
        get => this.get_TemplateSettingsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FocusBorderBrushProperty {
        get => this.get_FocusBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedHoverBorderBrushProperty {
        get => this.get_SelectedHoverBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedPressedBorderBrushProperty {
        get => this.get_SelectedPressedBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedBorderBrushProperty {
        get => this.get_SelectedBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HoverBorderBrushProperty {
        get => this.get_HoverBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PressedBorderBrushProperty {
        get => this.get_PressedBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarItemBorderBrushProperty {
        get => this.get_CalendarItemBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OutOfScopeBackgroundProperty {
        get => this.get_OutOfScopeBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarItemBackgroundProperty {
        get => this.get_CalendarItemBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PressedForegroundProperty {
        get => this.get_PressedForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodayForegroundProperty {
        get => this.get_TodayForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BlackoutForegroundProperty {
        get => this.get_BlackoutForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedForegroundProperty {
        get => this.get_SelectedForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OutOfScopeForegroundProperty {
        get => this.get_OutOfScopeForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarItemForegroundProperty {
        get => this.get_CalendarItemForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DayItemFontFamilyProperty {
        get => this.get_DayItemFontFamilyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DayItemFontSizeProperty {
        get => this.get_DayItemFontSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DayItemFontStyleProperty {
        get => this.get_DayItemFontStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DayItemFontWeightProperty {
        get => this.get_DayItemFontWeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TodayFontWeightProperty {
        get => this.get_TodayFontWeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfMonthLabelFontFamilyProperty {
        get => this.get_FirstOfMonthLabelFontFamilyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfMonthLabelFontSizeProperty {
        get => this.get_FirstOfMonthLabelFontSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfMonthLabelFontStyleProperty {
        get => this.get_FirstOfMonthLabelFontStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfMonthLabelFontWeightProperty {
        get => this.get_FirstOfMonthLabelFontWeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MonthYearItemFontFamilyProperty {
        get => this.get_MonthYearItemFontFamilyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MonthYearItemFontSizeProperty {
        get => this.get_MonthYearItemFontSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MonthYearItemFontStyleProperty {
        get => this.get_MonthYearItemFontStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MonthYearItemFontWeightProperty {
        get => this.get_MonthYearItemFontWeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfYearDecadeLabelFontFamilyProperty {
        get => this.get_FirstOfYearDecadeLabelFontFamilyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfYearDecadeLabelFontSizeProperty {
        get => this.get_FirstOfYearDecadeLabelFontSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfYearDecadeLabelFontStyleProperty {
        get => this.get_FirstOfYearDecadeLabelFontStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FirstOfYearDecadeLabelFontWeightProperty {
        get => this.get_FirstOfYearDecadeLabelFontWeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalDayItemAlignmentProperty {
        get => this.get_HorizontalDayItemAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalDayItemAlignmentProperty {
        get => this.get_VerticalDayItemAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalFirstOfMonthLabelAlignmentProperty {
        get => this.get_HorizontalFirstOfMonthLabelAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalFirstOfMonthLabelAlignmentProperty {
        get => this.get_VerticalFirstOfMonthLabelAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarItemBorderThicknessProperty {
        get => this.get_CalendarItemBorderThicknessProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarViewDayItemStyleProperty {
        get => this.get_CalendarViewDayItemStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CalendarIdentifierProperty() {
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
    get_DayOfWeekFormatProperty() {
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
    get_IsGroupLabelVisibleProperty() {
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
    get_DisplayModeProperty() {
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
    get_FirstDayOfWeekProperty() {
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
    get_IsOutOfScopeEnabledProperty() {
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
    get_IsTodayHighlightedProperty() {
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
    get_MaxDateProperty() {
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
    get_MinDateProperty() {
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
    get_NumberOfWeeksInViewProperty() {
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
    get_SelectedDatesProperty() {
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
    get_SelectionModeProperty() {
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
    get_TemplateSettingsProperty() {
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
    get_FocusBorderBrushProperty() {
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
    get_SelectedHoverBorderBrushProperty() {
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
    get_SelectedPressedBorderBrushProperty() {
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
    get_SelectedBorderBrushProperty() {
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
    get_HoverBorderBrushProperty() {
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
    get_PressedBorderBrushProperty() {
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
    get_CalendarItemBorderBrushProperty() {
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
    get_OutOfScopeBackgroundProperty() {
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
    get_CalendarItemBackgroundProperty() {
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
    get_PressedForegroundProperty() {
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
    get_TodayForegroundProperty() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BlackoutForegroundProperty() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedForegroundProperty() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OutOfScopeForegroundProperty() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CalendarItemForegroundProperty() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DayItemFontFamilyProperty() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DayItemFontSizeProperty() {
        result := ComCall(35, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DayItemFontStyleProperty() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DayItemFontWeightProperty() {
        result := ComCall(37, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TodayFontWeightProperty() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfMonthLabelFontFamilyProperty() {
        result := ComCall(39, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfMonthLabelFontSizeProperty() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfMonthLabelFontStyleProperty() {
        result := ComCall(41, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfMonthLabelFontWeightProperty() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MonthYearItemFontFamilyProperty() {
        result := ComCall(43, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MonthYearItemFontSizeProperty() {
        result := ComCall(44, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MonthYearItemFontStyleProperty() {
        result := ComCall(45, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MonthYearItemFontWeightProperty() {
        result := ComCall(46, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfYearDecadeLabelFontFamilyProperty() {
        result := ComCall(47, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfYearDecadeLabelFontSizeProperty() {
        result := ComCall(48, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfYearDecadeLabelFontStyleProperty() {
        result := ComCall(49, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FirstOfYearDecadeLabelFontWeightProperty() {
        result := ComCall(50, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalDayItemAlignmentProperty() {
        result := ComCall(51, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalDayItemAlignmentProperty() {
        result := ComCall(52, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalFirstOfMonthLabelAlignmentProperty() {
        result := ComCall(53, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalFirstOfMonthLabelAlignmentProperty() {
        result := ComCall(54, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CalendarItemBorderThicknessProperty() {
        result := ComCall(55, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CalendarViewDayItemStyleProperty() {
        result := ComCall(56, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
