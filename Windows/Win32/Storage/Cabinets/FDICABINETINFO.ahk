#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FDICABINETINFO structure contains details about a particular cabinet file.
 * @see https://learn.microsoft.com/windows/win32/api/fdi/ns-fdi-fdicabinetinfo
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDICABINETINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The total length of the cabinet file.
     * @type {Integer}
     */
    cbCabinet {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The count of the folders in the cabinet.
     * @type {Integer}
     */
    cFolders {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The count of the files in the cabinet.
     * @type {Integer}
     */
    cFiles {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The identifier of the cabinet set.
     * @type {Integer}
     */
    setID {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The cabinet number in set. This index is zero based.
     * @type {Integer}
     */
    iCabinet {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * If this value is set to <b>TRUE</b>, a reserved area is present in the cabinet.
     * @type {Integer}
     */
    fReserve {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * If this value is set to <b>TRUE</b>, the cabinet is linked to a previous cabinet. This is accomplished by having a file continued from the previous cabinet into the current one.
     * @type {Integer}
     */
    hasprev {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * If this value is set to <b>TRUE</b>, the current cabinet is linked to the next cabinet by having a file continued from the current cabinet into the next one.
     * @type {Integer}
     */
    hasnext {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
