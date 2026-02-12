#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IWebAccountProvider3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProvider3
     * @type {Guid}
     */
    static IID => Guid("{da1c518b-970d-4d49-825c-f2706f8ca7fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User"]

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
        result := ComCall(6, this, "ptr*", &user_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(user_)
    }
}
