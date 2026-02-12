#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UserDataProtectionManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class IUserDataProtectionManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataProtectionManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{977780e8-6dce-4fae-af85-782ac2cf4572}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetDefault", "TryGetForUser"]

    /**
     * 
     * @returns {UserDataProtectionManager} 
     */
    TryGetDefault() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserDataProtectionManager(result_)
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {UserDataProtectionManager} 
     */
    TryGetForUser(user_) {
        result := ComCall(7, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserDataProtectionManager(result_)
    }
}
