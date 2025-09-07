#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class HLITEM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uHLID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pwzFriendlyName{
        get {
            if(!this.HasProp("__pwzFriendlyName"))
                this.__pwzFriendlyName := PWSTR(this.ptr + 8)
            return this.__pwzFriendlyName
        }
    }
}
