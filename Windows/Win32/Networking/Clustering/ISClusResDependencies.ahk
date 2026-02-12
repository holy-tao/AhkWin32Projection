#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ISClusResource.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResDependencies extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusResDependencies
     * @type {Guid}
     */
    static IID => Guid("{f2e60704-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Refresh", "get_Item", "CreateItem", "DeleteItem", "AddItem", "RemoveItem"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(retval)
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {ISClusResource} 
     */
    get_Item(varIndex) {
        result := ComCall(10, this, "ptr", varIndex, "ptr*", &ppClusResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResource(ppClusResource)
    }

    /**
     * Creates an item moniker that identifies an object within a containing object (typically a compound document).
     * @remarks
     * A moniker provider, which hands out monikers to identify its objects so they are accessible to other parties, would call <b>CreateItemMoniker</b> to identify its objects with item monikers. Item monikers are based on a string, and identify objects that are contained within another object and can be individually identified using a string. The containing object must also implement the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecontainer">IOleContainer</a> interface. 
     * 
     * Most moniker providers are OLE applications that support linking. Applications that support linking to objects smaller than file-based documents, such as a server application that allows linking to a selection within a document, should use item monikers to identify the objects. Container applications that allow linking to embedded objects use item monikers to identify the embedded objects. 
     * 
     * 
     * 
     * The <i>lpszItem</i> parameter is the name used by the document to uniquely identify the object. For example, if the object being identified is a cell range in a spreadsheet, an appropriate name might be something like "A1:E7." An appropriate name when the object being identified is an embedded object might be something like "embedobj1." The containing object must provide an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface that can interpret this name and locate the corresponding object. This allows the item moniker to be bound to the object it identifies.
     * 
     * Item monikers are not used in isolation. They must be composed with a moniker that identifies the containing object as well. For example, if the object being identified is a cell range contained in a file-based document, the item moniker identifying that object must be composed with the file moniker identifying that document, resulting in a composite moniker that is the equivalent of "C:\work\sales.xls!A1:E7."
     * 
     * Nested containers are allowed also, as in the case where an object is contained within an embedded object inside another document. The complete moniker of such an object would be the equivalent of "C:\work\report.doc!embedobj1!A1:E7." In this case, each containing object must call <b>CreateItemMoniker</b> and provide its own implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface.
     * @param {BSTR} bstrResourceName 
     * @param {BSTR} bstrResourceType 
     * @param {Integer} dwFlags 
     * @returns {ISClusResource} 
     * @see https://learn.microsoft.com/windows/win32/api//content/objbase/nf-objbase-createitemmoniker
     */
    CreateItem(bstrResourceName, bstrResourceType, dwFlags) {
        if(bstrResourceName is String) {
            pin := BSTR.Alloc(bstrResourceName)
            bstrResourceName := pin.Value
        }
        if(bstrResourceType is String) {
            pin := BSTR.Alloc(bstrResourceType)
            bstrResourceType := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrResourceName, "ptr", bstrResourceType, "int", dwFlags, "ptr*", &ppClusterResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResource(ppClusterResource)
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    DeleteItem(varIndex) {
        result := ComCall(12, this, "ptr", varIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ISClusResource} pResource 
     * @returns {HRESULT} 
     */
    AddItem(pResource) {
        result := ComCall(13, this, "ptr", pResource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    RemoveItem(varIndex) {
        result := ComCall(14, this, "ptr", varIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
