#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_TIMESTAMP_RESPONSE_STATUS.ahk" { CRYPT_TIMESTAMP_RESPONSE_STATUS }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * Is used internally to encapsulate an Abstract Syntax Notation One (ASN.1) Distinguished Encoding Rules (DER) encoded response.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_timestamp_response
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_TIMESTAMP_RESPONSE {
    #StructPack 8

    /**
     * A <b>DWORD</b> value that indicates the status of the time stamp response.
     */
    dwStatus : CRYPT_TIMESTAMP_RESPONSE_STATUS

    /**
     * Optional. The length, in characters, of the string pointed to by the <b>rgFreeText</b> member.
     */
    cFreeText : UInt32

    /**
     * Optional. A pointer to a string that contains the text information about request failure.
     */
    rgFreeText : PWSTR.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> structure that contains the reason why the time stamp request was rejected. Each flag is encoded as a bit in the structure.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_FAILURE_BAD_ALG"></a><a id="timestamp_failure_bad_alg"></a><dl>
     * <dt><b>TIMESTAMP_FAILURE_BAD_ALG</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unrecognized or unsupported algorithm identifier was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_FAILURE_BAD_REQUEST"></a><a id="timestamp_failure_bad_request"></a><dl>
     * <dt><b>TIMESTAMP_FAILURE_BAD_REQUEST</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction is not permitted or supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_FAILURE_BAD_FORMAT"></a><a id="timestamp_failure_bad_format"></a><dl>
     * <dt><b>TIMESTAMP_FAILURE_BAD_FORMAT</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data submitted is in the wrong format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_FAILURE_TIME_NOT_AVAILABLE"></a><a id="timestamp_failure_time_not_available"></a><dl>
     * <dt><b>TIMESTAMP_FAILURE_TIME_NOT_AVAILABLE</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Time Stamping Authority (TSA) time source is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_FAILURE_POLICY_NOT_SUPPORTED"></a><a id="timestamp_failure_policy_not_supported"></a><dl>
     * <dt><b>TIMESTAMP_FAILURE_POLICY_NOT_SUPPORTED</b></dt>
     * <dt>15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested TSA policy is not supported by the TSA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_FAILURE_EXTENSION_NOT_SUPPORTED"></a><a id="timestamp_failure_extension_not_supported"></a><dl>
     * <dt><b>TIMESTAMP_FAILURE_EXTENSION_NOT_SUPPORTED</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested extension is not supported by the TSA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_FAILURE_INFO_NOT_AVAILABLE"></a><a id="timestamp_failure_info_not_available"></a><dl>
     * <dt><b>TIMESTAMP_FAILURE_INFO_NOT_AVAILABLE</b></dt>
     * <dt>17</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The additional information requested was not recognized or is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TIMESTAMP_FAILURE_SYSTEM_FAILURE"></a><a id="timestamp_failure_system_failure"></a><dl>
     * <dt><b>TIMESTAMP_FAILURE_SYSTEM_FAILURE</b></dt>
     * <dt>25</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request cannot be handled due to a system failure.  
     * 
     * </td>
     * </tr>
     * </table>
     */
    FailureInfo : CRYPT_BIT_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPT_DER_BLOB</a> structure that encapsulates a signed data content type in Cryptographic Message Syntax (CMS) format.
     */
    ContentInfo : CRYPT_INTEGER_BLOB

}
