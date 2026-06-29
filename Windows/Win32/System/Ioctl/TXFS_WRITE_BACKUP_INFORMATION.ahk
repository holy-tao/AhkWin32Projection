#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a Transactional NTFS (TxF) specific structure. This information should only be used when calling TXFS_WRITE_BACKUP_INFORMATION. (TXFS_WRITE_BACKUP_INFORMATION)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_write_backup_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_WRITE_BACKUP_INFORMATION {
    #StructPack 1

    /**
     * The buffer for the data.
     */
    Buffer : Int8[1]

}
