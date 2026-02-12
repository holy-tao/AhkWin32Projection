#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling certificate revocation list (CRL) distribution information arrays used in certificate extensions.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nn-certenc-icertencodecrldistinfo
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeCRLDistInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeCRLDistInfo
     * @type {Guid}
     */
    static IID => Guid("{01958640-bbff-11d0-8825-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetDistPointCount", "GetNameCount", "GetNameChoice", "GetName", "Reset", "SetNameCount", "SetNameEntry", "Encode"]

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded certificate revocation list (CRL) distribution information extension and stores the resulting array in the COM object.
     * @remarks
     * This method places the decoded contents of <i>strBinary</i> into the object's array of CRL distribution information points. If the object's array already contains data, this existing content will be freed, and the array will be loaded with the decoded values.
     * @param {BSTR} strBinary An ASN.1-encoded CRL distribution information extension.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-decode
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
     * Returns the number of certificate revocation list (CRL) distribution points in a CRL distribution information array.
     * @returns {Integer} A pointer to a <b>LONG</b> that will represent the number of CRL distribution points in the array.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-getdistpointcount
     */
    GetDistPointCount() {
        result := ComCall(8, this, "int*", &pDistPointCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDistPointCount
    }

    /**
     * Returns the number of names in a certificate revocation list (CRL) distribution point.
     * @param {Integer} DistPointIndex Specifies the index of the distribution point for which to get the name count.
     * @returns {Integer} A pointer to a <b>Long</b> that will represent the number of name values contained in the CRL distribution point.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-getnamecount
     */
    GetNameCount(DistPointIndex) {
        result := ComCall(9, this, "int", DistPointIndex, "int*", &pNameCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pNameCount
    }

    /**
     * Returns the name choice at a specified index of a certificate revocation list (CRL) distribution information point.
     * @param {Integer} DistPointIndex Specifies the index of the distribution point for which to get a name choice. The first value is at index zero.
     * @param {Integer} NameIndex Specifies the index of the name choice entry to get. The first value is at index zero.
     * @returns {Integer} A pointer to a <b>Long</b> that represents the name choice.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-getnamechoice
     */
    GetNameChoice(DistPointIndex, NameIndex) {
        result := ComCall(10, this, "int", DistPointIndex, "int", NameIndex, "int*", &pNameChoice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pNameChoice
    }

    /**
     * Returns the name at a specified index of a certificate revocation list (CRL) distribution information point.
     * @param {Integer} DistPointIndex Specifies the index of the distribution point for which to get a name. The first value is at index zero.
     * @param {Integer} NameIndex Specifies the index of the name entry to get. The first value is at index zero.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that represents the name value. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-getname
     */
    GetName(DistPointIndex, NameIndex) {
        pstrName := BSTR()
        result := ComCall(11, this, "int", DistPointIndex, "int", NameIndex, "ptr", pstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrName
    }

    /**
     * Resets a certificate revocation list (CRL) distribution information array to a specified number of distribution point structures.
     * @param {Integer} DistPointCount Specifies the number of CRL distribution points in the CRL distribution information array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-reset
     */
    Reset(DistPointCount) {
        result := ComCall(12, this, "int", DistPointCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a name count for the specified distribution point in a certificate revocation list (CRL) distribution information array.
     * @param {Integer} DistPointIndex Specifies the index of the distribution point for which to set the name count.
     * @param {Integer} NameCount Specifies the name count.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-setnamecount
     */
    SetNameCount(DistPointIndex, NameCount) {
        result := ComCall(13, this, "int", DistPointIndex, "int", NameCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a name at a specified index of a distribution point in a certificate revocation list (CRL) distribution information array.
     * @param {Integer} DistPointIndex Specifies the index of the CRL distribution point for which to set the name. The first value is at index zero.
     * @param {Integer} NameIndex Specifies the index of the name entry to set. The first value is at index zero.
     * @param {Integer} NameChoice 
     * @param {BSTR} strName Specifies the name.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-setnameentry
     */
    SetNameEntry(DistPointIndex, NameIndex, NameChoice, strName) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(14, this, "int", DistPointIndex, "int", NameIndex, "int", NameChoice, "ptr", strName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs Abstract Syntax Notation One (ASN.1) encoding on a certificate revocation list (CRL) distribution information array stored in the COM object and returns the ASN.1-encoded extension.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the encoded CRL distribution information extension. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-encode
     */
    Encode() {
        pstrBinary := BSTR()
        result := ComCall(15, this, "ptr", pstrBinary, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrBinary
    }
}
