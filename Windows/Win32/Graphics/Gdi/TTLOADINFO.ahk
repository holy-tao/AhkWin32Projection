#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TTLOADINFO structure contains the URL from which the embedded font object has been obtained.
 * @see https://docs.microsoft.com/windows/win32/api//t2embapi/ns-t2embapi-ttloadinfo
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class TTLOADINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size, in bytes, of this structure. The client should set this value to <b>sizeof</b>(TTLOADINFO).
     * @type {Integer}
     */
    usStructSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Size, in wide characters, of <i>pusRefStr</i>, including the terminating null character.
     * @type {Integer}
     */
    usRefStrSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Pointer to the string containing the current URL.
     * @type {Pointer<UInt16>}
     */
    pusRefStr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
