#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various types of storage buses.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_bus_type
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class STORAGE_BUS_TYPE extends Win32Enum{

    /**
     * Unknown bus type.
     * @type {Integer (Int32)}
     */
    static BusTypeUnknown => 0

    /**
     * SCSI bus.
     * @type {Integer (Int32)}
     */
    static BusTypeScsi => 1

    /**
     * ATAPI bus.
     * @type {Integer (Int32)}
     */
    static BusTypeAtapi => 2

    /**
     * ATA bus.
     * @type {Integer (Int32)}
     */
    static BusTypeAta => 3

    /**
     * IEEE-1394 bus.
     * @type {Integer (Int32)}
     */
    static BusType1394 => 4

    /**
     * SSA bus.
     * @type {Integer (Int32)}
     */
    static BusTypeSsa => 5

    /**
     * Fibre Channel bus.
     * @type {Integer (Int32)}
     */
    static BusTypeFibre => 6

    /**
     * USB bus.
     * @type {Integer (Int32)}
     */
    static BusTypeUsb => 7

    /**
     * RAID bus.
     * @type {Integer (Int32)}
     */
    static BusTypeRAID => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeiScsi => 9

    /**
     * Serial Attached SCSI (SAS) bus.
     * 
     * **Windows Server 2003:**  This is not supported before Windows Server 2003 with SP1.
     * @type {Integer (Int32)}
     */
    static BusTypeSas => 10

    /**
     * SATA bus.
     * 
     * **Windows Server 2003:**  This is not supported before Windows Server 2003 with SP1.
     * @type {Integer (Int32)}
     */
    static BusTypeSata => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeSd => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeMmc => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeVirtual => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeFileBackedVirtual => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeSpaces => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeNvme => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeSCM => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeUfs => 19

    /**
     * @type {Integer (Int32)}
     */
    static BusTypeNvmeof => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeMax => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BusTypeMaxReserved => 127
}
