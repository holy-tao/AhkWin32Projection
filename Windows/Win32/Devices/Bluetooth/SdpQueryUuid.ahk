#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SdpQueryUuidUnion.ahk" { SdpQueryUuidUnion }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The SdpQueryUuid structure facilitates searching for UUIDs.
 * @see https://learn.microsoft.com/windows/win32/api/bthsdpdef/ns-bthsdpdef-sdpqueryuuid
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct SdpQueryUuid {
    #StructPack 4

    /**
     * Union containing the UUID on which to search.
     */
    u : SdpQueryUuidUnion

    /**
     * Type of UUID being searched. Must be one of the three valid values from the SDP_SPECIFICTYPE enumeration:
     * 
     * 
     * <ul>
     * <li>SDP_ST_UUID16 - indicates u.uuid16 will be used in the search.</li>
     * <li>SDP_ST_UUID32 - indicates u.uuid32 will be used in the search.</li>
     * <li>SDP_ST_UUID128 - indicates u.uuid128 will be used in the search.</li>
     * </ul>
     */
    uuidType : UInt16

}
