#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a pointer.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ns-oaidl-bindptr
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BINDPTR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a function.
     * @type {Pointer<FUNCDESC>}
     */
    lpfuncdesc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a variable, constant, or data member.
     * @type {Pointer<VARDESC>}
     */
    lpvardesc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> that binds the pointer.
     * @type {Pointer<ITypeComp>}
     */
    lptcomp {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
