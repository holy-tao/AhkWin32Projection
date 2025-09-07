#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides disk performance information.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_performance
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_PERFORMANCE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The number of bytes read.
     * @type {Integer}
     */
    BytesRead {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The number of bytes written.
     * @type {Integer}
     */
    BytesWritten {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The time it takes to complete a read.
     * @type {Integer}
     */
    ReadTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The time it takes to complete a write.
     * @type {Integer}
     */
    WriteTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The idle time.
     * @type {Integer}
     */
    IdleTime {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The number of read operations.
     * @type {Integer}
     */
    ReadCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of write operations.
     * @type {Integer}
     */
    WriteCount {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The depth of the queue.
     * @type {Integer}
     */
    QueueDepth {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The cumulative count of I/Os that are associated I/Os. 
     * 
     * An associated I/O is a fragmented I/O, where multiple I/Os to a disk are required to fulfill the original logical I/O request. The most common example of this scenario is a file that is fragmented on a disk. The multiple I/Os are counted as split I/O counts.
     * @type {Integer}
     */
    SplitCount {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The system time stamp when a query for this structure is returned. 
     * 
     * Use this member to synchronize between the file system driver and a caller.
     * @type {Integer}
     */
    QueryTime {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * The unique number for a device that identifies it to the storage manager that is indicated in the <b>StorageManagerName</b> member.
     * @type {Integer}
     */
    StorageDeviceNumber {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The name of the storage manager that controls this device. 
     * 
     * Examples of storage managers are "PhysDisk," "FTDISK," and "DMIO".
     * @type {String}
     */
    StorageManagerName {
        get => StrGet(this.ptr + 68, 7, "UTF-16")
        set => StrPut(value, this.ptr + 68, 7, "UTF-16")
    }
}
