#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertProperty.ahk

/**
 * Represents a certificate property that identifies a template that has been configured to enable autoenrollment of the certificate.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-icertpropertyautoenroll
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyAutoEnroll extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyAutoEnroll
     * @type {Guid}
     */
    static IID => Guid("{728ab332-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_TemplateName"]

    /**
     * @type {BSTR} 
     */
    TemplateName {
        get => this.get_TemplateName()
    }

    /**
     * Initializes the object by specifying the name of the template to be used for autoenrollment.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyautoenroll-get_templatename">TemplateName</a> property to retrieve the template name.
     * @param {BSTR} strTemplateName A <b>BSTR</b> variable that contains the template name or object identifier.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertpropertyautoenroll-initialize
     */
    Initialize(strTemplateName) {
        if(strTemplateName is String) {
            pin := BSTR.Alloc(strTemplateName)
            strTemplateName := pin.Value
        }

        result := ComCall(14, this, "ptr", strTemplateName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a string that contains the name of the template that the certificate can use for autoenrollment.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyautoenroll-initialize">Initialize</a> method to specify the property value.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertpropertyautoenroll-get_templatename
     */
    get_TemplateName() {
        pValue := BSTR()
        result := ComCall(15, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }
}
