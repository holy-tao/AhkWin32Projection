#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\PSID.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TOKEN_SID_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PSID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := PSID(this.ptr + 0)
            return this.__Sid
        }
    }
}
