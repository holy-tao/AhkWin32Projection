#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IRowsetFastLoad (Native Client OLE DB provider)
 * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-interfaces/irowsetfastload-ole-db
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetFastLoad extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetFastLoad
     * @type {Guid}
     */
    static IID => Guid("{5cf4ca13-ef21-11d0-97e7-00c04fc2ad98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertRow", "Commit"]

    /**
     * IRowsetFastLoad::InsertRow (Native Client OLE DB provider)
     * @remarks
     * An error converting consumer data to the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type for a column causes an E_FAIL return from the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client OLE DB provider. Data can be transmitted to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] on any **InsertRow** method or only on **Commit** method. The consumer application can call the **InsertRow** method many times with erroneous data before it receives notice that a data type conversion error exists. Because the **Commit** method ensures that all data is correctly specified by the consumer, the consumer can use the **Commit** method appropriately to validate data as necessary.  
     *   
     *  The [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client OLE DB provider bulk copy rowsets are write-only. The [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client OLE DB provider exposes no methods allowing consumer query of the rowset. To terminate processing, the consumer can release its reference on the [IRowsetFastLoad](../../relational-databases/native-client-ole-db-interfaces/irowsetfastload-ole-db.md) interface without calling the **Commit** method. There are no facilities for accessing a consumer-inserted row in the rowset and changing its values, or removing it individually from the rowset.  
     *   
     *  Bulk copied rows are formatted on the server for [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)]. The row format is affected by any options that may have been set for the connection or session such as ANSI_PADDING. This option is set on by default for any connection made through the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client OLE DB provider.
     * @param {HACCESSOR} hAccessor_ The handle of the accessor defining the row data for bulk copy. The accessor referenced is a row accessor, binding consumer-owned memory containing data values.
     * @param {Pointer<Void>} pData A pointer to the consumer-owned memory containing data values. For more information, see [DBBINDING Structures](/previous-versions/windows/desktop/ms716845(v=vs.85)).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-interfaces/irowsetfastload-insertrow-ole-db
     */
    InsertRow(hAccessor_, pData) {
        hAccessor_ := hAccessor_ is Win32Handle ? NumGet(hAccessor_, "ptr") : hAccessor_

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hAccessor_, pDataMarshal, pData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * IRowsetFastLoad::Commit (Native Client OLE DB provider)
     * @remarks
     * A [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client OLE DB provider bulk copy rowset behaves as a delayed-update mode rowset. As the user inserts row data through the rowset, inserted rows are treated in the same fashion as pending inserts on a rowset supporting **IRowsetUpdate**.  
     *   
     *  The consumer must call the **Commit** method on the bulk copy rowset to write inserted rows to the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] table in the same way as the **IRowsetUpdate::Update** method is used to submit pending rows to an instance of SQL Server.  
     *   
     *  If the consumer releases its reference on the bulk copy rowset without calling the **Commit** method, all inserted rows not previously written are lost.  
     *   
     *  The consumer can batch inserted rows by calling the **Commit** method with the *fDone* argument set to FALSE. When *fDone*is set to TRUE, the rowset becomes invalid. An invalid bulk copy rowset supports only the **ISupportErrorInfo** interface and **IRowsetFastLoad::Release** method.
     * @param {BOOL} fDone If FALSE, the rowset maintains validity and can be used by the consumer for additional row insertion. If TRUE, the rowset loses validity and no further insertion can be done by the consumer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-interfaces/irowsetfastload-commit-ole-db
     */
    Commit(fDone) {
        result := ComCall(4, this, "int", fDone, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
