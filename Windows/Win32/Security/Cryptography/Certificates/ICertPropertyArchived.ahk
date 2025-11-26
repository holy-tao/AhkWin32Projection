#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertProperty.ahk

/**
 * Represents a certificate property that identifies whether a certificate has been archived.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertyarchived
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyArchived extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyArchived
     * @type {Guid}
     */
    static IID => Guid("{728ab337-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Archived"]

    /**
     * @type {VARIANT_BOOL} 
     */
    Archived {
        get => this.get_Archived()
    }

    /**
     * Initializes the object from a Boolean value that specifies whether the certificate has been archived.
     * @param {VARIANT_BOOL} ArchivedValue A <b>VARIANT_BOOL</b> variable that identifies whether the certificate has been archived.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyarchived-initialize
     */
    Initialize(ArchivedValue) {
        result := ComCall(14, this, "short", ArchivedValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a Boolean value that specifies whether the certificate has been archived.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyarchived-initialize">Initialize</a> method to specify the Boolean value.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyarchived-get_archived
     */
    get_Archived() {
        result := ComCall(15, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }
}
