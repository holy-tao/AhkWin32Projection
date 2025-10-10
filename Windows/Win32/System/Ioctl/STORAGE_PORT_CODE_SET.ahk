#Requires AutoHotkey v2.0.0 64-bit

/**
 * Reserved for system use.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ne-winioctl-storage_port_code_set
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PORT_CODE_SET{

    /**
     * Indicates an unknown storage adapter driver type.
     * @type {Integer (Int32)}
     */
    static StoragePortCodeSetReserved => 0

    /**
     * Storage adapter driver is a Storport-miniport driver.
     * @type {Integer (Int32)}
     */
    static StoragePortCodeSetStorport => 1

    /**
     * Storage adapter driver is a SCSI Port-miniport driver.
     * @type {Integer (Int32)}
     */
    static StoragePortCodeSetSCSIport => 2

    /**
     * Storage adapter driver is the Spaceport driver.
     * @type {Integer (Int32)}
     */
    static StoragePortCodeSetSpaceport => 3

    /**
     * Storage adapter driver is an ATA-port miniport driver.
     * @type {Integer (Int32)}
     */
    static StoragePortCodeSetATAport => 4

    /**
     * Storage adapter driver is the  USB-storage port driver.
     * @type {Integer (Int32)}
     */
    static StoragePortCodeSetUSBport => 5

    /**
     * Storage adapter driver is the  SBP2 port driver.
     * @type {Integer (Int32)}
     */
    static StoragePortCodeSetSBP2port => 6

    /**
     * Storage adapter driver is an SD-port miniport driver.
     * @type {Integer (Int32)}
     */
    static StoragePortCodeSetSDport => 7
}
