#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRECORESULTTIMES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {FILETIME}
     */
    ftStreamTime{
        get {
            if(!this.HasProp("__ftStreamTime"))
                this.__ftStreamTime := FILETIME(0, this)
            return this.__ftStreamTime
        }
    }

    /**
     * @type {Integer}
     */
    ullLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwTickCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ullStart {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
