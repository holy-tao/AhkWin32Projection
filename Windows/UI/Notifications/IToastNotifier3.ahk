#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotifier3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotifier3
     * @type {Guid}
     */
    static IID => Guid("{ae75a04a-3b0c-51ad-b7e8-b08ab6052549}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ScheduledToastNotificationShowing", "remove_ScheduledToastNotificationShowing"]

    /**
     * 
     * @param {TypedEventHandler<ToastNotifier, ScheduledToastNotificationShowingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScheduledToastNotificationShowing(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_ScheduledToastNotificationShowing(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
