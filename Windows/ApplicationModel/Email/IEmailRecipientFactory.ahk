#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EmailRecipient.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailRecipientFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailRecipientFactory
     * @type {Guid}
     */
    static IID => Guid("{5500b84d-c79a-4ef8-b909-722e18e3935d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithName"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} address_ 
     * @returns {EmailRecipient} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(address_) {
        if(address_ is String) {
            pin := HSTRING.Create(address_)
            address_ := pin.Value
        }
        address_ := address_ is Win32Handle ? NumGet(address_, "ptr") : address_

        result := ComCall(6, this, "ptr", address_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailRecipient(result_)
    }

    /**
     * 
     * @param {HSTRING} address_ 
     * @param {HSTRING} name 
     * @returns {EmailRecipient} 
     */
    CreateWithName(address_, name) {
        if(address_ is String) {
            pin := HSTRING.Create(address_)
            address_ := pin.Value
        }
        address_ := address_ is Win32Handle ? NumGet(address_, "ptr") : address_
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", address_, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailRecipient(result_)
    }
}
