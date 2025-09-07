#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TTEMBEDINFO structure contains a list of URLs from which the embedded font object may be legitimately referenced.
 * @see https://learn.microsoft.com/windows/win32/api/t2embapi/ns-t2embapi-ttembedinfo
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class TTEMBEDINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size, in bytes, of this structure. The client should set this value to <b>sizeof</b>(TTEMBEDINFO).
     * @type {Integer}
     */
    usStructSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Size, in wide characters, of <i>pusRootStr</i> including NULL terminator(s).
     * @type {Integer}
     */
    usRootStrSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * One or more full URLs that the embedded font object may be referenced from. Multiple URLs, separated by NULL terminators, can be specified.
     * @type {Pointer<UInt16>}
     */
    pusRootStr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
