#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumCERTVIEWCOLUMN.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a column-enumeration sequence that contains the column data for the current row of the enumeration sequence.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-ienumcertviewcolumn
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWCOLUMN extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCERTVIEWCOLUMN
     * @type {Guid}
     */
    static IID => Guid("{9c735be2-57a5-11d1-9bdb-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "GetName", "GetDisplayName", "GetType", "IsIndexed", "GetMaxLength", "GetValue", "Skip", "Reset", "Clone"]

    /**
     * Moves to the next column in the column-enumeration sequence.
     * @param {Pointer<Integer>} pIndex A pointer to a variable that  contains the index value of the next column referenced by the column-enumeration sequence. If there are no more columns to enumerate, this variable is set to –1. This method will fail if <i>pIndex</i> is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the next column in the column-enumeration sequence is now being referenced. If there are no more columns to enumerate, the method returns S_FALSE, and the <i>pIndex</i> parameter is set to a value of –1.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the index value of the column that is now referenced by the column-enumeration sequence. If there are no more columns to enumerate, the return value is –1.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-next
     */
    Next(pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * Retrieves the nonlocalized name of the current column in the column-enumeration sequence.
     * @param {Pointer<BSTR>} pstrOut A pointer to a variable of <b>BSTR</b> type that  contains the name of the column.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK  and the <i>pstrOut</i> parameter contains the name of the column.
     * 
     * To use this method, create a variable of <b>BSTR</b> type, set the variable equal to <b>NULL</b>, and pass the address of this variable as <i>pstrOut</i>. When you have finished using the <b>BSTR</b>, free it by calling the <a href="/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>String</b> that contains the name of the column.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-getname
     */
    GetName(pstrOut) {
        result := ComCall(8, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * Retrieves the localized name of the current column in the column-enumeration sequence.
     * @param {Pointer<BSTR>} pstrOut A pointer to a variable of <b>BSTR</b> type that contains the localized name of the column.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the <i>pstrOut</i> parameter contains the localized name of the column.
     * 
     * To use this method, create a variable of <b>BSTR</b> type, set the variable equal to <b>NULL</b>, and pass the address of this variable as <i>pstrOut</i>. When you have finished using the <b>BSTR</b>, free it by calling the <a href="/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>String</b> that contains the localized name of the column.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-getdisplayname
     */
    GetDisplayName(pstrOut) {
        result := ComCall(9, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * Retrieves the data type of the current column in the column-enumeration sequence.
     * @param {Pointer<Integer>} pType A pointer to a variable of <b>LONG</b> type that denotes the data type of the column referenced by the column-enumeration sequence.  For a table of the valid data types, see Remarks. This method  fails if the <i>pType</i> parameter is set to <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value represents the data type of the column. For a table of the valid data types, see Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-gettype
     */
    GetType(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * Reports whether the data in the column is indexed.
     * @param {Pointer<Integer>} pIndexed A pointer to a variable of type <b>LONG</b> that indicates <b>TRUE</b> if the data is indexed and <b>FALSE</b> if the data is not indexed. This method fails if <i>pIndexed</i> is set to <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the <i>pIndexed</i> is set to <b>TRUE</b> or <b>FALSE</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  One if the column is indexed; otherwise, zero.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-isindexed
     */
    IsIndexed(pIndexed) {
        pIndexedMarshal := pIndexed is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pIndexedMarshal, pIndexed, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum allowable length, in bytes, for the column data.
     * @param {Pointer<Integer>} pMaxLength A pointer to a value of <b>LONG</b> type  that  contains the maximum allowable length for the column data. This function will fail if <i>pMaxLength</i> is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the <i>pMaxLength</i> is set to the  maximum allowable length for the column data.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the maximum allowable length, in bytes, for the column data.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-getmaxlength
     */
    GetMaxLength(pMaxLength) {
        pMaxLengthMarshal := pMaxLength is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pMaxLengthMarshal, pMaxLength, "HRESULT")
        return result
    }

    /**
     * Retrieves the data value contained in the current column in the column-enumeration sequence.
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarValue A pointer to value of <b>VARIANT</b> type that contains the data column. This method fails if <i>pvarValue</i> is <b>NULL</b>. Upon successful completion of this method, <i>pvarValue</i> contains the data in the  column. The caller is responsible for calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> when done with this data.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>Variant</b> that represents the data in the column.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-getvalue
     */
    GetValue(Flags, pvarValue) {
        result := ComCall(13, this, "int", Flags, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of columns in the column-enumeration sequence.
     * @param {Integer} celt The number of columns to skip. A positive value for the <i>celt</i> parameter causes the column-enumeration sequence to skip forward in the enumeration sequence. A negative value causes column-enumeration to skip backward in the enumeration sequence.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * A return value of E_INVALIDARG indicates that a negative value in the   <i>celt</i> parameter caused the column-enumeration sequence index to become less than zero.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-skip
     */
    Skip(celt) {
        result := ComCall(14, this, "int", celt, "HRESULT")
        return result
    }

    /**
     * Moves to the beginning of the column-enumeration sequence.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-reset
     */
    Reset() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the column-enumeration sequence.
     * @returns {IEnumCERTVIEWCOLUMN} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a> type. This method will fail if the <i>ppenum</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewcolumn-clone
     */
    Clone() {
        result := ComCall(16, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCERTVIEWCOLUMN(ppenum)
    }
}
