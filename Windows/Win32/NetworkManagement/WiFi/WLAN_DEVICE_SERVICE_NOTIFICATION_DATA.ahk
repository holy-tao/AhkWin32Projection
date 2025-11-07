#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A structure that represents a device service notification.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_device_service_notification_data
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_DEVICE_SERVICE_NOTIFICATION_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * 
     * The **GUID** identifying the device service for this notification.
     * @type {Pointer<Guid>}
     */
    DeviceService {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The opcode that identifies the operation under the device service for this notification.
     * @type {Integer}
     */
    dwOpCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The size, in bytes, of the *DataBlob* member. The maximum value of *dwDataSize* may be restricted by the type of data that is stored in the **WLAN_DEVICE_SERVICE_NOTIFICATION_DATA** structure.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **[BYTE](../guiddef/ns-guiddef-guid.md)\[1\]**
     * 
     * A pointer to an array containing **BYTES**s, representing the data blob. This is the data that is received from the independent hardware vendor (IHV) driver, and is passed on to the client as an unformatted byte array blob.
     * @type {Array<Byte>}
     */
    DataBlob{
        get {
            if(!this.HasProp("__DataBlobProxyArray"))
                this.__DataBlobProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__DataBlobProxyArray
        }
    }
}
