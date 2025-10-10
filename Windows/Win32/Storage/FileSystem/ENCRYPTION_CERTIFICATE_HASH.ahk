#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a certificate hash and display information for the certificate.
 * @see https://docs.microsoft.com/windows/win32/api//winefs/ns-winefs-encryption_certificate_hash
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class ENCRYPTION_CERTIFICATE_HASH extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The length of this structure, in bytes.
     * @type {Integer}
     */
    cbTotalLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> of the user who created the certificate. This member is optional and can be <b>NULL</b>.
     * @type {Pointer<SID>}
     */
    pUserSid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winefs/ns-winefs-efs_hash_blob">EFS_HASH_BLOB</a> structure.
     * @type {Pointer<EFS_HASH_BLOB>}
     */
    pHash {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * User-displayable information for the certificate.  This is usually the user's common name and universal principal name (UPN).
     * @type {Pointer<Char>}
     */
    lpDisplayInformation {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
