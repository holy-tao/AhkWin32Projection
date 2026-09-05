#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class INTERNET_AUTODIAL extends Win32Enum {

    /**
     * Native name: INTERNET_AUTODIAL_FAILIFSECURITYCHECK
     * @type {Integer (UInt32)}
     */
    static FAILIFSECURITYCHECK => 4

    /**
     * Native name: INTERNET_AUTODIAL_FORCE_ONLINE
     * @type {Integer (UInt32)}
     */
    static FORCE_ONLINE => 1

    /**
     * Native name: INTERNET_AUTODIAL_FORCE_UNATTENDED
     * @type {Integer (UInt32)}
     */
    static FORCE_UNATTENDED => 2

    /**
     * Native name: INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT
     * @type {Integer (UInt32)}
     */
    static OVERRIDE_NET_PRESENT => 8
}
