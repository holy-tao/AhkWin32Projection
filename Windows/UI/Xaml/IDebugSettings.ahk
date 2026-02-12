#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDebugSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugSettings
     * @type {Guid}
     */
    static IID => Guid("{3d451f98-c6a7-4d17-8398-d83a067183d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnableFrameRateCounter", "put_EnableFrameRateCounter", "get_IsBindingTracingEnabled", "put_IsBindingTracingEnabled", "get_IsOverdrawHeatMapEnabled", "put_IsOverdrawHeatMapEnabled", "add_BindingFailed", "remove_BindingFailed"]

    /**
     * @type {Boolean} 
     */
    EnableFrameRateCounter {
        get => this.get_EnableFrameRateCounter()
        set => this.put_EnableFrameRateCounter(value)
    }

    /**
     * @type {Boolean} 
     */
    IsBindingTracingEnabled {
        get => this.get_IsBindingTracingEnabled()
        set => this.put_IsBindingTracingEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsOverdrawHeatMapEnabled {
        get => this.get_IsOverdrawHeatMapEnabled()
        set => this.put_IsOverdrawHeatMapEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableFrameRateCounter() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_EnableFrameRateCounter(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBindingTracingEnabled() {
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
    put_IsBindingTracingEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverdrawHeatMapEnabled() {
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
    put_IsOverdrawHeatMapEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BindingFailedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BindingFailed(handler) {
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
    remove_BindingFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
