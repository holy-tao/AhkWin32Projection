#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_METADATA_SECTION.ahk" { WSD_METADATA_SECTION }

/**
 * Represents a node in a single-linked list of metadata sections.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_metadata_section_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_METADATA_SECTION_LIST {
    #StructPack 8

    /**
     * Reference to the next node in the linked list of <b>WSD_METADATA_SECTION_LIST</b> structures.
     */
    Next : WSD_METADATA_SECTION_LIST.Ptr

    /**
     * The metadata section referenced by this node.
     */
    Element : WSD_METADATA_SECTION.Ptr

}
