#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_INFO_1062 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    wki1062_read_ahead_throughput {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
