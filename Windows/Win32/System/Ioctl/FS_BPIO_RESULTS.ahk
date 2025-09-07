#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FS_BPIO_RESULTS extends Win32Struct
{
    static sizeof => 328

    static packingSize => 4

    /**
     * @type {Integer}
     */
    OpStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FailingDriverNameLen {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {String}
     */
    FailingDriverName {
        get => StrGet(this.ptr + 6, 31, "UTF-16")
        set => StrPut(value, this.ptr + 6, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    FailureReasonLen {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }

    /**
     * @type {String}
     */
    FailureReason {
        get => StrGet(this.ptr + 72, 127, "UTF-16")
        set => StrPut(value, this.ptr + 72, 127, "UTF-16")
    }
}
