#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Allows the developer to view the qualifiers of a class definition.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_qualifierset
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_QualifierSet extends Win32Struct
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_qualifiersetft">MI_QualifierSetFT</a> structure holding the function pointers to view the qualifier details. To enumerate over the structure, use the functions containing the "MI_QualifierSet_" prefix.
     * @type {Pointer<MI_QualifierSetFT>}
     */
    ft {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
