#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The KSMULTIPLE\_ITEM structure describes the size and count of variable-length properties on kernel-mode pins.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/ksmultiple-item
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSMULTIPLE_ITEM extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Size of the returned memory block, in bytes. The size includes the **KSMULTIPLE\_ITEM** structure and the items that follow it.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total number of items that follow this structure.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
