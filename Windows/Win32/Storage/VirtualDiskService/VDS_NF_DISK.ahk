#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A disk was inserted, or a RAID controller surfaced a LUN that is local to the host.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_disk_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NF_DISK extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DISK_ARRIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DISK_DEPART => 9

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DISK_MODIFY => 10
}
