#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a node in a single-linked list of WSD_ENDPOINT_REFERENCE structures.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_endpoint_reference_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_ENDPOINT_REFERENCE_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to the next node in the linked list of <b>WSD_ENDPOINT_REFERENCE_LIST</b> structures.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE_LIST>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that contains the endpoint referenced by this node.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    Element {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
