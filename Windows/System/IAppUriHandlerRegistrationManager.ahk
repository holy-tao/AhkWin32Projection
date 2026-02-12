#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\User.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppUriHandlerRegistration.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppUriHandlerRegistrationManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppUriHandlerRegistrationManager
     * @type {Guid}
     */
    static IID => Guid("{e62c9a52-ac94-5750-ac1b-6cfb6f250263}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "TryGetRegistration"]

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
     * @param {HSTRING} name 
     * @returns {AppUriHandlerRegistration} 
     */
    TryGetRegistration(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppUriHandlerRegistration(result_)
    }
}
