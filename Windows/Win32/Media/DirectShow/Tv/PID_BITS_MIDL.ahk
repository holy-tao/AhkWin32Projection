#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class PID_BITS_MIDL extends Win32Struct {
    static sizeof => 2

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Bits {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
