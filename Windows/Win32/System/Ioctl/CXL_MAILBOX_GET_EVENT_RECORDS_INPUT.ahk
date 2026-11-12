#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_GET_EVENT_RECORDS_INPUT extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    EventLog {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
