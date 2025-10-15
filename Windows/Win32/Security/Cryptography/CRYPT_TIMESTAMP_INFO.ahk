#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains a signed data content type in Cryptographic Message Syntax (CMS) format.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_timestamp_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_TIMESTAMP_INFO extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

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
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Optional. A pointer to a null-terminated string that specifies the Time Stamping Authority (TSA) policy under which the time stamp token was provided. This value must correspond with the value passed  in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_request">CRYPT_TIMESTAMP_REQUEST</a> structure.
     * @type {PSTR}
     */
    pszTSAPolicyId{
        get {
            if(!this.HasProp("__pszTSAPolicyId"))
                this.__pszTSAPolicyId := PSTR(this.ptr + 8)
            return this.__pszTSAPolicyId
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains information about the algorithm used to calculate the hash. This value must correspond with the value passed  in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_request">CRYPT_TIMESTAMP_REQUEST</a> structure.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 16)
            return this.__HashAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPT_DER_BLOB</a> structure that specifies the hash values to be time stamped.
     * @type {CRYPT_INTEGER_BLOB}
     */
    HashedMessage{
        get {
            if(!this.HasProp("__HashedMessage"))
                this.__HashedMessage := CRYPT_INTEGER_BLOB(this.ptr + 40)
            return this.__HashedMessage
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the serial number assigned by the TSA to each time stamp token.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumber"))
                this.__SerialNumber := CRYPT_INTEGER_BLOB(this.ptr + 56)
            return this.__SerialNumber
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> value that specifies the time at which the time stamp token was produced by the TSA.
     * @type {FILETIME}
     */
    ftTime{
        get {
            if(!this.HasProp("__ftTime"))
                this.__ftTime := FILETIME(this.ptr + 72)
            return this.__ftTime
        }
    }

    /**
     * Optional. A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_accuracy">CRYPT_TIMESTAMP_ACCURACY</a>   structure that contains the time deviation around the UTC time at which the time stamp token was created by the TSA.
     * @type {Pointer<CRYPT_TIMESTAMP_ACCURACY>}
     */
    pvAccuracy {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * This member is reserved.
     * @type {BOOL}
     */
    fOrdering{
        get {
            if(!this.HasProp("__fOrdering"))
                this.__fOrdering := BOOL(this.ptr + 88)
            return this.__fOrdering
        }
    }

    /**
     * Optional. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains the nonce value used by the client to verify the
     * timeliness of the response when no local clock is available. This value must correspond with the value passed  in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_request">CRYPT_TIMESTAMP_REQUEST</a> structure.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Nonce{
        get {
            if(!this.HasProp("__Nonce"))
                this.__Nonce := CRYPT_INTEGER_BLOB(this.ptr + 96)
            return this.__Nonce
        }
    }

    /**
     * Optional. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains the subject name of the TSA certificate.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Tsa{
        get {
            if(!this.HasProp("__Tsa"))
                this.__Tsa := CRYPT_INTEGER_BLOB(this.ptr + 112)
            return this.__Tsa
        }
    }

    /**
     * The number of elements in the array pointed to by the <b>rgExtension</b> member.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures that contain extension information returned from the request.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }
}
