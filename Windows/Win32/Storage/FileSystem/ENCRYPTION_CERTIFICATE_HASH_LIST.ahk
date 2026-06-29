#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENCRYPTION_CERTIFICATE_HASH.ahk" { ENCRYPTION_CERTIFICATE_HASH }

/**
 * Contains a list of certificate hashes.
 * @see https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate_hash_list
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct ENCRYPTION_CERTIFICATE_HASH_LIST {
    #StructPack 8

    /**
     * The number of certificate hashes in the list.
     */
    nCert_Hash : UInt32

    /**
     * A pointer to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winefs/ns-winefs-encryption_certificate_hash">ENCRYPTION_CERTIFICATE_HASH</a> structure in the list.
     */
    pUsers : IntPtr

}
