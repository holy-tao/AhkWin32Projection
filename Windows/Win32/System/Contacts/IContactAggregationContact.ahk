#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationContact extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationContact
     * @type {Guid}
     */
    static IID => Guid("{1eb22e86-4c86-41f0-9f9f-c251e9fda6c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Delete", "Save", "MoveToAggregate", "Unlink", "get_AccountId", "put_AccountId", "get_AggregateId", "get_Id", "get_IsMe", "get_IsExternal", "get_NetworkSourceId", "put_NetworkSourceId", "get_NetworkSourceIdString", "put_NetworkSourceIdString", "get_RemoteObjectId", "put_RemoteObjectId", "get_SyncIdentityHash", "put_SyncIdentityHash"]

    /**
     * @type {PWSTR} 
     */
    AccountId {
        get => this.get_AccountId()
        set => this.put_AccountId(value)
    }

    /**
     * @type {PWSTR} 
     */
    AggregateId {
        get => this.get_AggregateId()
    }

    /**
     * @type {PWSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BOOL} 
     */
    IsMe {
        get => this.get_IsMe()
    }

    /**
     * @type {BOOL} 
     */
    IsExternal {
        get => this.get_IsExternal()
    }

    /**
     * @type {Integer} 
     */
    NetworkSourceId {
        get => this.get_NetworkSourceId()
        set => this.put_NetworkSourceId(value)
    }

    /**
     * @type {PWSTR} 
     */
    NetworkSourceIdString {
        get => this.get_NetworkSourceIdString()
        set => this.put_NetworkSourceIdString(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    RemoteObjectId {
        get => this.get_RemoteObjectId()
        set => this.put_RemoteObjectId(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    SyncIdentityHash {
        get => this.get_SyncIdentityHash()
        set => this.put_SyncIdentityHash(value)
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Save Method
     * @remarks
     * The **Save Method** method can only be invoked on an open **Recordset**. Use the [Open Method (ADO Recordset)](./open-method-ado-recordset.md) method to later restore the **Recordset** from *Destination*.  
     *   
     *  If the [Filter Property](./filter-property.md) property is in effect for the **Recordset**, then only the rows accessible under the filter are saved. If the **Recordset** is hierarchical, then the current child **Recordset** and its children are saved, including the parent **Recordset**. If the Save method of a child **Recordset** is called, the child and all its children are saved, but the parent is not.  
     *   
     *  The first time you save the **Recordset**, it is optional to specify *Destination*. If you omit *Destination*, a new file will be created with a name set to the value of the Source property of the **Recordset**.  
     *   
     *  Omit *Destination* when you subsequently call **Save** after the first save, or a run-time error will occur. If you subsequently call **Save** with a new *Destination*, the **Recordset** is saved to the new destination. However, the new destination and the original destination will both be open.  
     *   
     *  **Save** does not close the **Recordset** or *Destination*, so you can continue to work with the **Recordset** and save your most recent changes. *Destination* remains open until the **Recordset** is closed.  
     *   
     *  For reasons of security, the **Save** method permits only the use of low and custom security settings from a script executed by Microsoft Internet Explorer.  
     *   
     *  If the **Save** method is called while an asynchronous **Recordset** fetch, execute, or update operation is in progress, then **Save** waits until the asynchronous operation is complete.  
     *   
     *  Records are saved beginning with the first row of the **Recordset**. When the **Save** method is finished, the current row position is moved to the first row of the **Recordset**.  
     *   
     *  For best results, set the [CursorLocation Property (ADO)](./cursorlocation-property-ado.md) property to **adUseClient** with **Save**. If your provider does not support all of the functionality necessary to save **Recordset** objects, the Cursor Service will provide that functionality.  
     *   
     *  When a **Recordset** is persisted with the **CursorLocation** property set to **adUseServer**, the update capability for the **Recordset** is limited. Typically, only single-table updates, insertions, and deletions are allowed (dependant upon provider functionality). The [Resync Method](./resync-method.md) method is also unavailable in this configuration.  
     *   
     * > [!NOTE]
     * >  Saving a **Recordset** with **Fields** of type **adVariant**, **adIDispatch**, or **adIUnknown** is not supported by ADO and can cause unpredictable results.  
     *   
     *  Only Filters in the form of Criteria Strings (e.g. OrderDate > '12/31/1999') affect the contents of a persisted **Recordset**. Filters created with an Array of **Bookmarks** or using a value from the [FilterGroupEnum](./filtergroupenum.md) will not affect the contents of the persisted **Recordset**. These rules apply to **Recordset**s created with either client-side or server-side cursors.  
     *   
     *  Because the *Destination* parameter can accept any object that supports the OLE DB IStream interface, you can save a **Recordset** directly to the ASP Response object. For more details, please see the **XML Recordset Persistence Scenario**.  
     *   
     *  You can also save a **Recordset** in XML format to an instance of an MSXML DOM object, as is shown in the following Visual Basic code:  
     *   
     * ```  
     * Dim xDOM As New MSXML.DOMDocument  
     * Dim rsXML As New ADODB.Recordset  
     * Dim sSQL As String, sConn As String  
     *   
     * sSQL = "SELECT customerid, companyname, contactname FROM customers"  
     * sConn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Northwind.mdb"  
     * rsXML.Open sSQL, sConn  
     * rsXML.Save xDOM, adPersistXML   'Save Recordset directly into a DOM tree.  
     * ...  
     * ```  
     *   
     * > [!NOTE]
     * >  Two limitations apply when saving hierarchical Recordsets (data shapes) in XML format. You cannot save into XML if the hierarchical **Recordset** contains pending updates, and you cannot save a parameterized hierarchical **Recordset**.  
     *   
     *  A **Recordset** saved in XML format is saved using UTF-8 format. When such a file is loaded into an ADO Stream, the Stream object will not attempt to open a **Recordset** from the stream unless the Charset property of the stream is set to the appropriate value for UTF-8 format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/save-method
     */
    Save() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    MoveToAggregate(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unlink() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_AccountId() {
        result := ComCall(7, this, "ptr*", &ppAccountId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAccountId
    }

    /**
     * 
     * @param {PWSTR} pAccountId 
     * @returns {HRESULT} 
     */
    put_AccountId(pAccountId) {
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(8, this, "ptr", pAccountId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_AggregateId() {
        result := ComCall(9, this, "ptr*", &ppAggregateId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAggregateId
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(10, this, "ptr*", &ppItemId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppItemId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsMe() {
        result := ComCall(11, this, "int*", &pIsMe := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsMe
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsExternal() {
        result := ComCall(12, this, "int*", &pIsExternal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsExternal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkSourceId() {
        result := ComCall(13, this, "uint*", &pNetworkSourceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pNetworkSourceId
    }

    /**
     * 
     * @param {Integer} networkSourceId 
     * @returns {HRESULT} 
     */
    put_NetworkSourceId(networkSourceId) {
        result := ComCall(14, this, "uint", networkSourceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_NetworkSourceIdString() {
        result := ComCall(15, this, "ptr*", &ppNetworkSourceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppNetworkSourceId
    }

    /**
     * 
     * @param {PWSTR} pNetworkSourceId 
     * @returns {HRESULT} 
     */
    put_NetworkSourceIdString(pNetworkSourceId) {
        pNetworkSourceId := pNetworkSourceId is String ? StrPtr(pNetworkSourceId) : pNetworkSourceId

        result := ComCall(16, this, "ptr", pNetworkSourceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_RemoteObjectId() {
        result := ComCall(17, this, "ptr*", &ppRemoteObjectId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRemoteObjectId
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteObjectId 
     * @returns {HRESULT} 
     */
    put_RemoteObjectId(pRemoteObjectId) {
        result := ComCall(18, this, "ptr", pRemoteObjectId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_SyncIdentityHash() {
        result := ComCall(19, this, "ptr*", &ppSyncIdentityHash := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppSyncIdentityHash
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pSyncIdentityHash 
     * @returns {HRESULT} 
     */
    put_SyncIdentityHash(pSyncIdentityHash) {
        result := ComCall(20, this, "ptr", pSyncIdentityHash, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
