#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CharacterGroupings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.Collation
 * @version WindowsRuntime 1.4
 */
class ICharacterGroupingsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICharacterGroupingsFactory
     * @type {Guid}
     */
    static IID => Guid("{99ea9fd9-886d-4401-9f98-69c82d4c2f78}")

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
     * @param {HSTRING} language_ 
     * @returns {CharacterGroupings} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(language_) {
        if(language_ is String) {
            pin := HSTRING.Create(language_)
            language_ := pin.Value
        }
        language_ := language_ is Win32Handle ? NumGet(language_, "ptr") : language_

        result := ComCall(6, this, "ptr", language_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CharacterGroupings(result_)
    }
}
