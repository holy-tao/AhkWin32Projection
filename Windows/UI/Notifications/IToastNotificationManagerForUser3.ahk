#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationManagerForUser3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationManagerForUser3
     * @type {Guid}
     */
    static IID => Guid("{3efcb176-6cc1-56dc-973b-251f7aacb1c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NotificationMode", "add_NotificationModeChanged", "remove_NotificationModeChanged"]

    /**
     * @type {Integer} 
     */
    NotificationMode {
        get => this.get_NotificationMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NotificationMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<ToastNotificationManagerForUser, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NotificationModeChanged(handler) {
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
    remove_NotificationModeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
