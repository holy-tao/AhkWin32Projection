#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class GUEST_OS_MICROSOFT_IDS extends Win32Enum {

    /**
     * Native name: GuestOsMicrosoftUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: GuestOsMicrosoftMSDOS
     * @type {Integer (Int32)}
     */
    static MicrosoftMSDOS => 1

    /**
     * Native name: GuestOsMicrosoftWindows3x
     * @type {Integer (Int32)}
     */
    static Windows3x => 2

    /**
     * Native name: GuestOsMicrosoftWindows9x
     * @type {Integer (Int32)}
     */
    static Windows9x => 3

    /**
     * Native name: GuestOsMicrosoftWindowsNT
     * @type {Integer (Int32)}
     */
    static WindowsNT => 4

    /**
     * Native name: GuestOsMicrosoftWindowsCE
     * @type {Integer (Int32)}
     */
    static WindowsCE => 5
}
