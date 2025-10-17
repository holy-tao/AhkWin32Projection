#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include .\WLAN_RATE_SET.ahk
#Include .\WLAN_BSS_ENTRY.ahk

/**
 * Contains a list of basic service set (BSS) entries.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetnetworkbsslist">WlanGetNetworkBssList</a> function retrieves the BSS list of the wireless network or networks on a given interface and returns this information in a <b>WLAN_BSS_LIST</b> structure. 
  * 
  * 
  * 
  * The <b>WLAN_BSS_LIST</b> structure may contain padding for alignment between the <b>dwTotalSize</b> member, the  <b>dwNumberOfItems</b> member, and the first <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a>  array entry in the <b>wlanBssEntries</b>  member. Padding for alignment may also be present between the <b>WLAN_BSS_ENTRY</b> array entries in the <b>wlanBssEntries</b> member. Any access to a <b>WLAN_BSS_ENTRY</b> array entry should assume padding may exist.
  * 
  * 
  * When the wireless LAN interface is also operating as  a Wireless Hosted Network , the BSS list will contain an entry for the BSS created for the Wireless Hosted Network.
  * 
  * 
  * 
  * Since the information is returned by the access point for an infrastructure BSS network or by the network peer for an independent BSS network (ad hoc network), the information returned should not be trusted. The <b>ulIeOffset</b> and <b>ulIeSize</b>  members in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a> structure should be used to determine the maximum size of the information element data blob in the <b>WLAN_BSS_ENTRY</b> structure, not the data in the information element data blob.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_bss_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_BSS_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The total size of this structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of items in the <b>wlanBssEntries</b> member.
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a> structures that contains information about a BSS.
     * @type {Array<WLAN_BSS_ENTRY>}
     */
    wlanBssEntries{
        get {
            if(!this.HasProp("__wlanBssEntriesProxyArray"))
                this.__wlanBssEntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, WLAN_BSS_ENTRY, "")
            return this.__wlanBssEntriesProxyArray
        }
    }
}
