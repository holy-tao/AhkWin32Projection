#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Learn more about: JET_ENUMCOLUMNVALUE constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-enumcolumnvalue-constructor
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_ENUMCOLUMNVALUE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    itagSequence {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    err {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
