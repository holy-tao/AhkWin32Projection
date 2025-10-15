#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_AC3_ROOM_TYPE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fLargeRoom{
        get {
            if(!this.HasProp("__fLargeRoom"))
                this.__fLargeRoom := BOOL(this.ptr + 0)
            return this.__fLargeRoom
        }
    }
}
