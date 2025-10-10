#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\XYZColorF.ahk

/**
 * This structure contains eight primary colors in XYZ coordinates.
 * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/ns-wcsplugin-primaryxyzcolors
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class PrimaryXYZColors extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Red primary.
     * @type {XYZColorF}
     */
    red{
        get {
            if(!this.HasProp("__red"))
                this.__red := XYZColorF(this.ptr + 0)
            return this.__red
        }
    }

    /**
     * Yellow primary.
     * @type {XYZColorF}
     */
    yellow{
        get {
            if(!this.HasProp("__yellow"))
                this.__yellow := XYZColorF(this.ptr + 16)
            return this.__yellow
        }
    }

    /**
     * Green primary.
     * @type {XYZColorF}
     */
    green{
        get {
            if(!this.HasProp("__green"))
                this.__green := XYZColorF(this.ptr + 32)
            return this.__green
        }
    }

    /**
     * Cyan primary.
     * @type {XYZColorF}
     */
    cyan{
        get {
            if(!this.HasProp("__cyan"))
                this.__cyan := XYZColorF(this.ptr + 48)
            return this.__cyan
        }
    }

    /**
     * Blue primary.
     * @type {XYZColorF}
     */
    blue{
        get {
            if(!this.HasProp("__blue"))
                this.__blue := XYZColorF(this.ptr + 64)
            return this.__blue
        }
    }

    /**
     * Magenta primary.
     * @type {XYZColorF}
     */
    magenta{
        get {
            if(!this.HasProp("__magenta"))
                this.__magenta := XYZColorF(this.ptr + 80)
            return this.__magenta
        }
    }

    /**
     * Black primary.
     * @type {XYZColorF}
     */
    black{
        get {
            if(!this.HasProp("__black"))
                this.__black := XYZColorF(this.ptr + 96)
            return this.__black
        }
    }

    /**
     * White primary.
     * @type {XYZColorF}
     */
    white{
        get {
            if(!this.HasProp("__white"))
                this.__white := XYZColorF(this.ptr + 112)
            return this.__white
        }
    }
}
