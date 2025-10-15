#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class FILEPATHS_W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    Target{
        get {
            if(!this.HasProp("__Target"))
                this.__Target := PWSTR(this.ptr + 0)
            return this.__Target
        }
    }

    /**
     * @type {PWSTR}
     */
    Source{
        get {
            if(!this.HasProp("__Source"))
                this.__Source := PWSTR(this.ptr + 8)
            return this.__Source
        }
    }

    /**
     * @type {Integer}
     */
    Win32Error {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
