#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a single operations execution. This object holds the internal function tables for carrying out actions on the operation.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_operation
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Operation extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Reserved for internal use.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for internal use.
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This member is used internally, and it must not be changed.
     * @type {Pointer<MI_OperationFT>}
     */
    ft {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
