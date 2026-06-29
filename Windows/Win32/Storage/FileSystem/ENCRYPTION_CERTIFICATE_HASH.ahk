#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\EFS_HASH_BLOB.ahk" { EFS_HASH_BLOB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains a certificate hash and display information for the certificate.
 * @see https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate_hash
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct ENCRYPTION_CERTIFICATE_HASH {
    #StructPack 8

    /**
     * The length of this structure, in bytes.
     */
    cbTotalLength : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> of the user who created the certificate. This member is optional and can be <b>NULL</b>.
     */
    pUserSid : SID.Ptr

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winefs/ns-winefs-efs_hash_blob">EFS_HASH_BLOB</a> structure.
     */
    pHash : EFS_HASH_BLOB.Ptr

    /**
     * User-displayable information for the certificate.  This is usually the user's common name and universal principal name (UPN).
     */
    lpDisplayInformation : PWSTR

}
