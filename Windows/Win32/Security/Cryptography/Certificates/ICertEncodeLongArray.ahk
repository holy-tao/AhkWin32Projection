#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides methods for handling Long arrays used in certificate extensions.
 * @see https://learn.microsoft.com/windows/win32/api/certenc/nn-certenc-icertencodelongarray
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertEncodeLongArray extends IDispatch {
    /**
     * The interface identifier for ICertEncodeLongArray
     * @type {Guid}
     */
    static IID := Guid("{15e2f230-a0a2-11d0-8821-00a0c903b83c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertEncodeLongArray interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Decode   : IntPtr
        GetCount : IntPtr
        GetValue : IntPtr
        Reset    : IntPtr
        SetValue : IntPtr
        Encode   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertEncodeLongArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Decodes an Abstract Syntax Notation One (ASN.1)-encoded Long array and stores the resulting array of Long values in the CertEncodeLongArray object.
     * @remarks
     * This method places the decoded contents of <i>strBinary</i> into the object's array of <b>Long</b> values. If the object's array already contains <b>Long</b> values, the existing content will be freed, and the array will be loaded with the decoded values.
     * @param {BSTR} strBinary An ASN.1-encoded <b>Long</b> array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodelongarray-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, BSTR, strBinary, "HRESULT")
        return result
    }

    /**
     * Returns the number of Long values in the object's Long array.
     * @returns {Integer} A pointer to a <b>Long</b> that receives the number of <b>Long</b> values contained in the <b>Long</b> array.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodelongarray-getcount
     */
    GetCount() {
        result := ComCall(8, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Returns the specified Long value from the Long array.
     * @param {Integer} Index The zero-based index that specifies the <b>Long</b> value to retrieve.
     * @returns {Integer} A pointer to a <b>Long</b> variable that receives the value.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodelongarray-getvalue
     */
    GetValue(Index) {
        result := ComCall(9, this, "int", Index, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies the size of the array in this object.
     * @param {Integer} Count Specifies the number of elements in the <b>Long</b> array.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodelongarray-reset
     */
    Reset(Count) {
        result := ComCall(10, this, "int", Count, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodelongarray-setvalue
     */
    SetValue(Index, Value) {
        result := ComCall(11, this, "int", Index, "int", Value, "HRESULT")
        return result
    }

    /**
     * Returns an ASN.1-encoded string of the LONG array stored in this object.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that will contain the encoded <b>LONG</b> array. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodelongarray-encode
     */
    Encode() {
        pstrBinary := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pstrBinary, "HRESULT")
        return pstrBinary
    }

    Query(iid) {
        if (ICertEncodeLongArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Decode := CallbackCreate(GetMethod(implObj, "Decode"), flags, 2)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 3)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 2)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 3)
        this.vtbl.Encode := CallbackCreate(GetMethod(implObj, "Encode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Decode)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.Encode)
    }
}
