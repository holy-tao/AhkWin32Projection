#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class VM_NOTIFY_ENTRY extends Win32Struct
{
    static sizeof => 512

    static packingSize => 2

    /**
     * @type {String}
     */
    VmName {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    VmHost {
        get => StrGet(this.ptr + 256, 127, "UTF-16")
        set => StrPut(value, this.ptr + 256, 127, "UTF-16")
    }
}
