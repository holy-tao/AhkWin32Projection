#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Provides disk performance information.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_performance
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_PERFORMANCE {
    #StructPack 8

    /**
     * The number of bytes read.
     */
    BytesRead : Int64

    /**
     * The number of bytes written.
     */
    BytesWritten : Int64

    /**
     * The time it takes to complete a read.
     */
    ReadTime : Int64

    /**
     * The time it takes to complete a write.
     */
    WriteTime : Int64

    /**
     * The idle time.
     */
    IdleTime : Int64

    /**
     * The number of read operations.
     */
    ReadCount : UInt32

    /**
     * The number of write operations.
     */
    WriteCount : UInt32

    /**
     * The depth of the queue.
     */
    QueueDepth : UInt32

    /**
     * The cumulative count of I/Os that are associated I/Os. 
     * 
     * An associated I/O is a fragmented I/O, where multiple I/Os to a disk are required to fulfill the original logical I/O request. The most common example of this scenario is a file that is fragmented on a disk. The multiple I/Os are counted as split I/O counts.
     */
    SplitCount : UInt32

    /**
     * The system time stamp when a query for this structure is returned. 
     * 
     * Use this member to synchronize between the file system driver and a caller.
     */
    QueryTime : Int64

    /**
     * The unique number for a device that identifies it to the storage manager that is indicated in the <b>StorageManagerName</b> member.
     */
    StorageDeviceNumber : UInt32

    /**
     * The name of the storage manager that controls this device. 
     * 
     * Examples of storage managers are "PhysDisk," "FTDISK," and "DMIO".
     */
    StorageManagerName : WCHAR[8]

}
