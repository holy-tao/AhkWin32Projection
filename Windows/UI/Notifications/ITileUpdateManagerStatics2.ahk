#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TileUpdateManagerForUser.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ITileUpdateManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileUpdateManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{731c1ddc-8e14-4b7c-a34b-9d22de76c84d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForUser"]

    /**
     * 
     * @param {User} user_ 
     * @returns {TileUpdateManagerForUser} 
     */
    GetForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileUpdateManagerForUser(result_)
    }
}
