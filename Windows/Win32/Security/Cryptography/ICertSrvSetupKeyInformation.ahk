#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a set of private key properties that are used for setup of certification authority (CA) or Microsoft Simple Certificate Enrollment Protocol (SCEP) roles.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertsrvsetupkeyinformation
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertSrvSetupKeyInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertSrvSetupKeyInformation
     * @type {Guid}
     */
    static IID => Guid("{6ba73778-36da-4c39-8a85-bcfa7d000793}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderName", "put_ProviderName", "get_Length", "put_Length", "get_Existing", "put_Existing", "get_ContainerName", "put_ContainerName", "get_HashAlgorithm", "put_HashAlgorithm", "get_ExistingCACertificate", "put_ExistingCACertificate"]

    /**
     * @type {BSTR} 
     */
    ProviderName {
        get => this.get_ProviderName()
        set => this.put_ProviderName(value)
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Existing {
        get => this.get_Existing()
        set => this.put_Existing(value)
    }

    /**
     * @type {BSTR} 
     */
    ContainerName {
        get => this.get_ContainerName()
        set => this.put_ContainerName(value)
    }

    /**
     * @type {BSTR} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * @type {VARIANT} 
     */
    ExistingCACertificate {
        get => this.get_ExistingCACertificate()
        set => this.put_ExistingCACertificate(value)
    }

    /**
     * Gets or sets the name of the cryptographic service provider (CSP) or key storage provider (KSP) that is used to generate or store the private key.
     * @remarks
     * 
     * For a KSP, the <b>ProviderName</b> property value must be formatted as <i>PublicKeyAlgorithmName</i>, number sign (#), and <i>KeyStorageProviderName</i>, for example "RSA#Microsoft Software Key Storage Provider" or "ECDSA_P256#Microsoft Software Key Storage Provider". The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key algorithm</a> must be supported by the provider. To get supported algorithms, call the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptenumalgorithms">NCryptEnumAlgorithms</a> function with the <i>dwAlgOperations</i> parameter set to <b>NCRYPT_SIGNATURE_OPERATION</b>. For information about algorithm identifiers, see <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-get_providername
     */
    get_ProviderName() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the name of the cryptographic service provider (CSP) or key storage provider (KSP) that is used to generate or store the private key.
     * @remarks
     * 
     * For a KSP, the <b>ProviderName</b> property value must be formatted as <i>PublicKeyAlgorithmName</i>, number sign (#), and <i>KeyStorageProviderName</i>, for example "RSA#Microsoft Software Key Storage Provider" or "ECDSA_P256#Microsoft Software Key Storage Provider". The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key algorithm</a> must be supported by the provider. To get supported algorithms, call the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptenumalgorithms">NCryptEnumAlgorithms</a> function with the <i>dwAlgOperations</i> parameter set to <b>NCRYPT_SIGNATURE_OPERATION</b>. For information about algorithm identifiers, see <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a>.
     * 
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-put_providername
     */
    put_ProviderName(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(8, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the strength of the key to one of the values supported by the cryptographic service provider (CSP).
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-get_length
     */
    get_Length() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the strength of the key to one of the values supported by the cryptographic service provider (CSP).
     * @param {Integer} lVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-put_length
     */
    put_Length(lVal) {
        result := ComCall(10, this, "int", lVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates whether the private key already exists.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-get_existing
     */
    get_Existing() {
        result := ComCall(11, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value that indicates whether the private key already exists.
     * @param {VARIANT_BOOL} bVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-put_existing
     */
    put_Existing(bVal) {
        result := ComCall(12, this, "short", bVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name used by the cryptographic service provider (CSP) to generate, store, or access the key.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> already exists, this name must match the name used by the CSP to access the key.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-get_containername
     */
    get_ContainerName() {
        pVal := BSTR()
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the name used by the cryptographic service provider (CSP) to generate, store, or access the key.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> already exists, this name must match the name used by the CSP to access the key.
     * 
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-put_containername
     */
    put_ContainerName(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(14, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name of the hashing algorithm used to sign or verify the certification authority (CA) certificate for the key.
     * @remarks
     * 
     * The hashing algorithm must be supported by the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetupkeyinformation-get_providername">ProviderName</a> provider. For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service providers</a> (CSPs), get supported algorithms by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgetprovparam">CryptGetProvParam</a> function for the given provider. For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key storage providers</a> (KSPs), get supported algorithms by calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptenumalgorithms">BCryptEnumAlgorithms</a> function with the <i>dwAlgOperations</i> parameter set to <b>BCRYPT_HASH_OPERATION</b>. For information about algorithm identifiers, see <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a>.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-get_hashalgorithm
     */
    get_HashAlgorithm() {
        pVal := BSTR()
        result := ComCall(15, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the name of the hashing algorithm used to sign or verify the certification authority (CA) certificate for the key.
     * @remarks
     * 
     * The hashing algorithm must be supported by the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetupkeyinformation-get_providername">ProviderName</a> provider. For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service providers</a> (CSPs), get supported algorithms by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgetprovparam">CryptGetProvParam</a> function for the given provider. For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key storage providers</a> (KSPs), get supported algorithms by calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptenumalgorithms">BCryptEnumAlgorithms</a> function with the <i>dwAlgOperations</i> parameter set to <b>BCRYPT_HASH_OPERATION</b>. For information about algorithm identifiers, see <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a>.
     * 
     * 
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-put_hashalgorithm
     */
    put_HashAlgorithm(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(16, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the binary value that has been encoded by using Distinguished Encoding Rules (DER) and that is the binary value of the certification authority (CA) certificate that corresponds to an existing key.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-get_existingcacertificate
     */
    get_ExistingCACertificate() {
        pVal := VARIANT()
        result := ComCall(17, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the binary value that has been encoded by using Distinguished Encoding Rules (DER) and that is the binary value of the certification authority (CA) certificate that corresponds to an existing key.
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetupkeyinformation-put_existingcacertificate
     */
    put_ExistingCACertificate(varVal) {
        result := ComCall(18, this, "ptr", varVal, "HRESULT")
        return result
    }
}
