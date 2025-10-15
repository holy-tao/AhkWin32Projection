#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_INFO_1050 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    wki1050_use_close_behind{
        get {
            if(!this.HasProp("__wki1050_use_close_behind"))
                this.__wki1050_use_close_behind := BOOL(this.ptr + 0)
            return this.__wki1050_use_close_behind
        }
    }
}
