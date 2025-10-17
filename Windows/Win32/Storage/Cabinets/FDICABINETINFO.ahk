#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDICABINETINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbCabinet {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cFolders {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cFiles {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    setID {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    iCabinet {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {BOOL}
     */
    fReserve {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {BOOL}
     */
    hasprev {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    hasnext {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
