#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\Views.ahk
#Include .\SnapIns.ahk
#Include .\View.ahk
#Include .\Node.ahk
#Include .\ScopeNamespace.ahk
#Include .\Properties.ahk
#Include .\_Application.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains cells for a document that control preview quality, scope, and output format.
 * @remarks
 * You can also set these values by using the **Properties** dialog box (click the **File** tab, click **Info**, click **Properties**, and then click **Advanced Properties**).
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/document-properties-section
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Document extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Document
     * @type {Guid}
     */
    static IID => Guid("{225120d6-1e0f-40a3-93fe-1079e6a8017b}")

    /**
     * The class identifier for Document
     * @type {Guid}
     */
    static CLSID => Guid("{225120d6-1e0f-40a3-93fe-1079e6a8017b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Save", "SaveAs", "Close", "get_Views", "get_SnapIns", "get_ActiveView", "get_Name", "put_Name", "get_Location", "get_IsSaved", "get_Mode", "put_Mode", "get_RootNode", "get_ScopeNamespace", "CreateProperties", "get_Application"]

    /**
     * @type {Views} 
     */
    Views {
        get => this.get_Views()
    }

    /**
     * @type {SnapIns} 
     */
    SnapIns {
        get => this.get_SnapIns()
    }

    /**
     * @type {View} 
     */
    ActiveView {
        get => this.get_ActiveView()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * @type {BOOL} 
     */
    IsSaved {
        get => this.get_IsSaved()
    }

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * @type {Node} 
     */
    RootNode {
        get => this.get_RootNode()
    }

    /**
     * @type {ScopeNamespace} 
     */
    ScopeNamespace {
        get => this.get_ScopeNamespace()
    }

    /**
     * @type {_Application} 
     */
    Application {
        get => this.get_Application()
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
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} Filename 
     * @returns {HRESULT} 
     */
    SaveAs(Filename) {
        if(Filename is String) {
            pin := BSTR.Alloc(Filename)
            Filename := pin.Value
        }

        result := ComCall(8, this, "ptr", Filename, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * MSSQLSERVER_4064
     * @param {BOOL} SaveChanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close(SaveChanges) {
        result := ComCall(9, this, "int", SaveChanges, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Views} 
     */
    get_Views() {
        result := ComCall(10, this, "ptr*", &Views_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Views(Views_)
    }

    /**
     * 
     * @returns {SnapIns} 
     */
    get_SnapIns() {
        result := ComCall(11, this, "ptr*", &SnapIns_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SnapIns(SnapIns_)
    }

    /**
     * 
     * @returns {View} 
     */
    get_ActiveView() {
        result := ComCall(12, this, "ptr*", &View_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return View(View_)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(13, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Name
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     */
    put_Name(Name) {
        if(Name is String) {
            pin := BSTR.Alloc(Name)
            Name := pin.Value
        }

        result := ComCall(14, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Location() {
        Location_ := BSTR()
        result := ComCall(15, this, "ptr", Location_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Location_
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsSaved() {
        result := ComCall(16, this, "int*", &IsSaved := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IsSaved
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(17, this, "int*", &Mode_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Mode_
    }

    /**
     * 
     * @param {Integer} Mode_ 
     * @returns {HRESULT} 
     */
    put_Mode(Mode_) {
        result := ComCall(18, this, "int", Mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Node} 
     */
    get_RootNode() {
        result := ComCall(19, this, "ptr*", &Node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Node(Node_)
    }

    /**
     * 
     * @returns {ScopeNamespace} 
     */
    get_ScopeNamespace() {
        result := ComCall(20, this, "ptr*", &ScopeNamespace_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScopeNamespace(ScopeNamespace_)
    }

    /**
     * 
     * @returns {Properties} 
     */
    CreateProperties() {
        result := ComCall(21, this, "ptr*", &Properties_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Properties(Properties_)
    }

    /**
     * 
     * @returns {_Application} 
     */
    get_Application() {
        result := ComCall(22, this, "ptr*", &Application_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return _Application(Application_)
    }
}
