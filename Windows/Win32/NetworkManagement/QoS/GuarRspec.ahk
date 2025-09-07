#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GuarRspec structure contains guaranteed Rspec information.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-guarrspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class GuarRspec extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Guaranteed rate, in bytes per second.
     * @type {Float}
     */
    Guar_R {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Slack term, in  seconds.
     * @type {Integer}
     */
    Guar_S {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
