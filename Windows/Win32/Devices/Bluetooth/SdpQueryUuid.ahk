#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SdpQueryUuidUnion.ahk

/**
 * The SdpQueryUuid structure facilitates searching for UUIDs.
 * @see https://learn.microsoft.com/windows/win32/api/bthsdpdef/ns-bthsdpdef-sdpqueryuuid
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class SdpQueryUuid extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Union containing the UUID on which to search.
     * @type {SdpQueryUuidUnion}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := SdpQueryUuidUnion(0, this)
            return this.__u
        }
    }

    /**
     * Type of UUID being searched. Must be one of the three valid values from the SDP_SPECIFICTYPE enumeration:
     * 
     * 
     * <ul>
     * <li>SDP_ST_UUID16 - indicates u.uuid16 will be used in the search.</li>
     * <li>SDP_ST_UUID32 - indicates u.uuid32 will be used in the search.</li>
     * <li>SDP_ST_UUID128 - indicates u.uuid128 will be used in the search.</li>
     * </ul>
     * @type {Integer}
     */
    uuidType {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
