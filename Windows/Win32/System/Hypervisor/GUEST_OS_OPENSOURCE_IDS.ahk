#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class GUEST_OS_OPENSOURCE_IDS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsOpenSourceUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsOpenSourceLinux => 1

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsOpenSourceFreeBSD => 2

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsOpenSourceXen => 3

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsOpenSourceIllumos => 4
}
