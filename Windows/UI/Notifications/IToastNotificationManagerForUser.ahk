#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ToastNotifier.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ToastNotificationHistory.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationManagerForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationManagerForUser
     * @type {Guid}
     */
    static IID => Guid("{79ab57f6-43fe-487b-8a7f-99567200ae94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateToastNotifier", "CreateToastNotifierWithId", "get_History", "get_User"]

    /**
     * @type {ToastNotificationHistory} 
     */
    History {
        get => this.get_History()
    }

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {ToastNotifier} 
     */
    CreateToastNotifier() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotifier(result_)
    }

    /**
     * 
     * @param {HSTRING} applicationId 
     * @returns {ToastNotifier} 
     */
    CreateToastNotifierWithId(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(7, this, "ptr", applicationId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotifier(result_)
    }

    /**
     * 
     * @returns {ToastNotificationHistory} 
     */
    get_History() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotificationHistory(value)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }
}
