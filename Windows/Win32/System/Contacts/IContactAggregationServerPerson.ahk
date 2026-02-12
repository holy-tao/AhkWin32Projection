#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationServerPerson extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationServerPerson
     * @type {Guid}
     */
    static IID => Guid("{7fdc3d4b-1b82-4334-85c5-25184ee5a5f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Delete", "Save", "get_AggregateId", "put_AggregateId", "get_AntiLink", "put_AntiLink", "get_AntiLinkBaseline", "put_AntiLinkBaseline", "get_FavoriteOrder", "put_FavoriteOrder", "get_FavoriteOrderBaseline", "put_FavoriteOrderBaseline", "get_Groups", "put_Groups", "get_GroupsBaseline", "put_GroupsBaseline", "get_Id", "get_IsTombstone", "put_IsTombstone", "get_LinkedAggregateId", "put_LinkedAggregateId", "get_ObjectId", "put_ObjectId"]

    /**
     * @type {PWSTR} 
     */
    AggregateId {
        get => this.get_AggregateId()
        set => this.put_AggregateId(value)
    }

    /**
     * @type {PWSTR} 
     */
    AntiLink {
        get => this.get_AntiLink()
        set => this.put_AntiLink(value)
    }

    /**
     * @type {PWSTR} 
     */
    AntiLinkBaseline {
        get => this.get_AntiLinkBaseline()
        set => this.put_AntiLinkBaseline(value)
    }

    /**
     * @type {Integer} 
     */
    FavoriteOrder {
        get => this.get_FavoriteOrder()
        set => this.put_FavoriteOrder(value)
    }

    /**
     * @type {Integer} 
     */
    FavoriteOrderBaseline {
        get => this.get_FavoriteOrderBaseline()
        set => this.put_FavoriteOrderBaseline(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    Groups {
        get => this.get_Groups()
        set => this.put_Groups(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    GroupsBaseline {
        get => this.get_GroupsBaseline()
        set => this.put_GroupsBaseline(value)
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
    IsTombstone {
        get => this.get_IsTombstone()
        set => this.put_IsTombstone(value)
    }

    /**
     * @type {PWSTR} 
     */
    LinkedAggregateId {
        get => this.get_LinkedAggregateId()
        set => this.put_LinkedAggregateId(value)
    }

    /**
     * @type {PWSTR} 
     */
    ObjectId {
        get => this.get_ObjectId()
        set => this.put_ObjectId(value)
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
     * @returns {PWSTR} 
     */
    get_AggregateId() {
        result := ComCall(5, this, "ptr*", &ppAggregateId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAggregateId
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    put_AggregateId(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_AntiLink() {
        result := ComCall(7, this, "ptr*", &ppAntiLink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAntiLink
    }

    /**
     * 
     * @param {PWSTR} pAntiLink 
     * @returns {HRESULT} 
     */
    put_AntiLink(pAntiLink) {
        pAntiLink := pAntiLink is String ? StrPtr(pAntiLink) : pAntiLink

        result := ComCall(8, this, "ptr", pAntiLink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_AntiLinkBaseline() {
        result := ComCall(9, this, "ptr*", &ppAntiLink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAntiLink
    }

    /**
     * 
     * @param {PWSTR} pAntiLink 
     * @returns {HRESULT} 
     */
    put_AntiLinkBaseline(pAntiLink) {
        pAntiLink := pAntiLink is String ? StrPtr(pAntiLink) : pAntiLink

        result := ComCall(10, this, "ptr", pAntiLink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FavoriteOrder() {
        result := ComCall(11, this, "uint*", &pFavoriteOrder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFavoriteOrder
    }

    /**
     * 
     * @param {Integer} favoriteOrder 
     * @returns {HRESULT} 
     */
    put_FavoriteOrder(favoriteOrder) {
        result := ComCall(12, this, "uint", favoriteOrder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FavoriteOrderBaseline() {
        result := ComCall(13, this, "uint*", &pFavoriteOrder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFavoriteOrder
    }

    /**
     * 
     * @param {Integer} favoriteOrder 
     * @returns {HRESULT} 
     */
    put_FavoriteOrderBaseline(favoriteOrder) {
        result := ComCall(14, this, "uint", favoriteOrder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_Groups() {
        result := ComCall(15, this, "ptr*", &pGroups := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pGroups
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pGroups 
     * @returns {HRESULT} 
     */
    put_Groups(pGroups) {
        result := ComCall(16, this, "ptr", pGroups, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_GroupsBaseline() {
        result := ComCall(17, this, "ptr*", &ppGroups := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppGroups
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pGroups 
     * @returns {HRESULT} 
     */
    put_GroupsBaseline(pGroups) {
        result := ComCall(18, this, "ptr", pGroups, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(19, this, "ptr*", &ppId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsTombstone() {
        result := ComCall(20, this, "int*", &pIsTombstone := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsTombstone
    }

    /**
     * 
     * @param {BOOL} isTombstone 
     * @returns {HRESULT} 
     */
    put_IsTombstone(isTombstone) {
        result := ComCall(21, this, "int", isTombstone, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_LinkedAggregateId() {
        result := ComCall(22, this, "ptr*", &ppLinkedAggregateId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppLinkedAggregateId
    }

    /**
     * 
     * @param {PWSTR} pLinkedAggregateId 
     * @returns {HRESULT} 
     */
    put_LinkedAggregateId(pLinkedAggregateId) {
        pLinkedAggregateId := pLinkedAggregateId is String ? StrPtr(pLinkedAggregateId) : pLinkedAggregateId

        result := ComCall(23, this, "ptr", pLinkedAggregateId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_ObjectId() {
        result := ComCall(24, this, "ptr*", &ppObjectId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppObjectId
    }

    /**
     * 
     * @param {PWSTR} pObjectId 
     * @returns {HRESULT} 
     */
    put_ObjectId(pObjectId) {
        pObjectId := pObjectId is String ? StrPtr(pObjectId) : pObjectId

        result := ComCall(25, this, "ptr", pObjectId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
