#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * CABINETSTATE may be altered or unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-cabinetstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CABINETSTATE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>WORD</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * @type {Integer}
     */
    nVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * One or both of the following flags.
     * @type {Integer}
     */
    fMenuEnumFilter {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
