#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Learn more about: JET_INDEXRANGE Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-indexrange-structure
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_INDEXRANGE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    tableid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    grbit {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
