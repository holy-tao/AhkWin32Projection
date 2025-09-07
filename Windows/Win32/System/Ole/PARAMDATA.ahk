#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a parameter accepted by a method or property.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ns-oleauto-paramdata
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PARAMDATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The parameter name. Names should follow standard conventions for programming language access; that is, no embedded spaces or control characters, and 32 or fewer characters. The name should be localized because each type description provides names for a particular locale.
     * @type {Pointer<Ptr>}
     */
    szName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The parameter type. If more than one parameter type is accepted, VT_VARIANT should be specified.
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
