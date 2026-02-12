#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PowerGridForecast.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class IPowerGridForecastStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPowerGridForecastStatics
     * @type {Guid}
     */
    static IID => Guid("{5b78c806-2e4e-5bcc-bb34-cb81c60f9e12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForecast", "add_ForecastUpdated", "remove_ForecastUpdated"]

    /**
     * 
     * @returns {PowerGridForecast} 
     */
    GetForecast() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PowerGridForecast(result_)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ForecastUpdated(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
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
    remove_ForecastUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
