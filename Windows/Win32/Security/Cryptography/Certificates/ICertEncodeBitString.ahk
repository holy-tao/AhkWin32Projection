#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides methods for handling bit strings used in certificate extensions.
 * @see https://learn.microsoft.com/windows/win32/api/certenc/nn-certenc-icertencodebitstring
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertEncodeBitString extends IDispatch {
    /**
     * The interface identifier for ICertEncodeBitString
     * @type {Guid}
     */
    static IID := Guid("{6db525be-1278-11d1-9bd4-00c04fb683fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertEncodeBitString interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Decode       : IntPtr
        GetBitCount  : IntPtr
        GetBitString : IntPtr
        Encode       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertEncodeBitString.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded bit string and stores the resulting bit string in this object.
     * @remarks
     * Use this method to decode an encoded bit string.
     * @param {BSTR} strBinary An ASN.1-encoded bit string.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, BSTR, strBinary, "HRESULT")
        return result
    }

    /**
     * Returns the number of bits in a bit string that belongs to the CertEncodeBitString object and has been initialized by an earlier call to ICertEncodeBitString::Decode.
     * @returns {Integer} A pointer to a <b>Long</b> that will receive the number of bits in the bit string.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-getbitcount
     */
    GetBitCount() {
        result := ComCall(8, this, "int*", &pBitCount := 0, "HRESULT")
        return pBitCount
    }

    /**
     * Returns the string of bits in the object's bit string.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the bit string. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-getbitstring
     */
    GetBitString() {
        pstrBitString := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pstrBitString, "HRESULT")
        return pstrBitString
    }

    /**
     * Performs Abstract Syntax Notation One (ASN.1) encoding on a given bit string.
     * @param {Integer} BitCount The number of bits in <i>strBitString</i>.
     * @param {BSTR} strBitString The bit string to encode.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the encoded bit string. When you have finished using this <b>BSTR</b>, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function to free <i>pbstrBinary</i>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-encode
     */
    Encode(BitCount, strBitString) {
        strBitString := strBitString is String ? BSTR.Alloc(strBitString).Value : strBitString

        pstrBinary := BSTR.Owned()
        result := ComCall(10, this, "int", BitCount, BSTR, strBitString, BSTR.Ptr, pstrBinary, "HRESULT")
        return pstrBinary
    }

    Query(iid) {
        if (ICertEncodeBitString.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Decode := CallbackCreate(GetMethod(implObj, "Decode"), flags, 2)
        this.vtbl.GetBitCount := CallbackCreate(GetMethod(implObj, "GetBitCount"), flags, 2)
        this.vtbl.GetBitString := CallbackCreate(GetMethod(implObj, "GetBitString"), flags, 2)
        this.vtbl.Encode := CallbackCreate(GetMethod(implObj, "Encode"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Decode)
        CallbackFree(this.vtbl.GetBitCount)
        CallbackFree(this.vtbl.GetBitString)
        CallbackFree(this.vtbl.Encode)
    }
}
