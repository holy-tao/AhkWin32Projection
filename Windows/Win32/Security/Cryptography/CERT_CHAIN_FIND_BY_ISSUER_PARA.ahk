#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains information used in the CertFindChainInStore function to build certificate chains.
 * @remarks
 * The <b>pdwIssuerChainIndex</b> and <b>pdwIssuerElementIndex</b> members are only available if the <b>CERT_CHAIN_FIND_BY_ISSUER_PARA_HAS_EXTRA_FIELDS</b> macro is defined. If the <b>CERT_CHAIN_FIND_BY_ISSUER_PARA_HAS_EXTRA_FIELDS</b> macro is defined, the application must initialize all unused fields to zero.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_chain_find_by_issuer_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CHAIN_FIND_BY_ISSUER_PARA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Contains the size of this structure, in bytes. This size should not be hard-coded. It should be set at compile time by using the <b>sizeof</b> operator as shown in the following example.
     * 
     * 
     * ```cpp
     * CERT_CHAIN_FIND_BY_ISSUER_PARA findParams;
     * findParams.cbSize = sizeof(CERT_CHAIN_FIND_BY_ISSUER_PARA);
     * ```
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated ANSI string that contains the usage identifier to be matched. If this member is <b>NULL</b>, a certificate with any usage can be a match.
     * @type {PSTR}
     */
    pszUsageIdentifier{
        get {
            if(!this.HasProp("__pszUsageIdentifier"))
                this.__pszUsageIdentifier := PSTR(this.ptr + 8)
            return this.__pszUsageIdentifier
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * When the <i>dwFindFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfindchaininstore">CertFindChainInStore</a> function contains <b>CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecertificateprivatekey">CryptAcquireCertificatePrivateKey</a> function is called to do the public key comparison. In this case, this member is passed as the <i>dwFlags</i> parameter of the <b>CryptAcquireCertificatePrivateKey</b> function. For possible values for this member and their meanings, see the <i>dwFlags</i> parameter of the <b>CryptAcquireCertificatePrivateKey</b> function.
     * @type {Integer}
     */
    dwAcquirePrivateKeyFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Contains the number of elements in the <b>rgIssuer</b> array. If this member is zero, any issuer can be a match.
     * @type {Integer}
     */
    cIssuer {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a>, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoded issuer name <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOBs</a> to match. If this member is <b>NULL</b> or the callback function returns <b>TRUE</b>, a new element is added to the chain for the certificate having a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> with the specified KeySpec and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">enhanced key usage</a>.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgIssuer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_chain_find_by_issuer_callback">CertChainFindByIssuerCallback</a> callback function that allows the application to filter the certificates that chains are created for. If this member is <b>NULL</b>, a chain is built for every certificate found. If this member is not <b>NULL</b>, a chain will be built for the certificate found based on the return value of the callback function.
     * @type {Pointer<Ptr>}
     */
    pfnFindCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * An application-defined value that will be passed as the <i>pvFindArg</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_chain_find_by_issuer_callback">CertChainFindByIssuerCallback</a> callback function pointed to by the <b>pfnFindCallback</b> member of this structure.
     * @type {Pointer<Void>}
     */
    pvFindArg {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
