#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class GEN_GET_NETCARD_TIME extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ReadTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
