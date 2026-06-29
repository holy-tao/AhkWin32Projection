#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\CERT_ALT_NAME.ahk" { CERT_ALT_NAME }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides methods for handling certificate revocation list (CRL) distribution information arrays used in certificate extensions.
 * @see https://learn.microsoft.com/windows/win32/api/certenc/nn-certenc-icertencodecrldistinfo
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertEncodeCRLDistInfo extends IDispatch {
    /**
     * The interface identifier for ICertEncodeCRLDistInfo
     * @type {Guid}
     */
    static IID := Guid("{01958640-bbff-11d0-8825-00a0c903b83c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertEncodeCRLDistInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Decode            : IntPtr
        GetDistPointCount : IntPtr
        GetNameCount      : IntPtr
        GetNameChoice     : IntPtr
        GetName           : IntPtr
        Reset             : IntPtr
        SetNameCount      : IntPtr
        SetNameEntry      : IntPtr
        Encode            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertEncodeCRLDistInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded certificate revocation list (CRL) distribution information extension and stores the resulting array in the COM object.
     * @remarks
     * This method places the decoded contents of <i>strBinary</i> into the object's array of CRL distribution information points. If the object's array already contains data, this existing content will be freed, and the array will be loaded with the decoded values.
     * @param {BSTR} strBinary An ASN.1-encoded CRL distribution information extension.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, BSTR, strBinary, "HRESULT")
        return result
    }

    /**
     * Returns the number of certificate revocation list (CRL) distribution points in a CRL distribution information array.
     * @returns {Integer} A pointer to a <b>LONG</b> that will represent the number of CRL distribution points in the array.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-getdistpointcount
     */
    GetDistPointCount() {
        result := ComCall(8, this, "int*", &pDistPointCount := 0, "HRESULT")
        return pDistPointCount
    }

    /**
     * Returns the number of names in a certificate revocation list (CRL) distribution point.
     * @param {Integer} DistPointIndex Specifies the index of the distribution point for which to get the name count.
     * @returns {Integer} A pointer to a <b>Long</b> that will represent the number of name values contained in the CRL distribution point.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-getnamecount
     */
    GetNameCount(DistPointIndex) {
        result := ComCall(9, this, "int", DistPointIndex, "int*", &pNameCount := 0, "HRESULT")
        return pNameCount
    }

    /**
     * Returns the name choice at a specified index of a certificate revocation list (CRL) distribution information point.
     * @param {Integer} DistPointIndex Specifies the index of the distribution point for which to get a name choice. The first value is at index zero.
     * @param {Integer} NameIndex Specifies the index of the name choice entry to get. The first value is at index zero.
     * @returns {Integer} A pointer to a <b>Long</b> that represents the name choice.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-getnamechoice
     */
    GetNameChoice(DistPointIndex, NameIndex) {
        result := ComCall(10, this, "int", DistPointIndex, "int", NameIndex, "int*", &pNameChoice := 0, "HRESULT")
        return pNameChoice
    }

    /**
     * Returns the name at a specified index of a certificate revocation list (CRL) distribution information point.
     * @param {Integer} DistPointIndex Specifies the index of the distribution point for which to get a name. The first value is at index zero.
     * @param {Integer} NameIndex Specifies the index of the name entry to get. The first value is at index zero.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that represents the name value. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-getname
     */
    GetName(DistPointIndex, NameIndex) {
        pstrName := BSTR.Owned()
        result := ComCall(11, this, "int", DistPointIndex, "int", NameIndex, BSTR.Ptr, pstrName, "HRESULT")
        return pstrName
    }

    /**
     * Resets a certificate revocation list (CRL) distribution information array to a specified number of distribution point structures.
     * @param {Integer} DistPointCount Specifies the number of CRL distribution points in the CRL distribution information array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-reset
     */
    Reset(DistPointCount) {
        result := ComCall(12, this, "int", DistPointCount, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-setnamecount
     */
    SetNameCount(DistPointIndex, NameCount) {
        result := ComCall(13, this, "int", DistPointIndex, "int", NameCount, "HRESULT")
        return result
    }

    /**
     * Sets a name at a specified index of a distribution point in a certificate revocation list (CRL) distribution information array.
     * @param {Integer} DistPointIndex Specifies the index of the CRL distribution point for which to set the name. The first value is at index zero.
     * @param {Integer} NameIndex Specifies the index of the name entry to set. The first value is at index zero.
     * @param {CERT_ALT_NAME} NameChoice 
     * @param {BSTR} strName Specifies the name.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-setnameentry
     */
    SetNameEntry(DistPointIndex, NameIndex, NameChoice, strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, "int", DistPointIndex, "int", NameIndex, CERT_ALT_NAME, NameChoice, BSTR, strName, "HRESULT")
        return result
    }

    /**
     * Performs Abstract Syntax Notation One (ASN.1) encoding on a certificate revocation list (CRL) distribution information array stored in the COM object and returns the ASN.1-encoded extension.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the encoded CRL distribution information extension. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-encode
     */
    Encode() {
        pstrBinary := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pstrBinary, "HRESULT")
        return pstrBinary
    }

    Query(iid) {
        if (ICertEncodeCRLDistInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Decode := CallbackCreate(GetMethod(implObj, "Decode"), flags, 2)
        this.vtbl.GetDistPointCount := CallbackCreate(GetMethod(implObj, "GetDistPointCount"), flags, 2)
        this.vtbl.GetNameCount := CallbackCreate(GetMethod(implObj, "GetNameCount"), flags, 3)
        this.vtbl.GetNameChoice := CallbackCreate(GetMethod(implObj, "GetNameChoice"), flags, 4)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 2)
        this.vtbl.SetNameCount := CallbackCreate(GetMethod(implObj, "SetNameCount"), flags, 3)
        this.vtbl.SetNameEntry := CallbackCreate(GetMethod(implObj, "SetNameEntry"), flags, 5)
        this.vtbl.Encode := CallbackCreate(GetMethod(implObj, "Encode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Decode)
        CallbackFree(this.vtbl.GetDistPointCount)
        CallbackFree(this.vtbl.GetNameCount)
        CallbackFree(this.vtbl.GetNameChoice)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.SetNameCount)
        CallbackFree(this.vtbl.SetNameEntry)
        CallbackFree(this.vtbl.Encode)
    }
}
