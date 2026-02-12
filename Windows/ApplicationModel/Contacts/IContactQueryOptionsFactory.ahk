#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContactQueryOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactQueryOptionsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactQueryOptionsFactory
     * @type {Guid}
     */
    static IID => Guid("{543fba47-8ce7-46cb-9dac-9aa42a1bc8e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithText", "CreateWithTextAndFields"]

    /**
     * 
     * @param {HSTRING} text 
     * @returns {ContactQueryOptions} 
     */
    CreateWithText(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(6, this, "ptr", text, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactQueryOptions(result_)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {Integer} fields 
     * @returns {ContactQueryOptions} 
     */
    CreateWithTextAndFields(text, fields) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(7, this, "ptr", text, "uint", fields, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactQueryOptions(result_)
    }
}
