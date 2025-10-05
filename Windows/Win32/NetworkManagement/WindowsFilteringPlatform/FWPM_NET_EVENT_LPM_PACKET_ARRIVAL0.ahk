#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_LPM_PACKET_ARRIVAL0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    spi {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
