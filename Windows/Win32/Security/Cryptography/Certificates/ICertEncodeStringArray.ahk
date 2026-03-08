#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling string arrays used in certificate extensions.
 * @see https://learn.microsoft.com/windows/win32/api/certenc/nn-certenc-icertencodestringarray
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeStringArray extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeStringArray
     * @type {Guid}
     */
    static IID => Guid("{12a88820-7494-11d0-8816-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetStringType", "GetCount", "GetValue", "Reset", "SetValue", "Encode"]

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded string array and stores the resulting array of strings in the CertEncodeStringArray object.
     * @remarks
     * This method will place the decoded contents of <i>strBinary</i> into the object's array of strings. If the object's array already contains strings, this existing content will be freed, and the array will be loaded with the decoded values.
     * @param {BSTR} strBinary An ASN.1-encoded string array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * Returns the type of string values that the string array contains.
     * @remarks
     * The following table lists the types of strings that the string array can  contain. For more information about RDN types, see the CryptoAPI 2.0 documents.
     * 
     * <table>
     * <tr>
     * <th>String type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>CERT_RDN_ANY_TYPE</td>
     * <td>For encoding an X509_UNICODE_NAME name.</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_NUMERIC_STRING</td>
     * <td>The numerals 0 through 9 and the space character (8 bit).</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_PRINTABLE_STRING</td>
     * <td>Printable characters (8 bit).</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_T61_STRING</td>
     * <td>T.61 encoded characters (8 bit).</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_VIDEOTEX_STRING</td>
     * <td>VIDEOTEX characters.</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_IA5_STRING</td>
     * <td>IA5 (ASCII) characters.</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_GRAPHIC_STRING</td>
     * <td>A string of ISO-defined GRAPHIC characters.</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_ISO646_STRING</td>
     * <td>128 character set (8 bit).</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_GENERAL_STRING</td>
     * <td>A string of ISO-defined GENERAL characters.</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_INT4_STRING</td>
     * <td>An array of INT4 values (32 bit).</td>
     * </tr>
     * <tr>
     * <td>CERT_RDN_UNICODE_STRING</td>
     * <td><a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> characters (16 bit).</td>
     * </tr>
     * </table>
     * @returns {Integer} A pointer to a <b>Long</b> that  represents the string type. For a list of string types, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-getstringtype
     */
    GetStringType() {
        result := ComCall(8, this, "int*", &pStringType := 0, "HRESULT")
        return pStringType
    }

    /**
     * Returns the number of string values in the string array.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives the number of string values contained in the string array.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-getcount
     */
    GetCount() {
        result := ComCall(9, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Returns the specified string from the string array.
     * @param {Integer} Index The zero-based index that specifies the string to retrieve.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that represents the string value. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-getvalue
     */
    GetValue(Index) {
        pstr := BSTR()
        result := ComCall(10, this, "int", Index, "ptr", pstr, "HRESULT")
        return pstr
    }

    /**
     * Specifies the size of the string array and the type of strings the array will contain.
     * @param {Integer} Count Specifies the number of elements in the string array.
     * @param {Integer} StringType 
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-reset
     */
    Reset(Count, StringType) {
        result := ComCall(11, this, "int", Count, "int", StringType, "HRESULT")
        return result
    }

    /**
     * Sets a string value at the specified index of the string array.
     * @param {Integer} Index The zero-based index that specifies the element of the string array to set.
     * @param {BSTR} str Specifies the string value to set.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-setvalue
     */
    SetValue(Index, str) {
        str := str is String ? BSTR.Alloc(str).Value : str

        result := ComCall(12, this, "int", Index, "ptr", str, "HRESULT")
        return result
    }

    /**
     * Returns an ASN.1-encoded string of the string array stored in this object.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the encoded string array. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-encode
     */
    Encode() {
        pstrBinary := BSTR()
        result := ComCall(13, this, "ptr", pstrBinary, "HRESULT")
        return pstrBinary
    }
}
