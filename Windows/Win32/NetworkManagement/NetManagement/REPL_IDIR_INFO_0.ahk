#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class REPL_IDIR_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    rpid0_dirname{
        get {
            if(!this.HasProp("__rpid0_dirname"))
                this.__rpid0_dirname := PWSTR(this.ptr + 0)
            return this.__rpid0_dirname
        }
    }
}
