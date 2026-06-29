#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IObjectId.ahk" { IObjectId }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Can be used to represent an attribute in a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509attribute
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509Attribute extends IDispatch {
    /**
     * The interface identifier for IX509Attribute
     * @type {Guid}
     */
    static IID := Guid("{728ab322-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509Attribute interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize   : IntPtr
        get_ObjectId : IntPtr
        get_RawData  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509Attribute.Vtbl()
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
     * Initializes the object from an object identifier (OID) and a value.
     * @remarks
     * You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromname">InitializeFromName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromvalue">InitializeFromValue</a> methods before using it in this method.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attribute-get_objectid">ObjectId</a> property to retrieve the OID. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attribute-get_rawdata">RawData</a> property to retrieve the attribute value.
     * @param {IObjectId} pObjectId Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that contains the attribute OID.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the attribute value contained in the <i>strEncodedData</i> parameter.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the attribute value.
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
     * <dt><b>CERTSRV_E_PROPERTY_EMPTY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attribute-initialize
     */
    Initialize(pObjectId, Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(7, this, "ptr", pObjectId, EncodingType, Encoding, BSTR, strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves the object identifier (OID) for the attribute. (IX509Attribute.get_ObjectId)
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attribute-initialize">Initialize</a> method to specify the property value.
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attribute-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves the attribute value.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attribute-initialize">Initialize</a> method to specify the property value.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attribute-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(9, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509Attribute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.get_ObjectId := CallbackCreate(GetMethod(implObj, "get_ObjectId"), flags, 2)
        this.vtbl.get_RawData := CallbackCreate(GetMethod(implObj, "get_RawData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_ObjectId)
        CallbackFree(this.vtbl.get_RawData)
    }
}
