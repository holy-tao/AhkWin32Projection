#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling Date arrays used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodedatearray
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeDateArray extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeDateArray
     * @type {Guid}
     */
    static IID => Guid("{2f9469a0-a470-11d0-8821-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetCount", "GetValue", "Reset", "SetValue", "Encode"]

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded date array and stores the resulting array of date values in the CertEncodeDateArray object.
     * @param {BSTR} strBinary An ASN.1-encoded <b>DATE</b> array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodedatearray-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * Returns the number of DATE values in the object's DATE array.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives the number of <b>DATE</b> values contained in the <b>DATE</b> array.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodedatearray-getcount
     */
    GetCount() {
        result := ComCall(8, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Returns the specified date from the DATE array.
     * @param {Integer} Index The zero-based index that specifies the date to retrieve.
     * @returns {Float} A pointer to a <b>DATE</b> variable that receives the date.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodedatearray-getvalue
     */
    GetValue(Index) {
        result := ComCall(9, this, "int", Index, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies the size of DATE array in this object.
     * @param {Integer} Count Specifies the number of elements in the <b>DATE</b> array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodedatearray-reset
     */
    Reset(Count) {
        result := ComCall(10, this, "int", Count, "HRESULT")
        return result
    }

    /**
     * Sets a DATE value at the specified index of the DATE array.
     * @param {Integer} Index The zero-based index that specifies the index of the date element to set.
     * @param {Float} Value Specifies the <b>DATE</b> value to set.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodedatearray-setvalue
     */
    SetValue(Index, Value) {
        result := ComCall(11, this, "int", Index, "double", Value, "HRESULT")
        return result
    }

    /**
     * Returns an Abstract Syntax Notation One (ASN.1)-encoded string of the date array stored in this object.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the encoded <b>Date</b> array. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodedatearray-encode
     */
    Encode() {
        pstrBinary := BSTR()
        result := ComCall(12, this, "ptr", pstrBinary, "HRESULT")
        return pstrBinary
    }
}
