#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXNamespacePrefixes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXNamespacePrefixes
     * @type {Guid}
     */
    static IID => Guid("{c90352f4-643c-4fbc-bb23-e996eb2d51fd}")

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
     * @param {Pointer<BSTR>} prefix 
     * @returns {HRESULT} 
     */
    get_item(index, prefix) {
        result := ComCall(7, this, "int", index, "ptr", prefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     */
    get_length(length) {
        result := ComCall(8, this, "int*", length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppUnk) {
        result := ComCall(9, this, "ptr*", ppUnk, "HRESULT")
        return result
    }
}
