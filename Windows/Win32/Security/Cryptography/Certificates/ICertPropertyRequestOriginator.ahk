#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertProperty.ahk

/**
 * Represents a certificate property that contains the Domain Naming System (DNS) name of the computer on which the request was created.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertyrequestoriginator
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyRequestOriginator extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyRequestOriginator
     * @type {Guid}
     */
    static IID => Guid("{728ab333-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeFromLocalRequestOriginator", "get_RequestOriginator"]

    /**
     * @type {BSTR} 
     */
    RequestOriginator {
        get => this.get_RequestOriginator()
    }

    /**
     * Initializes the object from a string that contains the DNS name of the originating computer.
     * @param {BSTR} strRequestOriginator A <b>BSTR</b> variable that contains the name.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyrequestoriginator-initialize
     */
    Initialize(strRequestOriginator) {
        strRequestOriginator := strRequestOriginator is String ? BSTR.Alloc(strRequestOriginator).Value : strRequestOriginator

        result := ComCall(14, this, "ptr", strRequestOriginator, "HRESULT")
        return result
    }

    /**
     * Initializes the object from the DNS name of the local computer.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyrequestoriginator-initializefromlocalrequestoriginator
     */
    InitializeFromLocalRequestOriginator() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a string that contains the DNS name of the originating computer.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-initialize">Initialize</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-initializefromlocalrequestoriginator">InitializeFromLocalRequestOriginator</a> method to specify a value for the <b>RequestOriginator</b> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyrequestoriginator-get_requestoriginator
     */
    get_RequestOriginator() {
        pValue := BSTR()
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
