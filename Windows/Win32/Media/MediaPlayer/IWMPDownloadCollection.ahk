#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPDownloadItem2.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDownloadCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPDownloadCollection
     * @type {Guid}
     */
    static IID => Guid("{0a319c7f-85f9-436c-b88e-82fd88000e1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_id", "get_count", "item", "startDownload", "removeItem", "Clear"]

    /**
     */
    id {
        get => this.get_id()
    }

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     */
    get_id(plId) {
        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plIdMarshal, plId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plCountMarshal, plCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lItem_ 
     * @returns {IWMPDownloadItem2} 
     */
    item(lItem_) {
        result := ComCall(9, this, "int", lItem_, "ptr*", &ppDownload := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMPDownloadItem2(ppDownload)
    }

    /**
     * 
     * @param {BSTR} bstrSourceURL 
     * @param {BSTR} bstrType 
     * @returns {IWMPDownloadItem2} 
     */
    startDownload(bstrSourceURL, bstrType) {
        if(bstrSourceURL is String) {
            pin := BSTR.Alloc(bstrSourceURL)
            bstrSourceURL := pin.Value
        }
        if(bstrType is String) {
            pin := BSTR.Alloc(bstrType)
            bstrType := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrSourceURL, "ptr", bstrType, "ptr*", &ppDownload := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMPDownloadItem2(ppDownload)
    }

    /**
     * 
     * @param {Integer} lItem_ 
     * @returns {HRESULT} 
     */
    removeItem(lItem_) {
        result := ComCall(11, this, "int", lItem_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clear Method (ADO)
     * @remarks
     * Use the **Clear** method on the [Errors](./errors-collection-ado.md) collection to remove all existing [Error](./error-object.md) objects from the collection. When an error occurs, ADO automatically clears the **Errors** collection and fills it with **Error** objects based on the new error.  
     *   
     *  Some properties and methods return warnings that appear as **Error** objects in the **Errors** collection but do not halt a program's execution. Before you call the [Resync](./resync-method.md), [UpdateBatch](./updatebatch-method.md), or [CancelBatch](./cancelbatch-method-ado.md) methods on a [Recordset](./recordset-object-ado.md) object; the [Open](./open-method-ado-connection.md) method on a [Connection](./connection-object-ado.md) object; or set the [Filter](./filter-property.md) property on a **Recordset** object, call the **Clear** method on the **Errors** collection. That way, you can read the [Count](./count-property-ado.md) property of the **Errors** collection to test for returned warnings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clear-method-ado
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
