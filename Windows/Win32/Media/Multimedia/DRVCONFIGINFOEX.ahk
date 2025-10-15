#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class DRVCONFIGINFOEX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwDCISize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    lpszDCISectionName{
        get {
            if(!this.HasProp("__lpszDCISectionName"))
                this.__lpszDCISectionName := PWSTR(this.ptr + 8)
            return this.__lpszDCISectionName
        }
    }

    /**
     * @type {PWSTR}
     */
    lpszDCIAliasName{
        get {
            if(!this.HasProp("__lpszDCIAliasName"))
                this.__lpszDCIAliasName := PWSTR(this.ptr + 16)
            return this.__lpszDCIAliasName
        }
    }

    /**
     * @type {Integer}
     */
    dnDevNode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
