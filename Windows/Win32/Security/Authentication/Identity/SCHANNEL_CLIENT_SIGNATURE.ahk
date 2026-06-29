#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Cryptography\ALG_ID.ahk" { ALG_ID }

/**
 * Specifies a client signature when a call to the InitializeSecurityContext (Schannel) function cannot access the private key for a client certificate (in this case, the function returns SEC_I_SIGNATURE_NEEDED).
 * @remarks
 * Add a client signature to a client context by using this structure as the value of the <i>pInput</i> parameter in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-schannel_client_signature
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCHANNEL_CLIENT_SIGNATURE {
    #StructPack 4

    /**
     * The size, in bytes, of this structure.
     */
    cbLength : UInt32

    /**
     * The ID of the algorithm used to compute the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the certificate.
     */
    aiHash : ALG_ID

    /**
     * The size, in bytes, of the <b>HashValue</b> array.
     */
    cbHash : UInt32

    /**
     * An array of byte values that specify the hash of the certificate.
     */
    HashValue : Int8[36]

    /**
     * An array of byte values that specify the certificate thumbprint.
     */
    CertThumbprint : Int8[20]

}
