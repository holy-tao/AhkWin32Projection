#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.AppBroadcasting
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastingMonitor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastingMonitor
     * @type {Guid}
     */
    static IID => Guid("{00f95a68-8907-48a0-b8ef-24d208137542}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCurrentAppBroadcasting", "add_IsCurrentAppBroadcastingChanged", "remove_IsCurrentAppBroadcastingChanged"]

    /**
     * @type {Boolean} 
     */
    IsCurrentAppBroadcasting {
        get => this.get_IsCurrentAppBroadcasting()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCurrentAppBroadcasting() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastingMonitor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsCurrentAppBroadcastingChanged(handler) {
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
    remove_IsCurrentAppBroadcastingChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
