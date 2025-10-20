#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-lgpos-structure2
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_LGPOS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ib {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    isec {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    lGeneration {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
