#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\System\User.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class IHttpBaseProtocolFilter5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpBaseProtocolFilter5
     * @type {Guid}
     */
    static IID => Guid("{416e4993-31e3-4816-bf09-e018ee8dc1f5}")

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
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }
}
