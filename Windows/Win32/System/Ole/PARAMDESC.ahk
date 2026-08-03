#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PARAMDESCEX.ahk
#Include .\PARAMFLAGS.ahk

/**
 * Contains information needed for transferring a structure element, parameter, or function return value between processes.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-paramdesc
 * @namespace Windows.Win32.System.Ole
 */
class PARAMDESC extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * The default value for the parameter, if PARAMFLAG_FHASDEFAULT is specified in <b>wParamFlags</b>.
     * @type {Pointer<PARAMDESCEX>}
     */
    pparamdescex {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The parameter flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/paramflags">PARAMFLAG Constants</a>.
     * @type {PARAMFLAGS}
     */
    wParamFlags {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
