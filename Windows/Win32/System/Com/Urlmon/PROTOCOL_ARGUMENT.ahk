#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class PROTOCOL_ARGUMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    szMethod{
        get {
            if(!this.HasProp("__szMethod"))
                this.__szMethod := PWSTR(this.ptr + 0)
            return this.__szMethod
        }
    }

    /**
     * @type {PWSTR}
     */
    szTargetUrl{
        get {
            if(!this.HasProp("__szTargetUrl"))
                this.__szTargetUrl := PWSTR(this.ptr + 8)
            return this.__szTargetUrl
        }
    }
}
