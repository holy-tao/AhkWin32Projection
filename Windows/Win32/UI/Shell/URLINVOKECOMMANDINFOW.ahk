#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class URLINVOKECOMMANDINFOW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwcbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(8, this)
            return this.__hwndParent
        }
    }

    /**
     * @type {PWSTR}
     */
    pcszVerb {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
