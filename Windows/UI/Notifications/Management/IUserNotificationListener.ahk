#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\UserNotification.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications.Management
 * @version WindowsRuntime 1.4
 */
class IUserNotificationListener extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserNotificationListener
     * @type {Guid}
     */
    static IID => Guid("{62553e41-8a06-4cef-8215-6033a5be4b03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessAsync", "GetAccessStatus", "add_NotificationChanged", "remove_NotificationChanged", "GetNotificationsAsync", "GetNotification", "ClearNotifications", "RemoveNotification"]

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAccessStatus() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TypedEventHandler<UserNotificationListener, UserNotificationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NotificationChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_NotificationChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} kinds 
     * @returns {IAsyncOperation<IVectorView<UserNotification>>} 
     */
    GetNotificationsAsync(kinds) {
        result := ComCall(10, this, "uint", kinds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, UserNotification), operation)
    }

    /**
     * Requests and receives a notification for a resource manager (RM). This function is used by the RM register to receive notifications when a transaction changes state.
     * @remarks
     * All resource managers must register to receive <b>TRANSACTION_NOTIFY_PREPREPARE</b>, 
     *      <b>TRANSACTION_NOTIFY_PREPARE</b>, and <b>TRANSACTION_NOTIFY_COMMIT</b> 
     *      notifications, even if they subsequently call 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-readonlyenlistment">ReadOnlyEnlistment</a> to mark an enlistment as 
     *      read-only. Resource managers can support <b>TRANSACTION_NOTIFY_SINGLE_PHASE_COMMIT</b>, but 
     *      they must also support the multi-phase pre-prepare, prepare, and commit notifications. For the list of all 
     *      notifications that resource managers can receive, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/ktmtypes/ns-ktmtypes-transaction_notification">TRANSACTION_NOTIFICATION</a>.
     * @param {Integer} notificationId 
     * @returns {UserNotification} 
     * @see https://learn.microsoft.com/windows/win32/api//content/ktmw32/nf-ktmw32-getnotificationresourcemanager
     */
    GetNotification(notificationId) {
        result := ComCall(11, this, "uint", notificationId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserNotification(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearNotifications() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} notificationId 
     * @returns {HRESULT} 
     */
    RemoveNotification(notificationId) {
        result := ComCall(13, this, "uint", notificationId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
