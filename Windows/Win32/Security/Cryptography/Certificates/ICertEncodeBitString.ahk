#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling bit strings used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodebitstring
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeBitString extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeBitString
     * @type {Guid}
     */
    static IID => Guid("{6db525be-1278-11d1-9bd4-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetBitCount", "GetBitString", "Encode"]

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded bit string and stores the resulting bit string in this object.
     * @param {BSTR} strBinary An ASN.1-encoded bit string.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodebitstring-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * Returns the number of bits in a bit string that belongs to the CertEncodeBitString object and has been initialized by an earlier call to ICertEncodeBitString::Decode.
     * @returns {Integer} A pointer to a <b>Long</b> that will receive the number of bits in the bit string.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodebitstring-getbitcount
     */
    GetBitCount() {
        result := ComCall(8, this, "int*", &pBitCount := 0, "HRESULT")
        return pBitCount
    }

    /**
     * Returns the string of bits in the object's bit string.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the bit string. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodebitstring-getbitstring
     */
    GetBitString() {
        pstrBitString := BSTR()
        result := ComCall(9, this, "ptr", pstrBitString, "HRESULT")
        return pstrBitString
    }

    /**
     * Performs Abstract Syntax Notation One (ASN.1) encoding on a given bit string.
     * @param {Integer} BitCount The number of bits in <i>strBitString</i>.
     * @param {BSTR} strBitString The bit string to encode.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the encoded bit string. When you have finished using this <b>BSTR</b>, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function to free <i>pbstrBinary</i>.
     * @see https://docs.microsoft.com/windows/win32/api//certenc/nf-certenc-icertencodebitstring-encode
     */
    Encode(BitCount, strBitString) {
        strBitString := strBitString is String ? BSTR.Alloc(strBitString).Value : strBitString

        pstrBinary := BSTR()
        result := ComCall(10, this, "int", BitCount, "ptr", strBitString, "ptr", pstrBinary, "HRESULT")
        return pstrBinary
    }
}
