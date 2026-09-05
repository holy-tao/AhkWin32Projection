#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Reserved for system use. (STORAGE_PORT_CODE_SET)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_port_code_set
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_PORT_CODE_SET extends Win32Enum {

    /**
     * Indicates an unknown storage adapter driver type.
     * Native name: StoragePortCodeSetReserved
     * @type {Integer (Int32)}
     */
    static Reserved => 0

    /**
     * Storage adapter driver is a Storport-miniport driver.
     * Native name: StoragePortCodeSetStorport
     * @type {Integer (Int32)}
     */
    static Storport => 1

    /**
     * Storage adapter driver is a SCSI Port-miniport driver.
     * Native name: StoragePortCodeSetSCSIport
     * @type {Integer (Int32)}
     */
    static SetSCSIport => 2

    /**
     * Storage adapter driver is the Spaceport driver.
     * Native name: StoragePortCodeSetSpaceport
     * @type {Integer (Int32)}
     */
    static Spaceport => 3

    /**
     * Storage adapter driver is an ATA-port miniport driver.
     * Native name: StoragePortCodeSetATAport
     * @type {Integer (Int32)}
     */
    static SetATAport => 4

    /**
     * Storage adapter driver is the  USB-storage port driver.
     * Native name: StoragePortCodeSetUSBport
     * @type {Integer (Int32)}
     */
    static SetUSBport => 5

    /**
     * Storage adapter driver is the  SBP2 port driver.
     * Native name: StoragePortCodeSetSBP2port
     * @type {Integer (Int32)}
     */
    static SetSBP2port => 6

    /**
     * Storage adapter driver is an SD-port miniport driver.
     * Native name: StoragePortCodeSetSDport
     * @type {Integer (Int32)}
     */
    static SetSDport => 7
}
