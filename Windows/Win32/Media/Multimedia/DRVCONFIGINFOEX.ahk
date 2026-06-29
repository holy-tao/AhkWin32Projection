#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
class DRVCONFIGINFOEX extends Win32Struct {
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
    lpszDCISectionName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    lpszDCIAliasName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dnDevNode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
