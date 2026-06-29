#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENCRYPTION_CERTIFICATE.ahk" { ENCRYPTION_CERTIFICATE }

/**
 * Contains a list of certificates.
 * @see https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate_list
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct ENCRYPTION_CERTIFICATE_LIST {
    #StructPack 8

    /**
     * The number of certificates in the list.
     */
    nUsers : UInt32

    /**
     * A pointer to the first 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/winefs/ns-winefs-encryption_certificate">ENCRYPTION_CERTIFICATE</a> structure in the list.
     */
    pUsers : IntPtr

}
