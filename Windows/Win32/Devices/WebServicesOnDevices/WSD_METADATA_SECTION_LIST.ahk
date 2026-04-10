#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSD_METADATA_SECTION_LIST.ahk
#Include .\WSD_METADATA_SECTION.ahk

/**
 * Represents a node in a single-linked list of metadata sections.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_metadata_section_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
class WSD_METADATA_SECTION_LIST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to the next node in the linked list of <b>WSD_METADATA_SECTION_LIST</b> structures.
     * @type {Pointer<WSD_METADATA_SECTION_LIST>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The metadata section referenced by this node.
     * @type {Pointer<WSD_METADATA_SECTION>}
     */
    Element {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
