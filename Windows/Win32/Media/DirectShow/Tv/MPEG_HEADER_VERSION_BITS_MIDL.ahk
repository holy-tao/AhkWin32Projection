#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_HEADER_VERSION_BITS_MIDL extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Bits {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
