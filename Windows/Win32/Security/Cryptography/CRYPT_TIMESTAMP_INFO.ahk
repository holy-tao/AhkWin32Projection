#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_TIMESTAMP_ACCURACY.ahk" { CRYPT_TIMESTAMP_ACCURACY }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains a signed data content type in Cryptographic Message Syntax (CMS) format.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_timestamp_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_TIMESTAMP_INFO {
    #StructPack 8

    /**
     * A <b>DWORD</b> value that specifies the version of the time stamp request.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_VERSION"></a><a id="timestamp_version"></a><dl>
     * <dt><b>TIMESTAMP_VERSION</b></dt>
     * <dt>	1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that this is a version 1 time stamp request.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * Optional. A pointer to a null-terminated string that specifies the Time Stamping Authority (TSA) policy under which the time stamp token was provided. This value must correspond with the value passed  in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_request">CRYPT_TIMESTAMP_REQUEST</a> structure.
     */
    pszTSAPolicyId : PSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains information about the algorithm used to calculate the hash. This value must correspond with the value passed  in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_request">CRYPT_TIMESTAMP_REQUEST</a> structure.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPT_DER_BLOB</a> structure that specifies the hash values to be time stamped.
     */
    HashedMessage : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the serial number assigned by the TSA to each time stamp token.
     */
    SerialNumber : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> value that specifies the time at which the time stamp token was produced by the TSA.
     */
    ftTime : FILETIME

    /**
     * Optional. A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_accuracy">CRYPT_TIMESTAMP_ACCURACY</a>   structure that contains the time deviation around the UTC time at which the time stamp token was created by the TSA.
     */
    pvAccuracy : CRYPT_TIMESTAMP_ACCURACY.Ptr

    /**
     * This member is reserved.
     */
    fOrdering : BOOL

    /**
     * Optional. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains the nonce value used by the client to verify the
     * timeliness of the response when no local clock is available. This value must correspond with the value passed  in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_request">CRYPT_TIMESTAMP_REQUEST</a> structure.
     */
    Nonce : CRYPT_INTEGER_BLOB

    /**
     * Optional. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains the subject name of the TSA certificate.
     */
    Tsa : CRYPT_INTEGER_BLOB

    /**
     * The number of elements in the array pointed to by the <b>rgExtension</b> member.
     */
    cExtension : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures that contain extension information returned from the request.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
