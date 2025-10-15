#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

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
     * @type {BOOL}
     */
    fIsVariable{
        get {
            if(!this.HasProp("__fIsVariable"))
                this.__fIsVariable := BOOL(this.ptr + 0)
            return this.__fIsVariable
        }
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
