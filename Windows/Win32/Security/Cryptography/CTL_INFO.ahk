#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CTL_USAGE.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains the information stored in a Certificate Trust List (CTL).
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ctl_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_INFO extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

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
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_usage">CTL_USAGE</a> structure identifying the intended usage of the list as a sequence of object identifiers. This is the same as in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">Enhanced Key Usage</a> extension.
     * @type {CTL_USAGE}
     */
    SubjectUsage{
        get {
            if(!this.HasProp("__SubjectUsage"))
                this.__SubjectUsage := CTL_USAGE(this.ptr + 8)
            return this.__SubjectUsage
        }
    }

    /**
     * A
     * 						<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that includes a byte string that uniquely identifies the list. This member is used to augment the <b>SubjectUsage</b> and further specifies the list when desired.
     * @type {CRYPT_INTEGER_BLOB}
     */
    ListIdentifier{
        get {
            if(!this.HasProp("__ListIdentifier"))
                this.__ListIdentifier := CRYPT_INTEGER_BLOB(this.ptr + 24)
            return this.__ListIdentifier
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains a monotonically increasing number for each update of the CTL.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SequenceNumber{
        get {
            if(!this.HasProp("__SequenceNumber"))
                this.__SequenceNumber := CRYPT_INTEGER_BLOB(this.ptr + 40)
            return this.__SequenceNumber
        }
    }

    /**
     * Indication of the date and time of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a> (CRLs) published. If the time is after 1950 and before 2050, it is UTC-time encoded as an 8-byte date/time precise to seconds with a 2-digit year (that is, YYMMDDHHMMSS plus 2 bytes). Otherwise, it is generalized-time encoded as an 8-byte year precise to milliseconds with a 4-byte year.
     * @type {FILETIME}
     */
    ThisUpdate{
        get {
            if(!this.HasProp("__ThisUpdate"))
                this.__ThisUpdate := FILETIME(this.ptr + 56)
            return this.__ThisUpdate
        }
    }

    /**
     * Indication of the date and time for the CRL's next available scheduled update. If the time is after 1950 and before 2050, it is UTC-time encoded as an 8-byte date/time precise to seconds with a 2-digit year (that is, YYMMDDHHMMSS plus 2 bytes). Otherwise, it is generalized-time encoded as an 8-byte date time precise to milliseconds with a 4-byte year.
     * @type {FILETIME}
     */
    NextUpdate{
        get {
            if(!this.HasProp("__NextUpdate"))
                this.__NextUpdate := FILETIME(this.ptr + 64)
            return this.__NextUpdate
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the algorithm type of the <b>SubjectIdentifier</b> in <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_entry">CTL_ENTRY</a> members of the <b>rgCTLEntry</b> member array. The structure also includes additional parameters used by the algorithm.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    SubjectAlgorithm{
        get {
            if(!this.HasProp("__SubjectAlgorithm"))
                this.__SubjectAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 72)
            return this.__SubjectAlgorithm
        }
    }

    /**
     * Number of elements in the <b>rgCTLEntry</b> member array.
     * @type {Integer}
     */
    cCTLEntry {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_entry">CTL_ENTRY</a> structures.
     * @type {Pointer<CTL_ENTRY>}
     */
    rgCTLEntry {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Number of elements in the <b>rgExtension</b> array.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }
}
