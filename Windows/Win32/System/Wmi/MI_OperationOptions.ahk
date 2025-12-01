#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a set of operation options.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_operationoptions
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_OperationOptions extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * This member is used internally, and it must not be changed.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is used internally, and it must not be changed.
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This member is used internally, and it must not be changed.
     * @type {Pointer<MI_OperationOptionsFT>}
     */
    ft {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
