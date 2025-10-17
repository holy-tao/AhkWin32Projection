#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class MORRSLT extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pwchOutput {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cchOutput {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pwchRead {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    pwchComp {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cchRead {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    cchComp {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pchInputPos {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pchOutputIdxWDD {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pchReadIdxWDD {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pchCompIdxWDD {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    paMonoRubyPos {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<WDD>}
     */
    pWDD {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    cWDD {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Pointer<Void>}
     */
    pPrivate {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {String}
     */
    BLKBuff {
        get => StrGet(this.ptr + 96, 0, "UTF-16")
        set => StrPut(value, this.ptr + 96, 0, "UTF-16")
    }
}
