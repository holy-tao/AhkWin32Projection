#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPolicyQualifiers.ahk" { IPolicyQualifiers }
#Import ".\IObjectId.ahk" { IObjectId }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Can be used to specify a certificate policy that identifies a purpose for which the certificate can be used.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertificatepolicy
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertificatePolicy extends IDispatch {
    /**
     * The interface identifier for ICertificatePolicy
     * @type {Guid}
     */
    static IID := Guid("{728ab31e-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertificatePolicy interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize           : IntPtr
        get_ObjectId         : IntPtr
        get_PolicyQualifiers : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertificatePolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IObjectId} 
     */
    ObjectId {
        get => this.get_ObjectId()
    }

    /**
     * @type {IPolicyQualifiers} 
     */
    PolicyQualifiers {
        get => this.get_PolicyQualifiers()
    }

    /**
     * Initializes the object from an object identifier (OID).
     * @remarks
     * You must use an initialized <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> object when calling this method. All of the  <b>IObjectId</b> initialization methods search  the registry and static memory on the local computer and Active Directory on the domain server for the first OID that matches the specified initialization parameters. You can retrieve the OID by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertificatepolicy-get_objectid">ObjectId</a> property.
     * 
     * When you call the <b>Initialize</b> method, an empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ipolicyqualifiers">IPolicyQualifiers</a> object is created. You can retrieve the object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertificatepolicy-get_policyqualifiers">PolicyQualifiers</a> property. You can use the object to define policy qualifiers if you are creating a <b>CertificatePolicies</b> extension.
     * @param {IObjectId} pValue Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the OID.
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
     * <dt><b><b>CERTSRV_E_PROPERTY_EMPTY</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface is <b>NULL</b>.
     * 
     * </td>
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificatepolicy-initialize
     */
    Initialize(pValue) {
        result := ComCall(7, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves an object identifier (OID) for the policy object.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> object stores information about the OID internally in a CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_oid_info">CRYPT_OID_INFO</a> structure. You cannot use this structure directly from the  Certificate Enrollment API, but you can use the  <b>IObjectId</b> interface to retrieve the display name or dotted decimal name of the OID, or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a> value.
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificatepolicy-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves a collection of optional policy qualifiers that can be applied to a certificate policy.
     * @remarks
     * An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ipolicyqualifiers">IPolicyQualifiers</a> object is created when you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertificatepolicy-initialize">Initialize</a> method. You can call the <b>PolicyQualifiers</b> property to retrieve this object and specify qualifying information for the policy. Policy qualifiers only apply if you are creating a <b>CertificatePolicies</b> extension. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensioncertificatepolicies">IX509ExtensionCertificatePolicies</a>.
     * @returns {IPolicyQualifiers} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificatepolicy-get_policyqualifiers
     */
    get_PolicyQualifiers() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IPolicyQualifiers(ppValue)
    }

    Query(iid) {
        if (ICertificatePolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.get_ObjectId := CallbackCreate(GetMethod(implObj, "get_ObjectId"), flags, 2)
        this.vtbl.get_PolicyQualifiers := CallbackCreate(GetMethod(implObj, "get_PolicyQualifiers"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_ObjectId)
        CallbackFree(this.vtbl.get_PolicyQualifiers)
    }
}
