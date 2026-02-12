#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EmailIrmTemplate.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailIrmTemplateFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailIrmTemplateFactory
     * @type {Guid}
     */
    static IID => Guid("{3da31876-8738-4418-b9cb-471b936fe71e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} id 
     * @param {HSTRING} name 
     * @param {HSTRING} description 
     * @returns {EmailIrmTemplate} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(id, name, description) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(description is String) {
            pin := HSTRING.Create(description)
            description := pin.Value
        }
        description := description is Win32Handle ? NumGet(description, "ptr") : description

        result := ComCall(6, this, "ptr", id, "ptr", name, "ptr", description, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailIrmTemplate(result_)
    }
}
