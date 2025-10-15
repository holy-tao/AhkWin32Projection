#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class GETCLIPBMETADATA extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    IsDelayRendered{
        get {
            if(!this.HasProp("__IsDelayRendered"))
                this.__IsDelayRendered := BOOL(this.ptr + 4)
            return this.__IsDelayRendered
        }
    }

    /**
     * @type {BOOL}
     */
    IsSynthetic{
        get {
            if(!this.HasProp("__IsSynthetic"))
                this.__IsSynthetic := BOOL(this.ptr + 8)
            return this.__IsSynthetic
        }
    }
}
