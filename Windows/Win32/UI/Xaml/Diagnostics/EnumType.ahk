#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a XAML Runtime enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-enumtype
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class EnumType extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The name of the enumeration.
     * @type {Pointer<BSTR>}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An array of int values in the enumeration.
     * @type {Pointer<SAFEARRAY>}
     */
    ValueInts {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An array of strings representing the named value of the enumeration.
     * @type {Pointer<SAFEARRAY>}
     */
    ValueStrings {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
