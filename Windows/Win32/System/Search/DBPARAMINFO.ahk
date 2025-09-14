#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPARAMINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 2

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    iOrdinal {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszName {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Pointer<ITypeInfo>}
     */
    pTypeInfo {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Pointer}
     */
    ulParamSize {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    bPrecision {
        get => NumGet(this, 38, "char")
        set => NumPut("char", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    bScale {
        get => NumGet(this, 39, "char")
        set => NumPut("char", value, this, 39)
    }
}
