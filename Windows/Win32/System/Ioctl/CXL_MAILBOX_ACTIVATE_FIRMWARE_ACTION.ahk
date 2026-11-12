#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_ACTIVATE_FIRMWARE_ACTION extends Win32Enum {

    /**
     * Native name: CxlMailboxActivateFWAction_Online
     * @type {Integer (Int32)}
     */
    static ActivateFWAction_Online => 0

    /**
     * Native name: CxlMailboxActivateFWAction_OnNextReset
     * @type {Integer (Int32)}
     */
    static ActivateFWAction_OnNextReset => 1

    /**
     * Native name: CxlMailboxActivateFWAction_Max
     * @type {Integer (Int32)}
     */
    static ActivateFWAction_Max => 2
}
