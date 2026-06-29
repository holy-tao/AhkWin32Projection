#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * A structure that represents a device service notification.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_device_service_notification_data
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_DEVICE_SERVICE_NOTIFICATION_DATA {
    #StructPack 4

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * 
     * The **GUID** identifying the device service for this notification.
     */
    DeviceService : Guid

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The opcode that identifies the operation under the device service for this notification.
     */
    dwOpCode : UInt32

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The size, in bytes, of the *DataBlob* member. The maximum value of *dwDataSize* may be restricted by the type of data that is stored in the **WLAN_DEVICE_SERVICE_NOTIFICATION_DATA** structure.
     */
    dwDataSize : UInt32

    /**
     * Type: **[BYTE](../guiddef/ns-guiddef-guid.md)\[1\]**
     * 
     * A pointer to an array containing **BYTES**s, representing the data blob. This is the data that is received from the independent hardware vendor (IHV) driver, and is passed on to the client as an unformatted byte array blob.
     */
    DataBlob : Int8[1]

}
