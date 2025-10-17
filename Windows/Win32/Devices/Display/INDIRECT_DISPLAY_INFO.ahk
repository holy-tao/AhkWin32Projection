#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class INDIRECT_DISPLAY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {LUID}
     */
    DisplayAdapterLuid{
        get {
            if(!this.HasProp("__DisplayAdapterLuid"))
                this.__DisplayAdapterLuid := LUID(0, this)
            return this.__DisplayAdapterLuid
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumMonitors {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    DisplayAdapterTargetBase {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
