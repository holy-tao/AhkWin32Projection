#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IObjectId.ahk" { IObjectId }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\AlgorithmType.ahk" { AlgorithmType }
#Import ".\AlgorithmOperationFlags.ahk" { AlgorithmOperationFlags }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AlgorithmFlags.ahk" { AlgorithmFlags }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Represents an algorithm implemented by a cryptographic provider.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icspalgorithm
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICspAlgorithm extends IDispatch {
    /**
     * The interface identifier for ICspAlgorithm
     * @type {Guid}
     */
    static IID := Guid("{728ab305-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICspAlgorithm interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetAlgorithmOid     : IntPtr
        get_DefaultLength   : IntPtr
        get_IncrementLength : IntPtr
        get_LongName        : IntPtr
        get_Valid           : IntPtr
        get_MaxLength       : IntPtr
        get_MinLength       : IntPtr
        get_Name            : IntPtr
        get_Type            : IntPtr
        get_Operations      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICspAlgorithm.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {AlgorithmType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {AlgorithmOperationFlags} 
     */
    Operations {
        get => this.get_Operations()
    }

    /**
     * Retrieves the algorithm object identifier (OID). This method is web enabled.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-initializefromname">InitializeFromName</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-initializefromtype">InitializeFromType</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface before calling <b>GetAlgorithmOid</b>.
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
     * @param {AlgorithmFlags} AlgFlags 
     * @returns {IObjectId} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the algorithm OID.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-getalgorithmoid
     */
    GetAlgorithmOid(Length, AlgFlags) {
        result := ComCall(7, this, "int", Length, AlgorithmFlags, AlgFlags, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves the default length of a key.
     * @remarks
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_defaultlength
     */
    get_DefaultLength() {
        result := ComCall(8, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value, in bits, that can be used to determine valid incremental key lengths for algorithms that support multiple key sizes.
     * @remarks
     * You can use the value of this property to determine valid key sizes for generated keys. For example, if the minimum key length of a DSA signing key is 512 bits, the maximum length is 1,024 bits, and the increment is 64 bits, valid key sizes include 512, 576, 640 and so in 64 bit increments up to  1,024.
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_incrementlength
     */
    get_IncrementLength() {
        result := ComCall(9, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the full name of the algorithm.
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_longname
     */
    get_LongName() {
        pValue := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the algorithm object is valid.
     * @remarks
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_valid
     */
    get_Valid() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the maximum permitted length for a key.
     * @remarks
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_maxlength
     */
    get_MaxLength() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the minimum permitted length for a key.
     * @remarks
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_minlength
     */
    get_MinLength() {
        result := ComCall(13, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the abbreviated algorithm name.
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_name
     */
    get_Name() {
        pValue := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the algorithm type.
     * @remarks
     * The main difference between the <b>Type</b> property and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_operations">Operations</a> property is that the latter contains a bitfield in which multiple bits can be set. Because many algorithms can be used for multiple purposes, the <b>Operations</b> property is often more useful. The <b>Type</b> value can correspond to only one of the <b>Operations</b> value bits. For example, if the <b>Operations</b> property returns XCN_NCRYPT_SIGNATURE_OPERATION | XCN_NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION, the <b>Type</b> property may return XCN_BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE.
     * @returns {AlgorithmType} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_type
     */
    get_Type() {
        result := ComCall(15, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the operations that can be performed by the algorithm.
     * @remarks
     * The main difference between the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspalgorithm-get_type">Type</a> property and the <b>Operations</b> property is that the latter contains a bitfield in which multiple bits can be set. Because many algorithms can be used for multiple purposes, the <b>Operations</b> property is often more useful. The <b>Type</b> value can correspond to only one of the <b>Operations</b> value bits. For example, if the <b>Operations</b> property returns XCN_NCRYPT_SIGNATURE_OPERATION | XCN_NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION, the <b>Type</b> property may return XCN_BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE.
     * @returns {AlgorithmOperationFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_operations
     */
    get_Operations() {
        result := ComCall(16, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICspAlgorithm.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAlgorithmOid := CallbackCreate(GetMethod(implObj, "GetAlgorithmOid"), flags, 4)
        this.vtbl.get_DefaultLength := CallbackCreate(GetMethod(implObj, "get_DefaultLength"), flags, 2)
        this.vtbl.get_IncrementLength := CallbackCreate(GetMethod(implObj, "get_IncrementLength"), flags, 2)
        this.vtbl.get_LongName := CallbackCreate(GetMethod(implObj, "get_LongName"), flags, 2)
        this.vtbl.get_Valid := CallbackCreate(GetMethod(implObj, "get_Valid"), flags, 2)
        this.vtbl.get_MaxLength := CallbackCreate(GetMethod(implObj, "get_MaxLength"), flags, 2)
        this.vtbl.get_MinLength := CallbackCreate(GetMethod(implObj, "get_MinLength"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Operations := CallbackCreate(GetMethod(implObj, "get_Operations"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAlgorithmOid)
        CallbackFree(this.vtbl.get_DefaultLength)
        CallbackFree(this.vtbl.get_IncrementLength)
        CallbackFree(this.vtbl.get_LongName)
        CallbackFree(this.vtbl.get_Valid)
        CallbackFree(this.vtbl.get_MaxLength)
        CallbackFree(this.vtbl.get_MinLength)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Operations)
    }
}
