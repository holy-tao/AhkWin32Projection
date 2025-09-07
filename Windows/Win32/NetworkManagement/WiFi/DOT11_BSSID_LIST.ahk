#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * Contains a list of basic service set (BSS) identifiers.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-bssid-list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_BSSID_LIST extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * An [**NDIS\_OBJECT\_HEADER**](ndis-object-header.md) structure that contains the type, version, and, size information of an NDIS structure. For most **DOT11\_BSSID\_LIST** structures, set the **Type** member to **NDIS\_OBJECT\_TYPE\_DEFAULT**, set the **Revision** member to **DOT11\_BSSID\_LIST\_REVISION\_1**, and set the **Size** member to **sizeof(DOT11\_BSSID\_LIST)**.
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
     * The number of entries in this structure.
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The total number of entries supported.
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A list of BSS identifiers. A BSS identifier is stored as a [**DOT11\_MAC\_ADDRESS**](dot11-mac-address-type.md) type.
     * @type {Array<Byte>}
     */
    BSSIDs{
        get {
            if(!this.HasProp("__BSSIDsProxyArray"))
                this.__BSSIDsProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__BSSIDsProxyArray
        }
    }
}
