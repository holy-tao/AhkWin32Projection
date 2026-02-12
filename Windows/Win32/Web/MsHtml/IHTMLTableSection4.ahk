#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTableSection4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTableSection4
     * @type {Guid}
     */
    static IID => Guid("{305106c5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ch", "get_ch", "put_chOff", "get_chOff", "insertRow", "deleteRow"]

    /**
     * @type {BSTR} 
     */
    ch {
        get => this.get_ch()
        set => this.put_ch(value)
    }

    /**
     * @type {BSTR} 
     */
    chOff {
        get => this.get_chOff()
        set => this.put_chOff(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ch(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ch() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_chOff(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(9, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_chOff() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * insertRow Method (SQLServerResultSet)
     * @remarks
     * This insertRow method is specified by the insertRow method in the java.sql.ResultSet interface.  
     *   
     *  The cursor must be on the insert row when this method is called. After this method is called, the cursor remains on the insert row and the result set remains in insert mode.
     * @param {Integer} index 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/insertrow-method-sqlserverresultset
     */
    insertRow(index) {
        result := ComCall(11, this, "int", index, "ptr*", &row := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(row)
    }

    /**
     * deleteRow Method (SQLServerResultSet)
     * @remarks
     * This deleteRow method is specified by the deleteRow method in the java.sql.ResultSet interface.  
     *   
     *  This method cannot be called when the cursor is on the insert row.  
     *   
     *  When using keyset cursors, this method leaves a gap in the result set. You can test for this gap by using the [rowDeleted](../../../connect/jdbc/reference/rowdeleted-method-sqlserverresultset.md) method. The row numbers of the rows in the result set do not change.
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/deleterow-method-sqlserverresultset
     */
    deleteRow(index) {
        result := ComCall(12, this, "int", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
