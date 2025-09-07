#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of device service GUIDs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_device_service_guid_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_DEVICE_SERVICE_GUID_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of items in the *DeviceService* argument.
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The index of the current item. The index of the first item is 0. *dwIndex* must be less than *dwNumberOfItems*. This member is not used by the wireless service. You can use this member when processing individual **GUID**s in the **WLAN_DEVICE_SERVICE_GUID_LIST** structure. When your application passes this structure from one function to another, it can set the value of *dwIndex* to the index of the item currently being processed. This can help your application maintain state. You should always initialize *dwIndex* before use.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)\[1\]**
     * 
     * A pointer to an array containing **GUID**s; each corresponds to a WLAN device service that the driver supports.
     * @type {Array<Guid>}
     */
    DeviceService{
        get {
            if(!this.HasProp("__DeviceServiceProxyArray"))
                this.__DeviceServiceProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ptr")
            return this.__DeviceServiceProxyArray
        }
    }
}
