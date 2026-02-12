#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDatePickerFlyoutStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatePickerFlyoutStatics
     * @type {Guid}
     */
    static IID => Guid("{cd570377-5845-4c12-8c10-592d9fcc7cd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CalendarIdentifierProperty", "get_DateProperty", "get_DayVisibleProperty", "get_MonthVisibleProperty", "get_YearVisibleProperty", "get_MinYearProperty", "get_MaxYearProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CalendarIdentifierProperty {
        get => this.get_CalendarIdentifierProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DateProperty {
        get => this.get_DateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DayVisibleProperty {
        get => this.get_DayVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MonthVisibleProperty {
        get => this.get_MonthVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    YearVisibleProperty {
        get => this.get_YearVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinYearProperty {
        get => this.get_MinYearProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxYearProperty {
        get => this.get_MaxYearProperty()
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
    get_DateProperty() {
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
    get_DayVisibleProperty() {
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
    get_MonthVisibleProperty() {
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
    get_YearVisibleProperty() {
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
    get_MinYearProperty() {
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
    get_MaxYearProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
