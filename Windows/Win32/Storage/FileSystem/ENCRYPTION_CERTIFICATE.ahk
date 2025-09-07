#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a certificate and the SID of its owner.
 * @see https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class ENCRYPTION_CERTIFICATE extends Win32Struct
{
    static sizeof => 24

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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> of the user who owns the certificate.
     * @type {Pointer<SID>}
     */
    pUserSid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winefs/ns-winefs-efs_certificate_blob">EFS_CERTIFICATE_BLOB</a> structure.
     * @type {Pointer<EFS_CERTIFICATE_BLOB>}
     */
    pCertBlob {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
