#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various types of storage buses.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_bus_type
 * @namespace Windows.Win32.Storage.FileSystem
 */
class STORAGE_BUS_TYPE extends Win32Enum {

    /**
     * Unknown bus type.
     * Native name: BusTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * SCSI bus.
     * Native name: BusTypeScsi
     * @type {Integer (Int32)}
     */
    static Scsi => 1

    /**
     * ATAPI bus.
     * Native name: BusTypeAtapi
     * @type {Integer (Int32)}
     */
    static Atapi => 2

    /**
     * ATA bus.
     * Native name: BusTypeAta
     * @type {Integer (Int32)}
     */
    static Ata => 3

    /**
     * IEEE-1394 bus.
     * Native name: BusType1394
     * @type {Integer (Int32)}
     */
    static Type1394 => 4

    /**
     * SSA bus.
     * Native name: BusTypeSsa
     * @type {Integer (Int32)}
     */
    static Ssa => 5

    /**
     * Fibre Channel bus.
     * Native name: BusTypeFibre
     * @type {Integer (Int32)}
     */
    static Fibre => 6

    /**
     * USB bus.
     * Native name: BusTypeUsb
     * @type {Integer (Int32)}
     */
    static Usb => 7

    /**
     * RAID bus.
     * Native name: BusTypeRAID
     * @type {Integer (Int32)}
     */
    static TypeRAID => 8

    /**
     * Native name: BusTypeiScsi
     * @type {Integer (Int32)}
     */
    static TypeiScsi => 9

    /**
     * Serial Attached SCSI (SAS) bus.
     * 
     * **Windows Server 2003:**  This is not supported before Windows Server 2003 with SP1.
     * Native name: BusTypeSas
     * @type {Integer (Int32)}
     */
    static Sas => 10

    /**
     * SATA bus.
     * 
     * **Windows Server 2003:**  This is not supported before Windows Server 2003 with SP1.
     * Native name: BusTypeSata
     * @type {Integer (Int32)}
     */
    static Sata => 11

    /**
     * Native name: BusTypeSd
     * @type {Integer (Int32)}
     */
    static Sd => 12

    /**
     * Native name: BusTypeMmc
     * @type {Integer (Int32)}
     */
    static Mmc => 13

    /**
     * Native name: BusTypeVirtual
     * @type {Integer (Int32)}
     */
    static Virtual => 14

    /**
     * Native name: BusTypeFileBackedVirtual
     * @type {Integer (Int32)}
     */
    static FileBackedVirtual => 15

    /**
     * Native name: BusTypeSpaces
     * @type {Integer (Int32)}
     */
    static Spaces => 16

    /**
     * Native name: BusTypeNvme
     * @type {Integer (Int32)}
     */
    static Nvme => 17

    /**
     * Native name: BusTypeSCM
     * @type {Integer (Int32)}
     */
    static TypeSCM => 18

    /**
     * Native name: BusTypeUfs
     * @type {Integer (Int32)}
     */
    static Ufs => 19

    /**
     * Native name: BusTypeNvmeof
     * @type {Integer (Int32)}
     */
    static Nvmeof => 20

    /**
     * Native name: BusTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 21

    /**
     * Native name: BusTypeMaxReserved
     * @type {Integer (Int32)}
     */
    static MaxReserved => 127
}
