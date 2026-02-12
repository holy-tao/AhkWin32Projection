#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDatePickerFlyoutStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatePickerFlyoutStatics2
     * @type {Guid}
     */
    static IID => Guid("{afd3e569-81e6-4b54-84a9-68079b73e34e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DayFormatProperty", "get_MonthFormatProperty", "get_YearFormatProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DayFormatProperty {
        get => this.get_DayFormatProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MonthFormatProperty {
        get => this.get_MonthFormatProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    YearFormatProperty {
        get => this.get_YearFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DayFormatProperty() {
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
    get_MonthFormatProperty() {
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
    get_YearFormatProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
