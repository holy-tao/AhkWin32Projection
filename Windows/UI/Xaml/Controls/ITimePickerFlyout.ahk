#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITimePickerFlyout extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimePickerFlyout
     * @type {Guid}
     */
    static IID => Guid("{bb739d75-e836-439e-86d5-506d2d18e404}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClockIdentifier", "put_ClockIdentifier", "get_Time", "put_Time", "get_MinuteIncrement", "put_MinuteIncrement", "add_TimePicked", "remove_TimePicked", "ShowAtAsync"]

    /**
     * @type {HSTRING} 
     */
    ClockIdentifier {
        get => this.get_ClockIdentifier()
        set => this.put_ClockIdentifier(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
        set => this.put_Time(value)
    }

    /**
     * @type {Integer} 
     */
    MinuteIncrement {
        get => this.get_MinuteIncrement()
        set => this.put_MinuteIncrement(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClockIdentifier() {
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
    put_ClockIdentifier(value) {
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
     * @returns {TimeSpan} 
     */
    get_Time() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Time(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinuteIncrement() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_MinuteIncrement(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TimePickerFlyout, TimePickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TimePicked(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_TimePicked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {FrameworkElement} target 
     * @returns {IAsyncOperation<IReference<TimeSpan>>} 
     */
    ShowAtAsync(target) {
        result := ComCall(14, this, "ptr", target, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IReference.Call.Bind(IReference, (ptr) => IPropertyValue(ptr).GetTimeSpan()), operation)
    }
}
