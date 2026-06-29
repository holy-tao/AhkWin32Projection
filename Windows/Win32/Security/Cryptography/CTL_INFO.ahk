#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CTL_USAGE.ahk" { CTL_USAGE }
#Import ".\CTL_ENTRY.ahk" { CTL_ENTRY }
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the information stored in a Certificate Trust List (CTL).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_INFO {
    #StructPack 8

    /**
     * The CTL's version number. Currently defined version numbers are shown in the following table. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CTL_V1"></a><a id="ctl_v1"></a><dl>
     * <dt><b>CTL_V1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version 1
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_usage">CTL_USAGE</a> structure identifying the intended usage of the list as a sequence of object identifiers. This is the same as in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">Enhanced Key Usage</a> extension.
     */
    SubjectUsage : CTL_USAGE

    /**
     * A
     * 						<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that includes a byte string that uniquely identifies the list. This member is used to augment the <b>SubjectUsage</b> and further specifies the list when desired.
     */
    ListIdentifier : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains a monotonically increasing number for each update of the CTL.
     */
    SequenceNumber : CRYPT_INTEGER_BLOB

    /**
     * Indication of the date and time of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a> (CRLs) published. If the time is after 1950 and before 2050, it is UTC-time encoded as an 8-byte date/time precise to seconds with a 2-digit year (that is, YYMMDDHHMMSS plus 2 bytes). Otherwise, it is generalized-time encoded as an 8-byte year precise to milliseconds with a 4-byte year.
     */
    ThisUpdate : FILETIME

    /**
     * Indication of the date and time for the CRL's next available scheduled update. If the time is after 1950 and before 2050, it is UTC-time encoded as an 8-byte date/time precise to seconds with a 2-digit year (that is, YYMMDDHHMMSS plus 2 bytes). Otherwise, it is generalized-time encoded as an 8-byte date time precise to milliseconds with a 4-byte year.
     */
    NextUpdate : FILETIME

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the algorithm type of the <b>SubjectIdentifier</b> in <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_entry">CTL_ENTRY</a> members of the <b>rgCTLEntry</b> member array. The structure also includes additional parameters used by the algorithm.
     */
    SubjectAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * Number of elements in the <b>rgCTLEntry</b> member array.
     */
    cCTLEntry : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_entry">CTL_ENTRY</a> structures.
     */
    rgCTLEntry : CTL_ENTRY.Ptr

    /**
     * Number of elements in the <b>rgExtension</b> array.
     */
    cExtension : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
