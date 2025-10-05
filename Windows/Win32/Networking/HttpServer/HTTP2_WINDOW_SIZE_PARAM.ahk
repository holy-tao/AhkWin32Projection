#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP2_WINDOW_SIZE_PARAM extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Http2ReceiveWindowSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
