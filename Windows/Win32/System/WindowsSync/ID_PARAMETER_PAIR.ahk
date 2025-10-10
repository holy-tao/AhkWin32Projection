#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the format of a synchronization entity ID.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ns-winsync-id_parameter_pair
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ID_PARAMETER_PAIR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <b>TRUE</b> if the ID is variable length; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fIsVariable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The length of the ID when <i>fIsVariable</i> is <b>FALSE</b>. The maximum length of the ID when <i>fIsVariable</i> is <b>TRUE</b>. Must be greater than zero.
     * @type {Integer}
     */
    cbIdSize {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
