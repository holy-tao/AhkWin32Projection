#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\EFS_CERTIFICATE_BLOB.ahk" { EFS_CERTIFICATE_BLOB }

/**
 * Contains a certificate and the SID of its owner.
 * @see https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct ENCRYPTION_CERTIFICATE {
    #StructPack 8

    /**
     * The length of this structure, in bytes.
     */
    cbTotalLength : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> of the user who owns the certificate.
     */
    pUserSid : SID.Ptr

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winefs/ns-winefs-efs_certificate_blob">EFS_CERTIFICATE_BLOB</a> structure.
     */
    pCertBlob : EFS_CERTIFICATE_BLOB.Ptr

}
