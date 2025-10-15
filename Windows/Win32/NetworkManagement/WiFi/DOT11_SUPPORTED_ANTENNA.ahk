#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SUPPORTED_ANTENNA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uAntennaListIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    bSupportedAntenna{
        get {
            if(!this.HasProp("__bSupportedAntenna"))
                this.__bSupportedAntenna := BOOLEAN(this.ptr + 4)
            return this.__bSupportedAntenna
        }
    }
}
