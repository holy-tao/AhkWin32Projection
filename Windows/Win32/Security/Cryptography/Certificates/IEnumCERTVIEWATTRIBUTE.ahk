#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumCERTVIEWATTRIBUTE.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an attribute-enumeration sequence that contains the certificate attributes for the current row of the row-enumeration sequence.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-ienumcertviewattribute
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWATTRIBUTE extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCERTVIEWATTRIBUTE
     * @type {Guid}
     */
    static IID => Guid("{e77db656-7653-11d1-9bde-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "GetName", "GetValue", "Skip", "Reset", "Clone"]

    /**
     * Moves to the next attribute in the attribute-enumeration sequence.
     * @param {Pointer<Integer>} pIndex A pointer to a variable that contains the index value of the next <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> being referenced. If there are no more attributes to enumerate, this variable is set to –1. This method fails if <i>pIndex</i> is <b>NULL</b>.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and  the next attribute is now being referenced by the attribute-enumeration sequence.  If there are no more attributes, the method returns S_FALSE, and <i>pIndex</i> is set to a value of –1.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is the index value of the attribute that is now referenced by the attribute-enumeration sequence. If there are no more attributes to enumerate, the return value is –1.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewattribute-next
     */
    Next(pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the current attribute in the attribute-enumeration sequence.
     * @param {Pointer<BSTR>} pstrOut A pointer to a variable of <b>BSTR</b> type that contains the name of the attribute.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the <i>pstrOut</i> parameter contains the name of the <a href="/windows/desktop/SecGloss/a-gly">attribute</a>.
     * 
     * To use this method, create a variable of <b>BSTR</b> type, set the variable equal to <b>NULL</b>, and pass the address of this variable as <i>pstrOut</i>. When you have finished using the <b>BSTR</b>, free it by calling the <a href="/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>String</b> that contains the name of the attribute.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewattribute-getname
     */
    GetName(pstrOut) {
        result := ComCall(8, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the current attribute in the attribute-enumeration sequence.
     * @param {Pointer<BSTR>} pstrOut A pointer to a <b>BSTR</b> type that contains the value of the attribute.
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK and the <i>pstrOut</i> is set to the value of the current attribute.
     * 
     * To use this method, create a variable of <b>BSTR</b> type, set the variable equal to <b>NULL</b>, and pass the address of this variable as <i>pstrOut</i>. When you have finished using the <b>BSTR</b>, free it by calling the <a href="/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <h3>VB</h3>
     *  The return value is a <b>String</b> that represents the value of the current attribute.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewattribute-getvalue
     */
    GetValue(pstrOut) {
        result := ComCall(9, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of attributes in the attribute-enumeration sequence.
     * @param {Integer} celt The number of attributes to skip. A positive value for the <i>celt</i> parameter  causes the attribute-enumeration sequence to skip forward in the sequence. A negative value for the <i>celt</i> parameter causes the attribute-enumeration sequence to skip backward in the sequence.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * A return value of E_INVALIDARG indicates that a negative value for the <i>celt</i> parameter caused the attribute-enumeration sequence index to become less than zero.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewattribute-skip
     */
    Skip(celt) {
        result := ComCall(10, this, "int", celt, "HRESULT")
        return result
    }

    /**
     * Moves to the beginning of the attribute-enumeration sequence.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewattribute-reset
     */
    Reset() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the attribute-enumeration sequence object in its current state.
     * @returns {IEnumCERTVIEWATTRIBUTE} A pointer to a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewattribute">IEnumCERTVIEWATTRIBUTE</a> type. This function will fail if <i>ppenum</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-ienumcertviewattribute-clone
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCERTVIEWATTRIBUTE(ppenum)
    }
}
