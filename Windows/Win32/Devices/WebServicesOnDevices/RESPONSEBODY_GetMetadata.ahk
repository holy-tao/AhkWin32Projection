#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a WS-MetadataExchange GetMetadata response message.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-responsebody_getmetadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class RESPONSEBODY_GetMetadata extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_metadata_section_list">WSD_METADATA_SECTION_LIST</a> structure that contains a node in a single-linked list of metadata sections.
     * @type {Pointer<WSD_METADATA_SECTION_LIST>}
     */
    Metadata {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
