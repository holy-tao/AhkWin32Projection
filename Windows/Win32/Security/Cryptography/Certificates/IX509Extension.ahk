#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IObjectId.ahk" { IObjectId }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Can be used to define an extension for a certificate request.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509extension
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509Extension extends IDispatch {
    /**
     * The interface identifier for IX509Extension
     * @type {Guid}
     */
    static IID := Guid("{728ab30d-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509Extension interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize   : IntPtr
        get_ObjectId : IntPtr
        get_RawData  : IntPtr
        get_Critical : IntPtr
        put_Critical : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509Extension.Vtbl()
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
     * @type {VARIANT_BOOL} 
     */
    Critical {
        get => this.get_Critical()
        set => this.put_Critical(value)
    }

    /**
     * Initializes an IX509Extension object by using an object identifier (OID) and a byte array that contains the Distinguished Encoding Rules (DER) encoded extension.
     * @remarks
     * A certificate extension consists of an OID, a Boolean value that identifies whether the extension is critical, and a byte array that contains the extension value. The extension is defined by an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) standard and is encoded by using DER. You must specify  the DER-encoded byte array as a string that is either a pure binary sequence or is Unicode encoded. You can specify the type of encoding to apply to the string by using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration.
     * @param {IObjectId} pObjectId Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that contains the extension OID.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded extension value.
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
     * The OID could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-initialize
     */
    Initialize(pObjectId, Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(7, this, "ptr", pObjectId, EncodingType, Encoding, BSTR, strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves the object identifier (OID) for the extension.
     * @remarks
     * You can specify the OID when you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-initialize">Initialize</a> method to create an extension value.
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves a byte array that contains the extension value. (IX509Extension.get_RawData)
     * @remarks
     * A certificate extension is defined by an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure, and the extension is encoded into a byte array by using DER. The byte array is returned in a string to simplify use in languages other than C++. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration to specify the type of Unicode encoding to apply to the string. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-initialize">Initialize</a> method to specify the extension.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(9, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that identifies whether the certificate extension is critical. (Get)
     * @remarks
     * A certificate extension consists of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID), a Boolean value that identifies whether the extension is critical, and a byte array that contains the extension value. The criticality indicates whether an application that uses a certificate can ignore the extension type and value. If an extension is identified as critical but the application does not recognize the extension type, the application should reject the certificate.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-get_critical
     */
    get_Critical() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that identifies whether the certificate extension is critical. (Put)
     * @remarks
     * A certificate extension consists of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID), a Boolean value that identifies whether the extension is critical, and a byte array that contains the extension value. The criticality indicates whether an application that uses a certificate can ignore the extension type and value. If an extension is identified as critical but the application does not recognize the extension type, the application should reject the certificate.
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-put_critical
     */
    put_Critical(Value) {
        result := ComCall(11, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509Extension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.get_ObjectId := CallbackCreate(GetMethod(implObj, "get_ObjectId"), flags, 2)
        this.vtbl.get_RawData := CallbackCreate(GetMethod(implObj, "get_RawData"), flags, 3)
        this.vtbl.get_Critical := CallbackCreate(GetMethod(implObj, "get_Critical"), flags, 2)
        this.vtbl.put_Critical := CallbackCreate(GetMethod(implObj, "put_Critical"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_ObjectId)
        CallbackFree(this.vtbl.get_RawData)
        CallbackFree(this.vtbl.get_Critical)
        CallbackFree(this.vtbl.put_Critical)
    }
}
