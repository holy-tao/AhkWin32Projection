#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLElementCollection.ahk
#Include .\IHTMLTableSection.ahk
#Include .\IHTMLTableCaption.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTable extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTable
     * @type {Guid}
     */
    static IID => Guid("{3050f21e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTable
     * @type {Guid}
     */
    static CLSID => Guid("{3050f26b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_cols", "get_cols", "put_border", "get_border", "put_frame", "get_frame", "put_rules", "get_rules", "put_cellSpacing", "get_cellSpacing", "put_cellPadding", "get_cellPadding", "put_background", "get_background", "put_bgColor", "get_bgColor", "put_borderColor", "get_borderColor", "put_borderColorLight", "get_borderColorLight", "put_borderColorDark", "get_borderColorDark", "put_align", "get_align", "refresh", "get_rows", "put_width", "get_width", "put_height", "get_height", "put_dataPageSize", "get_dataPageSize", "nextPage", "previousPage", "get_tHead", "get_tFoot", "get_tBodies", "get_caption", "createTHead", "deleteTHead", "createTFoot", "deleteTFoot", "createCaption", "deleteCaption", "insertRow", "deleteRow", "get_readyState", "put_onreadystatechange", "get_onreadystatechange"]

    /**
     * @type {Integer} 
     */
    cols {
        get => this.get_cols()
        set => this.put_cols(value)
    }

    /**
     * @type {VARIANT} 
     */
    border {
        get => this.get_border()
        set => this.put_border(value)
    }

    /**
     * @type {BSTR} 
     */
    frame {
        get => this.get_frame()
        set => this.put_frame(value)
    }

    /**
     * @type {BSTR} 
     */
    rules {
        get => this.get_rules()
        set => this.put_rules(value)
    }

    /**
     * @type {VARIANT} 
     */
    cellSpacing {
        get => this.get_cellSpacing()
        set => this.put_cellSpacing(value)
    }

    /**
     * @type {VARIANT} 
     */
    cellPadding {
        get => this.get_cellPadding()
        set => this.put_cellPadding(value)
    }

    /**
     * @type {BSTR} 
     */
    background {
        get => this.get_background()
        set => this.put_background(value)
    }

    /**
     * @type {VARIANT} 
     */
    bgColor {
        get => this.get_bgColor()
        set => this.put_bgColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColor {
        get => this.get_borderColor()
        set => this.put_borderColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColorLight {
        get => this.get_borderColorLight()
        set => this.put_borderColorLight(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColorDark {
        get => this.get_borderColorDark()
        set => this.put_borderColorDark(value)
    }

    /**
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    rows {
        get => this.get_rows()
    }

    /**
     * @type {VARIANT} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {VARIANT} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * @type {Integer} 
     */
    dataPageSize {
        get => this.get_dataPageSize()
        set => this.put_dataPageSize(value)
    }

    /**
     * @type {IHTMLTableSection} 
     */
    tHead {
        get => this.get_tHead()
    }

    /**
     * @type {IHTMLTableSection} 
     */
    tFoot {
        get => this.get_tFoot()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    tBodies {
        get => this.get_tBodies()
    }

    /**
     * @type {IHTMLTableCaption} 
     */
    caption {
        get => this.get_caption()
    }

    /**
     * @type {BSTR} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT} 
     */
    onreadystatechange {
        get => this.get_onreadystatechange()
        set => this.put_onreadystatechange(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_cols(v) {
        result := ComCall(7, this, "int", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_cols() {
        result := ComCall(8, this, "int*", &p := 0, "int")
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
    put_border(v) {
        result := ComCall(9, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_border() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "int")
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
    put_frame(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_frame() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "int")
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
    put_rules(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(13, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rules() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "int")
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
    put_cellSpacing(v) {
        result := ComCall(15, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_cellSpacing() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "int")
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
    put_cellPadding(v) {
        result := ComCall(17, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_cellPadding() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "int")
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
    put_background(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(19, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "int")
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
        result := ComCall(21, this, "ptr", v, "int")
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
        result := ComCall(22, this, "ptr", p, "int")
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
    put_borderColor(v) {
        result := ComCall(23, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColor() {
        p := VARIANT()
        result := ComCall(24, this, "ptr", p, "int")
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
    put_borderColorLight(v) {
        result := ComCall(25, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorLight() {
        p := VARIANT()
        result := ComCall(26, this, "ptr", p, "int")
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
    put_borderColorDark(v) {
        result := ComCall(27, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorDark() {
        p := VARIANT()
        result := ComCall(28, this, "ptr", p, "int")
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
    put_align(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(29, this, "ptr", v, "int")
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
        result := ComCall(30, this, "ptr", p, "int")
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
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/refreshrow-method-sqlserverresultset
     */
    refresh() {
        result := ComCall(31, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_rows() {
        result := ComCall(32, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(33, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "int")
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
    put_height(v) {
        result := ComCall(35, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(36, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_dataPageSize(v) {
        result := ComCall(37, this, "int", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_dataPageSize() {
        result := ComCall(38, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    nextPage() {
        result := ComCall(39, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    previousPage() {
        result := ComCall(40, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    get_tHead() {
        result := ComCall(41, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLTableSection(p)
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    get_tFoot() {
        result := ComCall(42, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLTableSection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_tBodies() {
        result := ComCall(43, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLTableCaption} 
     */
    get_caption() {
        result := ComCall(44, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLTableCaption(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    createTHead() {
        result := ComCall(45, this, "ptr*", &head := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(head)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteTHead() {
        result := ComCall(46, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    createTFoot() {
        result := ComCall(47, this, "ptr*", &foot := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(foot)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteTFoot() {
        result := ComCall(48, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IHTMLTableCaption} 
     */
    createCaption() {
        result := ComCall(49, this, "ptr*", &caption := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLTableCaption(caption)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteCaption() {
        result := ComCall(50, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
        result := ComCall(51, this, "int", index, "ptr*", &row := 0, "int")
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
        result := ComCall(52, this, "int", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_readyState() {
        p := BSTR()
        result := ComCall(53, this, "ptr", p, "int")
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
    put_onreadystatechange(v) {
        result := ComCall(54, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(55, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }
}
