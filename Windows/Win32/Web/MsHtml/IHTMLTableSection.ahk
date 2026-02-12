#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLElementCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTableSection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTableSection
     * @type {Guid}
     */
    static IID => Guid("{3050f23b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTableSection
     * @type {Guid}
     */
    static CLSID => Guid("{3050f2e9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_align", "get_align", "put_vAlign", "get_vAlign", "put_bgColor", "get_bgColor", "get_rows", "insertRow", "deleteRow"]

    /**
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {BSTR} 
     */
    vAlign {
        get => this.get_vAlign()
        set => this.put_vAlign(value)
    }

    /**
     * @type {VARIANT} 
     */
    bgColor {
        get => this.get_bgColor()
        set => this.put_bgColor(value)
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    rows {
        get => this.get_rows()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
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
    get_align() {
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
    put_vAlign(v) {
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
    get_vAlign() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_rows() {
        result := ComCall(13, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
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
        result := ComCall(14, this, "int", index, "ptr*", &row := 0, "int")
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
        result := ComCall(15, this, "int", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
