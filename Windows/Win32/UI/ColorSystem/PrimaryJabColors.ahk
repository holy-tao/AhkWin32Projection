#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JabColorF.ahk

/**
 * This structure contains eight primary colors in Jab coordinates.
 * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/ns-wcsplugin-primaryjabcolors
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class PrimaryJabColors extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Red primary.
     * @type {JabColorF}
     */
    red{
        get {
            if(!this.HasProp("__red"))
                this.__red := JabColorF(0, this)
            return this.__red
        }
    }

    /**
     * Yellow primary.
     * @type {JabColorF}
     */
    yellow{
        get {
            if(!this.HasProp("__yellow"))
                this.__yellow := JabColorF(16, this)
            return this.__yellow
        }
    }

    /**
     * Green primary.
     * @type {JabColorF}
     */
    green{
        get {
            if(!this.HasProp("__green"))
                this.__green := JabColorF(32, this)
            return this.__green
        }
    }

    /**
     * Cyan primary.
     * @type {JabColorF}
     */
    cyan{
        get {
            if(!this.HasProp("__cyan"))
                this.__cyan := JabColorF(48, this)
            return this.__cyan
        }
    }

    /**
     * Blue primary.
     * @type {JabColorF}
     */
    blue{
        get {
            if(!this.HasProp("__blue"))
                this.__blue := JabColorF(64, this)
            return this.__blue
        }
    }

    /**
     * Magenta primary.
     * @type {JabColorF}
     */
    magenta{
        get {
            if(!this.HasProp("__magenta"))
                this.__magenta := JabColorF(80, this)
            return this.__magenta
        }
    }

    /**
     * Black primary.
     * @type {JabColorF}
     */
    black{
        get {
            if(!this.HasProp("__black"))
                this.__black := JabColorF(96, this)
            return this.__black
        }
    }

    /**
     * White primary.
     * @type {JabColorF}
     */
    white{
        get {
            if(!this.HasProp("__white"))
                this.__white := JabColorF(112, this)
            return this.__white
        }
    }
}
