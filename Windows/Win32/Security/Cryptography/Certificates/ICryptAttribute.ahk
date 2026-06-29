#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IObjectId.ahk" { IObjectId }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IX509Attributes.ahk" { IX509Attributes }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ICryptAttribute interface represents a cryptographic attribute in a certificate request. A collection of these attributes is contained in the CertificateRequestInfo structure of a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icryptattribute
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICryptAttribute extends IDispatch {
    /**
     * The interface identifier for ICryptAttribute
     * @type {Guid}
     */
    static IID := Guid("{728ab32c-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICryptAttribute interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        InitializeFromObjectId : IntPtr
        InitializeFromValues   : IntPtr
        get_ObjectId           : IntPtr
        get_Values             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICryptAttribute.Vtbl()
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
     * @type {IX509Attributes} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * Initializes a cryptographic attribute by using an object identifier.
     * @remarks
     * You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromname">InitializeFromName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromvalue">InitializeFromValue</a> methods before using it in this method.
     * @param {IObjectId} pObjectId Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that contains the object identifier of the attribute.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattribute-initializefromobjectid
     */
    InitializeFromObjectId(pObjectId) {
        result := ComCall(7, this, "ptr", pObjectId, "HRESULT")
        return result
    }

    /**
     * Initializes a cryptographic attribute by using an IX509Attributes object.
     * @remarks
     * The <b>InitializeFromValues</b> method uses the first <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attribute">IX509Attribute</a> object in the collection.
     * @param {IX509Attributes} pAttributes Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributes">IX509Attributes</a> interface that contains the attribute collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattribute-initializefromvalues
     */
    InitializeFromValues(pAttributes) {
        result := ComCall(8, this, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * Retrieves the object identifier (OID) for the attribute. (ICryptAttribute.get_ObjectId)
     * @remarks
     * You can initialize an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> object by calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromname">InitializeFromName</a>. This method initializes the object by using a value from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a> enumeration. The enumeration value is associated with an ASN.1 object identifier. For example, the value <b>XCN_OID_COUNTRY_NAME</b> is associated with a string containing 2.5.4.6. This is the dotted decimal representation of the joint-iso-itu-t(2)ds(5)attributeType(4)countryName(6) object identifier.
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattribute-get_objectid
     */
    get_ObjectId() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves an IX509Attributes object that contains a collection of attributes.
     * @returns {IX509Attributes} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattribute-get_values
     */
    get_Values() {
        result := ComCall(10, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Attributes(ppValue)
    }

    Query(iid) {
        if (ICryptAttribute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeFromObjectId := CallbackCreate(GetMethod(implObj, "InitializeFromObjectId"), flags, 2)
        this.vtbl.InitializeFromValues := CallbackCreate(GetMethod(implObj, "InitializeFromValues"), flags, 2)
        this.vtbl.get_ObjectId := CallbackCreate(GetMethod(implObj, "get_ObjectId"), flags, 2)
        this.vtbl.get_Values := CallbackCreate(GetMethod(implObj, "get_Values"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeFromObjectId)
        CallbackFree(this.vtbl.InitializeFromValues)
        CallbackFree(this.vtbl.get_ObjectId)
        CallbackFree(this.vtbl.get_Values)
    }
}
