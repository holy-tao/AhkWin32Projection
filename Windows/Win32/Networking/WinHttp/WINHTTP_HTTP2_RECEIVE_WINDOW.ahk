#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_HTTP2_RECEIVE_WINDOW extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulStreamWindow {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulStreamWindowUpdateDelta {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
