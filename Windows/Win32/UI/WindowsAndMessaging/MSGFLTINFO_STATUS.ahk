#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class MSGFLTINFO_STATUS extends Win32Enum {

    /**
     * Native name: MSGFLTINFO_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: MSGFLTINFO_ALLOWED_HIGHER
     * @type {Integer (UInt32)}
     */
    static ALLOWED_HIGHER => 3

    /**
     * Native name: MSGFLTINFO_ALREADYALLOWED_FORWND
     * @type {Integer (UInt32)}
     */
    static ALREADYALLOWED_FORWND => 1

    /**
     * Native name: MSGFLTINFO_ALREADYDISALLOWED_FORWND
     * @type {Integer (UInt32)}
     */
    static ALREADYDISALLOWED_FORWND => 2
}
