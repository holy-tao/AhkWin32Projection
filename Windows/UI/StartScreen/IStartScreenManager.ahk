#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class IStartScreenManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStartScreenManager
     * @type {Guid}
     */
    static IID => Guid("{4a1dcbcb-26e9-4eb4-8933-859eb6ecdb29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "SupportsAppListEntry", "ContainsAppListEntryAsync", "RequestAddAppListEntryAsync"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @param {AppListEntry} appListEntry_ 
     * @returns {Boolean} 
     */
    SupportsAppListEntry(appListEntry_) {
        result := ComCall(7, this, "ptr", appListEntry_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {AppListEntry} appListEntry_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ContainsAppListEntryAsync(appListEntry_) {
        result := ComCall(8, this, "ptr", appListEntry_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {AppListEntry} appListEntry_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestAddAppListEntryAsync(appListEntry_) {
        result := ComCall(9, this, "ptr", appListEntry_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
