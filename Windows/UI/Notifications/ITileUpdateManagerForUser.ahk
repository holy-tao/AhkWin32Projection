#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TileUpdater.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ITileUpdateManagerForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileUpdateManagerForUser
     * @type {Guid}
     */
    static IID => Guid("{55141348-2ee2-4e2d-9cc1-216a20decc9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTileUpdaterForApplication", "CreateTileUpdaterForApplicationWithId", "CreateTileUpdaterForSecondaryTile", "get_User"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {TileUpdater} 
     */
    CreateTileUpdaterForApplication() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileUpdater(result_)
    }

    /**
     * 
     * @param {HSTRING} applicationId 
     * @returns {TileUpdater} 
     */
    CreateTileUpdaterForApplicationWithId(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(7, this, "ptr", applicationId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileUpdater(result_)
    }

    /**
     * 
     * @param {HSTRING} tileId 
     * @returns {TileUpdater} 
     */
    CreateTileUpdaterForSecondaryTile(tileId) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId

        result := ComCall(8, this, "ptr", tileId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileUpdater(result_)
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
