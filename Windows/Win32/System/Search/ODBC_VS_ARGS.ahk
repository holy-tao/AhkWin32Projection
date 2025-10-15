#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ODBC_VS_ARGS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    pguidEvent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    wszArg{
        get {
            if(!this.HasProp("__wszArg"))
                this.__wszArg := PWSTR(this.ptr + 16)
            return this.__wszArg
        }
    }

    /**
     * @type {PSTR}
     */
    szArg{
        get {
            if(!this.HasProp("__szArg"))
                this.__szArg := PSTR(this.ptr + 16)
            return this.__szArg
        }
    }

    /**
     * @type {PWSTR}
     */
    wszCorrelation{
        get {
            if(!this.HasProp("__wszCorrelation"))
                this.__wszCorrelation := PWSTR(this.ptr + 24)
            return this.__wszCorrelation
        }
    }

    /**
     * @type {PSTR}
     */
    szCorrelation{
        get {
            if(!this.HasProp("__szCorrelation"))
                this.__szCorrelation := PSTR(this.ptr + 24)
            return this.__szCorrelation
        }
    }

    /**
     * @type {Integer}
     */
    RetCode {
        get => NumGet(this, 32, "short")
        set => NumPut("short", value, this, 32)
    }
}
