#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the identification number of a connection.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-connection_info_0
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class CONNECTION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    usSource {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    usControl {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    usDestination {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    usTransform {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    lScale {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
