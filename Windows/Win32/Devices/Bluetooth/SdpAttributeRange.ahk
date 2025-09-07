#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SdpAttributeRange structure is used in a Bluetooth query to constrain the set of attributes to return in the query.
 * @see https://learn.microsoft.com/windows/win32/api/bthsdpdef/ns-bthsdpdef-sdpattributerange
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class SdpAttributeRange extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Minimum attribute value for which to search.
     * @type {Integer}
     */
    minAttribute {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Maximum attribute value for which to search.
     * @type {Integer}
     */
    maxAttribute {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
