#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_TIMESTAMP_VERSION.ahk" { CRYPT_TIMESTAMP_VERSION }

/**
 * Defines a time stamp request structure that corresponds to the Abstract Syntax Notation One (ASN.1) definition of a TimeStampReq type.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_timestamp_request
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_TIMESTAMP_REQUEST {
    #StructPack 8

    /**
     * A <b>DWORD</b> value that specifies the version of the time stamp request.
     */
    dwVersion : CRYPT_TIMESTAMP_VERSION

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains information about the algorithm used to calculate the hash.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPT_DER_BLOB</a> structure that specifies the hash values to be time stamped.
     */
    HashedMessage : CRYPT_INTEGER_BLOB

    /**
     * Optional. A pointer to a null-terminated string that specifies the Time Stamping Authority (TSA) policy under which the time stamp token should be provided.
     */
    pszTSAPolicyId : PSTR

    /**
     * Optional. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the nonce value used by the client to verify the
     * timeliness of the response when no local clock is available.
     */
    Nonce : CRYPT_INTEGER_BLOB

    /**
     * A Boolean value that indicates whether the TSA must include the certificates used to sign the time stamp token in the response.
     */
    fCertReq : BOOL

    /**
     * The number of elements in the array pointed to by the <b>rgExtension</b> member.
     */
    cExtension : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures that contain extension information that is passed in the request.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
