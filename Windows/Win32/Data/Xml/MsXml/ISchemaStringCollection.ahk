#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaStringCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaStringCollection
     * @type {Guid}
     */
    static IID => Guid("{50ea08b1-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_item", "get_length", "get__newEnum"]

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} bstr 
     * @returns {HRESULT} 
     */
    get_item(index, bstr) {
        result := ComCall(7, this, "int", index, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     */
    get_length(length) {
        lengthMarshal := length is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, lengthMarshal, length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppunk) {
        result := ComCall(9, this, "ptr*", ppunk, "HRESULT")
        return result
    }
}
