#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A structure that represents a device service notification.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_device_service_notification_data
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_DEVICE_SERVICE_NOTIFICATION_DATA extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * 
     * The **GUID** identifying the device service for this notification.
     * @type {Guid}
     */
    DeviceService {
        get {
            if(!this.HasProp("__DeviceService"))
                this.__DeviceService := Guid(0, this)
            return this.__DeviceService
        }
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The opcode that identifies the operation under the device service for this notification.
     * @type {Integer}
     */
    dwOpCode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The size, in bytes, of the *DataBlob* member. The maximum value of *dwDataSize* may be restricted by the type of data that is stored in the **WLAN_DEVICE_SERVICE_NOTIFICATION_DATA** structure.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: **[BYTE](../guiddef/ns-guiddef-guid.md)\[1\]**
     * 
     * A pointer to an array containing **BYTES**s, representing the data blob. This is the data that is received from the independent hardware vendor (IHV) driver, and is passed on to the client as an unformatted byte array blob.
     * @type {Array<Integer>}
     */
    DataBlob {
        get {
            if(!this.HasProp("__DataBlobProxyArray"))
                this.__DataBlobProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__DataBlobProxyArray
        }
    }
}
