#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_SERVICE_METADATA.ahk" { WSD_SERVICE_METADATA }

/**
 * Represents a node in a single-linked list of service metadata structures.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_service_metadata_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SERVICE_METADATA_LIST {
    #StructPack 8

    /**
     * Reference to the next node in the linked list of <b>WSD_SERVICE_METADATA_LIST</b> structures.
     */
    Next : WSD_SERVICE_METADATA_LIST.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_service_metadata">WSD_SERVICE_METADATA</a> structure that represents the service metadata referenced by this node.
     */
    Element : WSD_SERVICE_METADATA.Ptr

}
