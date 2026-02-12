#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UserActivity.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivitySessionHistoryItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivitySessionHistoryItem
     * @type {Guid}
     */
    static IID => Guid("{e8d59bd3-3e5d-49fd-98d7-6da97521e255}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserActivity", "get_StartTime", "get_EndTime"]

    /**
     * @type {UserActivity} 
     */
    UserActivity {
        get => this.get_UserActivity()
    }

    /**
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    EndTime {
        get => this.get_EndTime()
    }

    /**
     * 
     * @returns {UserActivity} 
     */
    get_UserActivity() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivity(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_EndTime() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }
}
