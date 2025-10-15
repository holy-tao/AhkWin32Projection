#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class MCI_SYSINFO_PARMSW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    lpstrReturn{
        get {
            if(!this.HasProp("__lpstrReturn"))
                this.__lpstrReturn := PWSTR(this.ptr + 8)
            return this.__lpstrReturn
        }
    }

    /**
     * @type {Integer}
     */
    dwRetSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwNumber {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    wDeviceType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
