#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContactAggregationAggregateCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationGroup
     * @type {Guid}
     */
    static IID => Guid("{c93c545f-1284-499b-96af-07372af473e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Delete", "Save", "Add", "Remove", "get_Members", "get_GlobalObjectId", "put_GlobalObjectId", "get_Id", "get_Name", "put_Name"]

    /**
     * @type {IContactAggregationAggregateCollection} 
     */
    Members {
        get => this.get_Members()
    }

    /**
     * @type {Guid} 
     */
    GlobalObjectId {
        get => this.get_GlobalObjectId()
        set => this.put_GlobalObjectId(value)
    }

    /**
     * @type {PWSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {PWSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
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
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IContactAggregationAggregateCollection} 
     */
    get_Members() {
        result := ComCall(7, this, "ptr*", &ppAggregateContactCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IContactAggregationAggregateCollection(ppAggregateContactCollection)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GlobalObjectId() {
        pGlobalObjectId := Guid()
        result := ComCall(8, this, "ptr", pGlobalObjectId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pGlobalObjectId
    }

    /**
     * 
     * @param {Pointer<Guid>} pGlobalObjectId 
     * @returns {HRESULT} 
     */
    put_GlobalObjectId(pGlobalObjectId) {
        result := ComCall(9, this, "ptr", pGlobalObjectId, "int")
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
        result := ComCall(10, this, "ptr*", &ppItemId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppItemId
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Name() {
        result := ComCall(11, this, "ptr*", &ppName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppName
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    put_Name(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(12, this, "ptr", pName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
