#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetProtocolRoot.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocol extends IInternetProtocolRoot{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocol
     * @type {Guid}
     */
    static IID => Guid("{79eac9e4-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Seek", "LockRequest", "UnlockRequest"]

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pvMarshal, pv, "uint", cb, "uint*", &pcbRead := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbRead
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
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/seek-method
     */
    Seek(dlibMove, dwOrigin) {
        result := ComCall(10, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plibNewPosition
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    LockRequest(dwOptions) {
        result := ComCall(11, this, "uint", dwOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockRequest() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
