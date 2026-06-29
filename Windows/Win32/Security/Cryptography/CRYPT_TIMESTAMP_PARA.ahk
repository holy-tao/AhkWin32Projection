#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Defines additional parameters for the time stamp request.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_timestamp_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_TIMESTAMP_PARA {
    #StructPack 8

    /**
     * Optional. A pointer to a null-terminated character string that contains the Time Stamping Authority (TSA) policy under which the time stamp token
     * should be provided.
     */
    pszTSAPolicyId : PSTR

    /**
     * A Boolean value that specifies whether the TSA must include the certificates
     * used to sign the time stamp token in the response .
     */
    fRequestCerts : BOOL

    /**
     * Optional. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the nonce value used by the client to verify the
     * timeliness of the response when no local clock is available.
     */
    Nonce : CRYPT_INTEGER_BLOB

    /**
     * The number of elements in the array pointed to by the <b>rgExtension</b> member.
     */
    cExtension : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures that contain extension information that is passed in the request.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
