#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_MAILBOX_CEL_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_CEL_LOG extends Win32Struct {
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {CXL_MAILBOX_CEL_ENTRY}
     */
    LogEntry {
        get {
            if(!this.HasProp("__LogEntryProxyArray"))
                this.__LogEntryProxyArray := Win32FixedArray(this.ptr + 0, 1, CXL_MAILBOX_CEL_ENTRY, "")
            return this.__LogEntryProxyArray
        }
    }
}
