#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling Long arrays used in certificate extensions.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nn-certenc-icertencodelongarray
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeLongArray extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeLongArray
     * @type {Guid}
     */
    static IID => Guid("{15e2f230-a0a2-11d0-8821-00a0c903b83c}")

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
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded Long array and stores the resulting array of Long values in the CertEncodeLongArray object.
     * @remarks
     * This method places the decoded contents of <i>strBinary</i> into the object's array of <b>Long</b> values. If the object's array already contains <b>Long</b> values, the existing content will be freed, and the array will be loaded with the decoded values.
     * @param {BSTR} strBinary An ASN.1-encoded <b>Long</b> array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodelongarray-decode
     */
    Decode(strBinary) {
        if(strBinary is String) {
            pin := BSTR.Alloc(strBinary)
            strBinary := pin.Value
        }

        result := ComCall(7, this, "ptr", strBinary, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the number of Long values in the object's Long array.
     * @returns {Integer} A pointer to a <b>Long</b> that receives the number of <b>Long</b> values contained in the <b>Long</b> array.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodelongarray-getcount
     */
    GetCount() {
        result := ComCall(8, this, "int*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * Returns the specified Long value from the Long array.
     * @param {Integer} Index The zero-based index that specifies the <b>Long</b> value to retrieve.
     * @returns {Integer} A pointer to a <b>Long</b> variable that receives the value.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodelongarray-getvalue
     */
    GetValue(Index) {
        result := ComCall(9, this, "int", Index, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies the size of the array in this object.
     * @param {Integer} Count Specifies the number of elements in the <b>Long</b> array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodelongarray-reset
     */
    Reset(Count) {
        result := ComCall(10, this, "int", Count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a Long value at the specified index of the Long array.
     * @param {Integer} Index The zero-based index that specifies the index of the array element to set.
     * @param {Integer} Value Specifies the <b>Long</b> value to set.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodelongarray-setvalue
     */
    SetValue(Index, Value) {
        result := ComCall(11, this, "int", Index, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns an ASN.1-encoded string of the LONG array stored in this object.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the encoded <b>LONG</b> array. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodelongarray-encode
     */
    Encode() {
        pstrBinary := BSTR()
        result := ComCall(12, this, "ptr", pstrBinary, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrBinary
    }
}
