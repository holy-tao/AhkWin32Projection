#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_MIRACAST_DISPLAY_STOP_SESSIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {LUID}
     */
    AdapterLuid{
        get {
            if(!this.HasProp("__AdapterLuid"))
                this.__AdapterLuid := LUID(0, this)
            return this.__AdapterLuid
        }
    }

    /**
     * @type {Integer}
     */
    TargetId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    StopReason {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
