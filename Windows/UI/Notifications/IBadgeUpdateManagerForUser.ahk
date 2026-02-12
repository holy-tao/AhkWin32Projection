#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BadgeUpdater.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IBadgeUpdateManagerForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBadgeUpdateManagerForUser
     * @type {Guid}
     */
    static IID => Guid("{996b21bc-0386-44e5-ba8d-0c1077a62e92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBadgeUpdaterForApplication", "CreateBadgeUpdaterForApplicationWithId", "CreateBadgeUpdaterForSecondaryTile", "get_User"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {BadgeUpdater} 
     */
    CreateBadgeUpdaterForApplication() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BadgeUpdater(result_)
    }

    /**
     * 
     * @param {HSTRING} applicationId 
     * @returns {BadgeUpdater} 
     */
    CreateBadgeUpdaterForApplicationWithId(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(7, this, "ptr", applicationId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BadgeUpdater(result_)
    }

    /**
     * 
     * @param {HSTRING} tileId 
     * @returns {BadgeUpdater} 
     */
    CreateBadgeUpdaterForSecondaryTile(tileId) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId

        result := ComCall(8, this, "ptr", tileId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BadgeUpdater(result_)
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
