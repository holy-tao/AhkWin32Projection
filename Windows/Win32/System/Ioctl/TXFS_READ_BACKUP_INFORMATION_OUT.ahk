#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a Transactional NTFS (TxF) specific structure. This information should only be used when calling TXFS_WRITE_BACKUP_INFORMATION. (TXFS_READ_BACKUP_INFORMATION_OUT)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_read_backup_information_out
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_READ_BACKUP_INFORMATION_OUT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    BufferLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
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
