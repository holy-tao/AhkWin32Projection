#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REPORT_PARAMETER extends Win32Struct {
    static sizeof => 778

    static packingSize => 2

    /**
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 0, 128, "UTF-16")
        set => StrPut(value, this.ptr + 0, 128, "UTF-16")
    }

    /**
     * @type {String}
     */
    Value {
        get => StrGet(this.ptr + 258, 259, "UTF-16")
        set => StrPut(value, this.ptr + 258, 259, "UTF-16")
    }
}
