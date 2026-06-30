#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class netent extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    n_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Pointer<Integer>>}
     */
    n_aliases {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    n_addrtype {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    n_net {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
