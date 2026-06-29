#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_METADATA_SECTION_LIST.ahk" { WSD_METADATA_SECTION_LIST }

/**
 * Represents a WS-MetadataExchange GetMetadata response message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-responsebody_getmetadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct RESPONSEBODY_GetMetadata {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_metadata_section_list">WSD_METADATA_SECTION_LIST</a> structure that contains a node in a single-linked list of metadata sections.
     */
    Metadata : WSD_METADATA_SECTION_LIST.Ptr

}
