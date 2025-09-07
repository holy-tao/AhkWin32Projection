#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_PROPERTY_SNI extends Win32Struct
{
    static sizeof => 516

    static packingSize => 4

    /**
     * @type {String}
     */
    Hostname {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 512, "uint")
        set => NumPut("uint", value, this, 512)
    }
}
