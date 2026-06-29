#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_PROBE_MATCH.ahk" { WSD_PROBE_MATCH }

/**
 * Represents a node in a single-linked list of ProbeMatch message structures.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_probe_match_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_PROBE_MATCH_LIST {
    #StructPack 8

    /**
     * Reference to the next node in the linked list of <b>WSD_PROBE_MATCH_LIST</b> structures.
     */
    Next : WSD_PROBE_MATCH_LIST.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_probe_match">WSD_PROBE_MATCH</a> structure that contains the ProbeMatch message referenced by this node.
     */
    Element : WSD_PROBE_MATCH.Ptr

}
