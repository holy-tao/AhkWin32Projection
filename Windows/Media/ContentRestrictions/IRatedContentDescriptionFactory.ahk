#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RatedContentDescription.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.ContentRestrictions
 * @version WindowsRuntime 1.4
 */
class IRatedContentDescriptionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRatedContentDescriptionFactory
     * @type {Guid}
     */
    static IID => Guid("{2e38df62-9b90-4fa6-89c1-4b8d2ffb3573}")

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
     * @param {HSTRING} title 
     * @param {Integer} category 
     * @returns {RatedContentDescription} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(id, title, category) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title

        result := ComCall(6, this, "ptr", id, "ptr", title, "int", category, "ptr*", &RatedContentDescription_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RatedContentDescription(RatedContentDescription_)
    }
}
