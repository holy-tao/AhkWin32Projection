#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\CERT_ALT_NAME.ahk" { CERT_ALT_NAME }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides methods for handling alternate names used in certificate extensions.
 * @see https://learn.microsoft.com/windows/win32/api/certenc/nn-certenc-icertencodealtname
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertEncodeAltName extends IDispatch {
    /**
     * The interface identifier for ICertEncodeAltName
     * @type {Guid}
     */
    static IID := Guid("{1c9a8c70-1271-11d1-9bd4-00c04fb683fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertEncodeAltName interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Decode        : IntPtr
        GetNameCount  : IntPtr
        GetNameChoice : IntPtr
        GetName       : IntPtr
        Reset         : IntPtr
        SetNameEntry  : IntPtr
        Encode        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertEncodeAltName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded alternate name extension and stores the resulting array of strings in the CertEncodeAltName object.
     * @param {BSTR} strBinary Represents an ASN.1-encoded alternate name extension.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, BSTR, strBinary, "HRESULT")
        return result
    }

    /**
     * Returns the number of names in the alternate name array.
     * @returns {Integer} The number of alternate names in the array.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-getnamecount
     */
    GetNameCount() {
        result := ComCall(8, this, "int*", &pNameCount := 0, "HRESULT")
        return pNameCount
    }

    /**
     * Returns the name choice at a specified index of an alternate name array.
     * @param {Integer} NameIndex Specifies the index of the alternate name entry. The first entry is at index zero.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives the name choice specifier.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-getnamechoice
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
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-getname
     */
    GetName(NameIndex) {
        pstrName := BSTR.Owned()
        result := ComCall(10, this, "int", NameIndex, BSTR.Ptr, pstrName, "HRESULT")
        return pstrName
    }

    /**
     * Specifies the size of the alternate name array in this object. The value of all elements in the array are set to zero.
     * @param {Integer} NameCount Specifies the number of elements in the array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-reset
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
     * @param {CERT_ALT_NAME} NameChoice 
     * @param {BSTR} strName Specifies the alternate name.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-setnameentry
     */
    SetNameEntry(NameIndex, NameChoice, strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(12, this, "int", NameIndex, CERT_ALT_NAME, NameChoice, BSTR, strName, "HRESULT")
        return result
    }

    /**
     * Returns an ASN.1-encoded string of the alternate name array stored in this object. The names in the object are not encoded.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the ASN.1-encoded alternate name extension. When done, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free <i>pbstrBinary</i>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-encode
     */
    Encode() {
        pstrBinary := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pstrBinary, "HRESULT")
        return pstrBinary
    }

    Query(iid) {
        if (ICertEncodeAltName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Decode := CallbackCreate(GetMethod(implObj, "Decode"), flags, 2)
        this.vtbl.GetNameCount := CallbackCreate(GetMethod(implObj, "GetNameCount"), flags, 2)
        this.vtbl.GetNameChoice := CallbackCreate(GetMethod(implObj, "GetNameChoice"), flags, 3)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 3)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 2)
        this.vtbl.SetNameEntry := CallbackCreate(GetMethod(implObj, "SetNameEntry"), flags, 4)
        this.vtbl.Encode := CallbackCreate(GetMethod(implObj, "Encode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Decode)
        CallbackFree(this.vtbl.GetNameCount)
        CallbackFree(this.vtbl.GetNameChoice)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.SetNameEntry)
        CallbackFree(this.vtbl.Encode)
    }
}
