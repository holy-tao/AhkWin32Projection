#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationPerson.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationPersonFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationPersonFactory
     * @type {Guid}
     */
    static IID => Guid("{dcf4886d-229d-4b58-a49b-f3d2f0f5c99f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationPerson", "CreateSyndicationPersonEx"]

    /**
     * 
     * @param {HSTRING} name 
     * @returns {SyndicationPerson} 
     */
    CreateSyndicationPerson(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &person := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationPerson(person)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} email_ 
     * @param {Uri} uri_ 
     * @returns {SyndicationPerson} 
     */
    CreateSyndicationPersonEx(name, email_, uri_) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(email_ is String) {
            pin := HSTRING.Create(email_)
            email_ := pin.Value
        }
        email_ := email_ is Win32Handle ? NumGet(email_, "ptr") : email_

        result := ComCall(7, this, "ptr", name, "ptr", email_, "ptr", uri_, "ptr*", &person := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationPerson(person)
    }
}
