#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_INFO_1061 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    wki1061_use_512_byte_max_transfer{
        get {
            if(!this.HasProp("__wki1061_use_512_byte_max_transfer"))
                this.__wki1061_use_512_byte_max_transfer := BOOL(this.ptr + 0)
            return this.__wki1061_use_512_byte_max_transfer
        }
    }
}
