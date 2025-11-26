#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an SMIMECapabilities extension that identifies the decryption capabilities of an email recipient.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ismimecapability
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ISmimeCapability extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmimeCapability
     * @type {Guid}
     */
    static IID => Guid("{728ab319-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_ObjectId", "get_BitCount"]

    /**
     * @type {IObjectId} 
     */
    ObjectId {
        get => this.get_ObjectId()
    }

    /**
     * @type {Integer} 
     */
    BitCount {
        get => this.get_BitCount()
    }

    /**
     * Initializes the object from a symmetric encryption algorithm object identifier (OID) and an optional key length.
     * @param {IObjectId} pObjectId Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the OID.
     * @param {Integer} BitCount A <b>LONG</b> variable that contains the bit length of the symmetric key.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The <a href="/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> pointer is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ismimecapability-initialize
     */
    Initialize(pObjectId, BitCount) {
        result := ComCall(7, this, "ptr", pObjectId, "int", BitCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the object identifier (OID) of the symmetric encryption algorithm.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ismimecapability-initialize">Initialize</a> method to specify the <b>ObjectId</b> property. The following encryption OIDs are currently supported:
     * 
     * <ul>
     * <li>XCN_OID_NIST_AES128_CBC (2.16.840.1.101.3.4.1.2)</li>
     * <li>XCN_OID_NIST_AES192_CBC (2.16.840.1.101.3.4.1.22)</li>
     * <li>XCN_OID_NIST_AES256_CBC (2.16.840.1.101.3.4.1.42)</li>
     * <li>XCN_OID_NIST_AES128_WRAP (2.16.840.1.101.3.4.1.5)</li>
     * <li>XCN_OID_NIST_AES192_WRAP (2.16.840.1.101.3.4.1.25)</li>
     * <li>XCN_OID_NIST_AES256_WRAP (2.16.840.1.101.3.4.1.45)</li>
     * <li>XCN_OID_OIWSEC_desCBC (1.3.14.3.2.7)</li>
     * <li>XCN_OID_RSA_DES_EDE3_CBC (1.2.840.113549.3.7)</li>
     * <li>XCN_OID_RSA_RC2CBC (1.2.840.113549.3.2)</li>
     * <li>XCN_OID_RSA_RC4 (1.2.840.113549.3.4)</li>
     * <li>XCN_OID_RSA_SMIMEalgCMS3DESwrap (1.2.840.113549.1.9.16.3.6)</li>
     * <li>XCN_OID_RSA_SMIMEalgCMSRC2wrap (1.2.840.113549.1.9.16.3.7)</li>
     * </ul>
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ismimecapability-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves the length, in bits, of the encryption key.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ismimecapability-initialize">Initialize</a> method to specify the <b>BitCount</b> property. The following symmetric encryption algorithms and key lengths are supported by the Certificate Enrollment API.<table>
     * <tr>
     * <th>OID</th>
     * <th>Key Length</th>
     * </tr>
     * <tr>
     * <td>XCN_OID_OIWSEC_desCBC1.3.14.3.2.7
     * 
     * </td>
     * <td>56</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_DES_EDE3_CBC1.2.840.113549.3.7
     * 
     * </td>
     * <td>168</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RC2CBC1.2.840.113549.3.2
     * 
     * </td>
     * <td>40 to 128</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RC41.2.840.113549.3.4
     * 
     * </td>
     * <td>40 to 128</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_SMIMEalgCMS3DESwrap1.2.840.113549.1.9.16.3.6
     * 
     * </td>
     * <td>168</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_SMIMEalgCMSRC2wrap1.2.840.113549.1.9.16.3.7
     * 
     * </td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_NIST_AES128_CBC2.16.840.1.101.3.4.1.2
     * 
     * </td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_NIST_AES192_CBC2.16.840.1.101.3.4.1.22
     * 
     * </td>
     * <td>192</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_NIST_AES256_CBC2.16.840.1.101.3.4.1.42
     * 
     * </td>
     * <td>256</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_NIST_AES128_WRAP2.16.840.1.101.3.4.1.5
     * 
     * </td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_NIST_AES192_WRAP2.16.840.1.101.3.4.1.25
     * 
     * </td>
     * <td>192</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_NIST_AES256_WRAP2.16.840.1.101.3.4.1.45
     * 
     * </td>
     * <td>256</td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ismimecapability-get_bitcount
     */
    get_BitCount() {
        result := ComCall(9, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
