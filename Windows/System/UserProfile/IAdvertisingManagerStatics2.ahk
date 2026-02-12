#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AdvertisingManagerForUser.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class IAdvertisingManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvertisingManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{dd0947af-1a6d-46b0-95bc-f3f9d6beb9fb}")

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
     * @returns {AdvertisingManagerForUser} 
     */
    GetForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdvertisingManagerForUser(value)
    }
}
