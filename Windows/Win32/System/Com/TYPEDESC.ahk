#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the type of a variable, the return type of a function, or the type of a function parameter.
 * @remarks
 * If the variable is VT_SAFEARRAY or VT_PTR, the union portion of the TYPEDESC contains a pointer to a TYPEDESC that specifies the element type.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-typedesc
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class TYPEDESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<TYPEDESC>}
     */
    lptdesc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<ARRAYDESC>}
     */
    lpadesc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    hreftype {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The variant type.
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
