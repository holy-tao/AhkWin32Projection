#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an array of MI_Instance types. (MI_ConstReferenceA)
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constreferencea
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ConstReferenceA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of  <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> types where only the keys are present.
     * @type {Pointer<Pointer<MI_Instance>>}
     */
    data {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of items in the data array.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
