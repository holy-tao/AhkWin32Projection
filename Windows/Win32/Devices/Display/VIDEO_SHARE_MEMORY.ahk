#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_SHARE_MEMORY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    ProcessHandle{
        get {
            if(!this.HasProp("__ProcessHandle"))
                this.__ProcessHandle := HANDLE(this.ptr + 0)
            return this.__ProcessHandle
        }
    }

    /**
     * @type {Integer}
     */
    ViewOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ViewSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<Void>}
     */
    RequestedVirtualAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
