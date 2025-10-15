#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_INFO_1051 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    wki1051_buf_named_pipes{
        get {
            if(!this.HasProp("__wki1051_buf_named_pipes"))
                this.__wki1051_buf_named_pipes := BOOL(this.ptr + 0)
            return this.__wki1051_buf_named_pipes
        }
    }
}
