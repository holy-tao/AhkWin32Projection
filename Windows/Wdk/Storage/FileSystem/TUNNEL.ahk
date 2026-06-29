#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RTL_SPLAY_LINKS.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class TUNNEL extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Mutex {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<RTL_SPLAY_LINKS>}
     */
    Cache {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    TimerQueue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
