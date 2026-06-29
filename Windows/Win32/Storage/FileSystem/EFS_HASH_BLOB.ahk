#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a certificate hash.
 * @see https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-efs_hash_blob
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct EFS_HASH_BLOB {
    #StructPack 8

    /**
     * The number of bytes in the <b>pbData</b> buffer.
     */
    cbData : UInt32

    /**
     * The certificate hash.
     */
    pbData : IntPtr

}
