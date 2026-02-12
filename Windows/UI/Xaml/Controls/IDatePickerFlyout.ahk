#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDatePickerFlyout extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatePickerFlyout
     * @type {Guid}
     */
    static IID => Guid("{fbf33b1a-a3a4-4df8-9228-23a5ac27df4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CalendarIdentifier", "put_CalendarIdentifier", "get_Date", "put_Date", "get_DayVisible", "put_DayVisible", "get_MonthVisible", "put_MonthVisible", "get_YearVisible", "put_YearVisible", "get_MinYear", "put_MinYear", "get_MaxYear", "put_MaxYear", "add_DatePicked", "remove_DatePicked", "ShowAtAsync"]

    /**
     * @type {HSTRING} 
     */
    CalendarIdentifier {
        get => this.get_CalendarIdentifier()
        set => this.put_CalendarIdentifier(value)
    }

    /**
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * @type {Boolean} 
     */
    DayVisible {
        get => this.get_DayVisible()
        set => this.put_DayVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    MonthVisible {
        get => this.get_MonthVisible()
        set => this.put_MonthVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    YearVisible {
        get => this.get_YearVisible()
        set => this.put_YearVisible(value)
    }

    /**
     * @type {DateTime} 
     */
    MinYear {
        get => this.get_MinYear()
        set => this.put_MinYear(value)
    }

    /**
     * @type {DateTime} 
     */
    MaxYear {
        get => this.get_MaxYear()
        set => this.put_MaxYear(value)
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
     * @returns {DateTime} 
     */
    get_Date() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_Date(value) {
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
    get_DayVisible() {
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
    put_DayVisible(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MonthVisible() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_MonthVisible(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_YearVisible() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_YearVisible(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MinYear() {
        value := DateTime()
        result := ComCall(16, this, "ptr", value, "int")
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
    put_MinYear(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MaxYear() {
        value := DateTime()
        result := ComCall(18, this, "ptr", value, "int")
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
    put_MaxYear(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DatePickerFlyout, DatePickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DatePicked(handler) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", token, "int")
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
    remove_DatePicked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {FrameworkElement} target 
     * @returns {IAsyncOperation<IReference<DateTime>>} 
     */
    ShowAtAsync(target) {
        result := ComCall(22, this, "ptr", target, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IReference.Call.Bind(IReference, (ptr) => IPropertyValue(ptr).GetDateTime()), operation)
    }
}
