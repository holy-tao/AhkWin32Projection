#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaParameterInitializer extends IPrintSchemaElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaParameterInitializer
     * @type {Guid}
     */
    static IID => Guid("{52027082-0b74-4648-9564-828cc6cb656c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value"]

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    get_Value(pVar) {
        result := ComCall(10, this, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    put_Value(pVar) {
        result := ComCall(11, this, "ptr", pVar, "HRESULT")
        return result
    }
}
