#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SdpAttributeRange.ahk" { SdpAttributeRange }
#Import ".\SdpQueryUuidUnion.ahk" { SdpQueryUuidUnion }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SdpQueryUuid.ahk" { SdpQueryUuid }

/**
 * The BTH_QUERY_SERVICE structure is used to query a Bluetooth service.
 * @remarks
 * The <b>pRange</b> member is an open-ended array specifying a sparse set of attributes to return from the query. It is an application's responsibility to provide a nonoverlapping array that is sorted in ascending order of attribute ID, without duplicates.
 * 
 * See 
 * <a href="https://www.bluetooth.com/">www.bluetooth.com</a> for more information about the Bluetooth specification.
 * @see https://learn.microsoft.com/windows/win32/api/ws2bth/ns-ws2bth-bth_query_service
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_QUERY_SERVICE {
    #StructPack 4

    /**
     * Type of service to perform. Choose from the following:
     * 
     * <ul>
     * <li>SDP_SERVICE_SEARCH_REQUEST</li>
     * <li>SDP_SERVICE_ATTRIBUTE_REQUEST</li>
     * <li>SDP_SERVICE_SEARCH_ATTRIBUTE_REQUEST</li>
     * </ul>
     */
    type : UInt32

    /**
     * Service handle on which to query the attributes specified in the <b>pRange</b> member. Used only for attribute searches.
     */
    serviceHandle : UInt32

    /**
     * UUIDs that a record must contain to match the search. Used for service and service attribute searches. When querying less than MAX_UUIDS_IN_QUERY UUIDs, set the <b>SdpQueryUuid</b> element immediately following the last valid UUID to all zeros. Used only for attribute and service attribute searches.
     */
    uuids : SdpQueryUuid[12]

    /**
     * Number of elements in <b>pRange</b>. Used only for attribute and service attribute searches.
     */
    numRange : UInt32

    /**
     * Attribute values to retrieve for any matching records, in the form of an array of 
     * <b>SdpAttributeRange</b> structures. Attributes are defined in the Bluetooth specification. See Remarks.
     */
    pRange : SdpAttributeRange[1]

}
