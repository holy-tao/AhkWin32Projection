#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * Represents a node in a single-linked list of WSD_ENDPOINT_REFERENCE structures.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_ENDPOINT_REFERENCE_LIST {
    #StructPack 8

    /**
     * Reference to the next node in the linked list of <b>WSD_ENDPOINT_REFERENCE_LIST</b> structures.
     */
    Next : WSD_ENDPOINT_REFERENCE_LIST.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that contains the endpoint referenced by this node.
     */
    Element : WSD_ENDPOINT_REFERENCE.Ptr

}
