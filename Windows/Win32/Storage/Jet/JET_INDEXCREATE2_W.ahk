#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_INDEXCREATE2_W extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    szIndexName{
        get {
            if(!this.HasProp("__szIndexName"))
                this.__szIndexName := PWSTR(this.ptr + 8)
            return this.__szIndexName
        }
    }

    /**
     * @type {PWSTR}
     */
    szKey{
        get {
            if(!this.HasProp("__szKey"))
                this.__szKey := PWSTR(this.ptr + 16)
            return this.__szKey
        }
    }

    /**
     * @type {Integer}
     */
    cbKey {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    grbit {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    ulDensity {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<JET_UNICODEINDEX>}
     */
    pidxunicode {
        get => NumGet(this, 36, "ptr")
        set => NumPut("ptr", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    cbVarSegMac {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<JET_TUPLELIMITS>}
     */
    ptuplelimits {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<JET_CONDITIONALCOLUMN_W>}
     */
    rgconditionalcolumn {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    cConditionalColumn {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    err {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    cbKeyMost {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<JET_SPACEHINTS>}
     */
    pSpacehints {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
