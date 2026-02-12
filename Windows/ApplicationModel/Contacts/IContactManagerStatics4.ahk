#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ContactManagerForUser.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactManagerStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManagerStatics4
     * @type {Guid}
     */
    static IID => Guid("{24982272-347b-46dc-8d95-51bd41e15aaf}")

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
     * @returns {ContactManagerForUser} 
     */
    GetForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactManagerForUser(result_)
    }
}
