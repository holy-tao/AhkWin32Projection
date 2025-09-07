#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Learn more about: JET_SETINFO class
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-setinfo-class
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_SETINFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ibLongValue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    itagSequence {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
