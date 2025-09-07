#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Learn more about: JET_BKLOGTIME Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-bklogtime-structure
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_BKLOGTIME extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bSeconds {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bMinutes {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bHours {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bDay {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    bMonth {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    bYear {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    bFiller1 {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    bFiller2 {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }
}
