#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NETCON_CHARACTERISTIC_FLAGS enumeration type specifies possible characteristics for a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/ne-netcon-netcon_characteristic_flags
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETCON_CHARACTERISTIC_FLAGS{

    /**
     * No special characteristics.
     * @type {Integer (Int32)}
     */
    static NCCF_NONE => 0

    /**
     * Connection is available to all users.
     * @type {Integer (Int32)}
     */
    static NCCF_ALL_USERS => 1

    /**
     * Connection is duplicable.
     * @type {Integer (Int32)}
     */
    static NCCF_ALLOW_DUPLICATION => 2

    /**
     * Connection is removable.
     * @type {Integer (Int32)}
     */
    static NCCF_ALLOW_REMOVAL => 4

    /**
     * Connection can be renamed.
     * @type {Integer (Int32)}
     */
    static NCCF_ALLOW_RENAME => 8

    /**
     * Direction is "incoming" only.
     * @type {Integer (Int32)}
     */
    static NCCF_INCOMING_ONLY => 32

    /**
     * Direction is "outgoing" only.
     * @type {Integer (Int32)}
     */
    static NCCF_OUTGOING_ONLY => 64

    /**
     * Icons are branded.
     * @type {Integer (Int32)}
     */
    static NCCF_BRANDED => 128

    /**
     * Connection is shared.
     * @type {Integer (Int32)}
     */
    static NCCF_SHARED => 256

    /**
     * Connection is bridged.
     * @type {Integer (Int32)}
     */
    static NCCF_BRIDGED => 512

    /**
     * Connection is firewalled.
     * @type {Integer (Int32)}
     */
    static NCCF_FIREWALLED => 1024

    /**
     * Connection is the default connection.
     * @type {Integer (Int32)}
     */
    static NCCF_DEFAULT => 2048

    /**
     * Device supports home networking.
     * @type {Integer (Int32)}
     */
    static NCCF_HOMENET_CAPABLE => 4096

    /**
     * Connection is private (part of ICS).
     * @type {Integer (Int32)}
     */
    static NCCF_SHARED_PRIVATE => 8192

    /**
     * Connection is quarantined.
     * @type {Integer (Int32)}
     */
    static NCCF_QUARANTINED => 16384

    /**
     * Unused.
     * @type {Integer (Int32)}
     */
    static NCCF_RESERVED => 32768

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NCCF_HOSTED_NETWORK => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NCCF_VIRTUAL_STATION => 131072

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NCCF_WIFI_DIRECT => 262144

    /**
     * Bluetooth characteristics.
     * @type {Integer (Int32)}
     */
    static NCCF_BLUETOOTH_MASK => 983040

    /**
     * LAN characteristics.
     * @type {Integer (Int32)}
     */
    static NCCF_LAN_MASK => 15728640
}
