#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Notification.ahk
#Include ..\..\ApplicationModel\AppInfo.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods that set notification information and then display that notification to the user in a balloon that appears in conjunction with the notification area of the taskbar. (IUserNotification)
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided in Windows as CLSID_UserNotification.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-iusernotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IUserNotification extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserNotification
     * @type {Guid}
     */
    static IID => Guid("{adf7e52f-4e53-42d5-9c33-eb5ea515b23e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Notification", "get_AppInfo", "get_Id", "get_CreationTime"]

    /**
     * @type {Notification} 
     */
    Notification {
        get => this.get_Notification()
    }

    /**
     * @type {AppInfo} 
     */
    AppInfo {
        get => this.get_AppInfo()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {DateTime} 
     */
    CreationTime {
        get => this.get_CreationTime()
    }

    /**
     * 
     * @returns {Notification} 
     */
    get_Notification() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Notification(value)
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_AppInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInfo(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_CreationTime() {
        value := DateTime()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
