#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\UserAuthenticationStatusChangeDeferral.ahk
#Include .\User.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IUserAuthenticationStatusChangingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserAuthenticationStatusChangingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{8c030f28-a711-4c1e-ab48-04179c15938f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral", "get_User", "get_NewStatus", "get_CurrentStatus"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {Integer} 
     */
    NewStatus {
        get => this.get_NewStatus()
    }

    /**
     * @type {Integer} 
     */
    CurrentStatus {
        get => this.get_CurrentStatus()
    }

    /**
     * 
     * @returns {UserAuthenticationStatusChangeDeferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserAuthenticationStatusChangeDeferral(result_)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewStatus() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentStatus() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
