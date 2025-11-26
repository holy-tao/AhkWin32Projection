#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an algorithm implemented by a cryptographic provider.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icspalgorithm
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICspAlgorithm extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICspAlgorithm
     * @type {Guid}
     */
    static IID => Guid("{728ab305-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAlgorithmOid", "get_DefaultLength", "get_IncrementLength", "get_LongName", "get_Valid", "get_MaxLength", "get_MinLength", "get_Name", "get_Type", "get_Operations"]

    /**
     * @type {Integer} 
     */
    DefaultLength {
        get => this.get_DefaultLength()
    }

    /**
     * @type {Integer} 
     */
    IncrementLength {
        get => this.get_IncrementLength()
    }

    /**
     * @type {BSTR} 
     */
    LongName {
        get => this.get_LongName()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Valid {
        get => this.get_Valid()
    }

    /**
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
    }

    /**
     * @type {Integer} 
     */
    MinLength {
        get => this.get_MinLength()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    Operations {
        get => this.get_Operations()
    }

    /**
     * Retrieves the algorithm object identifier (OID). This method is web enabled.
     * @param {Integer} Length A <b>LONG</b> variable that identifies the required key size of the symmetric encryption algorithm. Use this parameter to retrieve a specific AES algorithm from a Cryptography API: Next Generation (CNG) key storage provider (KSP). A KSP may list only one algorithm named AES but support all of the AES variants in the following list:<ul>
     * <li>szOID_NIST_AES128_CBC (2.16.840.1.101.3.4.1.2)</li>
     * <li>szOID_NIST_AES192_CBC (2.16.840.1.101.3.4.1.22)</li>
     * <li>szOID_NIST_AES256_CBC (2.16.840.1.101.3.4.1.42)</li>
     * <li>szOID_NIST_AES128_WRAP (2.16.840.1.101.3.4.1.5)</li>
     * <li>szOID_NIST_AES192_WRAP (2.16.840.1.101.3.4.1.25)</li>
     * <li>szOID_NIST_AES256_WRAP (2.16.840.1.101.3.4.1.45)</li>
     * </ul>
     * 
     * 
     *  If you specify zero for the <i>Length</i> parameter and <b>AlgorithmFlagsNone</b> (0x00000000) for the  <i>AlgFlags</i> parameter, the OID associated with the default algorithm is retrieved. For the Microsoft Software KSP and the Microsoft Smart Card KSP, the default AES algorithm is szOID_NIST_AES128_CBC (2.16.840.1.101.3.4.1.2).<div class="alert"><b>Note</b>  This parameter must be zero for any algorithm other than a symmetric encryption algorithm.</div>
     * <div> </div>
     * @param {Integer} AlgFlags 
     * @returns {IObjectId} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the algorithm OID.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-getalgorithmoid
     */
    GetAlgorithmOid(Length, AlgFlags) {
        result := ComCall(7, this, "int", Length, "int", AlgFlags, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves the default length of a key.
     * @remarks
     * 
     * You can use this property to retrieve the default size, in bits, of a key. The <b>DefaultLength</b>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_incrementlength">IncrementLength</a>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_maxlength">MaxLength</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_minlength">MinLength</a> properties can vary by algorithm and provider. The following table lists a few algorithms for which multiple key sizes can be set. The list is not inclusive.<table>
     * <tr>
     * <th>Algorithm OID</th>
     * <th>Cryptographic provider</th>
     * <th>Key length (bits)</th>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RSA(1.2.840.113549.1.1.1)
     * 
     * </td>
     * <td>
     * Microsoft Smart Card Key Storage Provider
     * 
     * Microsoft Base Smart Card Crypto Provider
     * 
     * </td>
     * <td>
     * Minimum: 1,024
     * 
     * Maximum: 4,096
     * 
     * Default: 1,024
     * 
     * Increment: 512
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RSA(1.2.840.113549.1.1.1)
     * 
     * </td>
     * <td>
     * Microsoft Software Key Storage Provider
     * 
     * Microsoft Base Cryptographic Provider v1.0
     * 
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * Microsoft RSA Schannel Cryptographic Provider
     * 
     * Microsoft Strong Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 384
     * 
     * Maximum: 16,384
     * 
     * Default: 1,024
     * 
     * Increment: 8
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_X957_DSA(1.2.840.10040.4.1)
     * 
     * </td>
     * <td>
     * Microsoft Software Key Storage Provider
     * 
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Base DSS Cryptographic Provider
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 512
     * 
     * Maximum: 1,024
     * 
     * Default: 1,024
     * 
     * Increment: 64
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_ANSI_X942_DH(1.2.840.10046.2.1)
     * 
     * </td>
     * <td>
     * Diffie-Hellman key exchange algorithm.
     * 
     * </td>
     * <td>
     * Minimum: 512
     * 
     * Maximum: 1,024
     * 
     * Default: 1,024
     * 
     * Increment: 64
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_ANSI_X942_DH(1.2.840.10046.2.1)
     * 
     * </td>
     * <td>
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 512
     * 
     * Maximum: 4,096
     * 
     * Default: 1,024
     * 
     * Increment: 64
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RC2CBC(1.2.840.113549.3.2)
     * 
     * </td>
     * <td>
     * Microsoft Software Key Storage Provider
     * 
     * Microsoft Smart Card Key Storage Provider
     * 
     * Microsoft Base Smart Card Crypto Provider
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * Microsoft RSA Schannel Cryptographic Provider
     * 
     * Microsoft Strong Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 40
     * 
     * Maximum: 128
     * 
     * Default: 128
     * 
     * Increment: 8
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_defaultlength
     */
    get_DefaultLength() {
        result := ComCall(8, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value, in bits, that can be used to determine valid incremental key lengths for algorithms that support multiple key sizes.
     * @remarks
     * 
     * You can use the value of this property to determine valid key sizes for generated keys. For example, if the minimum key length of an DSA signing key is 512 bits, the maximum length is 1,024 bits, and the increment is 64 bits, valid key sizes include 512, 576, 640 and so in 64 bit increments up to  1,024.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_defaultlength">DefaultLength</a>, <b>IncrementLength</b>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_maxlength">MaxLength</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_minlength">MinLength</a> properties can vary by algorithm and provider. The following table lists a few algorithms for which multiple key sizes can be set. The list is not inclusive.<table>
     * <tr>
     * <th>Algorithm OID</th>
     * <th>Cryptographic provider</th>
     * <th>Key length (bits)</th>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RSA(1.2.840.113549.1.1.1)
     * 
     * </td>
     * <td>
     * Microsoft Smart Card Key Storage Provider
     * 
     * Microsoft Base Smart Card Crypto Provider
     * 
     * </td>
     * <td>
     * Minimum: 1,024
     * 
     * Maximum: 4,096
     * 
     * Default: 1,024
     * 
     * Increment: 512
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RSA(1.2.840.113549.1.1.1)
     * 
     * </td>
     * <td>
     * Microsoft Software Key Storage Provider
     * 
     * Microsoft Base Cryptographic Provider v1.0
     * 
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * Microsoft RSA Schannel Cryptographic Provider
     * 
     * Microsoft Strong Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 384
     * 
     * Maximum: 16,384
     * 
     * Default: 1,024
     * 
     * Increment: 8
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_X957_DSA(1.2.840.10040.4.1)
     * 
     * </td>
     * <td>
     * Microsoft Software Key Storage Provider
     * 
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Base DSS Cryptographic Provider
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 512
     * 
     * Maximum: 1,024
     * 
     * Default: 1,024
     * 
     * Increment: 64
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_ANSI_X942_DH(1.2.840.10046.2.1)
     * 
     * </td>
     * <td>
     * Diffie-Hellman key exchange algorithm.
     * 
     * </td>
     * <td>
     * Minimum: 512
     * 
     * Maximum: 1,024
     * 
     * Default: 1,024
     * 
     * Increment: 64
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_ANSI_X942_DH(1.2.840.10046.2.1)
     * 
     * </td>
     * <td>
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 512
     * 
     * Maximum: 4,096
     * 
     * Default: 1,024
     * 
     * Increment: 64
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RC2CBC(1.2.840.113549.3.2)
     * 
     * </td>
     * <td>
     * Microsoft Software Key Storage Provider
     * 
     * Microsoft Smart Card Key Storage Provider
     * 
     * Microsoft Base Smart Card Crypto Provider
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * Microsoft RSA Schannel Cryptographic Provider
     * 
     * Microsoft Strong Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 40
     * 
     * Maximum: 128
     * 
     * Default: 128
     * 
     * Increment: 8
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_incrementlength
     */
    get_IncrementLength() {
        result := ComCall(9, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the full name of the algorithm.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_name">Name</a> property retrieves a short algorithm name. Call the <b>LongName</b> property to retrieve a more descriptive name. The names are not localized. Examples are shown in the following table.
     * 
     * <div class="alert"><b>Note</b>  Cryptography API: Next Generation (CNG) key storage providers (KSPs) do not support the long name concept. The <b>LongName</b> property and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_name">Name</a> property return an abbreviated name.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Algorithm OID</th>
     * <th>Name (KSP and CSP)</th>
     * <th>LongName (KSP)</th>
     * <th>LongName (CSP)</th>
     * </tr>
     * <tr>
     * <td>XCN_OID_OIWSEC_desCBC(1.3.14.3.2.7)
     * 
     * </td>
     * <td>DES</td>
     * <td>DES</td>
     * <td>Data Encryption Standard (DES)</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_OIWSEC_sha1(1.3.14.3.2.26)
     * 
     * </td>
     * <td>SHA-1</td>
     * <td>SHA-1</td>
     * <td>Secure Hash Algorithm (SHA-1)</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_MD2(1.2.840.113549.2.2)
     * 
     * </td>
     * <td>MD2</td>
     * <td>MD2</td>
     * <td>Message Digest 2 (MD2)</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RC2CBC(1.2.840.113549.3.2)
     * 
     * </td>
     * <td>RC2</td>
     * <td>RC2</td>
     * <td>RSA Data Security's RC2</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_ANSI_X942_DH(1.2.840.10046.2.1)
     * 
     * </td>
     * <td>DH_KEYX</td>
     * <td>DH_KEYX</td>
     * <td>Diffie-Hellman Key Exchange Algorithm</td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_longname
     */
    get_LongName() {
        pValue := BSTR()
        result := ComCall(10, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the algorithm object is valid.
     * @remarks
     * 
     * If a template refers to an algorithm that is not supported by the specified cryptographic provider, the enrollment process creates a placeholder <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspalgorithm">ICspAlgorithm</a> object, sets the <b>Valid</b> property to false, and sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_name">Name</a> property. No other property values are defined.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-initializefromname">InitializeFromName</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-initializefromtype">InitializeFromType</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface before calling this property.
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) is defined by the X.680 through X.683 standards. The Certificate Enrollment API verifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) by <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoding it and then decoding the result to make certain that the OID remains unchanged and by checking that the following are true:<ul>
     * <li>The first number in the OID is either 0, 1, or 2.</li>
     * <li>All other characters are either digits (0 to 9) or periods (.).</li>
     * <li>No periods start or end the OID.</li>
     * <li>No consecutive characters are both periods.</li>
     * <li>The OID must contain at least one period.</li>
     * <li>If the first number is 0 or 1, the second number must be between 0 and 39 inclusive.</li>
     * <li>If the first number is 2, the second number can be any value.</li>
     * </ul>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_valid
     */
    get_Valid() {
        result := ComCall(11, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the maximum permitted length for a key.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_defaultlength">DefaultLength</a>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_incrementlength">IncrementLength</a>, <b>MaxLength</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_minlength">MinLength</a> properties can vary by algorithm and provider. The following table lists a few example maximum, minimum and default key sizes.<table>
     * <tr>
     * <th>Algorithm OID</th>
     * <th>Cryptographic provider</th>
     * <th>Key length (bits)</th>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_OIWSEC_desCBC
     * 
     * (1.3.14.3.2.7)
     * 
     * </td>
     * <td>
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 56
     * 
     * Maximum: 56
     * 
     * Default: 56
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_RSA_DES_EDE3_CBC
     * 
     * (1.2.840.113549.3.7)
     * 
     * </td>
     * <td>
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * Microsoft Exchange Cryptographic Provider v1.0
     * 
     * </td>
     * <td>
     * Minimum: 168
     * 
     * Maximum: 168
     * 
     * Default: 168
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_RSA_RSA
     * 
     * (1.2.840.113549.1.1.1)
     * 
     * </td>
     * <td>
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * Microsoft RSA Schannel Cryptographic Provider
     * 
     * Microsoft Strong Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 384
     * 
     * Maximum: 16,384
     * 
     * Default: 1,024
     * 
     * Increment: 8
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_X957_DSA
     * 
     * (1.2.840.10040.4.1)
     * 
     * </td>
     * <td>
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Base DSS Cryptographic Provider
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 512
     * 
     * Maximum: 1,024
     * 
     * Default: 1,024
     * 
     * Increment: 64
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_maxlength
     */
    get_MaxLength() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the minimum permitted length for a key.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_defaultlength">DefaultLength</a>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_incrementlength">IncrementLength</a>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_maxlength">MaxLength</a>, and <b>MinLength</b> properties can vary by algorithm and provider. The following table lists a few example maximum, minimum and default key sizes.<table>
     * <tr>
     * <th>Algorithm OID</th>
     * <th>Cryptographic provider</th>
     * <th>Key length (bits)</th>
     * </tr>
     * <tr>
     * <td>XCN_OID_OIWSEC_desCBC(1.3.14.3.2.7)
     * 
     * </td>
     * <td>
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 56
     * 
     * Maximum: 56
     * 
     * Default: 56
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_DES_EDE3_CBC(1.2.840.113549.3.7)
     * 
     * </td>
     * <td>
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * Microsoft Exchange Cryptographic Provider v1.0
     * 
     * </td>
     * <td>
     * Minimum: 168
     * 
     * Maximum: 168
     * 
     * Default: 168
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RSA(1.2.840.113549.1.1.1)
     * 
     * </td>
     * <td>
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * Microsoft RSA Schannel Cryptographic Provider
     * 
     * Microsoft Strong Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 384
     * 
     * Maximum: 16,384
     * 
     * Default: 1,024
     * 
     * Increment: 8
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XCN_OID_X957_DSA(1.2.840.10040.4.1)
     * 
     * </td>
     * <td>
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * Microsoft Base DSS Cryptographic Provider
     * 
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * </td>
     * <td>
     * Minimum: 512
     * 
     * Maximum: 1,024
     * 
     * Default: 1,024
     * 
     * Increment: 64
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_minlength
     */
    get_MinLength() {
        result := ComCall(13, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the abbreviated algorithm name.
     * @remarks
     * 
     * The <b>Name</b> property retrieves a shortened algorithm name. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_longname">LongName</a> property to retrieve a more descriptive name. The names are not localized. Examples are shown in the following table.
     * 
     * <div class="alert"><b>Note</b>  Cryptography API: Next Generation (CNG) key storage providers (KSPs) do not support the long name concept. The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_longname">LongName</a> property and <b>Name</b> property return an abbreviated name.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Algorithm OID</th>
     * <th>Name (KSP and CSP)</th>
     * <th>LongName (KSP)</th>
     * <th>LongName (CSP)</th>
     * </tr>
     * <tr>
     * <td>XCN_OID_OIWSEC_desCBC(1.3.14.3.2.7)
     * 
     * </td>
     * <td>DES</td>
     * <td>DES</td>
     * <td>Data Encryption Standard (DES)</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_OIWSEC_sha1(1.3.14.3.2.26)
     * 
     * </td>
     * <td>SHA-1</td>
     * <td>SHA-1</td>
     * <td>Secure Hash Algorithm (SHA-1)</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_MD2(1.2.840.113549.2.2)
     * 
     * </td>
     * <td>MD2</td>
     * <td>MD2</td>
     * <td>Message Digest 2 (MD2)</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_RSA_RC2CBC(1.2.840.113549.3.2)
     * 
     * </td>
     * <td>RC2</td>
     * <td>RC2</td>
     * <td>RSA Data Security's RC2</td>
     * </tr>
     * <tr>
     * <td>XCN_OID_ANSI_X942_DH(1.2.840.10046.2.1)
     * 
     * </td>
     * <td>DH_KEYX</td>
     * <td>DH_KEYX</td>
     * <td>Diffie-Hellman Key Exchange Algorithm</td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_name
     */
    get_Name() {
        pValue := BSTR()
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the algorithm type.
     * @remarks
     * 
     * The main difference between the <b>Type</b> property and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_operations">Operations</a> property is that the latter contains a bitfield in which multiple bits can be set. Because many algorithms can be used for multiple purposes, the <b>Operations</b> property is often more useful. The <b>Type</b> value can correspond to only one of the <b>Operations</b> value bits. For example, if the <b>Operations</b> property returns XCN_NCRYPT_SIGNATURE_OPERATION | XCN_NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION, the <b>Type</b> property may return XCN_BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_type
     */
    get_Type() {
        result := ComCall(15, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the operations that can be performed by the algorithm.
     * @remarks
     * 
     * The main difference between the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_type">Type</a> property and the <b>Operations</b> property is that the latter contains a bitfield in which multiple bits can be set. Because many algorithms can be used for multiple purposes, the <b>Operations</b> property is often more useful. The <b>Type</b> value can correspond to only one of the <b>Operations</b> value bits. For example, if the <b>Operations</b> property returns XCN_NCRYPT_SIGNATURE_OPERATION | XCN_NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION, the <b>Type</b> property may return XCN_BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspalgorithm-get_operations
     */
    get_Operations() {
        result := ComCall(16, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
