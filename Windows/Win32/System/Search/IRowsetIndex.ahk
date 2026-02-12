#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetIndex extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetIndex
     * @type {Guid}
     */
    static IID => Guid("{0c733a82-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIndexInfo", "Seek", "SetRange"]

    /**
     * 
     * @param {Pointer<Pointer>} pcKeyColumns 
     * @param {Pointer<Pointer<DBINDEXCOLUMNDESC>>} prgIndexColumnDesc 
     * @param {Pointer<Integer>} pcIndexPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgIndexPropertySets 
     * @returns {HRESULT} 
     */
    GetIndexInfo(pcKeyColumns, prgIndexColumnDesc, pcIndexPropertySets, prgIndexPropertySets) {
        pcKeyColumnsMarshal := pcKeyColumns is VarRef ? "ptr*" : "ptr"
        prgIndexColumnDescMarshal := prgIndexColumnDesc is VarRef ? "ptr*" : "ptr"
        pcIndexPropertySetsMarshal := pcIndexPropertySets is VarRef ? "uint*" : "ptr"
        prgIndexPropertySetsMarshal := prgIndexPropertySets is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcKeyColumnsMarshal, pcKeyColumns, prgIndexColumnDescMarshal, prgIndexColumnDesc, pcIndexPropertySetsMarshal, pcIndexPropertySets, prgIndexPropertySetsMarshal, prgIndexPropertySets, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Seek Method
     * @remarks
     * Use the **Seek** method in conjunction with the [Index](./index-property.md) property if the underlying provider supports indexes on the **Recordset** object. Use the [Supports](./supports-method.md)**(adSeek)** method to determine whether the underlying provider supports **Seek**, and the **Supports(adIndex)** method to determine whether the provider supports indexes. (For example, the [OLE DB Provider for Microsoft Jet](../../guide/appendixes/microsoft-ole-db-provider-for-microsoft-jet.md) supports **Seek** and **Index**.)  
     *   
     *  If **Seek** does not find the desired row, no error occurs, and the row is positioned at the end of the **Recordset**. Set the **Index** property to the desired index before executing this method.  
     *   
     *  This method is supported only with server-side cursors. Seek is not supported when the **Recordset** object's [CursorLocation](./cursorlocation-property-ado.md) property value is **adUseClient**.  
     *   
     *  This method can only be used when the **Recordset** object has been opened with a [CommandTypeEnum](./commandtypeenum.md) value of **adCmdTableDirect**.
     * @param {HACCESSOR} hAccessor_ 
     * @param {Pointer} cKeyValues 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dwSeekOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/seek-method
     */
    Seek(hAccessor_, cKeyValues, pData, dwSeekOptions) {
        hAccessor_ := hAccessor_ is Win32Handle ? NumGet(hAccessor_, "ptr") : hAccessor_

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", hAccessor_, "ptr", cKeyValues, pDataMarshal, pData, "uint", dwSeekOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HACCESSOR} hAccessor_ 
     * @param {Pointer} cStartKeyColumns 
     * @param {Pointer<Void>} pStartData 
     * @param {Pointer} cEndKeyColumns 
     * @param {Pointer<Void>} pEndData 
     * @param {Integer} dwRangeOptions 
     * @returns {HRESULT} 
     */
    SetRange(hAccessor_, cStartKeyColumns, pStartData, cEndKeyColumns, pEndData, dwRangeOptions) {
        hAccessor_ := hAccessor_ is Win32Handle ? NumGet(hAccessor_, "ptr") : hAccessor_

        pStartDataMarshal := pStartData is VarRef ? "ptr" : "ptr"
        pEndDataMarshal := pEndData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", hAccessor_, "ptr", cStartKeyColumns, pStartDataMarshal, pStartData, "ptr", cEndKeyColumns, pEndDataMarshal, pEndData, "uint", dwRangeOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
