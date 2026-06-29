#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICertProperty.ahk" { ICertProperty }

/**
 * Enables you to specify and retrieve a string that contains the display name of a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertpropertyfriendlyname
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertPropertyFriendlyName extends ICertProperty {
    /**
     * The interface identifier for ICertPropertyFriendlyName
     * @type {Guid}
     */
    static IID := Guid("{728ab330-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertPropertyFriendlyName interfaces
    */
    struct Vtbl extends ICertProperty.Vtbl {
        Initialize       : IntPtr
        get_FriendlyName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertPropertyFriendlyName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * Initializes the object from the certificate display name.
     * @remarks
     * Typically, you specify the display name in a user interface or from the command line before beginning the enrollment process so that the name can be associated with the dummy certificate in the request store. To retrieve that value and use it here, call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_certificatefriendlyname">CertificateFriendlyName</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyfriendlyname-get_friendlyname">FriendlyName</a> property to retrieve the display name.
     * @param {BSTR} strFriendlyName A <b>BSTR</b> variable that contains the name.  The string length cannot exceed 260 characters.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_FILENAME_EXCED_RANGE)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string length exceeds 260 characters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyfriendlyname-initialize
     */
    Initialize(strFriendlyName) {
        strFriendlyName := strFriendlyName is String ? BSTR.Alloc(strFriendlyName).Value : strFriendlyName

        result := ComCall(14, this, BSTR, strFriendlyName, "HRESULT")
        return result
    }

    /**
     * Retrieves the display name of the certificate. (ICertPropertyFriendlyName.get_FriendlyName)
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyfriendlyname-initialize">Initialize</a> method to create a description.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyfriendlyname-get_friendlyname
     */
    get_FriendlyName() {
        pValue := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICertPropertyFriendlyName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.get_FriendlyName := CallbackCreate(GetMethod(implObj, "get_FriendlyName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_FriendlyName)
    }
}
