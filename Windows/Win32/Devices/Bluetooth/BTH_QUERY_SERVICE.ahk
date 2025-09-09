#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SdpQueryUuidUnion.ahk
#Include .\SdpQueryUuid.ahk
#Include .\SdpAttributeRange.ahk

/**
 * The BTH_QUERY_SERVICE structure is used to query a Bluetooth service.
 * @remarks
 * The <b>pRange</b> member is an open-ended array specifying a sparse set of attributes to return from the query. It is an application's responsibility to provide a nonoverlapping array that is sorted in ascending order of attribute ID, without duplicates.
  * 
  * See 
  * <a href="https://www.bluetooth.com/">www.bluetooth.com</a> for more information about the Bluetooth specification.
 * @see https://learn.microsoft.com/windows/win32/api/ws2bth/ns-ws2bth-bth_query_service
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_QUERY_SERVICE extends Win32Struct
{
    static sizeof => 116

    static packingSize => 1

    /**
     * Type of service to perform. Choose from the following:
     * 
     * <ul>
     * <li>SDP_SERVICE_SEARCH_REQUEST</li>
     * <li>SDP_SERVICE_ATTRIBUTE_REQUEST</li>
     * <li>SDP_SERVICE_SEARCH_ATTRIBUTE_REQUEST</li>
     * </ul>
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Service handle on which to query the attributes specified in the <b>pRange</b> member. Used only for attribute searches.
     * @type {Integer}
     */
    serviceHandle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * UUIDs that a record must contain to match the search. Used for service and service attribute searches. When querying less than MAX_UUIDS_IN_QUERY UUIDs, set the <b>SdpQueryUuid</b> element immediately following the last valid UUID to all zeros. Used only for attribute and service attribute searches.
     * @type {Array<SdpQueryUuid>}
     */
    uuids{
        get {
            if(!this.HasProp("__uuidsProxyArray"))
                this.__uuidsProxyArray := Win32FixedArray(this.ptr + 8, 12, SdpQueryUuid, "")
            return this.__uuidsProxyArray
        }
    }

    /**
     * Number of elements in <b>pRange</b>. Used only for attribute and service attribute searches.
     * @type {Integer}
     */
    numRange {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Attribute values to retrieve for any matching records, in the form of an array of 
     * <b>SdpAttributeRange</b> structures. Attributes are defined in the Bluetooth specification. See Remarks.
     * @type {Array<SdpAttributeRange>}
     */
    pRange{
        get {
            if(!this.HasProp("__pRangeProxyArray"))
                this.__pRangeProxyArray := Win32FixedArray(this.ptr + 108, 1, SdpAttributeRange, "")
            return this.__pRangeProxyArray
        }
    }
}
