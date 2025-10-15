#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class WCS_DEVICE_VCGT_CAPABILITIES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    SupportsVcgt{
        get {
            if(!this.HasProp("__SupportsVcgt"))
                this.__SupportsVcgt := BOOL(this.ptr + 4)
            return this.__SupportsVcgt
        }
    }
}
