#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_REQUEST_DSCP_INFO extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    DscpTag {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
