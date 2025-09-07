#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class MDAInfo extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    lpMDACaption{
        get {
            if(!this.HasProp("__lpMDACaption"))
                this.__lpMDACaption := PWSTR(this.ptr + 0)
            return this.__lpMDACaption
        }
    }

    /**
     * @type {PWSTR}
     */
    lpMDAMessage{
        get {
            if(!this.HasProp("__lpMDAMessage"))
                this.__lpMDAMessage := PWSTR(this.ptr + 8)
            return this.__lpMDAMessage
        }
    }

    /**
     * @type {PWSTR}
     */
    lpStackTrace{
        get {
            if(!this.HasProp("__lpStackTrace"))
                this.__lpStackTrace := PWSTR(this.ptr + 16)
            return this.__lpStackTrace
        }
    }
}
