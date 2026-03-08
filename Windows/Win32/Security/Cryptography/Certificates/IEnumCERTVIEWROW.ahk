#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumCERTVIEWCOLUMN.ahk
#Include .\IEnumCERTVIEWATTRIBUTE.ahk
#Include .\IEnumCERTVIEWEXTENSION.ahk
#Include .\IEnumCERTVIEWROW.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a row-enumeration sequence that contains the data in the rows of the Certificate Services view, allowing further access to the columns, attributes, and extensions associated with each row.
 * @see https://learn.microsoft.com/windows/win32/api/certview/nn-certview-ienumcertviewrow
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWROW extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCERTVIEWROW
     * @type {Guid}
     */
    static IID => Guid("{d1157f4c-5af2-11d1-9bdc-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "EnumCertViewColumn", "EnumCertViewAttribute", "EnumCertViewExtension", "Skip", "Reset", "Clone", "GetMaxIndex"]

    /**
     * Moves to the next row in the row-enumeration sequence.
     * @remarks
     * Upon successful completion of this method, the 
     * columns, attributes, and extensions associated with the certificate in the row can be enumerated using the methods of the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewattribute">IEnumCERTVIEWATTRIBUTE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewextension">IEnumCERTVIEWEXTENSION</a>
     * </li>
     * </ul>
     * Looping through all the  rows in the enumeration sequence can be resource-intensive to compute, depending of the query involved and the  size of the sequence.
     * @param {Pointer<Integer>} pIndex A pointer to a variable that contains the index value of the next row being  referenced. If there are no more rows to enumerate, this variable will be set to –1. This method fails if <i>pIndex</i> is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the next row is now being referenced by the row-enumeration sequence. If there are no more rows to enumerate, S_FALSE is returned, and <i>pIndex</i> is set to a value of –1.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the index value of the  row that is now being referenced by the row-enumeration sequence. If there are no more rows to enumerate, the return value is –1.
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewrow-next
     */
    Next(pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * Obtains an instance of a column-enumeration sequence for the current row of the row-enumeration sequence.
     * @remarks
     * The 
     * column-enumeration sequence obtained by this call can be used to enumerate the columns associated with the certificate in the current row. This enumeration can be accessed through the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a> interface.
     * 
     * To reference a different row, call one of the following methods to navigate through the row-enumeration sequence:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-reset">IEnumCERTVIEWROW::Reset</a>: Moves to the beginning of the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-next">IEnumCERTVIEWROW::Next</a>: Moves to the next row in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-skip">IEnumCERTVIEWROW::Skip</a>: Skips a specified number of rows.</li>
     * </ul>
     * @returns {IEnumCERTVIEWCOLUMN} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a> type.
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewrow-enumcertviewcolumn
     */
    EnumCertViewColumn() {
        result := ComCall(8, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCERTVIEWCOLUMN(ppenum)
    }

    /**
     * Obtains an instance of an attribute-enumeration sequence for the current row of the row-enumeration sequence.
     * @remarks
     * The 
     * attribute-enumeration sequence obtained by this call can be used to enumerate the attributes associated with the certificate in the current row. This enumeration can be accessed through the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewattribute">IEnumCERTVIEWATTRIBUTE</a> interface.
     * 
     * To reference a different row, call one of the following methods to navigate through the row-enumeration sequence:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-reset">IEnumCERTVIEWROW::Reset</a>: Moves to the beginning of the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-next">IEnumCERTVIEWROW::Next</a>: Moves to the next row in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-skip">IEnumCERTVIEWROW::Skip</a>: Skips a specified number of rows.</li>
     * </ul>
     * @param {Integer} Flags <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * A <b>LONG</b> value. Must be zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * A <b>Long</b> value. Must be zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IEnumCERTVIEWATTRIBUTE} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewattribute">IEnumCERTVIEWATTRIBUTE</a> type. Upon successful completion of this method, <i>ppenum</i> is set to a pointer of <b>IEnumCERTVIEWATTRIBUTE</b> type.
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewrow-enumcertviewattribute
     */
    EnumCertViewAttribute(Flags) {
        result := ComCall(9, this, "int", Flags, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCERTVIEWATTRIBUTE(ppenum)
    }

    /**
     * Obtains an instance of an extension-enumeration sequence for the current row of the row-enumeration sequence.
     * @remarks
     * The 
     * extension-enumeration sequence obtained by this call can be used to enumerate the extensions associated with the certificate in the current row. This enumeration can be accessed through the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewextension">IEnumCERTVIEWEXTENSION</a> interface.
     * 
     * To reference a different row, call one of the following methods to navigate through the row-enumeration sequence:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-reset">IEnumCERTVIEWROW::Reset</a>: Moves to the beginning of the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-next">IEnumCERTVIEWROW::Next</a>: Moves to the next row in the enumeration sequence.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-skip">IEnumCERTVIEWROW::Skip</a>: Skips a specified number of rows.</li>
     * </ul>
     * @param {Integer} Flags <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * A <b>LONG</b> value. Must be zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * A <b>Long</b> value. Must be zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IEnumCERTVIEWEXTENSION} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewextension">IEnumCERTVIEWEXTENSION</a> type.
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewrow-enumcertviewextension
     */
    EnumCertViewExtension(Flags) {
        result := ComCall(10, this, "int", Flags, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCERTVIEWEXTENSION(ppenum)
    }

    /**
     * Skips a specified number of rows in the row enumeration sequence.
     * @remarks
     * Upon successful completion of this method, call  the 
     * <b>IEnumCERTVIEWROW::Skip</b> method to reference the current row in the row-enumeration sequence. After this second call is made, the 
     * columns, attributes, and extensions associated with the certificate in the row can be enumerated using the methods of the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewattribute">IEnumCERTVIEWATTRIBUTE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewextension">IEnumCERTVIEWEXTENSION</a>
     * </li>
     * </ul>
     * The row-enumeration sequence maintains an internal  zero-based index. The call to the <b>Skip</b> method causes this index to increase or decrease based on the setting of the <i>celt</i> parameter.
     * 
     * If a negative value of the <i>celt</i> parameter causes the index to be less than zero, the behavior of subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-next">Next</a> is undefined.
     * 
     * If a positive value of the <i>celt</i> parameter causes the index to exceed the last row in the enumeration sequence, a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-next">Next</a> method will fail.
     * @param {Integer} celt The number of rows to skip. A positive value for the <i>celt</i> parameter causes the row-enumeration sequence to skip forward in the enumeration sequence. A negative value for the <i>celt</i> parameter causes the row enumeration sequence to skip backward in the enumeration sequence.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * A return value of E_INVALIDARG indicates that the <i>celt</i> parameter was set to a negative number which caused the row-enumeration sequence  index to become less than zero.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewrow-skip
     */
    Skip(celt) {
        result := ComCall(11, this, "int", celt, "HRESULT")
        return result
    }

    /**
     * Moves to the beginning of the row-enumeration sequence.
     * @remarks
     * Upon successful completion of this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-next">IEnumCERTVIEWROW::Next</a> method to reference the first row in the enumeration. 
     * 
     * After this second call is made, the 
     * columns, attributes, and extensions associated with the certificate in the row can be enumerated using the methods of the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewattribute">IEnumCERTVIEWATTRIBUTE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewextension">IEnumCERTVIEWEXTENSION</a>
     * </li>
     * </ul>
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewrow-reset
     */
    Reset() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Represents a row-enumeration sequence that contains the data in the rows of the Certificate Services view, allowing further access to the columns, attributes, and extensions associated with each row.
     * @returns {IEnumCERTVIEWROW} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nn-certview-ienumcertviewrow
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCERTVIEWROW(ppenum)
    }

    /**
     * Retrieves the maximum valid index value after all the rows in the row-enumeration sequence have been referenced.
     * @remarks
     * Successful completion of this method is dependent on reaching the last row of the enumeration sequence. The maximum row index can be useful to size a scroll bar or display window, but it can also be resource-intensive to compute because it requires evaluating the entire query. For some queries, column data for each row must be examined to determine whether it is included in the view. After the user has paged through all of the data or explicitly requested to proceed to the end, the maximum row index is preserved.
     * 
     * To navigate through the row-enumeration sequence, call the following methods.
     * 
     * <table>
     * <tr>
     * <th>Method</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-reset">IEnumCERTVIEWROW::Reset</a>
     * </td>
     * <td>Moves to the beginning of the enumeration sequence.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-next">IEnumCERTVIEWROW::Next</a>
     * </td>
     * <td>Moves to the next row in the enumeration sequence.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-ienumcertviewrow-skip">IEnumCERTVIEWROW::Skip</a>
     * </td>
     * <td>Skips a specified number of rows.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pIndex A pointer to a <b>LONG</b> variable that contains the maximum index value for the row-enumeration sequence. This method fails if <i>pIndex</i> is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and <i>pIndex</i> is set to the maximum index value for the row-enumeration sequence.
     * 
     * If traversal to the last row has not occurred, this method fails with a return value of E_UNEXPECTED.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the maximum index value for the row-enumeration sequence. This method fails if traversal to the last row has not occurred.
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewrow-getmaxindex
     */
    GetMaxIndex(pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pIndexMarshal, pIndex, "HRESULT")
        return result
    }
}
