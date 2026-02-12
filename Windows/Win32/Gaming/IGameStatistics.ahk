#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IGameStatistics extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameStatistics
     * @type {Guid}
     */
    static IID => Guid("{3887c9ca-04a0-42ae-bc4c-5fa6c7721145}")

    /**
     * The class identifier for GameStatistics
     * @type {Guid}
     */
    static CLSID => Guid("{dbc85a2c-c0dc-4961-b6e2-d28b62c11ad4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxCategoryLength", "GetMaxNameLength", "GetMaxValueLength", "GetMaxCategories", "GetMaxStatsPerCategory", "SetCategoryTitle", "GetCategoryTitle", "GetStatistic", "SetStatistic", "Save", "SetLastPlayedCategory", "GetLastPlayedCategory"]

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxCategoryLength() {
        result := ComCall(3, this, "uint*", &cch := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxNameLength() {
        result := ComCall(4, this, "uint*", &cch := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxValueLength() {
        result := ComCall(5, this, "uint*", &cch := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxCategories() {
        result := ComCall(6, this, "ushort*", &pMax := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pMax
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxStatsPerCategory() {
        result := ComCall(7, this, "ushort*", &pMax := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pMax
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {PWSTR} title 
     * @returns {HRESULT} 
     */
    SetCategoryTitle(categoryIndex, title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(8, this, "ushort", categoryIndex, "ptr", title, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @returns {PWSTR} 
     */
    GetCategoryTitle(categoryIndex) {
        result := ComCall(9, this, "ushort", categoryIndex, "ptr*", &pTitle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pTitle
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {Integer} statIndex 
     * @param {Pointer<PWSTR>} pName 
     * @param {Pointer<PWSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetStatistic(categoryIndex, statIndex, pName, pValue) {
        pNameMarshal := pName is VarRef ? "ptr*" : "ptr"
        pValueMarshal := pValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ushort", categoryIndex, "ushort", statIndex, pNameMarshal, pName, pValueMarshal, pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {Integer} statIndex 
     * @param {PWSTR} name 
     * @param {PWSTR} value 
     * @returns {HRESULT} 
     */
    SetStatistic(categoryIndex, statIndex, name, value) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := ComCall(11, this, "ushort", categoryIndex, "ushort", statIndex, "ptr", name, "ptr", value, "int")
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
     * @param {BOOL} trackChanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/save-method
     */
    Save(trackChanges) {
        result := ComCall(12, this, "int", trackChanges, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @returns {HRESULT} 
     */
    SetLastPlayedCategory(categoryIndex) {
        result := ComCall(13, this, "uint", categoryIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLastPlayedCategory() {
        result := ComCall(14, this, "uint*", &pCategoryIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCategoryIndex
    }
}
