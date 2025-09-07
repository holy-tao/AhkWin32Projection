#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_DEV_CAP_DRV extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    wszName{
        get {
            if(!this.HasProp("__wszName"))
                this.__wszName := PWSTR(this.ptr + 16)
            return this.__wszName
        }
    }

    /**
     * @type {PWSTR}
     */
    wszDescription{
        get {
            if(!this.HasProp("__wszDescription"))
                this.__wszDescription := PWSTR(this.ptr + 24)
            return this.__wszDescription
        }
    }

    /**
     * @type {PWSTR}
     */
    wszIcon{
        get {
            if(!this.HasProp("__wszIcon"))
                this.__wszIcon := PWSTR(this.ptr + 32)
            return this.__wszIcon
        }
    }
}
