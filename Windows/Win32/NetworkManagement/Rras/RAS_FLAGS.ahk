#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_PPP_CONNECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_MESSENGER_PRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_QUARANTINE_PRESENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_ARAP_CONNECTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_IKEV2_CONNECTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_DORMANT => 32
}
