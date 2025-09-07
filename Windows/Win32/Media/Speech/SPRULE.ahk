#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRULE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszRuleName{
        get {
            if(!this.HasProp("__pszRuleName"))
                this.__pszRuleName := PWSTR(this.ptr + 0)
            return this.__pszRuleName
        }
    }

    /**
     * @type {Integer}
     */
    ulRuleId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwAttributes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
