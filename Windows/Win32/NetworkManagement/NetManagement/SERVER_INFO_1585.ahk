#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1585 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    sv1585_sendsfrompreferredprocessor{
        get {
            if(!this.HasProp("__sv1585_sendsfrompreferredprocessor"))
                this.__sv1585_sendsfrompreferredprocessor := BOOL(this.ptr + 0)
            return this.__sv1585_sendsfrompreferredprocessor
        }
    }
}
