#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a Transactional NTFS (TxF) specific structure. This information should only be used when calling TXFS_WRITE_BACKUP_INFORMATION. (TXFS_READ_BACKUP_INFORMATION_OUT)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_read_backup_information_out
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_READ_BACKUP_INFORMATION_OUT {
    #StructPack 4

    BufferLength : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Buffer', { type: Int8[1], offset: 0 })
        this.DeleteProp("__New")
    }
}
