#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CXL_MAILBOX_SUPPORTED_LOG_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_GET_SUPPORTED_LOGS extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfSupportedLogsEntries {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 2, 6, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {CXL_MAILBOX_SUPPORTED_LOG_ENTRY}
     */
    SupportedLogEntries {
        get {
            if(!this.HasProp("__SupportedLogEntriesProxyArray"))
                this.__SupportedLogEntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, CXL_MAILBOX_SUPPORTED_LOG_ENTRY, "")
            return this.__SupportedLogEntriesProxyArray
        }
    }
}
