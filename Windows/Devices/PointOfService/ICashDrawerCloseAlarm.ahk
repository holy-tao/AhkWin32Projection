#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ICashDrawerCloseAlarm extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICashDrawerCloseAlarm
     * @type {Guid}
     */
    static IID => Guid("{6bf88cc7-6f63-430e-ab3b-95d75ffbe87f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AlarmTimeout", "get_AlarmTimeout", "put_BeepFrequency", "get_BeepFrequency", "put_BeepDuration", "get_BeepDuration", "put_BeepDelay", "get_BeepDelay", "add_AlarmTimeoutExpired", "remove_AlarmTimeoutExpired", "StartAsync"]

    /**
     * @type {TimeSpan} 
     */
    AlarmTimeout {
        get => this.get_AlarmTimeout()
        set => this.put_AlarmTimeout(value)
    }

    /**
     * @type {Integer} 
     */
    BeepFrequency {
        get => this.get_BeepFrequency()
        set => this.put_BeepFrequency(value)
    }

    /**
     * @type {TimeSpan} 
     */
    BeepDuration {
        get => this.get_BeepDuration()
        set => this.put_BeepDuration(value)
    }

    /**
     * @type {TimeSpan} 
     */
    BeepDelay {
        get => this.get_BeepDelay()
        set => this.put_BeepDelay(value)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_AlarmTimeout(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AlarmTimeout() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
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
    put_BeepFrequency(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BeepFrequency() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
    put_BeepDuration(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BeepDuration() {
        value := TimeSpan()
        result := ComCall(11, this, "ptr", value, "int")
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
    put_BeepDelay(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BeepDelay() {
        value := TimeSpan()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<CashDrawerCloseAlarm, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AlarmTimeoutExpired(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_AlarmTimeoutExpired(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    StartAsync() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }
}
