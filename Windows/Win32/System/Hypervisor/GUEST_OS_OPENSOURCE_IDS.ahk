#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class GUEST_OS_OPENSOURCE_IDS extends Win32Enum {

    /**
     * Native name: GuestOsOpenSourceUndefined
     * @type {Integer (Int32)}
     */
    static OpenSourceUndefined => 0

    /**
     * Native name: GuestOsOpenSourceLinux
     * @type {Integer (Int32)}
     */
    static OpenSourceLinux => 1

    /**
     * Native name: GuestOsOpenSourceFreeBSD
     * @type {Integer (Int32)}
     */
    static OpenSourceFreeBSD => 2

    /**
     * Native name: GuestOsOpenSourceXen
     * @type {Integer (Int32)}
     */
    static OpenSourceXen => 3

    /**
     * Native name: GuestOsOpenSourceIllumos
     * @type {Integer (Int32)}
     */
    static OpenSourceIllumos => 4
}
