#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class RAS_FLAGS extends Win32Enum {

    /**
     * Native name: RAS_FLAGS_PPP_CONNECTION
     * @type {Integer (UInt32)}
     */
    static PPP_CONNECTION => 1

    /**
     * Native name: RAS_FLAGS_MESSENGER_PRESENT
     * @type {Integer (UInt32)}
     */
    static MESSENGER_PRESENT => 2

    /**
     * Native name: RAS_FLAGS_QUARANTINE_PRESENT
     * @type {Integer (UInt32)}
     */
    static QUARANTINE_PRESENT => 8

    /**
     * Native name: RAS_FLAGS_ARAP_CONNECTION
     * @type {Integer (UInt32)}
     */
    static ARAP_CONNECTION => 16

    /**
     * Native name: RAS_FLAGS_IKEV2_CONNECTION
     * @type {Integer (UInt32)}
     */
    static IKEV2_CONNECTION => 16

    /**
     * Native name: RAS_FLAGS_DORMANT
     * @type {Integer (UInt32)}
     */
    static DORMANT => 32
}
