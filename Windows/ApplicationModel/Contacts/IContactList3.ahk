#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ContactListLimitedWriteOperations.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContactChangeTracker.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactList3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactList3
     * @type {Guid}
     */
    static IID => Guid("{1578ee57-26fc-41e8-a850-5aa32514aca9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LimitedWriteOperations", "GetChangeTracker"]

    /**
     * @type {ContactListLimitedWriteOperations} 
     */
    LimitedWriteOperations {
        get => this.get_LimitedWriteOperations()
    }

    /**
     * 
     * @returns {ContactListLimitedWriteOperations} 
     */
    get_LimitedWriteOperations() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactListLimitedWriteOperations(value)
    }

    /**
     * 
     * @param {HSTRING} identity 
     * @returns {ContactChangeTracker} 
     */
    GetChangeTracker(identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(7, this, "ptr", identity, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactChangeTracker(result_)
    }
}
