#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_DATA_RATE_MAPPING_ENTRY.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_DATA_RATE_MAPPING_TABLE extends Win32Struct
{
    static sizeof => 1016

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    uDataRateMappingLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<DOT11_DATA_RATE_MAPPING_ENTRY>}
     */
    DataRateMappingEntries{
        get {
            if(!this.HasProp("__DataRateMappingEntriesProxyArray"))
                this.__DataRateMappingEntriesProxyArray := Win32FixedArray(this.ptr + 8, 126, DOT11_DATA_RATE_MAPPING_ENTRY, "")
            return this.__DataRateMappingEntriesProxyArray
        }
    }
}
