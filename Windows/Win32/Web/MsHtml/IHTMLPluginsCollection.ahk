#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPluginsCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLPluginsCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f3fd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "refresh"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * refreshRow Method (SQLServerResultSet)
     * @remarks
     * This refreshRow method is specified by the refreshRow method in the java.sql.ResultSet interface.  
     *   
     *  This method cannot be called when the cursor is on the insert row.  
     *   
     *  This method provides a way for an application to explicitly tell the JDBC driver to refetch rows from the database. An application might need to call this method when the [!INCLUDE[jdbcNoVersion](../../../includes/jdbcnoversion_md.md)] is caching or prefetching to fetch the latest value of a row from the database. The JDBC driver might actually refresh multiple rows at the same time if the fetch size is greater than one.  
     *   
     *  All values are refetched subject to the transaction isolation level and cursor sensitivity. If this method is called after calling an updater method, but before calling the [updateRow](../../../connect/jdbc/reference/updaterow-method-sqlserverresultset.md) method, the updates made to the row are lost. Calling this method frequently will probably slow performance.
     * @param {VARIANT_BOOL} reload 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/refreshrow-method-sqlserverresultset
     */
    refresh(reload) {
        result := ComCall(8, this, "short", reload, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
