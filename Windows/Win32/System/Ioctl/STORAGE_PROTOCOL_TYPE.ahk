#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the protocol of a storage device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_protocol_type
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_PROTOCOL_TYPE extends Win32Enum {

    /**
     * Unknown protocol type.
     * Native name: ProtocolTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * SCSI protocol type.
     * Native name: ProtocolTypeScsi
     * @type {Integer (Int32)}
     */
    static Scsi => 1

    /**
     * ATA protocol type.
     * Native name: ProtocolTypeAta
     * @type {Integer (Int32)}
     */
    static Ata => 2

    /**
     * NVMe protocol type.
     * Native name: ProtocolTypeNvme
     * @type {Integer (Int32)}
     */
    static Nvme => 3

    /**
     * SD protocol type.
     * Native name: ProtocolTypeSd
     * @type {Integer (Int32)}
     */
    static Sd => 4

    /**
     * Native name: ProtocolTypeUfs
     * @type {Integer (Int32)}
     */
    static Ufs => 5

    /**
     * Vendor-specific protocol type.
     * Native name: ProtocolTypeProprietary
     * @type {Integer (Int32)}
     */
    static Proprietary => 126

    /**
     * Reserved.
     * Native name: ProtocolTypeMaxReserved
     * @type {Integer (Int32)}
     */
    static MaxReserved => 127
}
