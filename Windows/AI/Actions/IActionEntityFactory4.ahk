#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TableActionEntity.ahk
#Include .\ContactActionEntity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionEntityFactory4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEntityFactory4
     * @type {Guid}
     */
    static IID => Guid("{332eda05-de0e-5a58-b318-a2ad771f013d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTableEntity", "CreateContactEntity"]

    /**
     * 
     * @param {Integer} data_length 
     * @param {Pointer<HSTRING>} data 
     * @param {Integer} columnCount 
     * @returns {TableActionEntity} 
     */
    CreateTableEntity(data_length, data, columnCount) {
        result := ComCall(6, this, "uint", data_length, "ptr", data, "uint", columnCount, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TableActionEntity(result_)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {ContactActionEntity} 
     */
    CreateContactEntity(contact_) {
        result := ComCall(7, this, "ptr", contact_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactActionEntity(result_)
    }
}
