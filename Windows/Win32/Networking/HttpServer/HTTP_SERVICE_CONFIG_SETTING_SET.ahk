#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_SERVICE_CONFIG_SETTING_KEY.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_SERVICE_CONFIG_SETTING_SET extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {HTTP_SERVICE_CONFIG_SETTING_KEY}
     */
    KeyDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ParamDesc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
