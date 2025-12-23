#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the protocol of a storage device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_protocol_type
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_TYPE extends Win32Enum{

    /**
     * Unknown protocol type.
     * @type {Integer (Int32)}
     */
    static ProtocolTypeUnknown => 0

    /**
     * SCSI protocol type.
     * @type {Integer (Int32)}
     */
    static ProtocolTypeScsi => 1

    /**
     * ATA protocol type.
     * @type {Integer (Int32)}
     */
    static ProtocolTypeAta => 2

    /**
     * NVMe protocol type.
     * @type {Integer (Int32)}
     */
    static ProtocolTypeNvme => 3

    /**
     * SD protocol type.
     * @type {Integer (Int32)}
     */
    static ProtocolTypeSd => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ProtocolTypeUfs => 5

    /**
     * Vendor-specific protocol type.
     * @type {Integer (Int32)}
     */
    static ProtocolTypeProprietary => 126

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static ProtocolTypeMaxReserved => 127
}
