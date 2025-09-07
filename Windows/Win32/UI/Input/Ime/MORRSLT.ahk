#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class MORRSLT extends Win32Struct
{
    static sizeof => 78

    static packingSize => 1

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
    pwchOutput{
        get {
            if(!this.HasProp("__pwchOutput"))
                this.__pwchOutput := PWSTR(this.ptr + 4)
            return this.__pwchOutput
        }
    }

    /**
     * @type {Integer}
     */
    cchOutput {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {PWSTR}
     */
    pwchRead{
        get {
            if(!this.HasProp("__pwchRead"))
                this.__pwchRead := PWSTR(this.ptr + 14)
            return this.__pwchRead
        }
    }

    /**
     * @type {PWSTR}
     */
    pwchComp{
        get {
            if(!this.HasProp("__pwchComp"))
                this.__pwchComp := PWSTR(this.ptr + 14)
            return this.__pwchComp
        }
    }

    /**
     * @type {Integer}
     */
    cchRead {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    cchComp {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pchInputPos {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pchOutputIdxWDD {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pchReadIdxWDD {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pchCompIdxWDD {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    paMonoRubyPos {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<WDD>}
     */
    pWDD {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    cWDD {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Pointer<Void>}
     */
    pPrivate {
        get => NumGet(this, 68, "ptr")
        set => NumPut("ptr", value, this, 68)
    }

    /**
     * @type {String}
     */
    BLKBuff {
        get => StrGet(this.ptr + 76, 0, "UTF-16")
        set => StrPut(value, this.ptr + 76, 0, "UTF-16")
    }
}
