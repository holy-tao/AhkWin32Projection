#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling alternate names used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodealtname
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeAltName extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeAltName
     * @type {Guid}
     */
    static IID => Guid("{1c9a8c70-1271-11d1-9bd4-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetNameCount", "GetNameChoice", "GetName", "Reset", "SetNameEntry", "Encode"]

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded alternate name extension and stores the resulting array of strings in the CertEncodeAltName object.
     * @param {BSTR} strBinary Represents an ASN.1-encoded alternate name extension.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodealtname-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * Returns the number of names in the alternate name array.
     * @returns {Integer} The number of alternate names in the array.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodealtname-getnamecount
     */
    GetNameCount() {
        result := ComCall(8, this, "int*", &pNameCount := 0, "HRESULT")
        return pNameCount
    }

    /**
     * Returns the name choice at a specified index of an alternate name array.
     * @param {Integer} NameIndex Specifies the index of the alternate name entry. The first entry is at index zero.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives the name choice specifier.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodealtname-getnamechoice
     */
    GetNameChoice(NameIndex) {
        result := ComCall(9, this, "int", NameIndex, "int*", &pNameChoice := 0, "HRESULT")
        return pNameChoice
    }

    /**
     * Returns the specified name from the alternate name array.
     * @param {Integer} NameIndex A zero-based index that specifies the index of the alternate name entry to retrieve.  
     * 
     * To retrieve the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of a CERT_ALT_NAME_OTHER_NAME name, combine the index value with EAN_NAMEOBJECTID (defined as 0x80000000) with a bitwise-<b>OR</b> operation. Otherwise, the binary value is retrieved. To determine the type of name, call the <a href="https://docs.microsoft.com/windows/desktop/api/certenc/nf-certenc-icertencodealtname-getnamechoice">ICertEncodeAltName::GetNameChoice</a> method.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the alternate name. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodealtname-getname
     */
    GetName(NameIndex) {
        pstrName := BSTR()
        result := ComCall(10, this, "int", NameIndex, "ptr", pstrName, "HRESULT")
        return pstrName
    }

    /**
     * Specifies the size of the alternate name array in this object. The value of all elements in the array are set to zero.
     * @param {Integer} NameCount Specifies the number of elements in the array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodealtname-reset
     */
    Reset(NameCount) {
        result := ComCall(11, this, "int", NameCount, "HRESULT")
        return result
    }

    /**
     * Sets a name at a specified index of the alternate name array.
     * @param {Integer} NameIndex Zero-based index that specifies the index of the alternate name entry to set.
     * 
     * If the <i>NameChoice</i> parameter is CERT_ALT_NAME_OTHER_NAME, OR (|) the index value with EAN_NAMEOBJECTID (defined as 0x80000000) to set the OID. Otherwise, the binary value is set.
     * @param {Integer} NameChoice 
     * @param {BSTR} strName Specifies the alternate name.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodealtname-setnameentry
     */
    SetNameEntry(NameIndex, NameChoice, strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(12, this, "int", NameIndex, "int", NameChoice, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * Returns an ASN.1-encoded string of the alternate name array stored in this object. The names in the object are not encoded.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the ASN.1-encoded alternate name extension. When done, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free <i>pbstrBinary</i>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodealtname-encode
     */
    Encode() {
        pstrBinary := BSTR()
        result := ComCall(13, this, "ptr", pstrBinary, "HRESULT")
        return pstrBinary
    }
}
