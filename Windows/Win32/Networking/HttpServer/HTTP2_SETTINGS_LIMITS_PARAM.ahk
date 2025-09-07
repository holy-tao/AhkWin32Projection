#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP2_SETTINGS_LIMITS_PARAM extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Http2MaxSettingsPerFrame {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Http2MaxSettingsPerMinute {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
