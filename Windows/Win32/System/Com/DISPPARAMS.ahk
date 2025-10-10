#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the arguments passed to a method or property.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ns-oaidl-dispparams
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class DISPPARAMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An array of arguments.
     * @type {Pointer<VARIANT>}
     */
    rgvarg {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The dispatch IDs of the named arguments.
     * @type {Pointer<Int32>}
     */
    rgdispidNamedArgs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of arguments.
     * @type {Integer}
     */
    cArgs {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of named arguments.
     * @type {Integer}
     */
    cNamedArgs {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
