#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UriActionEntity.ahk
#Include .\ArrayActionEntity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionEntityFactory5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEntityFactory5
     * @type {Guid}
     */
    static IID => Guid("{b59faab1-cfe4-564a-a5ba-53ad7ff6f924}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUriEntity", "CreateArrayEntity"]

    /**
     * 
     * @param {Uri} Uri_ 
     * @returns {UriActionEntity} 
     */
    CreateUriEntity(Uri_) {
        result := ComCall(6, this, "ptr", Uri_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UriActionEntity(result_)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} entities_length 
     * @param {Pointer<ActionEntity>} entities 
     * @returns {ArrayActionEntity} 
     */
    CreateArrayEntity(kind, entities_length, entities) {
        result := ComCall(7, this, "int", kind, "uint", entities_length, "ptr*", entities, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ArrayActionEntity(result_)
    }
}
