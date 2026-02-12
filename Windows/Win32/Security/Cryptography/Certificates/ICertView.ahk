#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IEnumCERTVIEWCOLUMN.ahk
#Include .\IEnumCERTVIEWROW.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Allows properly authorized clients to create a customized or complete view of the Certificate Services database.
 * @see https://learn.microsoft.com/windows/win32/api//content/certview/nn-certview-icertview
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertView extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertView
     * @type {Guid}
     */
    static IID => Guid("{c3fac344-1e84-11d1-9bd6-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenConnection", "EnumCertViewColumn", "GetColumnCount", "GetColumnIndex", "SetResultColumnCount", "SetResultColumn", "SetRestriction", "OpenView"]

    /**
     * Establishes a connection with a Certificate Services server.
     * @remarks
     * Upon successful completion of this method, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-icertview">ICertView</a> object will have a connection to the Certificate Services server specified in the  <i>strConfig</i> parameter.
     * 
     *  To close the connection, call the <b>Release</b> function.
     * @param {BSTR} strConfig Represents a valid configuration string for the Certificate Services server. The configuration string is in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the server's network name, and CANAME is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-openconnection
     */
    OpenConnection(strConfig) {
        if(strConfig is String) {
            pin := BSTR.Alloc(strConfig)
            strConfig := pin.Value
        }

        result := ComCall(7, this, "ptr", strConfig, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains an instance of a column-enumeration sequence for the database schema.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a> object can be used to enumerate the view's columns and retrieve each column's information.
     * @param {Integer} fResultColumn 
     * @returns {IEnumCERTVIEWCOLUMN} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a> type. This method fails if the <i>ppenum</i> parameter is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-enumcertviewcolumn
     */
    EnumCertViewColumn(fResultColumn) {
        result := ComCall(8, this, "int", fResultColumn, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumCERTVIEWCOLUMN(ppenum)
    }

    /**
     * Retrieves the number of columns in the view of the Certificate Services database.
     * @remarks
     * This method is used to determine the number of columns in the view. The returned number  represents the count of a result set's columns if <i>fResultColumn</i> is <b>TRUE</b> or the count of the full database schema's columns if <i>fResultColumn</i> is <b>FALSE</b>.
     * @param {Integer} fResultColumn 
     * @param {Pointer<Integer>} pcColumn A pointer to a variable that contains the number of columns in the view. This function will fail if the <i>pcColumn</i> parameter is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK, and the <i>pcColumn</i> parameter is set to the number of columns in the view.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the number of columns in the view.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-getcolumncount
     */
    GetColumnCount(fResultColumn, pcColumn) {
        pcColumnMarshal := pcColumn is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", fResultColumn, pcColumnMarshal, pcColumn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the zero-based index of a column.
     * @remarks
     * This method is used to determine the index of the column specified by the <i>strColumnName</i> parameter. The column indices are zero-based (the first column is index zero).
     * @param {Integer} fResultColumn 
     * @param {BSTR} strColumnName A string that contains the nonlocalized name of a column in the view.
     * @param {Pointer<Integer>} pColumnIndex The address of a variable that will contain the index of the column specified in the <i>strColumnName</i> parameter. This method fails if <i>pColumnIndex</i> is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the zero-based index of the column.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-getcolumnindex
     */
    GetColumnIndex(fResultColumn, strColumnName, pColumnIndex) {
        if(strColumnName is String) {
            pin := BSTR.Alloc(strColumnName)
            strColumnName := pin.Value
        }

        pColumnIndexMarshal := pColumnIndex is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", fResultColumn, "ptr", strColumnName, pColumnIndexMarshal, pColumnIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the maximum number of columns for the result set of a customized view of the Certificate Services database.
     * @remarks
     * Before calling the <b>SetResultColumnCount</b> method, it is necessary to establish a connection with a Certificate Services server by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">OpenConnection</a> method first. After the connection is established, this method can be called once, and only once, to specify the maximum number of columns in the result set.
     * 
     * If the <i>cResultColumn</i> parameter is set to a positive number (not one of the predefined constants), the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-setresultcolumn">SetResultColumn</a> method must be called to specify which  columns to include in the  result set. Note that <b>SetResultColumn</b> fails if it is called more than the number of columns specified by <b>SetResultColumnCount</b>.
     * @param {Integer} cResultColumn Specifies the maximum number of columns in the result set. This parameter can be set to a positive number, or to zero if you are only interested in counting the rows of the Certificate Services database, or to one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_COLUMN_LOG_DEFAULT"></a><a id="cv_column_log_default"></a><dl>
     * <dt><b>CV_COLUMN_LOG_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of columns in the result set will be the number of columns in the Certificate Services' default result set for requests that have been resolved. A request is resolved if it has resulted in an issued certificate or a failed request; revoked certificates are considered resolved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_COLUMN_LOG_FAILED_DEFAULT"></a><a id="cv_column_log_failed_default"></a><dl>
     * <dt><b>CV_COLUMN_LOG_FAILED_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of columns in the result set will be the number of columns in the Certificate Services' default result set for requests that have failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_COLUMN_QUEUE_DEFAULT"></a><a id="cv_column_queue_default"></a><dl>
     * <dt><b>CV_COLUMN_QUEUE_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of columns in the result set will be the number of columns in the Certificate Services' default result set for requests that have not been resolved.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-setresultcolumncount
     */
    SetResultColumnCount(cResultColumn) {
        result := ComCall(11, this, "int", cResultColumn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies a column for the result set of a customized view of the Certificate Services database.
     * @remarks
     * Before calling the <b>SetResultColumn</b> method, the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-setresultcolumncount">SetResultColumnCount</a> method must be called to specify how many columns will be in the result set. Calls to the <b>SetResultColumn</b> method will fail under the following conditions:
     * 
     * <ul>
     * <li>The number of columns has not been specified.</li>
     * <li><b>SetResultColumn</b> is called more times than the number of columns specified by the call to <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-setresultcolumncount">SetResultColumnCount</a>.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-setresultcolumncount">SetResultColumnCount</a> specified a predefined set of columns.  This method specifies a predefined set of columns when its <i>cResultColumnCount</i> parameter is one of the following values:<ul>
     * <li>CV_COLUMN_LOG_DEFAULT</li>
     * <li>CV_COLUMN_LOG_FAILED_DEFAULT</li>
     * <li>CV_COLUMN_QUEUE_DEFAULT</li>
     * </ul>
     * </li>
     * </ul>
     * After a column is specified, an optional call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-setrestriction">SetRestriction</a> method can be used to specify sorting and qualifying restrictions for the column.
     * 
     * The <b>SetResultColumn</b> method must be called for each column that is needed in the result set. On successful completion of these calls, the columns specified in each call will be included in the result set when the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openview">OpenView</a> method is called.
     * @param {Integer} ColumnIndex A zero-based index of a column to include in the result set.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-setresultcolumn
     */
    SetResultColumn(ColumnIndex) {
        result := ComCall(12, this, "int", ColumnIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the sorting and qualifying restrictions on a column.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-icertview">ICertView</a> object maintains an array of restrictions, allowing each column to contain any number of restrictions. After the column restrictions are established, a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openview">ICertView::OpenView</a> method will retrieve the data, with each column's restrictions used as part of the database query.
     * 
     * Before the <b>SetRestriction</b> method is called, it is necessary to establish a connection with the Certificate Service server by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">ICertView::OpenConnection</a> method.
     * @param {Integer} ColumnIndex A valid column index number for the view or a predefined column specifier. If the <i>ColumnIndex</i> parameter is not negative, this value represents the zero-based index of the column that is receiving the restriction.
     * @param {Integer} SeekOperator 
     * @param {Integer} SortOrder Specifies the sort order for the column. Indexed columns with zero or one restriction can include a sort order of  CVR_SORT_ASCEND or CVR_SORT_DESCEND. Nonindexed columns or columns with two or more restrictions  must use CVR_SORT_NONE.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CVR_SORT_ASCEND"></a><a id="cvr_sort_ascend"></a><dl>
     * <dt><b>CVR_SORT_ASCEND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ascending
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CVR_SORT_DESCEND"></a><a id="cvr_sort_descend"></a><dl>
     * <dt><b>CVR_SORT_DESCEND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Descending
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CVR_SORT_NONE"></a><a id="cvr_sort_none"></a><dl>
     * <dt><b>CVR_SORT_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No sort order
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<VARIANT>} pvarValue Specifies the data query qualifier applied to this column. This parameter, along with the <i>SeekOperator</i> parameter, determines which data is returned to the Certificate Services view.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-setrestriction
     */
    SetRestriction(ColumnIndex, SeekOperator, SortOrder, pvarValue) {
        result := ComCall(13, this, "int", ColumnIndex, "int", SeekOperator, "int", SortOrder, "ptr", pvarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Opens a view to a Certificate Services database and instantiates an instance of an IEnumCERTVIEWROW object.
     * @remarks
     * Before calling the <b>OpenView</b> method, it is necessary to establish a connection with a Certificate Services server by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">OpenConnection</a> method first.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewrow">IEnumCERTVIEWROW</a> object returned by this call represents a row-enumeration sequence whose internal index is pointing to the beginning of the sequence. To look at the first row in the sequence, call the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-next">IEnumCERTVIEWROW::Next</a> method, which moves the internal index to the first row.
     * 
     * To view a nondefault column set or a subset of the rows, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-setresultcolumncount">SetResultColumnCount</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-setresultcolumn">SetResultColumn</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-setrestriction">SetRestriction</a> after calling <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">OpenConnection</a> and before calling <b>OpenView</b>.
     * @returns {IEnumCERTVIEWROW} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewrow">IEnumCERTVIEWROW</a> type.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-openview
     */
    OpenView() {
        result := ComCall(14, this, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumCERTVIEWROW(ppenum)
    }
}
