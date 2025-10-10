#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a Transactional NTFS (TxF) specific structure. This information should only be used when calling TXFS_WRITE_BACKUP_INFORMATION.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-txfs_write_backup_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_WRITE_BACKUP_INFORMATION extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * The buffer for the data.
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
