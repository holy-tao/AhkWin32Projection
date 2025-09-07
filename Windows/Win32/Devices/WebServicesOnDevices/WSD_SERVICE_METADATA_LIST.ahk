#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a node in a single-linked list of service metadata structures.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_service_metadata_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SERVICE_METADATA_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to the next node in the linked list of <b>WSD_SERVICE_METADATA_LIST</b> structures.
     * @type {Pointer<WSD_SERVICE_METADATA_LIST>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_service_metadata">WSD_SERVICE_METADATA</a> structure that represents the service metadata referenced by this node.
     * @type {Pointer<WSD_SERVICE_METADATA>}
     */
    Element {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
