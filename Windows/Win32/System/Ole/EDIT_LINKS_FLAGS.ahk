#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class EDIT_LINKS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_SHOWHELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_DISABLEUPDATENOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_DISABLEOPENSOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_DISABLECHANGESOURCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_DISABLECANCELLINK => 16
}
