#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarDatePickerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarDatePickerStatics
     * @type {Guid}
     */
    static IID => Guid("{39a3d291-afab-4b94-8395-ba7b874e3c8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DateProperty", "get_IsCalendarOpenProperty", "get_DateFormatProperty", "get_PlaceholderTextProperty", "get_HeaderProperty", "get_HeaderTemplateProperty", "get_CalendarViewStyleProperty", "get_MinDateProperty", "get_MaxDateProperty", "get_IsTodayHighlightedProperty", "get_DisplayModeProperty", "get_FirstDayOfWeekProperty", "get_DayOfWeekFormatProperty", "get_CalendarIdentifierProperty", "get_IsOutOfScopeEnabledProperty", "get_IsGroupLabelVisibleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DateProperty {
        get => this.get_DateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsCalendarOpenProperty {
        get => this.get_IsCalendarOpenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DateFormatProperty {
        get => this.get_DateFormatProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlaceholderTextProperty {
        get => this.get_PlaceholderTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderProperty {
        get => this.get_HeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderTemplateProperty {
        get => this.get_HeaderTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarViewStyleProperty {
        get => this.get_CalendarViewStyleProperty()
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
    MaxDateProperty {
        get => this.get_MaxDateProperty()
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
    DayOfWeekFormatProperty {
        get => this.get_DayOfWeekFormatProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CalendarIdentifierProperty {
        get => this.get_CalendarIdentifierProperty()
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
    IsGroupLabelVisibleProperty {
        get => this.get_IsGroupLabelVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DateProperty() {
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
    get_IsCalendarOpenProperty() {
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
    get_DateFormatProperty() {
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
    get_PlaceholderTextProperty() {
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
    get_HeaderProperty() {
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
    get_HeaderTemplateProperty() {
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
    get_CalendarViewStyleProperty() {
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
    get_MinDateProperty() {
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
    get_MaxDateProperty() {
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
    get_IsTodayHighlightedProperty() {
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
    get_DisplayModeProperty() {
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
    get_FirstDayOfWeekProperty() {
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
    get_DayOfWeekFormatProperty() {
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
    get_CalendarIdentifierProperty() {
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
    get_IsOutOfScopeEnabledProperty() {
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
    get_IsGroupLabelVisibleProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
