#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintReadStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintReadStream
     * @type {Guid}
     */
    static IID => Guid("{4d47a67c-66cc-4430-850e-daf466fe5bc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Seek", "ReadBytes"]

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
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/seek-method
     */
    Seek(dlibMove, dwOrigin) {
        result := ComCall(3, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plibNewPosition
    }

    /**
     * 
     * @param {Pointer} pvBuffer 
     * @param {Integer} cbRequested 
     * @param {Pointer<Integer>} pcbRead 
     * @param {Pointer<BOOL>} pbEndOfFile 
     * @returns {HRESULT} 
     */
    ReadBytes(pvBuffer, cbRequested, pcbRead, pbEndOfFile) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"
        pbEndOfFileMarshal := pbEndOfFile is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pvBuffer, "uint", cbRequested, pcbReadMarshal, pcbRead, pbEndOfFileMarshal, pbEndOfFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
