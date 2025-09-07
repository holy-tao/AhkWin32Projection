#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides metadata for all services hosted by a device.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_host_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_HOST_METADATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_service_metadata">WSD_SERVICE_METADATA</a> structure that describes the parent service or the device.
     * @type {Pointer<WSD_SERVICE_METADATA>}
     */
    Host {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_service_metadata_list">WSD_SERVICE_METADATA_LIST</a> structure that represents the singly linked list of services hosted by the parent service.
     * @type {Pointer<WSD_SERVICE_METADATA_LIST>}
     */
    Hosted {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
