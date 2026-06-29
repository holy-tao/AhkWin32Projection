#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICertProperty.ahk" { ICertProperty }

/**
 * Represents a SHA-1 hash of an encrypted private key submitted to a certification authority for archival.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertpropertyarchivedkeyhash
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertPropertyArchivedKeyHash extends ICertProperty {
    /**
     * The interface identifier for ICertPropertyArchivedKeyHash
     * @type {Guid}
     */
    static IID := Guid("{728ab33b-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertPropertyArchivedKeyHash interfaces
    */
    struct Vtbl extends ICertProperty.Vtbl {
        Initialize          : IntPtr
        get_ArchivedKeyHash : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertPropertyArchivedKeyHash.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object from a byte array that contains the hash.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyarchivedkeyhash-get_archivedkeyhash">ArchivedKeyHash</a> property to retrieve the hash.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string.
     * @param {BSTR} strArchivedKeyHashValue A <b>BSTR</b> variable that contains a SHA-1 hash of the encrypted private key.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyarchivedkeyhash-initialize
     */
    Initialize(Encoding, strArchivedKeyHashValue) {
        strArchivedKeyHashValue := strArchivedKeyHashValue is String ? BSTR.Alloc(strArchivedKeyHashValue).Value : strArchivedKeyHashValue

        result := ComCall(14, this, EncodingType, Encoding, BSTR, strArchivedKeyHashValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a SHA-1 hash of the private key.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyarchivedkeyhash-initialize">Initialize</a> method to specify the hash.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyarchivedkeyhash-get_archivedkeyhash
     */
    get_ArchivedKeyHash(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(15, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICertPropertyArchivedKeyHash.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.get_ArchivedKeyHash := CallbackCreate(GetMethod(implObj, "get_ArchivedKeyHash"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_ArchivedKeyHash)
    }
}
