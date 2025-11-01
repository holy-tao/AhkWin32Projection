#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-virtual_disk_access_mask~r1
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class VIRTUAL_DISK_ACCESS_MASK{

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_ATTACH_RO => 65536

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_ATTACH_RW => 131072

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_DETACH => 262144

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_GET_INFO => 524288

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_CREATE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_METAOPS => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_READ => 851968

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_ALL => 4128768

    /**
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_WRITABLE => 3276800
}
