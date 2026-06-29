#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * Contains a list of basic service set (BSS) identifiers.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-bssid-list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_BSSID_LIST {
    #StructPack 4

    /**
     * An [**NDIS\_OBJECT\_HEADER**](ndis-object-header.md) structure that contains the type, version, and, size information of an NDIS structure. For most **DOT11\_BSSID\_LIST** structures, set the **Type** member to **NDIS\_OBJECT\_TYPE\_DEFAULT**, set the **Revision** member to **DOT11\_BSSID\_LIST\_REVISION\_1**, and set the **Size** member to **sizeof(DOT11\_BSSID\_LIST)**.
     */
    Header : NDIS_OBJECT_HEADER

    /**
     * The number of entries in this structure.
     */
    uNumOfEntries : UInt32

    /**
     * The total number of entries supported.
     */
    uTotalNumOfEntries : UInt32

    /**
     * A list of BSS identifiers. A BSS identifier is stored as a [**DOT11\_MAC\_ADDRESS**](dot11-mac-address-type.md) type.
     */
    BSSIDs : Int8[6]

}
