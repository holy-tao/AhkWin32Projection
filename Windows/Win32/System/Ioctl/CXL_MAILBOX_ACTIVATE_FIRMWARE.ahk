#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_ACTIVATE_FIRMWARE extends Win32Struct {
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Slot {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
