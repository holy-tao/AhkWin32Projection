#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertProperty.ahk

/**
 * Represents a SHA-1 hash of an encrypted private key submitted to a certification authority for archival.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertyarchivedkeyhash
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyArchivedKeyHash extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyArchivedKeyHash
     * @type {Guid}
     */
    static IID => Guid("{728ab33b-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_ArchivedKeyHash"]

    /**
     * Initializes the object from a byte array that contains the hash.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string.
     * @param {BSTR} strArchivedKeyHashValue A <b>BSTR</b> variable that contains a SHA-1 hash of the encrypted private key.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyarchivedkeyhash-initialize
     */
    Initialize(Encoding, strArchivedKeyHashValue) {
        strArchivedKeyHashValue := strArchivedKeyHashValue is String ? BSTR.Alloc(strArchivedKeyHashValue).Value : strArchivedKeyHashValue

        result := ComCall(14, this, "int", Encoding, "ptr", strArchivedKeyHashValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a SHA-1 hash of the private key.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyarchivedkeyhash-initialize">Initialize</a> method to specify the hash.
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyarchivedkeyhash-get_archivedkeyhash
     */
    get_ArchivedKeyHash(Encoding) {
        pValue := BSTR()
        result := ComCall(15, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
